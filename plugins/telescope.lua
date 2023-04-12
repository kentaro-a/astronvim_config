local lga_actions = require("telescope-live-grep-args.actions")




return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
    },
    cmd = "Telescope",
    opts = function()
        local actions = require "telescope.actions"
        local get_icon = require("astronvim.utils").get_icon
        return {
            defaults = {
                prompt_prefix = string.format("%s ", get_icon "Search"),
                selection_caret = string.format("%s ", get_icon "Selected"),
                path_display = { "truncate" },
                sorting_strategy = "ascending",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.90,
                    height = 0.80,
                    preview_cutoff = 120,
                },
                mappings = {
                    i = {
                        ["<C-n>"] = actions.cycle_history_next,
                        ["<C-p>"] = actions.cycle_history_prev,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    },
                    n = { ["q"] = actions.close },
                },
            },
            extensions = {
                live_grep_args = {
                    auto_quoting = true, -- enable/disable auto-quoting
                    -- define mappings, e.g.
                    mappings = {
                        -- extend mappings
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                            ["<C-i>"] = lga_actions.quote_prompt { postfix = " --iglob " },
                            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                        },
                    },
                    -- ... also accepts theme settings, for example:
                    -- theme = "dropdown", -- use dropdown theme
                    -- theme = { }, -- use own theme spec
                    -- layout_config = { mirror=true }, -- mirror preview pane
                },
            },
        }
    end,
    config = require "plugins.configs.telescope",
}
