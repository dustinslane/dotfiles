return {
    -- add gruvbox
    { "ellisonleao/gruvbox.nvim" },
    { "sainnhe/everforest" },
    { "xero/miasma.nvim" },
    { "dasupradyumna/midnight.nvim" },
    { "rebelot/kanagawa.nvim" },
    { "kwsp/halcyon-neovim" },

    -- Configure LazyVim to load gruvbox
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "kanagawa",
        },
    },
}
