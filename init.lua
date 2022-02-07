local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
end

vim.cmd [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
    augroup end

    set undofile
    set undodir=~/.local/share/nvim/undo
]]

vim.g.mapleader = " "

vim.cmd [[
    filetype plugin indent on
    set mouse=a
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set number
    set termguicolors
    set hidden
    set splitright
    set splitbelow
    set nowrap
    set cmdheight=1
    set updatetime=300
    set scrolloff=3
    set shortmess+=c
    set completeopt=menu,menuone,noselect
    set sessionoptions+=winpos,terminal
    set grepprg=rg\ --vimgrep
    set grepformat^=%f:%l:%c:%m
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    autocmd FileType qf nnoremap <buffer> <CR> <CR>:lclose<CR>
    let g:neovide_cursor_animation_length=0
]]

return require("packer").startup(function(raw_use)
    function use(config)
        if type(config) ~= "table" then
            config = { config }
        end
        if config["config_mod"] then
            config["config"] = 'require "' .. config["config_mod"] .. '"'
            config["config_mod"] = nil
        end
        raw_use(config)
    end

    function term_use(config)
        -- if type(config) ~= 'table' then
        --     config = {config}
        -- end
        -- config['disabled'] = vscode
        use(config)
    end

    -- example plugins: https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/plugins.lua

    use "wbthomason/packer.nvim"
    use "9mm/vim-closer"
    use "nathom/filetype.nvim"
    use "andymass/vim-matchup"
    -- term_use {"kevinhwang91/nvim-hlslens"}
    term_use {
        "petertriho/nvim-scrollbar",
        config = function()
            require("scrollbar").setup()
        end,
    }

    use "editorconfig/editorconfig-vim"
    -- use {'easymotion/vim-easymotion', cond = not vscode}
    -- use {'asvetliakov/vim-easymotion', cond = vscode, as = 'vsc-easymotion'}
    use "tpope/vim-repeat"
    use "tpope/vim-surround"
    use "michaeljsmith/vim-indent-object"
    use "ggandor/lightspeed.nvim"

    use "kana/vim-textobj-user"
    -- ae/ie
    use "kana/vim-textobj-entire"
    -- ac/Ac
    use "glts/vim-textobj-comment"
    -- am/im
    use "D4KU/vim-textobj-chainmember"
    -- av/iv
    use "Julian/vim-textobj-variable-segment"

    use {
        "ruifm/gitlinker.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("gitlinker").setup {
                callbacks = {
                    ["git.hub.klippa.com"] = require("gitlinker.hosts").get_gitlab_type_url,
                },
            }
        end,
    }

    -- TODO
    -- https://github.com/folke/twilight.nvim
    -- treesitter
    --   https://github.com/vigoux/architext.nvim
    --   https://github.com/mfussenegger/nvim-treehopper

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config_mod = "config.treesitter",
    }
    use {
        "danymat/neogen",
        config = function()
            require("neogen").setup {
                enabled = true,
            }
        end,
        requires = "nvim-treesitter/nvim-treesitter",
    }
    -- use 'nvim-treesitter/nvim-treesitter-refactor'
    -- use 'nvim-treesitter/nvim-treesitter-textobjects'
    -- use {
    --   'glepnir/galaxyline.nvim',
    --   branch = 'main',
    --   -- your statusline
    --   -- config = function() require'my_statusline' end,
    --   -- some optional icons
    --   requires = {'kyazdani42/nvim-web-devicons', opt = true}
    -- }
    term_use {
        "feline-nvim/feline.nvim",
        config = function()
            require("config.status_line").setup()
        end,
    }

    term_use { "neovim/nvim-lspconfig", config_mod = "config.lsp" }
    term_use {
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup {}
        end,
    }
    term_use {
        "simrat39/rust-tools.nvim",
        config = function()
            require("rust-tools").setup {
                tools = {
                    on_attach = require("config.lsp").on_attach,
                },
            }
        end,
    }

    term_use { "hrsh7th/cmp-nvim-lsp" }
    term_use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
    term_use { "hrsh7th/cmp-path", after = "nvim-cmp" }
    term_use { "hrsh7th/cmp-cmdline", after = "nvim-cmp" }
    -- term_use {"hrsh7th/nvim-cmp", event = "InsertEnter", config_mod = 'config.nvim-cmp'}
    term_use { "hrsh7th/nvim-cmp", config_mod = "config.nvim-cmp" }

    term_use { "L3MON4D3/LuaSnip", after = "nvim-cmp" }
    term_use { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" }
    term_use { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" }
    term_use { "onsails/lspkind-nvim" }
    -- term_use {"windwp/nvim-autopairs", setup = function()
    --     require('nvim-autopairs').setup{}
    --     require 'cmp'.event:on('confirm_done', require 'nvim-autopairs.completion.cmp'.on_confirm_done({  map_char = { tex = '' } }))
    -- end}

    term_use {
        "norcalli/nvim-terminal.lua",
        config = [[require("terminal").setup()]],
    }
    term_use {
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("gitsigns").setup {
                -- signs = {
                --     add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
                --     change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
                --     delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
                --     topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
                --     changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
                -- },
            }
        end,
    }
    term_use {
        "sindrets/diffview.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("diffview").setup {
                key_bindings = {
                    view = {
                        q = "<cmd>tabclose<cr>",
                    },
                    file_panel = {
                        q = "<cmd>tabclose<cr>",
                        c = "<cmd>Neogit kind=split_above<cr>",
                    },
                },
            }
        end,
    }
    term_use {
        "TimUntersberger/neogit",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("neogit").setup {
                disable_context_highlighting = true,
                disable_commit_confirmation = true,
                integrations = {
                    diffview = true,
                },
            }
        end,
    }
    term_use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
            require "config.keys"
        end,
    }
    term_use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup {
                indentLine_enabled = 1,
                char = "▏",
                filetype_exclude = {
                    "help",
                    "terminal",
                    "dashboard",
                    "packer",
                    "lspinfo",
                    "TelescopePrompt",
                    "TelescopeResults",
                    "nvchad_cheatsheet",
                    "",
                },
                buftype_exclude = { "terminal" },
                show_trailing_blankline_indent = false,
                show_first_indent_level = false,
            }
        end,
    }
    term_use "norcalli/nvim-colorizer.lua"
    term_use "kyazdani42/nvim-web-devicons"
    term_use {
        "numToStr/Comment.nvim",
        config = [[ require('Comment').setup()]],
    }
    term_use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
        config = function()
            require "telescope.actions"
            local trouble = require "trouble.providers.telescope"
            require("telescope").setup {
                defaults = {
                    mappings = {
                        i = { ["<c-t>"] = trouble.open_with_trouble },
                        n = { ["<c-t>"] = trouble.open_with_trouble },
                    },
                },
            }
        end,
    }
    term_use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup()
            vim.cmd "autocmd FileType Trouble :set cursorline"
        end,
    }
    term_use {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            local null_ls = require "null-ls"
            null_ls.setup {
                debug = true,
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.diagnostics.selene,
                    null_ls.builtins.formatting.djhtml,
                    null_ls.builtins.formatting.isort,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.diagnostics.mypy,
                    -- null_ls.builtins.diagnostics.editorconfig_checker,
                    null_ls.builtins.diagnostics.flake8,
                    -- null_ls.builtins.code_actions.gitsigns,
                    -- null_ls.builtins.code_actions.refactoring,
                    null_ls.builtins.completion.luasnip,
                },
            }
        end,
    }
    term_use {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require "notify"
            vim.notify.setup {
                -- render="minimal",
            }
        end,
    }
    term_use {
        "shaunsingh/solarized.nvim",
        config = function()
            vim.g.solarized_italic_comments = true
            vim.g.solarized_italic_keywords = false
            vim.g.solarized_italic_functions = false
            vim.g.solarized_italic_variables = false
            vim.g.solarized_contrast = true
            vim.g.solarized_borders = false
            vim.g.solarized_disable_background = false
            require("solarized").set()
        end,
    }
    -- makes prompt etc better
    -- example: vim.ui.select({ "Yes", "No" }, { prompt = '' }, function(choice) end)
    term_use "stevearc/dressing.nvim"
    -- term_use {'karb94/neoscroll.nvim', config = function() require('neoscroll').setup() end}
    term_use { "numToStr/FTerm.nvim" }
    term_use {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup {
                open_mapping = nil,
                shading_factor = 3,
                shade_terminals = true,
            }
            vim.cmd "highlight DarkenedPanel guibg=#eee8d5"
        end,
    }
    term_use {
        "kyazdani42/nvim-tree.lua",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            vim.g.nvim_tree_quit_on_open = 1
            require("nvim-tree").setup { auto_close = true, update_focused_file = { enable = true } }
        end,
    }
end)
