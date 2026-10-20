return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    config = function()
      -- Bug upstream: reset_filter() gan `state.tree = deepcopy(state.orig_tree)`
      -- roi xoa `state.orig_tree`. Neu reset chay 2 lan (search roi Escape),
      -- lan hai lay orig_tree = nil → state.tree = nil → moi lenh dua tren tree
      -- (toggle_node, open) deu crash: "attempt to index local 'tree' (a nil value)".
      -- Guard o day: neu tree bi nil thi dung lai cay truoc khi lenh chay.
      local function with_tree_guard(cmd)
        return function(state)
          if not state.tree then
            -- navigate() se tao lai cay (create_tree) roi ve lai noi dung
            require("neo-tree.sources.manager").navigate(state)
            return
          end
          return cmd(state)
        end
      end

      local cmds = require("neo-tree.sources.filesystem.commands")

      require("neo-tree").setup({
        use_default_mappings = false, -- de mapping cua ta khong bi ghi de
        window = {
          mappings = {
            ["<cr>"] = with_tree_guard(cmds.open),
            ["<space>"] = with_tree_guard(cmds.toggle_node),
            ["<2-LeftMouse>"] = "open",
            ["<tab>"] = "select",
            ["<C-S-i>"] = "invert_selection",
            ["<C-;>"] = "clear_selection",
            ["<esc>"] = "cancel",
            ["q"] = "close_window",
            ["P"] = { "toggle_preview", config = { use_float = true } },
            ["<C-f>"] = { "scroll_preview", config = { direction = -10 } },
            ["<C-b>"] = { "scroll_preview", config = { direction = 10 } },
            ["l"] = "focus_preview",
            ["h"] = "focus_diagnostic",
          },
        },
      })
    end,
  },
}
