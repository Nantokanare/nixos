{
  pkgs,
  lib,
  ...
}: {
  options = {
     autoCmd = [
       {
         event = [ "FileType" ];
         pattern = [ "qf" ];
         command = "nmap <buffer> <CR> <CR>";
         # options.desc = "Restore enter in quickfix";
       }
       {
         event = [ "FileType" ];
         pattern = [ "qf" ];
         command = "nmap <buffer><silent> q :ccl<CR>";
         # options.desc = "Quit quickfix with q";
       }
       {
         event = [ "FileType" ];
         pattern = [ "help" ];
         command = "nmap <buffer><silent> q :q<CR>";
         # options.desc = "Quit help with q";
       }
       {
         event = [ "FileType" ];
         pattern = [ "markdown" ];
         command = "<cmd>set wrap<CR>";
         # options.desc = "Wrap markdown";
       }
     ];

    globals = {
      mapleader = " ";
    };

    options = {
      sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions";
      termguicolors = true;
      scrolloff = 10;
      swapfile = false;
      backup = false; # don't create backups
      hlsearch = false;
      incsearch = true;
      wrap = false;

      shiftwidth = 2;
      tabstop = 4;
      softtabstop = 4;
      expandtab = true;
      smartindent = true;

      cursorline = true;
      number = true;
      relativenumber = true;
      numberwidth = 2;
      ruler = false;

      splitbelow = true;
      splitright = true;
      undofile = true;
      undolevels = 10000;

      signcolumn = "yes";
      cmdheight = 0;
      cot = ["menu" "menuone" "noselect"];

      updatetime = 100;
      timeout = true;
      timeoutlen = 250;

      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;
      clipboard = "unnamedplus";
    };

      extraPackages = with pkgs; [
        fd
        ripgrep
        lazygit
        gnused
      ];

    #  extraPlugins = with pkgs.vimPlugins; [
    #    # Rust
    #    nvim-dap
    #    crates-nvim
    #    rust-tools-nvim
    #    neotest-rust
    #    neotest
    #    # LazyVim
    #    LazyVim
    #    lazy-nvim
    #    bufferline-nvim
    #    cmp-buffer
    #    cmp-nvim-lsp
    #    cmp-path
    #    cmp_luasnip
    #    conform-nvim
    #    dashboard-nvim
    #    dressing-nvim
    #    flash-nvim
    #    friendly-snippets
    #    gitsigns-nvim
    #    indent-blankline-nvim
    #    clangd_extensions-nvim
    #    lualine-nvim
    #    neo-tree-nvim
    #    oil-nvim
    #    nvim-web-devicons
    #    neoconf-nvim
    #    neodev-nvim
    #    noice-nvim
    #    nui-nvim
    #    nvim-cmp
    #    nvim-lint
    #    nvim-lspconfig
    #    nvim-notify
    #    nvim-spectre
    #    nvim-treesitter
    #    nvim-treesitter-context
    #    nvim-treesitter-textobjects
    #    nvim-ts-autotag
    #    nvim-ts-context-commentstring
    #    nvim-web-devicons
    #    persistence-nvim
    #    plenary-nvim
    #    telescope-fzf-native-nvim
    #    telescope-nvim
    #    todo-comments-nvim
    #    tokyonight-nvim
    #    trouble-nvim
    #    vim-illuminate
    #    vim-startuptime
    #  ];

    # extraConfigLua = let
    #   plugins = with pkgs.vimPlugins; [
    #     # Rust
    #     nvim-dap
    #     crates-nvim
    #     rust-tools-nvim
    #     neotest-rust
    #     neotest
    #     # LazyVim
    #     LazyVim
    #     lazy-nvim
    #     bufferline-nvim
    #     cmp-buffer
    #     cmp-nvim-lsp
    #     cmp-path
    #     cmp_luasnip
    #     conform-nvim
    #     dashboard-nvim
    #     dressing-nvim
    #     flash-nvim
    #     friendly-snippets
    #     gitsigns-nvim
    #     indent-blankline-nvim
    #     clangd_extensions-nvim
    #     lualine-nvim
    #     neo-tree-nvim
    #     oil-nvim
    #     nvim-web-devicons
    #     neoconf-nvim
    #     neodev-nvim
    #     noice-nvim
    #     nui-nvim
    #     nvim-cmp
    #     nvim-lint
    #     nvim-lspconfig
    #     nvim-notify
    #     nvim-spectre
    #     nvim-treesitter
    #     nvim-treesitter-context
    #     nvim-treesitter-textobjects
    #     nvim-ts-autotag
    #     nvim-ts-context-commentstring
    #     nvim-web-devicons
    #     persistence-nvim
    #     plenary-nvim
    #     telescope-fzf-native-nvim
    #     telescope-nvim
    #     todo-comments-nvim
    #     tokyonight-nvim
    #     trouble-nvim
    #     vim-illuminate
    #     vim-startuptime
    #     which-key-nvim
    #     {
    #       name = "LuaSnip";
    #       path = luasnip;
    #     }
    #     {
    #       name = "mini.ai";
    #       path = mini-nvim;
    #     }
    #     {
    #       name = "mini.bufremove";
    #       path = mini-nvim;
    #     }
    #     {
    #       name = "mini.comment";
    #       path = mini-nvim;
    #     }
    #     {
    #       name = "mini.indentscope";
    #       path = mini-nvim;
    #     }
    #     {
    #       name = "mini.pairs";
    #       path = mini-nvim;
    #     }
    #     {
    #       name = "mini.surround";
    #       path = mini-nvim;
    #     }
    #   ];
    #   mkEntryFromDrv = drv:
    #     if lib.isDerivation drv
    #     then {
    #       name = "${lib.getName drv}";
    #       path = drv;
    #     }
    #     else drv;
    #   lazyPath = pkgs.linkFarm "lazy-plugins" (builtins.map mkEntryFromDrv plugins);
    # in ''
    #   require("lazy").setup({
    #     defaults = {
    #       lazy = true,
    #     },
    #     dev = {
    #       -- reuse files from pkgs.vimPlugins.*
    #       path = "${lazyPath}",
    #       patterns = { "." },
    #       -- fallback to download
    #       fallback = true,
    #     },
    #     spec = {
    #       -- add LazyVim and import its plugins
    #       { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    #       -- The following configs are needed for fixing lazyvim on nix
    #       -- force enable telescope-fzf-native.nvim
    #       -- { "nvim-telescope/telescope-fzf-native.nvim", enabled = true },
    #       -- disable mason.nvim, use programs.neovim.extraPackages
    #       { "williamboman/mason-lspconfig.nvim", enabled = false },
    #       { "williamboman/mason.nvim", enabled = false },
    #       -- import/override with your plugins
    #       --{ import = "plugins" },
    #       -- treesitter handled by xdg.configFile."nvim/parser", put this line at the end of spec to clear ensure_installed
    #       -- { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = {} } },
    #     },
    #   })
    # '';
     colorschemes.catppuccin-mocha.enable = true;
  };
}
