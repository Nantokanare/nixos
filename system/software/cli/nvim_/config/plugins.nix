{ pkgs, lib, ... }: {
  options = {
  plugins = {

    undotree = {
      enable = true;
      focusOnToggle = true;
    };

    nvim-autopairs = {
      enable = true;
      checkTs = true;
    };

    nvim-colorizer.enable = true;
    illuminate.enable = true;
    nix.enable = true;
    todo-comments.enable = true;
    lspkind.enable = true;
    better-escape.enable = true;
    project-nvim.enable = true;

     telescope = {
       enable = true;
        defaults.mappings = {
          i = { "[<c-t>]" = ''require("trouble.providers.telescope").open_with_trouble''; };
          v = { "[<c-t>]" = ''require("trouble.providers.telescope").open_with_trouble''; };
        };
       extensions.fzf-native.enable = true;
       extensions.frecency.enable = true;
       keymaps = {
         "<leader>ff" = {
           action = "find_files";
           desc = "find files";
         };
         "<leader><leader>" = {
           action = "find_files";
           desc = "find files";
         };
         "<leader>/" = {
           action = "live_grep";
           desc = "Telescope Git Files";
         };
         "<leader>:" = {
           action = "command_history";
           desc = "Command History";
         };
         "<C-p>" = {
           action = "git_files";
           desc = "find files in git";
         };
         "<leader>'" = {
           action = "resume";
           desc = "Resume Telescope";
         };
         "<leader>," = {
           action = "buffers";
           desc = "Find Buffers";
         };
          "<leader>fb" = {
            action = "buffers sort_mru=true sort_lastused=true";
            desc = "Find Buffers";
          };
         "<leader>sd" = {
           action = "diagnostics";
           desc = "Diagnostics";
         };
         "<leader>sm" = {
           action = "man_pages";
           desc = "Search Manual";
         };
         "<leader>ss" = {
           action = "lsp_document_symbols";
           desc = "Symbols";
         };
         "<leader>sS" = {
           action = "lsp_dynamic_workspace_symbols";
           desc = "Workspace Symbols";
         };
         "<leader>sG" = {
           action = "live_grep";
           desc = "Grep";
         };
         "<leader>gr" = {
           action = "lsp_references";
           desc = "Goto references";
         };
       };
        extraOptions = {
          mappings = {
            i = {
              "<c-t>" = ''require("trouble.providers.telescope").open_with_trouble(...)'';
            };
          };
        };
     };
    
     lightline.enable = true;
     lint.enable = true;
    
     which-key.enable = true;
     # dashboard.enable = true;
     # alpha = {
     #   enable = true;
     #   iconsEnabled = true;
     #   layout = [
     #     {
     #       type = "padding";
     #       val = 2;
     #     }
     #     {
     #       opts = {
     #         hl = "Type";
     #         position = "center";
     #       };
     #       type = "text";
     #       val = [
     #         "  ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗  "
     #         "  ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║  "
     #         "  ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║  "
     #         "  ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║  "
     #         "  ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║  "
     #         "  ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝  "
     #       ];
     #     }
     #     {
     #       type = "padding";
     #       val = 2;
     #     }
     #     {
     #       type = "group";
     #       val = [
     #         {
     #           command = "<CMD>ene <CR>";
     #           desc = "  New file";
     #           shortcut = "e";
     #         }
     #         {
     #           command = ":qa<CR>";
     #           desc = "  Quit Neovim";
     #           shortcut = "SPC q";
     #         }
     #       ];
     #     }
     #     {
     #       type = "padding";
     #       val = 2;
     #     }
     #     {
     #       opts = {
     #         hl = "Keyword";
     #         position = "center";
     #       };
     #       type = "text";
     #       val = "Inspiring quote here.";
     #     }
     #   ];
     # };
    
     gitsigns.enable = true;
     indent-blankline.enable = true;
     persistence.enable = true;
    
    treesitter = {
      enable = true;
      ensureInstalled = [
        "vimdoc"
        "nix"
        "lua"
        "vim"
        "javascript"
        "typescript"
        "c"
        "regex"
        "bash"
        "markdown"
        "markdown_inline"
        "svelte"
        "prisma"
        "sql"
        "typescript"
        "tsx"
        "regex"
        "bash"
        "rust"
        "toml"
        "kdl"
      ];
      indent = true;
      nixvimInjections = true;
    };
     treesitter-context.enable = true;
     treesitter-textobjects.enable = true;
     ts-autotag.enable = true;
     ts-context-commentstring.enable = true;
    
     luasnip = {
       enable = true;
       fromVscode = [{ paths = "${pkgs.vimPlugins.friendly-snippets}"; }];
     };
    
     lsp = {
       enable = true;
       servers = {
         nil_ls = {
           enable = true;
           extraOptions = {
             formatting.__raw = ''{ command = { "nixpkgs-fmt" } }'';
           };
         };
         lua-ls.enable = true;
         tsserver.enable = true;
         texlab.enable = true;
         clangd.enable = true;
       };
     };
    
     clangd-extensions = {
       enable = true;
       enableOffsetEncodingWorkaround = true;
     };
    
     lsp-format.enable = true;
    
     nvim-cmp = {
       enable = true;
       mapping = {
         "<C-n>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })";
         "<C-p>" = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })";
         "<C-b>" = "cmp.mapping.scroll_docs(-4)";
         "<C-f>" = "cmp.mapping.scroll_docs(4)";
         "<C-Space>" = "cmp.mapping.complete()";
         "<C-e>" = "cmp.mapping.abort()";
         "<CR>" = "cmp.mapping.confirm({ select = true })";
         "<S-CR>" = ''cmp.mapping.confirm({
             behavior = cmp.ConfirmBehavior.Replace,
             select = true,
             })'';
       };
       sources = [
         { name = "nvim_lsp"; }
         { name = "luasnip"; }
         {
           name = "buffer";
           # Words from other open buffers can also be suggested.
           option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
         }
         { name = "path"; }
       ];
     };
    
     cmp-nvim-lsp.enable = true;
     cmp-buffer.enable = true;
     cmp-emoji.enable = true;
     cmp-path.enable = true;
     cmp_luasnip.enable = true;
     cmp-latex-symbols.enable = true;
    
     flash.enable = true;

     harpoon = {
        enable = true;
        keymapsSilent = true;
        enableTelescope = true;
        keymaps = {
          addFile = "<leader>a";
          toggleQuickMenu = "<leader>hh";
          navNext = "]]";
          navPrev = "[[";
        };
      };
    
     mini = {
       enable = true;
       modules = {
         bufremove = { };
         pairs = { };
         comment = {
           options = {
             custom_commentstring.__raw = ''function()
               return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
               end,'';
           };
         };
         surround = {
           add = "gza";
           delete = "gzd";
           find = "gzf";
           find_left = "gzF";
           highlight = "gzh";
           replace = "gzr";
           update_n_lines = "gzn";
         };
         ai = {
           n_lines = 500;
           custom_textobjects = {
             o = ''ai.gen_spec.treesitter({
                 a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                 i = { "@block.inner", "@conditional.inner", "@loop.inner" },
                 }, {}),'';
             f = ''ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),'';
             c = ''ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),'';
           };
         };
       };
     };
    
     notify = {
       enable = true;
       stages = "fade";
       timeout = 2000;
       fps = 60;
       backgroundColour = "#000000";
     };
    
     lualine.enable = true;
    
     noice.enable = true;
     trouble.enable = true;
     fugitive.enable = true;
    
     comment-nvim = {
       enable = true;
       sticky = true;
     };
    
     bufferline = {
       enable = true;
    
       persistBufferSort = true;
    
        indicator.style = "underline";
        hover.enabled = true;
    
        button = "󰅙";
        # button = "󰅚";
        modified.button = "󰀨";
        inactive.modified.button = "󰗖";
        offsets =
          {
            filetype = "neo-tree";
            text = "Neo-tree";
            highlight = "Directory";
            text_align = "left";
          };
    
       separatorStyle = "slant";
       closeIcon = "󰅚";
       bufferCloseIcon = "󰅙";
       modifiedIcon = "󰀨";
       extraOptions = {
    
         "close_command".__raw = ''function (n) require ("mini.bufremove").delete (n, false) end'';
         "right_mouse_command".__raw = ''function (n) require ("mini.bufremove").delete (n, false) end'';
         "diagnostics".__raw = "nvim_lsp";
         "diagnostics_indicator".__raw = ''function(_, _, diag)
             local icons = require("lazyvim.config").icons.diagnostics
             local ret = (diag.error and icons.Error .. diag.error .. " " or "")
             .. (diag.warning and icons.Warn .. diag.warning or "")
             return vim.trim(ret)
             end'';
    
         "offsets".__raw = ''
           {
               {
               filetype = "neo-tree",
               text = "Neo-tree",
               highlight = "Directory",
               text_align = "left",
               },
           }
         '';
    
       };
     };

     neo-tree = {
       enable = true;
       addBlankLineAtTop = true;
       closeIfLastWindow = true;
       enableDiagnostics = true;
       enableGitStatus = true;
       autoCleanAfterSessionRestore = true;
       window.mappings = {
         "e".__raw = "function() vim.api.nvim_exec('Neotree filesystem', true) end";
         "b".__raw = "function() vim.api.nvim_exec('Neotree buffers', true) end";
         "g".__raw = "function() vim.api.nvim_exec('Neotree git_status', true) end";
       };
       filesystem = {
         followCurrentFile.enabled = true;
         filteredItems = {
           visible = true;
           hideDotfiles = false;
           hideByName = [
             ".git"
             ".node_modules"
           ];
         };
       };
     };
  };
};
}
