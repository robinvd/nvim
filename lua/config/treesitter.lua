require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "rust",
        "python",
        "lua",
        "vim",
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "toml",
        "yaml",
        "markdown",
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
    textobjects = {
        swap = {
            enable = true,
            swap_next = {
                swap_next = {
                    ["<leader>a"] = "@parameter.inner",
                },
                swap_previous = {
                    ["<leader>A"] = "@parameter.inner",
                },
            }
        },
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["ia"] = "@parameter.inner",
            },
        },
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "<a-e>",
            node_decremental = "<a-i>",
            scope_incremental = "grc",
        },
    },
        -- refactor = {
    --     highlight_definitions = { enable = not vscode },
    --     highlight_current_scope = { enable = false },
    --     smart_rename = {
    --         enable = not vscode,
    --         keymaps = {
    --             smart_rename = "grr",
    --         },
    --     },
    -- },
}
