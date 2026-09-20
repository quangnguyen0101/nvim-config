return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',     -- rewrite chính thức, hỗ trợ Neovim 0.12
    lazy = false,        -- Tải ngay khi Neovim khởi động
    build = ':TSUpdate', -- Cập nhật parsers sau khi cài đặt
    config = function()
        -- Branch main đã bỏ configs.setup và các module (highlight/indent/folds).
        -- Chỉ cần khai báo danh sách parsers; chúng được tải về đúng ABI cho nvim 0.12.
        -- "latex" không có ở đây: vimtex dùng syntax riêng, xem treesitter.lua history.
        require('nvim-treesitter').install({
            'bash',
            'c',
            'cpp',
            'c_sharp',
            'css',
            'csv',
            'html',
            'java',
            'javascript',
            'json',
            'markdown',
            'markdown_inline',
            'nix',
            'python',
            'regex',
            'rust',
            'tsx',
            'typescript',
        })

        -- Highlight: runtime nvim 0.12 tự bật cho lua/help/query/markdown,
        -- các filetype còn lại cần vim.treesitter.start() thủ công.
        vim.api.nvim_create_autocmd('FileType', {
            pattern = {
                'bash', 'sh', 'zsh',
                'c', 'cpp', 'cs',
                'css', 'csv', 'html',
                'java',
                'javascript', 'javascriptreact',
                'typescript', 'typescriptreact',
                'json', 'nix', 'python', 'rust',
            },
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)
            end,
        })
    end,
}
