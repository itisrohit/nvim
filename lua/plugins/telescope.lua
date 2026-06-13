return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")

      -- Show hidden files in file finder (e.g. .env, .gitignore)
      vim.keymap.set('n', '<C-p>', function()
        builtin.find_files({ hidden = true })
      end, { desc = "Telescope: Find files (incl. dotfiles)" })
      vim.keymap.set('n', '<leader>ff', function()
        builtin.find_files({ hidden = true })
      end, { desc = "Find files" })

      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope: Live grep" })
      vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = "Search in files" })
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({})
          }
        }
      })

      require("telescope").load_extension("ui-select")
    end
  },
}
