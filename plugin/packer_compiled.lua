-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/robin/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/robin/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/robin/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/robin/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/robin/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { " require('Comment').setup()" },
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FTerm.nvim"] = {
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/FTerm.nvim",
    url = "https://github.com/numToStr/FTerm.nvim"
  },
  LuaSnip = {
    after = { "cmp_luasnip" },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/robin/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/robin/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    after_files = { "/home/robin/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/robin/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/robin/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/robin/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/home/robin/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/robin/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    after_files = { "/home/robin/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/robin/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["diffview.nvim"] = {
    config = { "\27LJ\2\nÆ\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\17key_bindings\1\0\0\15file_panel\1\0\2\6c%<cmd>Neogit kind=split_above<cr>\6q\22<cmd>tabclose<cr>\tview\1\0\0\1\0\1\6q\22<cmd>tabclose<cr>\nsetup\rdiffview\frequire\0" },
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23config.status_line\frequire\0" },
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/feline.nvim",
    url = "https://github.com/feline-nvim/feline.nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["filetype.nvim"] = {
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["gitlinker.nvim"] = {
    config = { "\27LJ\2\nž\1\0\0\a\0\t\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\5\0006\4\0\0'\6\3\0B\4\2\0029\4\4\4=\4\6\3=\3\b\2B\0\2\1K\0\1\0\14callbacks\1\0\0\23git.hub.klippa.com\1\0\0\24get_gitlab_type_url\20gitlinker.hosts\nsetup\14gitlinker\frequire\0" },
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/gitlinker.nvim",
    url = "https://github.com/ruifm/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n¹\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\20buftype_exclude\1\2\0\0\rterminal\21filetype_exclude\1\n\0\0\thelp\rterminal\14dashboard\vpacker\flspinfo\20TelescopePrompt\21TelescopeResults\22nvchad_cheatsheet\5\1\0\4\28show_first_indent_level\1\tchar\bâ–#show_trailing_blankline_indent\1\23indentLine_enabled\3\1\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  neogen = {
    config = { "\27LJ\2\nD\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fenabled\2\nsetup\vneogen\frequire\0" },
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/neogen",
    url = "https://github.com/danymat/neogen"
  },
  neogit = {
    config = { "\27LJ\2\n˜\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\17integrations\1\0\1\rdiffview\2\1\0\2!disable_context_highlighting\2 disable_commit_confirmation\2\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\n³\2\0\0\6\0\17\0)6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0004\4\t\0009\5\4\0009\5\5\0059\5\6\5>\5\1\0049\5\4\0009\5\a\0059\5\b\5>\5\2\0049\5\4\0009\5\5\0059\5\t\5>\5\3\0049\5\4\0009\5\5\0059\5\n\5>\5\4\0049\5\4\0009\5\5\0059\5\v\5>\5\5\0049\5\4\0009\5\a\0059\5\f\5>\5\6\0049\5\4\0009\5\a\0059\5\r\5>\5\a\0049\5\4\0009\5\14\0059\5\15\5>\5\b\4=\4\16\3B\1\2\1K\0\1\0\fsources\fluasnip\15completion\vflake8\tmypy\nblack\nisort\vdjhtml\vselene\16diagnostics\vstylua\15formatting\rbuiltins\1\0\1\ndebug\2\nsetup\fnull-ls\frequire\0" },
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    after = { "cmp-buffer", "cmp-cmdline", "LuaSnip", "cmp-nvim-lua", "cmp-path" },
    loaded = true,
    only_config = true
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    config = { 'require "config.lsp"' },
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\nL\0\0\4\0\4\0\v6\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0006\0\0\0009\0\1\0009\0\3\0004\2\0\0B\0\2\1K\0\1\0\nsetup\frequire\vnotify\bvim\0" },
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-scrollbar"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14scrollbar\frequire\0" },
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-terminal.lua"] = {
    config = { 'require("terminal").setup()' },
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/nvim-terminal.lua",
    url = "https://github.com/norcalli/nvim-terminal.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nž\1\0\0\4\0\t\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\6\0005\3\a\0=\3\b\2B\0\2\1K\0\1\0\24update_focused_file\1\0\1\venable\2\1\0\1\15auto_close\2\nsetup\14nvim-tree\frequire\27nvim_tree_quit_on_open\6g\bvim\0" },
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { 'require "config.treesitter"' },
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\2\ny\0\0\a\0\b\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\5\0006\4\0\0'\6\3\0B\4\2\0029\4\4\4=\4\4\3=\3\a\2B\0\2\1K\0\1\0\ntools\1\0\0\1\0\0\14on_attach\15config.lsp\nsetup\15rust-tools\frequire\0" },
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["sessions.nvim"] = {
    config = { "\27LJ\2\nÒ\1\0\0\6\1\t\0\24-\0\0\0009\0\0\0B\0\1\0026\1\1\0009\1\2\1'\3\3\0\18\4\0\0&\3\4\3B\1\2\0016\1\1\0009\1\4\0019\1\5\1'\3\6\0B\1\2\2'\2\a\0\18\3\0\0&\1\3\0016\2\1\0009\2\2\2'\4\b\0\18\5\1\0&\4\5\4B\2\2\1L\1\2\0\0À\18session path \20/sessions.nvim/\tdata\fstdpath\afn\22session filename \vnotify\bvim\"escaped_session_name_from_cwdm\1\0\5\0\a\0\r6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\5\0003\4\4\0=\4\6\3B\1\2\0012\0\0€K\0\1\0\21session_filepath\1\0\0\0\nsetup\rsessions\nutils\frequire\0" },
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/sessions.nvim",
    url = "/home/robin/prog/hobby/sessions.nvim"
  },
  ["solarized.nvim"] = {
    config = { "\27LJ\2\n×\2\0\0\3\0\f\0\"6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\3\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0006\0\0\0009\0\1\0+\1\1\0=\1\5\0006\0\0\0009\0\1\0+\1\2\0=\1\6\0006\0\0\0009\0\1\0+\1\1\0=\1\a\0006\0\0\0009\0\1\0+\1\1\0=\1\b\0006\0\t\0'\2\n\0B\0\2\0029\0\v\0B\0\1\1K\0\1\0\bset\14solarized\frequire!solarized_disable_background\22solarized_borders\23solarized_contrast\31solarized_italic_variables\31solarized_italic_functions\30solarized_italic_keywords\30solarized_italic_comments\6g\bvim\0" },
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/solarized.nvim",
    url = "https://github.com/shaunsingh/solarized.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nî\1\0\0\b\0\16\0\0256\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0026\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\14\0005\4\f\0005\5\b\0005\6\6\0009\a\5\0=\a\a\6=\6\t\0055\6\n\0009\a\5\0=\a\a\6=\6\v\5=\5\r\4=\4\15\3B\1\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6n\1\0\0\6i\1\0\0\n<c-t>\1\0\0\22open_with_trouble\nsetup\14telescope trouble.providers.telescope\22telescope.actions\frequire\0" },
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\nŸ\1\0\0\3\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0*highlight DarkenedPanel guibg=#eee8d5\bcmd\bvim\1\0\2\19shading_factor\3\3\20shade_terminals\2\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nv\0\0\3\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0-autocmd FileType Trouble :set cursorline\bcmd\bvim\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-closer"] = {
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/vim-closer",
    url = "https://github.com/9mm/vim-closer"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/vim-indent-object",
    url = "https://github.com/michaeljsmith/vim-indent-object"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-textobj-chainmember"] = {
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/vim-textobj-chainmember",
    url = "https://github.com/D4KU/vim-textobj-chainmember"
  },
  ["vim-textobj-comment"] = {
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/vim-textobj-comment",
    url = "https://github.com/glts/vim-textobj-comment"
  },
  ["vim-textobj-entire"] = {
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/vim-textobj-entire",
    url = "https://github.com/kana/vim-textobj-entire"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  ["vim-textobj-variable-segment"] = {
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/vim-textobj-variable-segment",
    url = "https://github.com/Julian/vim-textobj-variable-segment"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nS\0\0\3\0\4\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\1K\0\1\0\16config.keys\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["workspaces.nvim"] = {
    config = { "\27LJ\2\nH\0\0\4\0\4\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0+\2\0\0005\3\3\0B\0\3\1K\0\1\0\1\0\1\vsilent\1\tload\rsessions\frequire~\1\0\4\0\b\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0005\2\6\0003\3\5\0=\3\a\2B\0\2\1K\0\1\0\topen\1\0\0\0\nsetup\15workspaces\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/robin/.local/share/nvim/site/pack/packer/start/workspaces.nvim",
    url = "https://github.com/natecraddock/workspaces.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nî\1\0\0\b\0\16\0\0256\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0026\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\14\0005\4\f\0005\5\b\0005\6\6\0009\a\5\0=\a\a\6=\6\t\0055\6\n\0009\a\5\0=\a\a\6=\6\v\5=\5\r\4=\4\15\3B\1\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6n\1\0\0\6i\1\0\0\n<c-t>\1\0\0\22open_with_trouble\nsetup\14telescope trouble.providers.telescope\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-scrollbar
time([[Config for nvim-scrollbar]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14scrollbar\frequire\0", "config", "nvim-scrollbar")
time([[Config for nvim-scrollbar]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n¹\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\20buftype_exclude\1\2\0\0\rterminal\21filetype_exclude\1\n\0\0\thelp\rterminal\14dashboard\vpacker\flspinfo\20TelescopePrompt\21TelescopeResults\22nvchad_cheatsheet\5\1\0\4\28show_first_indent_level\1\tchar\bâ–#show_trailing_blankline_indent\1\23indentLine_enabled\3\1\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: neogen
time([[Config for neogen]], true)
try_loadstring("\27LJ\2\nD\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fenabled\2\nsetup\vneogen\frequire\0", "config", "neogen")
time([[Config for neogen]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\nŸ\1\0\0\3\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0*highlight DarkenedPanel guibg=#eee8d5\bcmd\bvim\1\0\2\19shading_factor\3\3\20shade_terminals\2\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-terminal.lua
time([[Config for nvim-terminal.lua]], true)
require("terminal").setup()
time([[Config for nvim-terminal.lua]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nS\0\0\3\0\4\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\1K\0\1\0\16config.keys\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n˜\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\17integrations\1\0\1\rdiffview\2\1\0\2!disable_context_highlighting\2 disable_commit_confirmation\2\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: workspaces.nvim
time([[Config for workspaces.nvim]], true)
try_loadstring("\27LJ\2\nH\0\0\4\0\4\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0+\2\0\0005\3\3\0B\0\3\1K\0\1\0\1\0\1\vsilent\1\tload\rsessions\frequire~\1\0\4\0\b\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0005\2\6\0003\3\5\0=\3\a\2B\0\2\1K\0\1\0\topen\1\0\0\0\nsetup\15workspaces\19load_extension\14telescope\frequire\0", "config", "workspaces.nvim")
time([[Config for workspaces.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require "config.treesitter"
time([[Config for nvim-treesitter]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23config.status_line\frequire\0", "config", "feline.nvim")
time([[Config for feline.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\nv\0\0\3\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0-autocmd FileType Trouble :set cursorline\bcmd\bvim\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require "config.nvim-cmp"
time([[Config for nvim-cmp]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: sessions.nvim
time([[Config for sessions.nvim]], true)
try_loadstring("\27LJ\2\nÒ\1\0\0\6\1\t\0\24-\0\0\0009\0\0\0B\0\1\0026\1\1\0009\1\2\1'\3\3\0\18\4\0\0&\3\4\3B\1\2\0016\1\1\0009\1\4\0019\1\5\1'\3\6\0B\1\2\2'\2\a\0\18\3\0\0&\1\3\0016\2\1\0009\2\2\2'\4\b\0\18\5\1\0&\4\5\4B\2\2\1L\1\2\0\0À\18session path \20/sessions.nvim/\tdata\fstdpath\afn\22session filename \vnotify\bvim\"escaped_session_name_from_cwdm\1\0\5\0\a\0\r6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\5\0003\4\4\0=\4\6\3B\1\2\0012\0\0€K\0\1\0\21session_filepath\1\0\0\0\nsetup\rsessions\nutils\frequire\0", "config", "sessions.nvim")
time([[Config for sessions.nvim]], false)
-- Config for: rust-tools.nvim
time([[Config for rust-tools.nvim]], true)
try_loadstring("\27LJ\2\ny\0\0\a\0\b\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\5\0006\4\0\0'\6\3\0B\4\2\0029\4\4\4=\4\4\3=\3\a\2B\0\2\1K\0\1\0\ntools\1\0\0\1\0\0\14on_attach\15config.lsp\nsetup\15rust-tools\frequire\0", "config", "rust-tools.nvim")
time([[Config for rust-tools.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
 require('Comment').setup()
time([[Config for Comment.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\n³\2\0\0\6\0\17\0)6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0004\4\t\0009\5\4\0009\5\5\0059\5\6\5>\5\1\0049\5\4\0009\5\a\0059\5\b\5>\5\2\0049\5\4\0009\5\5\0059\5\t\5>\5\3\0049\5\4\0009\5\5\0059\5\n\5>\5\4\0049\5\4\0009\5\5\0059\5\v\5>\5\5\0049\5\4\0009\5\a\0059\5\f\5>\5\6\0049\5\4\0009\5\a\0059\5\r\5>\5\a\0049\5\4\0009\5\14\0059\5\15\5>\5\b\4=\4\16\3B\1\2\1K\0\1\0\fsources\fluasnip\15completion\vflake8\tmypy\nblack\nisort\vdjhtml\vselene\16diagnostics\vstylua\15formatting\rbuiltins\1\0\1\ndebug\2\nsetup\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
try_loadstring("\27LJ\2\nÆ\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\17key_bindings\1\0\0\15file_panel\1\0\2\6c%<cmd>Neogit kind=split_above<cr>\6q\22<cmd>tabclose<cr>\tview\1\0\0\1\0\1\6q\22<cmd>tabclose<cr>\nsetup\rdiffview\frequire\0", "config", "diffview.nvim")
time([[Config for diffview.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nž\1\0\0\4\0\t\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\6\0005\3\a\0=\3\b\2B\0\2\1K\0\1\0\24update_focused_file\1\0\1\venable\2\1\0\1\15auto_close\2\nsetup\14nvim-tree\frequire\27nvim_tree_quit_on_open\6g\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: gitlinker.nvim
time([[Config for gitlinker.nvim]], true)
try_loadstring("\27LJ\2\nž\1\0\0\a\0\t\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\5\0006\4\0\0'\6\3\0B\4\2\0029\4\4\4=\4\6\3=\3\b\2B\0\2\1K\0\1\0\14callbacks\1\0\0\23git.hub.klippa.com\1\0\0\24get_gitlab_type_url\20gitlinker.hosts\nsetup\14gitlinker\frequire\0", "config", "gitlinker.nvim")
time([[Config for gitlinker.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require "config.lsp"
time([[Config for nvim-lspconfig]], false)
-- Config for: solarized.nvim
time([[Config for solarized.nvim]], true)
try_loadstring("\27LJ\2\n×\2\0\0\3\0\f\0\"6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\3\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0006\0\0\0009\0\1\0+\1\1\0=\1\5\0006\0\0\0009\0\1\0+\1\2\0=\1\6\0006\0\0\0009\0\1\0+\1\1\0=\1\a\0006\0\0\0009\0\1\0+\1\1\0=\1\b\0006\0\t\0'\2\n\0B\0\2\0029\0\v\0B\0\1\1K\0\1\0\bset\14solarized\frequire!solarized_disable_background\22solarized_borders\23solarized_contrast\31solarized_italic_variables\31solarized_italic_functions\30solarized_italic_keywords\30solarized_italic_comments\6g\bvim\0", "config", "solarized.nvim")
time([[Config for solarized.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\nL\0\0\4\0\4\0\v6\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0006\0\0\0009\0\1\0009\0\3\0004\2\0\0B\0\2\1K\0\1\0\nsetup\frequire\vnotify\bvim\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd cmp-path ]]
vim.cmd [[ packadd cmp-cmdline ]]
vim.cmd [[ packadd cmp-nvim-lua ]]
vim.cmd [[ packadd LuaSnip ]]
vim.cmd [[ packadd cmp_luasnip ]]
vim.cmd [[ packadd cmp-buffer ]]
time([[Sequenced loading]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
