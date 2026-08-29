return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_quickfix_mode = 0
        vim.g.vimtex_compiler_method = "latexmk"
        vim.g.vimtex_compiler_latexmk = {
            engine = "xelatex",
            continuous = 0,
            options = { "-verbose", "-file-line-error", "-synctex=1", "-interaction=nonstopmode" },
        }
    end,
}
