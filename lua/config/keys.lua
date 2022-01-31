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
        b = { "<cmd>lua _bottom_term:toggle()<CR>", "toggle/close term" },
        f = { "<cmd>lua _float_term:toggle()<CR>", "toggle/close term" },
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
    p = { "<cmd>Telescope find_files<cr>", "Telescope files" },
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
    x = {
        name = "fix",
        n = { "<cmd>cnext<cr>" },
        p = { "<cmd>cprev<cr>" },
    },
}, { prefix = "<leader>" })

map("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>', opts)
map("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
map("n", "<A-r>", '<CMD>lua require("FTerm").run("!!")<CR>', opts)

map("n", "<C-Left>", [[<C-W>h]], opts)
map("n", "<C-Down>", [[<C-W>j]], opts)
map("n", "<C-Up>", [[<C-W>k]], opts)
map("n", "<C-Right>", [[<C-W>l]], opts)

local function set_term_keys(term)
    buf_map(term.bufnr, "t", "<C-Left>", [[<C-\><C-n><C-W>h]], opts)
    buf_map(term.bufnr, "t", "<C-Down>", [[<C-\><C-n><C-W>j]], opts)
    buf_map(term.bufnr, "t", "<C-Up>", [[<C-\><C-n><C-W>k]], opts)
    buf_map(term.bufnr, "t", "<C-Right>", [[<C-\><C-n><C-W>l]], opts)
end

_float_term = Terminal:new {
    direction = "float",
    on_open = function(term)
        buf_map(term.bufnr, "t", "<C-/>", "<cmd>close<CR>", opts)
        buf_map(term.bufnr, "n", "<C-/>", "<cmd>close<CR>", opts)
    end,
}
_bottom_term = Terminal:new {
    direction = "horizontal",
    on_open = set_term_keys,
}
map("n", "<C-/>", "<cmd>ToggleTermToggleAll<CR>", opts)
map("t", "<C-/>", "<cmd>ToggleTermToggleAll<CR>", opts)

map("n", "<C-w><C-w>", "<cmd>lua require 'utils'.next_normal_window()<cr>", opts)

map("n", "<C-p>", '"+p', opts)

-- Navigation
map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })
map("n", "]t", "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>", opts)
map("n", "[t", "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>", opts)

-- Text object
map("o", "ih", ":<C-U>Gitsigns select_hunk<CR>", {})
map("x", "ih", ":<C-U>Gitsigns select_hunk<CR>", {})
