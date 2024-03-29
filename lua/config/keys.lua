local wk = require "which-key"
local gs = require "gitsigns"
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local toggleterm = require "toggleterm.terminal"

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
        r = { '<cmd>wa <bar> TermExec cmd="!!" go_back=0<cr>', "save all files and repeat last command" },
    },
    q = {
        name = "quit",
        q = { "<cmd>xa<cr>", "quit" },
        w = { "<cmd>wa<cr>", "write all" },
    },
    f = {
        function()
            require("telescope.builtin").find_files {
                sorter = require("vscode-files").get_frecency_sorter(),
                find_command = { "rg", "--files", "--hidden", "--glob", "!.git" },
            }
        end,
        "Telescope files",
    },
    p = { '"+p', "paste from clipboard" },
    P = { "<cmd>Mru<cr>", "mru files" },
    F = { "<cmd>NvimTreeToggle<CR>", "file tree" },
    T = {
        name = "tabs", -- optional group name
        c = { "<cmd>tabclose<cr>", "close tab" },
        t = { "<cmd>tabnext<cr>", "next tab" },
        n = { "<cmd>tabnext<cr>", "next tab" },
        p = { "<cmd>tabprev<cr>", "next tab" },
    },
    t = {
        name = "Telescope",
        g = { "<cmd>Telescope live_grep<cr>", "live_grep" },
        c = { "<cmd>Telescope neoclip<cr>", "neoclip" },
        n = { "<cmd>Telescope notify<cr>", "notify" },
    },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "symbol picker" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "workspace symbols" },
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
        s = { "<cmd>lua require('tsht').nodes()<cr>", "select node" },
        R = { "<cmd>Telescope lsp_references<cr>", "references" },
        d = { "<cmd>Telescope lsp_document_symbols<cr>", "workspace symbols" },
        w = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "workspace symbols" },
    },
    u = {
        name = "unittest",
        t = { "<cmd>TestNearest<cw>" },
    },
    x = {
        name = "fix",
        n = { "<cmd>cnext<cr>" },
        p = { "<cmd>cprev<cr>" },
    },
}, { prefix = "<leader>" })

map("n", "<C-t>", "<CMD>exe v:count1 . 'ToggleTerm'<CR>", opts)
map("t", "<C-t>", "<C-\\><C-n><CMD>ToggleTerm<CR>", opts)

-- TODO tabs
map("n", "<C-Left>", [[<C-W>h]], opts)
map("n", "<C-Down>", [[<C-W>j]], opts)
map("n", "<C-Up>", [[<C-W>k]], opts)
map("n", "<C-Right>", [[<C-W>l]], opts)

-- TODO make textobject
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

map("n", "<a-i>", "<cmd>lua require'scope_movements'.up()<cr>", opts)
map("n", "<a-e>", "<cmd>lua require'scope_movements'.down()<cr>", opts)
map("n", "<a-n>", "<cmd>lua require'scope_movements'.sibling(0, 'prev')<cr>", opts)
map("n", "<a-o>", "<cmd>lua require'scope_movements'.sibling(0, 'next')<cr>", opts)

-- Text object
map("o", "ih", ":<C-U>Gitsigns select_hunk<CR>", {})
map("x", "ih", ":<C-U>Gitsigns select_hunk<CR>", {})
map("o", "m", ":<C-U>lua require('tsht').nodes()<CR>", opts)

map("n", "<C-p>", '"+p', opts)
map("n", "<C-s>", "<cmd>wa<cr>", { noremap = true })

vim.cmd [[
call textobj#user#plugin('line', {
\   '-': {
\     'select-a-function': 'CurrentLineA',
\     'select-a': 'al',
\     'select-i-function': 'CurrentLineI',
\     'select-i': 'il',
\   },
\ })

function! CurrentLineA()
  normal! 0
  let head_pos = getpos('.')
  normal! $
  let tail_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction

function! CurrentLineI()
  normal! ^
  let head_pos = getpos('.')
  normal! g_
  let tail_pos = getpos('.')
  let non_blank_char_exists_p = getline('.')[head_pos[2] - 1] !~# '\s'
  return
  \ non_blank_char_exists_p
  \ ? ['v', head_pos, tail_pos]
  \ : 0
endfunction
]]
vim.keymap.set({ "x", "o" }, "am", "<Plug>(textobj-chainmember-a)")
vim.keymap.set({ "x", "o" }, "im", "<Plug>(textobj-chainmember-i)")

-- Other
map("n", "ga", "<cmd>lua require'markdown'.toggle_markdown_check()<cr>", opts)
map("v", "<space>y", '"+y', opts)
map("v", "<space>p", '"+p', opts)

-- Match/surround
vim.keymap.set("n", "m", "<nop>")
vim.keymap.set("n", "mm", "%")
vim.keymap.set("n", "ma", "va")
vim.keymap.set("n", "mi", "vi")
--
-- vim.keymap.set("v", "ms", "S")
-- vim.keymap.set("n", "md", "ds")
-- vim.keymap.set("n", "mr", "cs")
vim.keymap.set({ "n", "v" }, "mt", ":lua require('tsht').nodes()<CR>", opts)

-- insert movement
