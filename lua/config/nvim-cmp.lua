local cmp = require'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 4 },
        { name = 'cmdline' },
    },
    -- TODO
    formatting = {
        format = require 'lspkind'.cmp_format({
            with_text = true,
        })
    }
})
print('cmp setup done')
