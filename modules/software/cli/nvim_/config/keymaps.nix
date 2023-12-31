{
  options = {
  keymaps = [
    {
      key = "<leader>fp";
      action = "<cmd>Ex";
      options.desc = "Escape";
      mode = [ "i" ];
    }
    {
      key = "kj";
      action = "<Esc>";
      options.desc = "Escape";
      mode = [ "i" ];
    }
    {
      key = "jk";
      action = "<Esc>";
      options.desc = "Escape";
      mode = [ "i" ];
    }
    {
      key = "jj";
      action = "<Esc>";
      options.desc = "Escape";
      mode = [ "i" ];
    }
    {
      key = "U";
      action = "<C-r>";
      options.desc = "Undo";
      mode = [ "n" ];
    }
    {
      key = "<C-z>";
      action = "<Esc>ui";
      options.desc = "Undo in Insert Mode";
      mode = [ "i" ];
    }
    {
      key = "<C-x>";
      action = "<C-w>q";
      options.desc = "Close window";
      mode = [ "n" ];
    }
    {
      key = "<leader>/";
      action = ''
        function()
          require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
        end
      '';
      lua = true;
      options.desc = "Toggle comment line";
      mode = [ "n" ];
    }
    {
      key = "<leader>/";
      action = ''
        <esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())
      '';
      options.desc = "Toggle comment for selection";
      mode = [ "v" ];
    }
    {
      key = "<C-s>";
      action = ":w<CR>";
      options.desc = "Save";
      mode = [ "n" ];
    }
    {
      action = "'_dP";
      key = "<leader>p";
      options = {
        desc = "Paste without updating buffer";
      };
      mode = [
        "v"
      ];
    }
    {
      action = ">gv";
      key = ">";
      options.desc = "Stay in visual mode during outdent";
      mode = [
        "v"
        "x"
      ];
    }
    {
      action = "<gv";
      key = "<";
      options.desc = "Stay in visual mode during indent";
      mode = [
        "v"
        "x"
      ];
    }
    {
      key = "r";
      action = "y:%s/<C-r>0/";
      options.desc = "Replace word under cursor";
      mode = [ "v" ];
    }
    {
      key = "<C-Up>";
      action = ":resize -2<CR>";
      options.desc = "Resize up";
      mode = [ "n" ];
    }
    {
      key = "<C-Down>";
      action = ":resize +2<CR>";
      options.desc = "Resize down";
      mode = [ "n" ];
    }
    {
      key = "<C-Left>";
      action = ":vertical resize -2<CR>";
      options.desc = "Resize left";
      mode = [ "n" ];
    }
    {
      key = "<C-Up>";
      action = ":vertical resize +2<CR>";
      options.desc = "Resize right";
      mode = [ "n" ];
    }
    {
      key = "<leader>sv";
      action = "<C-w>v";
      options.desc = "Vertical split";
      mode = [ "n" ];
    }
    {
      key = "<leader>sh";
      action = "<C-w>s";
      options.desc = "Horizontal split";
      mode = [ "n" ];
    }
    {
      key = "<leader><tab>n";
      action = "<cmd>tabnew<CR>";
      options.desc = "New tab";
      mode = [ "n" ];
    }
    {
      key = "<leader><tab>x";
      action = "<cmd>tabclose<CR>";
      options.desc = "Close tab";
      mode = [ "n" ];
    }
    {
      key = "[t";
      action = "<cmd>tabprevious<CR>";
      options.desc = "Prev tab";
      mode = [ "n" ];
    }
    {
      key = "]t";
      action = "<cmd>tabnext<CR>";
      options.desc = "Next tab";
      mode = [ "n" ];
    }
    {
      key = "<leader>r";
      action = "*:%s//";
      options.desc = "Replace under cursor";
      mode = [ "n" ];
    }
    {
      key = "p";
      action = "\"_dP";
      options.desc = "Better paste";
      mode = [ "v" ];
    }
    {
      key = "s";
      action = "function() require('flash').jump() end";
      lua = true;
      options.desc = "Run flash";
      mode = [ "n" "x" ];
    }
    {
      key = "S";
      action = "function() require('flash').treesitter() end";
      lua = true;
      options.desc = "Run flash treesitter";
      mode = [ "n" "x" ];
    }
    {
      key = "<C-d>";
      action = "<C-d>zz";
      options.desc = "Half-page jump down";
      mode = [ "n" ];
    }
    {
      key = "<C-u>";
      action = "<C-u>zz";
      options.desc = "Half-page jump up";
      mode = [ "n" ];
    }
    {
      key = "W";
      action = ":noautocmd w<CR>";
      options.desc = "Write without formatting";
      mode = [ "n" ];
    }
    {
      key = "<leader>R";
      action = ":Spectre<CR>";
      options.desc = "Spectre";
      mode = [ "n" ];
    }
    {
      key = "<leader>D";
      action = "ggVGd";
      options.desc = "Blank out file";
      mode = [ "n" ];
    }
    {
      key = "<C-Q>";
      action = "<cmd>qa!<CR>";
      options.desc = "Exit";
      mode = [ "n" ];
    }
    # {
    #   key = "n";
    #   action = "nzz";
    #   options.desc = "Recenter search";
    #   mode = [ "n" ];
    # }
    # {
    #   key = "N";
    #   action = "Nzz";
    #   options.desc = "Recenter search";
    #   mode = [ "n" ];
    # }
    {
      key = "<S-Up>";
      action = ":resize +2<CR>";
      options.desc = "Increase vertical window size";
      mode = [ "n" ];
    }
    {
      key = "<S-Down>";
      action = ":resize -2<CR>";
      options.desc = "Decrease vertical window size";
      mode = [ "n" ];
    }
    {
      key = "<S-Right>";
      action = ":vertical resize +2<CR>";
      options.desc = "Increase horizontal window size";
      mode = [ "n" ];
    }
    {
      key = "<S-Left>";
      action = ":vertical resize -2<CR>";
      options.desc = "Decrease horizontal window size";
      mode = [ "n" ];
    }
    {
      key = "<leader>gr";
      action = "<cmd>Gitsigns reset_hunk<CR>";
      options.desc = "Reset hunk";
      mode = [ "n" ];
    }
    {
      key = "<leader>gR";
      action = "<cmd>Gitsigns reset_buffer<CR>";
      options.desc = "Reset buffer";
      mode = [ "n" ];
    }
    {
      key = "<leader>gs";
      action = "<cmd>Gitsigns stage_hunk<CR>";
      options.desc = "Stage hunk";
      mode = [ "n" ];
    }
    {
      key = "<leader>gg";
      action = "<cmd>LazyGit<CR>";
      options.desc = "LazyGit";
      mode = [ "n" ];
    }
    {
      key = "<leader>gS";
      action = "<cmd>Gitsigns stage_buffer<CR>";
      options.desc = "Stage buffer";
      mode = [ "n" ];
    }
    {
      key = "]h";
      action = "<cmd>Gitsigns next_hunk<CR>";
      options.desc = "Next hunk";
      mode = [ "n" ];
    }
    {
      key = "[h";
      action = "<cmd>Gitsigns prev_hunk<CR>";
      options.desc = "Prev hunk";
      mode = [ "n" ];
    }
    {
      key = "<leader>gp";
      action = "<cmd>Gitsigns preview_hunk<CR>";
      options.desc = "Preview hunk";
      mode = [ "n" ];
    }
    {
      key = "<leader>gl";
      action = "<cmd>Gitsigns toggle_current_line_blame<CR>";
      options.desc = "Blame";
      mode = [ "n" ];
    }
    {
      key = "<leader>gd";
      action = "<cmd>Gitsigns diffthis<CR>";
      options.desc = "Diff";
      mode = [ "n" ];
    }
    # Move to window using the <ctrl> hjkl keys
    {
      key = "<C-h>";
      action = "<C-w>h";
      options.silent = true;
      options.desc = "Go to left window";
      mode = "n";
    }
    {
      key = "<C-j>";
      action = "<C-w>j";
      options.silent = true;
      options.desc = "Go to lower window";
      mode = "n";
    }
    {
      key = "<C-k>";
      action = "<C-w>k";
      options.silent = true;
      options.desc = "Go to upper window";
      mode = "n";
    }
    {
      key = "<C-l>";
      action = "<C-w>l";
      options.silent = true;
      options.desc = "Go to right window";
      mode = "n";
    }
    # buffers
    {
      key = "<S-h>";
      action = "<cmd>bprevious<cr>";
      options.desc = "Prev buffer";
      mode = "n";
    }
    {
      key = "<S-l>";
      action = "<cmd>bnext<cr>";
      options.desc = "Next buffer";
      mode = "n";
    }
    {
      key = "[b";
      action = "<cmd>bprevious<cr>";
      options.desc = "Prev buffer";
      mode = "n";
    }
    {
      key = "]b";
      action = "<cmd>bnext<cr>";
      options.desc = "Next buffer";
      mode = "n";
    }
    {
      key = "<leader>bb";
      action = "<cmd>e #<cr>";
      options.desc = "Switch to Other Buffer";
      mode = "n";
    }
    {
      key = "<leader>`";
      action = "<cmd>e #<cr>";
      options.desc = "Switch to Other Buffer";
      mode = "n";
    }
    {
      key = "<esc>";
      action = "<cmd>noh<cr><esc>";
      options.desc = "Escape and clear hlsearch";
      mode = [ "i" "n" ];
    }
    # Clear search, diff update and redraw, taken from runtime/lua/_editor.lua
    {
      key = "<leader>ur";
      action = "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>";
      options.desc = "Redraw / clear hlsearch / diff update";
      mode = [ "i" "n" ];
    }
    # https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
    {
      key = "n";
      action = "'Nn'[v:searchforward].'zv'";
      options.desc = "Next search result";
      mode = "n";
    }
    {
      key = "n";
      action = "'Nn'[v:searchforward]";
      options.desc = "Next search result";
      mode = [ "x" "o" ];
    }
    {
      key = "N";
      action = "'nN'[v:searchforward].'zv'";
      options.desc = "Prev search result";
      mode = "n";
    }
    {
      key = "n";
      action = "'nN'[v:searchforward]";
      options.desc = "Prev search result";
      mode = [ "x" "o" ];
    }
    # Add undo break-points
    {
      key = ",";
      action = ",<c-g>u";
      mode = "i";
    }
    {
      key = ".";
      action = ".<c-g>u";
      mode = "i";
    }
    {
      key = ";";
      action = ";<c-g>u";
      mode = "i";
    }
    # save file
    {
      key = "<C-s>";
      action = "<cmd>w<cr><esc>";
      options.desc = "Save file";
      mode = [ "i" "x" "n" "s" ];
    }
    # keywordprg
    {
      key = "<leader>K";
      action = "<cmd>norm! K<cr>";
      options.desc = "Keywordprg";
      mode = [ "i" "x" "n" "s" ];
    }

    # better indenting
    {
      key = "<";
      action = "<gv";
      mode = "v";
    }
    {
      key = ">";
      action = ">gv";
      mode = "v";
    }

    # new file
    {
      key = "<leader>fn";
      action = "<cmd>enew<cr>";
      options.desc = "New File";
      mode = "n";
    }
    {
      key = "<leader>xl";
      action = "<cmd>lopen<cr>";
      options.desc = "Location List";
      mode = "n";
    }
    {
      key = "<leader>xq";
      action = "<cmd>copen<cr>";
      options.desc = "Quickfix List";
      mode = "n";
    }
    {
      key = "[q";
      action = "vim.cmd.cprev";
      options.desc = "Previous Quickfix";
      lua = true;
      mode = "n";
    }
    {
      key = "]q";
      action = "vim.cmd.cnext";
      options.desc = "Next Quickfix";
      lua = true;
      mode = "n";
    }
    {
      action = "<cmd>Neotree toggle<CR>";
      key = "<leader>e";
      options.desc = "Neotree";
      mode = [ "n" ];
    }
    {
      mode = "n";
      key = "U";
      action = "<C-r>";
      options.desc = "Redo";
    }
    {
      mode = "n";
      key = "<esc>";
      action = "<cmd>nohl<CR>";
      options = {
        desc = "No Highlight";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "ga";
      action = "<C-^>";
      options.desc = "Go to alternate file";
    }
    {
      mode = "n";
      key = "<CR>";
      action = "<cmd>wa<CR>";
      options = {
        desc = "Write all";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "Q";
      action = "@q";
      options.desc = "Replay macro recorded by qq";
    }
    {
      mode = "x";
      key = "p";
      action = "P";
      options.desc = "Paste without yank";
    }
    {
      mode = "n";
      key = "x";
      action = "\"_x";
      options.desc = "Delete without yank";
    }
    {
      mode = "n";
      key = "X";
      action = "\"_X";
      options.desc = "Backspace without yank";
    }
    {
      mode = "n";
      key = "<leader>x";
      action = "<cmd>bd<CR>";
      options = {
        desc = "Delete Buffer";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>un";
      action = ''
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end
      '';
      options = {
        desc = "Dismiss all Notifications";
        silent = true;
      };
      lua = true;
    }
    {
      mode = "n";
      key = "<leader>y";
      action = "<cmd>let @+=expand('%').':'.line('.')<CR>";
      options = {
        desc = "Yank filename";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>qa<cr>";
      options.desc = "Quit all";
    }
    {
      mode = "n";
      key = "<leader>ui";
      action = "vim.show_pos";
      options.desc = "Inspect Pos";
      lua = true;
    }
    {
      mode = "t";
      key = "<esc><esc>";
      action = "<c-\\><c-n>";
      options.desc = "Enter Normal Mode";
    }
    {
      mode = "t";
      key = "<C-h>";
      action = "<cmd>wincmd h<cr>";
      options.desc = "Go to left window";
    }
    {
      mode = "t";
      key = "<C-l>";
      action = "<cmd>wincmd l<cr>";
      options.desc = "Go to right window";
    }
    {
      mode = "t";
      key = "<C-j>";
      action = "<cmd>wincmd j<cr>";
      options.desc = "Go to lower window";
    }
    {
      mode = "t";
      key = "<C-k>";
      action = "<cmd>wincmd k<cr>";
      options.desc = "Go to upper window";
    }
    {
      mode = "t";
      key = "<C-/>";
      action = "<cmd>wincmd k<cr>";
      options.desc = "Go to upper window";
    }
    {
      mode = "t";
      key = "<C-k>";
      action = "<cmd>close<cr>";
      options.desc = "Hide Terminal";
    }
    {
      mode = "t";
      key = "<c-_>";
      action = "<cmd>close<cr>";
      options.desc = "which_key_ignore";
    }
    {
      mode = "n";
      key = "<leader>ui";
      action = "vim.show_pos";
      options.desc = "Inspect Pos";
    }
    {
      mode = "n";
      key = "<leader>ww";
      action = "<C-W>c";
      options.desc = "Delete window";
    }
    {
      mode = "n";
      key = "<leader>w-";
      action = "<C-W>s";
      options.desc = "Split window below";
    }
    {
      mode = "n";
      key = "<leader>w|";
      action = "<C-W>v";
      options.desc = "Split window right";
    }
    {
      mode = "n";
      key = "<leader>w-";
      action = "<C-W>s";
      options.desc = "Split window below";
    }
    {
      mode = "n";
      key = "<leader>|";
      action = "<C-W>v";
      options.desc = "Split window right";
    }
    {
      mode = "n";
      key = "<leader>-";
      action = "<C-W>s";
      options.desc = "Split window below";
    }
    {
      mode = "n";
      key = "<leader><tab>l";
      action = "<cmd>tablast<cr>";
      options.desc = "Last Tab";
    }
    {
      mode = "n";
      key = "<leader><tab>f";
      action = "<cmd>tabfirst<cr>";
      options.desc = "First Tab";
    }
    {
      mode = "n";
      key = "<leader><tab><tab>";
      action = "<cmd>tabnew<cr>";
      options.desc = "New Tab";
    }
    {
      mode = "n";
      key = "<leader><tab>]";
      action = "<cmd>tabnext<cr>";
      options.desc = "Next Tab";
    }
    {
      mode = "n";
      key = "<leader><tab>d";
      action = "<cmd>tablast<cr>";
      options.desc = "Close Tab";
    }
    {
      mode = "n";
      key = "<leader><tab>[";
      action = "<cmd>tablast<cr>";
      options.desc = "Previous Tab";
    }
    # Reordering tabs
    {
      mode = "n";
      key = "<leader>bp";
      action = "<cmd>BufferLineTogglePin<cr>";
      options.desc = "";
    }
    {
      mode = "n";
      key = "<leader>bP";
      action = "<cmd>BufferLineGroupClose ungrouped<cr>";
      options.desc = "";
    }
    {
      mode = "n";
      key = "<leader>bo";
      action = "<cmd>BufferLineCloseOthers<cr>";
      options.desc = "";
    }
    {
      mode = "n";
      key = "<leader>br";
      action = "<cmd>BufferLineCloseRight<cr>";
      options.desc = "";
    }
    {
      mode = "n";
      key = "<leader>bl";
      action = "<cmd>BufferLineCloseLeft<cr>";
      options.desc = "";
    }

    # Navigating tabs
     {
       mode = "n";
       key = "<S-h>";
       action = "<cmd>BufferLineCycleNext<cr>";
       options.desc = "";
     }
     {
       mode = "n";
       key = "<S-l>";
       action = "<cmd>BufferLineCyclePrev<cr>";
       options.desc = "";
     }
     {
       mode = "n";
       key = "[b";
       action = "<cmd>BufferLineCycleNext<cr>";
       options.desc = "";
     }
     {
       mode = "n";
       key = "]b";
       action = "<cmd>BufferLineCyclePrev<cr>";
       options.desc = "";
     }
     {
       mode = "n";
       key = "<A-1>";
       action = "<cmd>BufferLineGoToBuffer 1<cr>";
       options.desc = "";
     }
     {
       mode = "n";
       key = "<A-2>";
       action = "<cmd>BufferLineGoToBuffer 2<cr>";
       options.desc = "";
     }
     {
       mode = "n";
       key = "<A-3>";
       action = "<cmd>BufferLineGoToBuffer 3<cr>";
       options.desc = "";
     }
     {
       mode = "n";
       key = "<A-4>";
       action = "<cmd>BufferLineGoToBuffer 4<cr>";
       options.desc = "";
     }
     {
       mode = "n";
       key = "<A-5>";
       action = "<cmd>BufferLineGoToBuffer 5<cr>";
       options.desc = "";
     }
     {
       mode = "n";
       key = "<A-6>";
       action = "<cmd>BufferLineGoToBuffer 6<cr>";
       options.desc = "";
     }
     {
       mode = "n";
       key = "<A-7>";
       action = "<cmd>BufferLineGoToBuffer 7<cr>";
       options.desc = "";
     }
     {
       mode = "n";
       key = "<A-8>";
       action = "<cmd>BufferLineGoToBuffer 8<cr>";
       options.desc = "";
     }
     {
       mode = "n";
       key = "<A-9>";
       action = "<cmd>BufferLineGoToBuffer 9<cr>";
       options.desc = "";
     }
     {
       mode = "n";
       key = "<A-0>";
       action = "<cmd>BufferLineGoToBuffer -1<cr>";
       options.desc = "";
     }
    {
      mode = "n";
      key = "<S-x>";
      action = "<cmd>lua require('bufferline.commands').unpin_and_close()<cr>";
      options.desc = "";
    }
  ];
};
}
