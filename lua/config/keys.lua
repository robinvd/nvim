local wk = require "which-key"
local gs = require "gitsigns"
local map = vim.api.nvim_set_keymap
local buf_map = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }
local toggleterm = require "toggleterm.terminal"
local Terminal = toggleterm.Terminal
local utils = require "utils"

wk.register({
    ["<space>"] = { "<cmd>Telescope find_files<cr>", "Telescope files" },
    c = {
        name = "commands/terminal",
        c = { "<cmd>ToggleTermToggleAll<CR>", "open close all" },
        n = { "<cmd>ToggleTerm<CR>", "add terminal" },
        q = {
            function()
                for _, term in ipairs(toggleterm.get_all(true)) do
                    term:shutdown()
                end
            end,
            "quit all terms",
        },
    },
    q = {
        name = "quit",
        q = { "<cmd>xa<cr>", "quit" },
        w = { "<cmd>wa<cr>", "write all" },
    },
    p = {
        function()
            require("telescope.builtin").find_files { find_command = { "rg", "--files", "--hidden", "--glob", "!.git" } }
        end,
        "Telescope files",
    },
    f = { "<cmd>NvimTreeToggle<CR>", "file tree" },
    t = {
        name = "tabs", -- optional group name
        c = { "<cmd>tabclose<cr>", "close tab" },
        t = { "<cmd>tabnext<cr>", "next tab" },
        n = { "<cmd>tabnext<cr>", "next tab" },
        p = { "<cmd>tabprev<cr>", "next tab" },
    },
    T = {
        name = "Telescope",
        g = { "<cmd>Telescope live_grep<cr>", "Telescope live_grep" },
        n = { "<cmd>Telescope notify<cr>", "Telescope notify" },
        s = { "<cmd>Telescope session-lens search_session<cr>", "Telescope session" },
    },
    g = {
        name = "git",
        y = { "copy remote link" },
        b = { "<cmd>Telescope git_branches<cr>", "select branch" },
        d = { "<cmd>DiffviewOpen<cr>", "diff view" },
        c = { "<cmd>Neogit commit<cr>", "commit" },
        g = { "<cmd>Neogit<cr>", "neogit" },
        h = {
            name = "hunk",
            s = { gs.stage_hunk, "stage hunk" },
            r = { gs.reset_hunk, "reset hunk" },
            u = { gs.undo_stage_hunk, "undo stage hunk" },
        },
    },
    l = {
        name = "lsp",
        R = { "<cmd>Telescope lsp_references<cr>", "references" },
        d = { "<cmd>Telescope lsp_document_symbols<cr>", "workspace symbols" },
        w = { "<cmd>Telescope lsp_workspace_symbols<cr>", "workspace symbols" },
        W = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "workspace symbols" },
    },
    u = {
        name = "unittest",
        t = { "<cmd>TestNearest<cw>" }
    },
    x = {
        name = "fix",
        n = { "<cmd>cnext<cr>" },
        p = { "<cmd>cprev<cr>" },
    },
}, { prefix = "<leader>" })

map("n", "<A-t>", "<CMD>exe v:count1 . 'ToggleTerm'<CR>", opts)
map("t", "<A-t>", '<C-\\><C-n><CMD>ToggleTerm<CR>', opts)

map("n", "<C-Left>", [[<C-W>h]], opts)
map("n", "<C-Down>", [[<C-W>j]], opts)
map("n", "<C-Up>", [[<C-W>k]], opts)
map("n", "<C-Right>", [[<C-W>l]], opts)

map("n", "gp", "`[v`]", opts)

map("t", "<C-Left>", [[<C-\><C-n><C-W>h]], opts)
map("t", "<C-Down>", [[<C-\><C-n><C-W>j]], opts)
map("t", "<C-Up>", [[<C-\><C-n><C-W>k]], opts)
map("t", "<C-Right>", [[<C-\><C-n><C-W>l]], opts)

map("n", "<C-w><C-w>", "<cmd>lua require 'utils'.next_normal_window()<cr>", opts)

-- Navigation
map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })
map("n", "]t", "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>", opts)
map("n", "[t", "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>", opts)

-- Text object
map("o", "ih", ":<C-U>Gitsigns select_hunk<CR>", {})
map("x", "ih", ":<C-U>Gitsigns select_hunk<CR>", {})

-- TODO make textobject
map("n", "<C-p>", '"+p', opts)

