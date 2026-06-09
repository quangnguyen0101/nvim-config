return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            local wk = require("which-key")
            wk.setup({
                preset = "modern",
                delay = 300,         -- Hiện menu sau 300ms
                icons = {
                    mappings = true, -- Hiện icon cho keymap
                },
                win = {
                    border = "rounded",
                },
                triggers = {
                    { "<leader>", mode = { "n", "v" } },
                    { "g",        mode = { "n", "v" } }, -- gd, gi, gr, gc, go…
                    { "]",        mode = { "n" } },      -- ]t, ]d
                    { "[",        mode = { "n" } },      -- [t, [d
                    { "z",        mode = { "n" } },      -- folding
                },
            })

            -- Phím học: hiện tất cả mappings
            vim.keymap.set("n", "<leader>?", function()
                wk.show({ global = true })
            end, { desc = "Show ALL keymaps" })

            -- Đặt tên nhóm cho các leader key
            wk.add({
                { "<leader>a", group = "AI" },
                { "<leader>b", group = "Buffer" },
                { "<leader>c", group = "Code" },
                { "<leader>d", group = "Debug" },
                { "<leader>e", desc = "Netrw explorer" },
                { "<leader>f", group = "Find" },
                { "<leader>g", group = "Git" },
                { "<leader>n", group = "Notifications" },
                { "<leader>o", group = "Open" },
                { "<leader>s", group = "Split" },
                { "<leader>t", group = "Terminal" },
                { "<leader>w", desc = "Save file" },
            })

            -- Đăng ký desc cho Ctrl/Alt mappings để which-key hiển thị
            wk.add({
                -- Editor
                { "<C-d>", desc = "Scroll down centered" },
                { "<C-u>", desc = "Scroll up centered" },
                { "<C-s>", desc = "Save file" },
                { "<C-q>", desc = "Quit" },
                { "<A-Left>", desc = "Start of line" },
                { "<A-Right>", desc = "End of line" },
                { "<A-c>", desc = "Copy file path" },
                { "<A-t>", desc = "Cycle theme" },
                -- Window
                { "<C-Left>", desc = "Go left split" },
                { "<C-Right>", desc = "Go right split" },
                { "<C-Down>", desc = "Go down split" },
                { "<C-Up>", desc = "Go up split" },
                { "<A-]>", desc = "Grow height" },
                { "<A-[>", desc = "Shrink height" },
                { "<A-}>", desc = "Grow width" },
                { "<A-{>", desc = "Shrink width" },
                { "<A-=>", desc = "Equalize splits" },
                -- Opencode
                { "<C-a>", desc = "Ask opencode" },
                { "<C-x>", desc = "Select opencode" },
                { "<C-.>", desc = "Toggle opencode" },
                { "<S-C-u>", desc = "Scroll opencode up" },
                { "<S-C-d>", desc = "Scroll opencode down" },
            })
        end,
    },
}
