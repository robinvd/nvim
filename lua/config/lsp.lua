local M = {}
function M.on_attach(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

end

-- Mappings.
local opts = { noremap=true, silent=true }

local map = vim.api.nvim_set_keymap
-- See `:help vim.lsp.*` for documentation on any of the below functions
-- map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
map('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
-- map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
-- map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
map('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
map('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', '<leader>.', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<leader>le', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<leader>lq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
map('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

local nvim_lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
   properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
   },
}

local servers = {
    -- 'pyright',
    -- 'rust_analyzer',
    -- 'tsserver',
}

local configs = require('lspconfig/configs')
local util = require('lspconfig/util')

local path = util.path

local function get_python_path(workspace)
    -- Use activated virtualenv.
    if vim.env.VIRTUAL_ENV then
        return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
    end

    -- Find and use virtualenv in workspace directory.
    for _, pattern in ipairs({'venv/bin/python'}) do
        local python_path = path.join(workspace, pattern)
        local match = vim.fn.glob(python_path)
        if match ~= '' then
            return python_path
        end
    end

    -- Fallback to system Python.
    return exepath('python3') or exepath('python') or 'python'
end

nvim_lsp.pyright.setup {
    on_attach = M.on_attach,
    capabilities = capabilities,
    autostart=true,
    flags = {
        debounce_text_changes = 150,
    },
    before_init = function(_, config)
        config.settings.python.pythonPath = get_python_path(config.root_dir)
    end
}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = M.on_attach,
        capabilities = capabilities,
        autostart=true,
        flags = {
            debounce_text_changes = 150,
        }
    }
end

local function lspSymbol(name, icon)
  local hl = "DiagnosticSign" .. name
  vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

lspSymbol("Error", "")
lspSymbol("Info", "")
lspSymbol("Hint", "")
lspSymbol("Warn", "")

vim.diagnostic.config {
   virtual_text = {
       prefix = "",
   },
   signs = false,
   underline = true,
   update_in_insert = false,
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
   border = "single",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
   border = "single",
})

return M
