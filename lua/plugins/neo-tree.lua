return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = true,        -- Show hidden files by default
          hide_dotfiles = false, -- Explicitly show dotfiles (like .env)
          hide_gitignored = false, -- Show files normally ignored by git
        },
      },
    })

    -- Keymap: Toggle Neo-tree on the left
    vim.keymap.set('n', '<C-n>', '<Cmd>Neotree toggle left<CR>', { desc = "Toggle file tree (neo-tree)" })
    vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle left<CR>', { desc = "Toggle file tree" })

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "FocusGained" }, {
      callback = function()
        vim.cmd("silent! Neotree refresh")
      end,
    })
  end,
}
