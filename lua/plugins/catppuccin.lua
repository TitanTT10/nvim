return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            transparent_background = true,
        })
        vim.cmd("highlight Normal ctermbg=none guibg=none")

        vim.cmd.colorscheme "catppuccin-macchiato"
    end
}
-- "catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha"
