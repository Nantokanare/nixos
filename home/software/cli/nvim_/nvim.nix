{
  config,
  pkgs,
  home-manager,
  lib,
  nixvim,
  ...
}: {
  imports = [
    nixvim.homeManagerModules.nixvim
        ./config/default.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = false;
    vimAlias = true;
    viAlias = true;

    extraConfigVim = ''

      :set number
      set relativenumber
      :set smartindent
      :set undofile
      :set scrolloff=10
      :set incsearch

    '';

  #  plugins = {
  #  undotree = {
  #    enable = true;
  #    focusOnToggle = true;
  #  };

  #  nvim-autopairs = {
  #    enable = true;
  #    checkTs = true;
  #  };

  #  nvim-colorizer.enable = true;
  #  illuminate.enable = true;
  #  nix.enable = true;
  #  todo-comments.enable = true;
  #  lspkind.enable = true;
  #  better-escape.enable = true;
  #  project-nvim.enable = true;

  #   telescope = {
  #     enable = true;
  #     # defaults.mappings = {
  #     #   i = { "[<c-t>]" = ''require("trouble.providers.telescope").open_with_trouble''; };
  #     #   v = { "[<c-t>]" = ''require("trouble.providers.telescope").open_with_trouble''; };
  #     # };
  #     extensions.fzf-native.enable = true;
  #     extensions.frecency.enable = true;
  #     keymaps = {
  #       "<leader>ff" = {
  #         action = "find_files";
  #         desc = "find files";
  #       };
  #       "<leader><leader>" = {
  #         action = "find_files";
  #         desc = "find files";
  #       };
  #       "<leader>/" = {
  #         action = "live_grep";
  #         desc = "Telescope Git Files";
  #       };
  #       "<leader>:" = {
  #         action = "command_history";
  #         desc = "Command History";
  #       };
  #       "<C-p>" = {
  #         action = "git_files";
  #         desc = "find files in git";
  #       };
  #       "<leader>'" = {
  #         action = "resume";
  #         desc = "Resume Telescope";
  #       };
  #       "<leader>," = {
  #         action = "buffers";
  #         desc = "Find Buffers";
  #       };
  #       # "<leader>fb" = {
  #       #   action = "buffers sort_mru=true sort_lastused=true";
  #       #   desc = "Find Buffers";
  #       # };
  #       "<leader>sd" = {
  #         action = "diagnostics";
  #         desc = "Diagnostics";
  #       };
  #       "<leader>sm" = {
  #         action = "man_pages";
  #         desc = "Search Manual";
  #       };
  #       "<leader>ss" = {
  #         action = "lsp_document_symbols";
  #         desc = "Symbols";
  #       };
  #       "<leader>sS" = {
  #         action = "lsp_dynamic_workspace_symbols";
  #         desc = "Workspace Symbols";
  #       };
  #       "<leader>sG" = {
  #         action = "live_grep";
  #         desc = "Grep";
  #       };
  #       "<leader>gr" = {
  #         action = "lsp_references";
  #         desc = "Goto references";
  #       };
  #     };
  #     # extraOptions = {
  #     #   mappings = {
  #     #     i = {
  #     #       "<c-t>" = ''require("trouble.providers.telescope").open_with_trouble(...)'';
  #     #     };
  #     #   };
  #     # };
  #   };
  #  
  #   lightline.enable = true;
  #   lint.enable = true;
  #  
  #   which-key.enable = true;
  #   # dashboard.enable = true;
  #   # alpha = {
  #   #   enable = true;
  #   #   iconsEnabled = true;
  #   #   layout = [
  #   #     {
  #   #       type = "padding";
  #   #       val = 2;
  #   #     }
  #   #     {
  #   #       opts = {
  #   #         hl = "Type";
  #   #         position = "center";
  #   #       };
  #   #       type = "text";
  #   #       val = [
  #   #         "  ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗  "
  #   #         "  ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║  "
  #   #         "  ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║  "
  #   #         "  ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║  "
  #   #         "  ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║  "
  #   #         "  ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝  "
  #   #       ];
  #   #     }
  #   #     {
  #   #       type = "padding";
  #   #       val = 2;
  #   #     }
  #   #     {
  #   #       type = "group";
  #   #       val = [
  #   #         {
  #   #           command = "<CMD>ene <CR>";
  #   #           desc = "  New file";
  #   #           shortcut = "e";
  #   #         }
  #   #         {
  #   #           command = ":qa<CR>";
  #   #           desc = "  Quit Neovim";
  #   #           shortcut = "SPC q";
  #   #         }
  #   #       ];
  #   #     }
  #   #     {
  #   #       type = "padding";
  #   #       val = 2;
  #   #     }
  #   #     {
  #   #       opts = {
  #   #         hl = "Keyword";
  #   #         position = "center";
  #   #       };
  #   #       type = "text";
  #   #       val = "Inspiring quote here.";
  #   #     }
  #   #   ];
  #   # };
  #  
  #   gitsigns.enable = true;
  #   indent-blankline.enable = true;
  #   persistence.enable = true;
  #  
  #  treesitter = {
  #    enable = true;
  #    ensureInstalled = [
  #      "vimdoc"
  #      "nix"
  #      "lua"
  #      "vim"
  #      "javascript"
  #      "typescript"
  #      "c"
  #      "regex"
  #      "bash"
  #      "markdown"
  #      "markdown_inline"
  #      "svelte"
  #      "prisma"
  #      "sql"
  #      "typescript"
  #      "tsx"
  #      "regex"
  #      "bash"
  #      "rust"
  #      "toml"
  #      "kdl"
  #    ];
  #    indent = true;
  #    nixvimInjections = true;
  #  };
  #   treesitter-context.enable = true;
  #   treesitter-textobjects.enable = true;
  #   ts-autotag.enable = true;
  #   ts-context-commentstring.enable = true;
  #  
  #   # luasnip.enable = true;
  #   luasnip = {
  #     enable = true;
  #     fromVscode = [{ paths = "${pkgs.vimPlugins.friendly-snippets}"; }];
  #   };
  #  
  #   lsp = {
  #     enable = true;
  #     servers = {
  #       nil_ls = {
  #         enable = true;
  #         extraOptions = {
  #           formatting.__raw = ''{ command = { "nixpkgs-fmt" } }'';
  #         };
  #       };
  #       lua-ls.enable = true;
  #       tsserver.enable = true;
  #       texlab.enable = true;
  #       clangd.enable = true;
  #     };
  #   };
  #  
  #   clangd-extensions = {
  #     enable = true;
  #     enableOffsetEncodingWorkaround = true;
  #   };
  #  
  #   lsp-format.enable = true;
  #  
  #   nvim-cmp = {
  #     enable = true;
  #     mapping = {
  #       "<C-n>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })";
  #       "<C-p>" = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })";
  #       "<C-b>" = "cmp.mapping.scroll_docs(-4)";
  #       "<C-f>" = "cmp.mapping.scroll_docs(4)";
  #       "<C-Space>" = "cmp.mapping.complete()";
  #       "<C-e>" = "cmp.mapping.abort()";
  #       "<CR>" = "cmp.mapping.confirm({ select = true })";
  #       "<S-CR>" = ''cmp.mapping.confirm({
  #           behavior = cmp.ConfirmBehavior.Replace,
  #           select = true,
  #           })'';
  #     };
  #     sources = [
  #       { name = "nvim_lsp"; }
  #       { name = "luasnip"; }
  #       {
  #         name = "buffer";
  #         # Words from other open buffers can also be suggested.
  #         option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
  #       }
  #       { name = "path"; }
  #     ];
  #   };
  #  
  #   cmp-nvim-lsp.enable = true;
  #   cmp-buffer.enable = true;
  #   cmp-emoji.enable = true;
  #   cmp-path.enable = true;
  #   cmp_luasnip.enable = true;
  #   cmp-latex-symbols.enable = true;
  #  
  #   flash.enable = true;
  #   # harpoon = {
  #   #   enable = true;
  #   #   keymapsSilent = true;
  #   #   enableTelescope = true;
  #   #   keymaps = {
  #   #     addFile = "<leader>a";
  #   #     toggleQuickMenu = "<leader>h";
  #   #     navNext = "]]";
  #   #     navPrev = "[[";
  #   #   };
  #   # };
  #  
  #   mini = {
  #     enable = true;
  #     modules = {
  #       bufremove = { };
  #       pairs = { };
  #       comment = {
  #         options = {
  #           custom_commentstring.__raw = ''function()
  #             return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
  #             end,'';
  #         };
  #       };
  #       surround = {
  #         add = "gza";
  #         delete = "gzd";
  #         find = "gzf";
  #         find_left = "gzF";
  #         highlight = "gzh";
  #         replace = "gzr";
  #         update_n_lines = "gzn";
  #       };
  #       ai = {
  #         n_lines = 500;
  #         custom_textobjects = {
  #           o = ''ai.gen_spec.treesitter({
  #               a = { "@block.outer", "@conditional.outer", "@loop.outer" },
  #               i = { "@block.inner", "@conditional.inner", "@loop.inner" },
  #               }, {}),'';
  #           f = ''ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),'';
  #           c = ''ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),'';
  #         };
  #       };
  #     };
  #   };
  #  
  #   notify = {
  #     enable = true;
  #     stages = "fade";
  #     timeout = 2000;
  #     fps = 60;
  #     backgroundColour = "#000000";
  #   };
  #  
  #   lualine.enable = true;
  #  
  #   noice.enable = true;
  #   trouble.enable = true;
  #   fugitive.enable = true;
  #  
  #   comment-nvim = {
  #     enable = true;
  #     sticky = true;
  #   };
  #  
  #   bufferline = {
  #     enable = true;
  #  
  #     persistBufferSort = true;
  #  
  #     # indicator.style = "underline";
  #     # hover.enabled = true;
  #  
  #     # button = "󰅙";
  #     # button = "󰅚";
  #     # modified.button = "󰀨";
  #     # inactive.modified.button = "󰗖";
  #     # offsets =
  #     #   {
  #     #     filetype = "neo-tree";
  #     #     text = "Neo-tree";
  #     #     highlight = "Directory";
  #     #     text_align = "left";
  #     #   };
  #  
  #     separatorStyle = "slant";
  #     closeIcon = "󰅚";
  #     bufferCloseIcon = "󰅙";
  #     modifiedIcon = "󰀨";
  #     extraOptions = {
  #  
  #       "close_command".__raw = ''function (n) require ("mini.bufremove").delete (n, false) end'';
  #       "right_mouse_command".__raw = ''function (n) require ("mini.bufremove").delete (n, false) end'';
  #       "diagnostics".__raw = "nvim_lsp";
  #       "diagnostics_indicator".__raw = ''function(_, _, diag)
  #           local icons = require("lazyvim.config").icons.diagnostics
  #           local ret = (diag.error and icons.Error .. diag.error .. " " or "")
  #           .. (diag.warning and icons.Warn .. diag.warning or "")
  #           return vim.trim(ret)
  #           end'';
  #  
  #       "offsets".__raw = ''
  #         {
  #             {
  #             filetype = "neo-tree",
  #             text = "Neo-tree",
  #             highlight = "Directory",
  #             text_align = "left",
  #             },
  #         }
  #       '';
  #  
  #     };
  #   };

  #   neo-tree = {
  #     enable = true;
  #     addBlankLineAtTop = true;
  #     closeIfLastWindow = true;
  #     enableDiagnostics = true;
  #     enableGitStatus = true;
  #     autoCleanAfterSessionRestore = true;
  #     window.mappings = {
  #       "e".__raw = "function() vim.api.nvim_exec('Neotree filesystem', true) end";
  #       "b".__raw = "function() vim.api.nvim_exec('Neotree buffers', true) end";
  #       "g".__raw = "function() vim.api.nvim_exec('Neotree git_status', true) end";
  #     };
  #     filesystem = {
  #       followCurrentFile.enabled = true;
  #       filteredItems = {
  #         visible = true;
  #         hideDotfiles = false;
  #         hideByName = [
  #           ".git"
  #           ".node_modules"
  #         ];
  #       };
  #     };
  #  #      {
  #  #        plugin = zephyr-nvim;
  #  #        type = "lua";
  #  #        config = ''
  #  #          require("zephyr")
  #  #
  #  #          vim.cmd[[colorscheme zephyr]]
  #  #
  #  #        '';
  #  #      }
  #  #      #          vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
  #  #      #          vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
  #  #      {
  #  #        plugin = lualine-nvim;
  #  #        type = "lua";
  #  #        config = ''
  #  #          local function metals_status()
  #  #            return vim.g["metals_status"] or ""
  #  #          end
  #  #          require('lualine').setup(
  #  #            {
  #  #              options = { theme = 'iceberg_dark' },
  #  #              sections = {
  #  #                lualine_a = {'mode' },
  #  #                lualine_b = {'branch', 'diff' },
  #  #                lualine_c = {'filename', metals_status },
  #  #                lualine_x = {'encoding', 'filetype'},
  #  #                lualine_y = {'progress'},
  #  #                lualine_z = {'location'}
  #  #              }
  #  #            }
  #  #          )
  #  #        '';
  #  #      } # Status Line
  #  #      {
  #  #        plugin = nvim-treesitter.withAllGrammars; # Syntax Highlighting
  #  #        type = "lua";
  #  #        config = ''
  #  #           require'nvim-treesitter.configs'.setup {
  #  #          sync_install = false,
  #  #
  #  #          highlight = {
  #  #          enable = true,
  #  #          additional_vim_regex_highlighting = false,
  #  #          },
  #  #           }
  #  #
  #  #        '';
  #  #      }
  #  #      {
  #  #        plugin = null-ls-nvim;
  #  #        type = "lua";
  #  #        config = ''
  #  #          local null_ls = require("null-ls")
  #  #          local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
  #  #          null_ls.setup({
  #  #              debug = true,
  #  #              sources = {
  #  #                  null_ls.builtins.formatting.alejandra.with({
  #  #                      command = "${pkgs.alejandra}/bin/alejandra"
  #  #                  }),
  #  #                  null_ls.builtins.formatting.lua_format.with({
  #  #                      command = "${pkgs.luaformatter}/bin/lua-format"
  #  #                  }),
  #  #                  null_ls.builtins.formatting.google_java_format.with({
  #  #                      command = "${pkgs.google-java-format}/bin/google-java-format"
  #  #                  }),
  #  #                  null_ls.builtins.formatting.clang_format.with({
  #  #                      command = "${pkgs.clang-tools}/bin/clang-format"
  #  #                  }),
  #  #                  null_ls.builtins.formatting.black.with({
  #  #                      command = "${pkgs.black}/bin/black"
  #  #                  })
  #  #              },
  #  #
  #  #              on_attach = function(client, bufnr)
  #  #                  if client.supports_method("textDocument/formatting") then
  #  #                      vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
  #  #                      vim.api.nvim_create_autocmd("BufWritePre", {
  #  #                          group = augroup,
  #  #                          buffer = bufnr,
  #  #                          callback = function()
  #  #                              vim.lsp.buf.format({
  #  #                                  bufnr = bufnr,
  #  #                                  filter = function(client)
  #  #                                      return client.name == "null-ls"
  #  #                                  end
  #  #                              })
  #  #                          end
  #  #                      })
  #  #                  end
  #  #              end
  #  #          })
  #  #        '';
  #  #      }
  #  #      {
  #  #        plugin = bufferline-nvim;
  #  #        type = "lua";
  #  #        config = ''
  #  #          require("bufferline").setup{}
  #  #        '';
  #  #      }
  #  #      {
  #  #        plugin = nvim-web-devicons;
  #  #        type = "lua";
  #  #        config = ''
  #  #          require("nvim-web-devicons").setup{}
  #  #        '';
  #  #      }
  #  #      {
  #  #        plugin = telescope-nvim;
  #  #        type = "lua";
  #  #        config = ''
  #  #          local builtin = require('telescope.builtin')
  #  #          vim.keymap.set('n', '<space>ff', builtin.find_files, {})
  #  #          vim.keymap.set('n', '<space>fg', builtin.live_grep, {})
  #  #          vim.keymap.set('n', '<space>fb', builtin.buffers, {})
  #  #          vim.keymap.set('n', '<space>fh', builtin.help_tags, {})
  #  #          require("telescope").setup{}
  #  #        '';
  #  #      }
  #  #      plenary-nvim
  #  #      markdown-preview-nvim # Markdown Preview
  #  #      vim-husk
  #  #      {
  #  #        plugin = undotree;
  #  #        type = "lua";
  #  #        config = ''
  #  #          vim.keymap.set("n", "<space>u", vim.cmd.UndotreeToggle)
  #  #        '';
  #  #      }
  #  #      {
  #  #        plugin = harpoon;
  #  #        type = "lua";
  #  #        config = ''
  #  #
  #  #          local mark = require("harpoon.mark")
  #  #          local ui = require("harpoon.ui")
  #  #
  #  #          vim.keymap.set("n", "<space>a", mark.add_file)
  #  #          vim.keymap.set("n", "<space>hh", ui.toggle_quick_menu)
  #  #
  #  #          vim.keymap.set("n", "<space>f1", function() ui.nav_file(1) end)
  #  #          vim.keymap.set("n", "<space>f2", function() ui.nav_file(2) end)
  #  #          vim.keymap.set("n", "<space>f3", function() ui.nav_file(3) end)
  #  #          vim.keymap.set("n", "<space>f4", function() ui.nav_file(4) end)
  #  #          vim.keymap.set("n", "<space>f5", function() ui.nav_file(5) end)
  #  #          vim.keymap.set("n", "<space>f6", function() ui.nav_file(6) end)
  #  #          vim.keymap.set("n", "<space>f7", function() ui.nav_file(7) end)
  #  #          vim.keymap.set("n", "<space>f8", function() ui.nav_file(8) end)
  #  #          vim.keymap.set("n", "<space>f9", function() ui.nav_file(9) end)
  #  #          vim.keymap.set("n", "<space>f0", function() ui.nav_file(10) end)
  #  #
  #  #        '';
  #  #      }
  #  #      {
  #  #        plugin = nvim-metals;
  #  #        type = "lua";
  #  #        config = ''
  #  #          metals_config = require("metals").bare_config()
  #  #          metals_config.settings = {
  #  #            useGlobalExecutable = true,
  #  #            showInferredType = true
  #  #          }
  #  #          metals_config.init_options.statusBarProvider = "on"
  #  #          local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
  #  #          vim.api.nvim_create_autocmd("FileType", {
  #  #            pattern = { "scala", "sbt", },
  #  #            callback = function()
  #  #              require("metals").initialize_or_attach(metals_config)
  #  #            end,
  #  #            group = nvim_metals_group,
  #  #          })
  #  #        '';
  #  #      }
  #  #      cmp-path
  #  #      cmp-nvim-lsp
  #  #      cmp-buffer
  #  #      cmp-cmdline
  #  #      {
  #  #        plugin = nvim-cmp;
  #  #        type = "lua";
  #  #        config = ''
  #  #          local cmp = require'cmp'
  #  #          cmp.setup({
  #  #            snippet = {
  #  #              -- REQUIRED - you must specify a snippet engine
  #  #              expand = function(args)
  #  #                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  #  #                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
  #  #                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  #  #              end,
  #  #            },
  #  #            window = {
  #  #              -- completion = cmp.config.window.bordered(),
  #  #              -- documentation = cmp.config.window.bordered(),
  #  #            },
  #  #            mapping = cmp.mapping.preset.insert({
  #  #              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  #  #              ['<C-f>'] = cmp.mapping.scroll_docs(4),
  #  #              ['<C-Space>'] = cmp.mapping.complete(),
  #  #              ['<C-e>'] = cmp.mapping.abort(),
  #  #              ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  #  #            }),
  #  #            sources = cmp.config.sources({
  #  #              { name = 'nvim_lsp' },
  #  #              { name = 'vsnip' }, -- For vsnip users.
  #  #              -- { name = 'luasnip' }, -- For luasnip users.
  #  #              -- { name = 'ultisnips' }, -- For ultisnips users.
  #  #              -- { name = 'snippy' }, -- For snippy users.
  #  #            }, {
  #  #              { name = 'buffer' },
  #  #            })
  #  #          })
  #  #
  #  #          -- Set configuration for specific filetype.
  #  #          cmp.setup.filetype('gitcommit', {
  #  #            sources = cmp.config.sources({
  #  #              { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  #  #            }, {
  #  #              { name = 'buffer' },
  #  #            })
  #  #          })
  #  #
  #  #          -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  #  #          cmp.setup.cmdline({ '/', '?' }, {
  #  #            mapping = cmp.mapping.preset.cmdline(),
  #  #            sources = {
  #  #              { name = 'buffer' }
  #  #            }
  #  #          })
  #  #
  #  #          -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  #  #          cmp.setup.cmdline(':', {
  #  #            mapping = cmp.mapping.preset.cmdline(),
  #  #            sources = cmp.config.sources({
  #  #              { name = 'path' }
  #  #            }, {
  #  #              { name = 'cmdline' }
  #  #            })
  #  #          })
  #  #
  #  #          -- Set up lspconfig.
  #  #          local capabilities = require('cmp_nvim_lsp').default_capabilities()
  #  #        '';
  #  #      }
  #  #      #      {
  #  #      #        plugin = ChatGPT-nvim;
  #  #      #        type = "lua";
  #  #      #        config = ''
  #  #      #          require('chatgpt').setup {}
  #  #      #        '';
  #  #      #      }
  #  #      {
  #  #        plugin = nvim-lspconfig;
  #  #        type = "lua";
  #  #        config = ''
  #  #            require('lspconfig').nil_ls.setup({
  #  #              cmd = { "${pkgs.nil}/bin/nil" }
  #  #            })
  #  #            require'lspconfig'.clangd.setup({
  #  #              cmd = { "${pkgs.clang-tools}/bin/clangd" }
  #  #            })
  #  #            require('lspconfig').java_language_server.setup({
  #  #              capabilities = capabilities,
  #  #              cmd = { "${pkgs.java-language-server}/bin/java-language-server" },
  #  #              settings = {
  #  #                java = {
  #  #                  classPath = {"carnett3/483libs.jar"}
  #  #                }
  #  #              }
  #  #            })
  #  #            require('lspconfig').pyright.setup({
  #  #              cmd = { "${pkgs.nodePackages.pyright}/bin/pyright" },
  #  #            })
  #  #          vim.diagnostic.config({
  #  #            virtual_text = false,
  #  #            float = {
  #  #              focusable = false,
  #  #              border = "rounded",
  #  #              source = "always",
  #  #            },
  #  #          })
  #  #          vim.o.updatetime = 250
  #  #        '';
  #  #      }
  #  #    ];
  #  #    extraPackages = with pkgs; [
  #  #      ripgrep # Requirement for telescope
  #  #    ];
  #   };
  #   };
     };
}
