local vscode = vim.fn.exists('g:vscode') == 1

require'nvim-treesitter.configs'.setup {
    ensure_installed = {'rust', 'python', 'lua', 'vim', 'html', 'css', 'scss', 'javascript', 'typescript', 'toml', 'yaml'},
    highlight = {
        enable = not vscode,
        additional_vim_regex_highlighting = vscode,
    },
    indent = {
        enable = not vscode
    },
    textobjects = {
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
