return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            plugins = { spelling = true },
            defaults = {
                mode = { "n", "v" },
            },
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            wk.register(opts.defaults)

            wk.register({
                p = {
                    v = "File Explorer",
                    f = "Project Files",
                    s = "Grep Search",
                }
            }, { prefix = "<leader>" })

            wk.register({
                ["<C-p>"] = "Git Files",
                ["<C-e>"] = "Harpoon Directory",
                ["<C-h>"] = "Harpoon File #1",
                ["<C-t>"] = "Harpoon File #2",
                ["<C-n>"] = "Harpoon File #3",
                ["<C-s>"] = "Harpoon File #4",
            })
        end,
    },
}
