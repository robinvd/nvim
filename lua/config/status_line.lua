local vi_mode_utils = require "feline.providers.vi_mode"

local fn = vim.fn
local bo = vim.bo
local api = vim.api

local components = {
    active = {},
    inactive = {},
}

components.active[1] = {
    {
        provider = "▊ ",
        hl = {
            fg = "skyblue",
        },
    },
    {
        provider = "vi_mode",
        hl = function()
            return {
                name = vi_mode_utils.get_mode_highlight_name(),
                fg = vi_mode_utils.get_mode_color(),
                style = "bold",
            }
        end,
    },
    {
        provider = function(component)
            local filename = api.nvim_buf_get_name(0)
            filename = fn.fnamemodify(filename, ":~:.")
            local extension = fn.fnamemodify(filename, ":e")
            local readonly_str, modified_str

            local icon

            -- Avoid loading nvim-web-devicons if an icon is provided already
            if not component.icon then
                local icon_str, icon_color = require("nvim-web-devicons").get_icon_color(
                    filename,
                    extension,
                    { default = true }
                )

                icon = { str = icon_str }

                icon.hl = { fg = icon_color }
            end

            if filename == "" then
                filename = "unnamed"
            end

            if bo.readonly then
                readonly_str = "🔒"
            else
                readonly_str = ""
            end

            if bo.modified then
                modified_str = "●"

                if modified_str ~= "" then
                    modified_str = " " .. modified_str
                end
            else
                modified_str = ""
            end

            return string.format(" %s%s%s", readonly_str, filename, modified_str), icon
        end,
        hl = {
            fg = "white",
            bg = "oceanblue",
            style = "bold",
        },
        left_sep = {
            "slant_left_2",
            { str = " ", hl = { bg = "oceanblue", fg = "NONE" } },
        },
        right_sep = {
            { str = " ", hl = { bg = "oceanblue", fg = "NONE" } },
            "slant_right_2",
            " ",
        },
    },
    {
        provider = "position",
        left_sep = " ",
        right_sep = {
            " ",
            {
                str = "slant_right_2_thin",
                hl = {
                    fg = "fg",
                    bg = "bg",
                },
            },
        },
    },
    {
        provider = "diagnostic_errors",
        hl = { fg = "red" },
    },
    {
        provider = "diagnostic_warnings",
        hl = { fg = "yellow" },
    },
    {
        provider = "diagnostic_hints",
        hl = { fg = "cyan" },
    },
    {
        provider = "diagnostic_info",
        hl = { fg = "skyblue" },
    },
}

components.active[2] = {
    {
        provider = "git_branch",
        hl = {
            fg = "white",
            bg = "black",
            style = "bold",
        },
        right_sep = {
            str = " ",
            hl = {
                fg = "NONE",
                bg = "black",
            },
        },
    },
    {
        provider = "git_diff_added",
        hl = {
            fg = "green",
            bg = "black",
        },
    },
    {
        provider = "git_diff_changed",
        hl = {
            fg = "orange",
            bg = "black",
        },
    },
    {
        provider = "git_diff_removed",
        hl = {
            fg = "red",
            bg = "black",
        },
        right_sep = {
            str = " ",
            hl = {
                fg = "NONE",
                bg = "black",
            },
        },
    },
    {
        provider = "line_percentage",
        hl = {
            style = "bold",
        },
        left_sep = "  ",
        right_sep = " ",
    },
}

components.inactive[1] = {
    {
        provider = "file_info",
        opts = {
            type = "relative",
        },
        type = "relative",
        hl = {
            fg = "white",
            bg = "oceanblue",
            style = "bold",
        },
        left_sep = {
            "slant_left_2",
            { str = " ", hl = { bg = "oceanblue", fg = "NONE" } },
        },
        right_sep = {
            { str = " ", hl = { bg = "oceanblue", fg = "NONE" } },
            "slant_right_2",
            " ",
        },
    },
    -- Empty component to fix the highlight till the end of the statusline
    {},
}

local M = {}
M.setup = function()
    require("feline").setup {
        components = components,
    }
end

return M
