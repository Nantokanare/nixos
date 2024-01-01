{
  config,
  pkgs,
  home-manager,
  lib,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    extraConfig = ''


      :set number
      set relativenumber
      :set smartindent
      :set undofile
      :set scrolloff=10
      :set incsearch
      :set background=dark


    '';
    extraLuaConfig = ''


      vim.keymap.set("n", "<space>fp", vim.cmd.Ex)


    '';
    plugins = with pkgs.vimPlugins; [
      vimwiki # Wiki
      vim-obsession
      luasnip
      lualine-lsp-progress
      {
        plugin = neo-tree-nvim;
        type = "lua";
        config = ''
          local function ColorMyPencil(color)
              color = color or "rose-pine"
              vim.cmd.colorscheme(color)

              vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
              vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

          end

          ColorMyPencil()
        '';
      }
      {
        plugin = rose-pine;
        type = "lua";
        config = ''
          require("rose-pine")
          vim.cmd[[colorscheme rose-pine]]
          local function ColorMyPencil(color)
              color = color or "rose-pine"
              vim.cmd.colorscheme(color)

              vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
              vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

          end

          ColorMyPencil()
        '';
      }

      {
        plugin = lualine-nvim;
        type = "lua";
        config = ''
          local function metals_status()
            return vim.g["metals_status"] or ""
          end
          require('lualine').setup(
            {
              options = { theme = 'iceberg_dark' },
              sections = {
                lualine_a = {'mode' },
                lualine_b = {'branch', 'diff' },
                lualine_c = {'filename', metals_status },
                lualine_x = {'encoding', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
              }
            }
          )
        '';
      } # Status Line
      {
        plugin = nvim-treesitter.withAllGrammars; # Syntax Highlighting
        type = "lua";
        config = ''
           require'nvim-treesitter.configs'.setup {
          sync_install = true,

          highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
          },
           }

        '';
      }
      {
        plugin = null-ls-nvim;
        type = "lua";
        config = ''
          local null_ls = require("null-ls")
          local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
          null_ls.setup({
              debug = true,
              sources = {
                  null_ls.builtins.formatting.alejandra.with({
                      command = "${pkgs.alejandra}/bin/alejandra"
                  }),
                  null_ls.builtins.formatting.lua_format.with({
                      command = "${pkgs.luaformatter}/bin/lua-format"
                  }),
                  null_ls.builtins.formatting.google_java_format.with({
                      command = "${pkgs.google-java-format}/bin/google-java-format"
                  }),
                  null_ls.builtins.formatting.clang_format.with({
                      command = "${pkgs.clang-tools}/bin/clang-format"
                  }),
                  null_ls.builtins.formatting.black.with({
                      command = "${pkgs.black}/bin/black"
                  })
              },

              on_attach = function(client, bufnr)
                  if client.supports_method("textDocument/formatting") then
                      vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
                      vim.api.nvim_create_autocmd("BufWritePre", {
                          group = augroup,
                          buffer = bufnr,
                          callback = function()
                              vim.lsp.buf.format({
                                  bufnr = bufnr,
                                  filter = function(client)
                                      return client.name == "null-ls"
                                  end
                              })
                          end
                      })
                  end
              end
          })
        '';
      }
      {
        plugin = bufferline-nvim;
        type = "lua";
        config = ''
          require("bufferline").setup{}
        '';
      }
      {
        plugin = nvim-web-devicons;
        type = "lua";
        config = ''
          require("nvim-web-devicons").setup{}
        '';
      }
      {
        plugin = telescope-nvim;
        type = "lua";
        config = ''
          local builtin = require('telescope.builtin')
          vim.keymap.set('n', '<space>ff', builtin.find_files, {})
          vim.keymap.set('n', '<space>fg', builtin.live_grep, {})
          vim.keymap.set('n', '<space>fb', builtin.buffers, {})
          vim.keymap.set('n', '<space>fh', builtin.help_tags, {})
          require("telescope").setup{}
        '';
      }
      plenary-nvim
      markdown-preview-nvim # Markdown Preview
      vim-husk
      {
        plugin = undotree;
        type = "lua";
        config = ''
          vim.keymap.set("n", "<space>u", vim.cmd.UndotreeToggle)
        '';
      }
      {
        plugin = harpoon;
        type = "lua";
        config = ''

          local mark = require("harpoon.mark")
          local ui = require("harpoon.ui")

          vim.keymap.set("n", "<space>a", mark.add_file)
          vim.keymap.set("n", "<space>h", ui.toggle_quick_menu)

          vim.keymap.set("n", "<space>f1", function() ui.nav_file(1) end)
          vim.keymap.set("n", "<space>f2", function() ui.nav_file(2) end)
          vim.keymap.set("n", "<space>f3", function() ui.nav_file(3) end)
          vim.keymap.set("n", "<space>f4", function() ui.nav_file(4) end)
          vim.keymap.set("n", "<space>f5", function() ui.nav_file(5) end)
          vim.keymap.set("n", "<space>f6", function() ui.nav_file(6) end)
          vim.keymap.set("n", "<space>f7", function() ui.nav_file(7) end)
          vim.keymap.set("n", "<space>f8", function() ui.nav_file(8) end)
          vim.keymap.set("n", "<space>f9", function() ui.nav_file(9) end)
          vim.keymap.set("n", "<space>f0", function() ui.nav_file(10) end)

        '';
      }
      {
        plugin = nvim-metals;
        type = "lua";
        config = ''
          metals_config = require("metals").bare_config()
          metals_config.settings = {
            useGlobalExecutable = true,
            showInferredType = true
          }
          metals_config.init_options.statusBarProvider = "on"
          local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
          vim.api.nvim_create_autocmd("FileType", {
            pattern = { "scala", "sbt", },
            callback = function()
              require("metals").initialize_or_attach(metals_config)
            end,
            group = nvim_metals_group,
          })
        '';
      }
      cmp-path
      cmp-nvim-lsp
      cmp-buffer
      cmp-cmdline
      {
        plugin = nvim-cmp;
        type = "lua";
        config = ''
          local cmp = require'cmp'
          cmp.setup({
            snippet = {
              -- REQUIRED - you must specify a snippet engine
              expand = function(args)
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
              end,
            },
            window = {
              -- completion = cmp.config.window.bordered(),
              -- documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'vsnip' }, -- For vsnip users.
              -- { name = 'luasnip' }, -- For luasnip users.
              -- { name = 'ultisnips' }, -- For ultisnips users.
              -- { name = 'snippy' }, -- For snippy users.
            }, {
              { name = 'buffer' },
            })
          })

          -- Set configuration for specific filetype.
          cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
              { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
            }, {
              { name = 'buffer' },
            })
          })

          -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
          cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
              { name = 'buffer' }
            }
          })

          -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
          cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
              { name = 'path' }
            }, {
              { name = 'cmdline' }
            })
          })

          -- Set up lspconfig.
          local capabilities = require('cmp_nvim_lsp').default_capabilities()
        '';
      }
      #      {
      #        plugin = ChatGPT-nvim;
      #        type = "lua";
      #        config = ''
      #          require('chatgpt').setup {}
      #        '';
      #      }
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
            require('lspconfig').nil_ls.setup({
              cmd = { "${pkgs.nil}/bin/nil" }
            })
            require'lspconfig'.clangd.setup({
              cmd = { "${pkgs.clang-tools}/bin/clangd" }
            })
            require('lspconfig').java_language_server.setup({
              capabilities = capabilities,
              cmd = { "${pkgs.java-language-server}/bin/java-language-server" },
              settings = {
                java = {
                  classPath = {"carnett3/483libs.jar"}
                }
              }
            })
            require('lspconfig').pyright.setup({
              cmd = { "${pkgs.nodePackages.pyright}/bin/pyright" },
            })
          vim.diagnostic.config({
            virtual_text = false,
            float = {
              focusable = false,
              border = "rounded",
              source = "always",
            },
          })
          vim.o.updatetime = 250
        '';
      }
    ];
    extraPackages = with pkgs; [
      ripgrep # Requirement for telescope
    ];
  };
}
