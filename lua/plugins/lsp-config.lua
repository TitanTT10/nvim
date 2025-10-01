return {
    {
        "mason-org/mason.nvim",
        config = function()
          require("mason").setup()
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "rust_analyzer" },
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        }
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
	    -- local lspconfig = require("lspconfig") -- got msg that this will be deprecated
            -- lspconfig.lua_ls.setup({})             -- just leaving it out as it doesn't seem to change anything

            vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

            vim.lsp.config('pylsp', {
              settings = {
                pylsp = {
                  plugins = {
                    pycodestyle = {
                      ignore = {'W391'},
                      maxLineLength = 100
                    }
                  }
                }
              }
            })
        end
    }
}
