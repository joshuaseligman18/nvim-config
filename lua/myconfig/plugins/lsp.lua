return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        lazy = false,
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/nvim-cmp',
            'L3MON4D3/LuaSnip',
        },
        config = function()
            local lsp_zero = require('lsp-zero')

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({buffer = bufnr})
            end)

            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'rust_analyzer',
                    'tsserver',
                    'lua_ls',
                    'gopls',
                    'clangd',
                    'arduino_language_server',
                },
                handlers = {
                    lsp_zero.default_setup,
                    ["lua_ls"] = function()
                        require("lspconfig").lua_ls.setup {
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" }
                                    }
                                }
                            }
                        }
                    end,
                    ['arduino_language_server'] = function()
                        require("lspconfig").arduino_language_server.setup {
                            cmd = {
                                "arduino-language-server",
                                "-cli-config", "~/arduinoIDE/arduino-cli.yaml",
                            }
                        }
                    end,
                },
            })
        end,
    },
}

