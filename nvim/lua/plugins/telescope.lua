
return {
    -- change some telescope options and a keymap to browse plugin files
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            -- add a keymap to browse plugin files
            -- stylua: ignore
            {
                "<leader>fp",
                function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
                desc = "Find Plugin File",
            },
        },

        -- change some options
        opts = {
            defaults = {
                preview = false,
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                winblend = 0,
                file_ignore_patterns = {
                    "pre.cfg",
                    "resource.cfg",
                    "server.cfg"
                },
            },
        },
        dependencies = {
            {
                "nvim-telescope/telescope-live-grep-args.nvim" ,
                -- This will not install any breaking changes.
                -- For major updates, this must be adjusted manually.
                version = "^1.0.0",
            },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
            },
            build = "make",
        },


        config = function()
            local telescope = require("telescope")
            local lga_actions = require("telescope-live-grep-args.actions")

            telescope.setup {
                extensions = {
                    live_grep_args = {
                        auto_quoting = true, -- enable/disable auto-quoting
                        -- define mappings, e.g.
                        mappings = { -- extend mappings
                            i = {
                                ["<C-j>"] = lga_actions.quote_prompt({
                                    postfix = " -tlua ",
                                }),
                            },
                        },
                        layout_strategy = "horizontal",
                        layout_config = { prompt_position = "top" },
                        sorting_strategy = "ascending",
                        winblend = 0,
                        

                        -- ... also accepts theme settings, for example:
                        -- theme = "dropdown", -- use dropdown theme
                        -- theme = { }, -- use own theme spec
                        -- layout_config = { mirror=true }, -- mirror preview pane
                        preview = false

                    },

                    fzf = {
                        file_ignore_patterns = {
                            "pre.cfg",
                            "resource.cfg",
                            "server.cfg"
                        },

                        preview = false
                    }
                }
            }
            telescope.load_extension("fzf")
            telescope.load_extension("live_grep_args")
        end,

    },
    -- add telescope-fzf-native
 --[[
    {
        "telescope.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope-live-grep-args.nvim" ,
                -- This will not install any breaking changes.
                -- For major updates, this must be adjusted manually.
                version = "^1.0.0",
            },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
            },
            build = "make",
            config = function()
                local telescope = require("telescope")
                local lga_actions = require("telescope-live-grep-args.actions")
                telescope.load_extension("fzf")

                telescope.setup {
                    extensions = {
                        live_grep_args = {
                            auto_quoting = true, -- enable/disable auto-quoting
                            -- define mappings, e.g.
                            mappings = { -- extend mappings
                                i = {
                                    ["<C-k>"] = lga_actions.quote_prompt(),
                                },
                            },
                            -- ... also accepts theme settings, for example:
                            -- theme = "dropdown", -- use dropdown theme
                            -- theme = { }, -- use own theme spec
                            -- layout_config = { mirror=true }, -- mirror preview pane
                        }
                    }
                }
                telescope.load_extension("live_grep_args")
            end,
        },

    }
]]
}
