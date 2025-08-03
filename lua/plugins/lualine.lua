return {
    'nvim-lualine/lualine.nvim',
    -- dependencies = { 'nvim-tree/nvim-web-devicons' }  -- needed for *fancy* icons etc.

    config = function()
        require("lualine").setup({
            options = {
                theme = "dracula"
            }
        })

    end
}
