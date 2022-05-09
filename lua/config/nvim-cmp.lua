local cmp = require "cmp"

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = {
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<CR>"] = cmp.mapping.confirm { select = false },
        ['<C-n>'] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                else
                    vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                else
                    fallback()
                end
            end
        }),
        ['<C-p>'] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                else
                    vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                else
                    fallback()
                end
            end
        }),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "buffer", keyword_length = 4 },
        { name = "cmdline" },
    },
    formatting = {
        format = require("lspkind").cmp_format {
            with_text = true,
        },
    },
}
