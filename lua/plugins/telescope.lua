return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      local pickers = require("telescope.pickers")
      local finders = require("telescope.finders")
      local conf = require("telescope.config").values
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      require("telescope").setup({
        defaults = {
          layout_config = {
            prompt_position = "top",
          },
          sorting_strategy = "ascending",
        },
      })

      local palette_items = {
        { label = "Open File Sidebar", run = function() vim.cmd("Neotree toggle left") end },
        { label = "Toggle Terminal", run = function() vim.cmd("ToggleTerm") end },
        { label = "Open Problems Panel", run = function() vim.cmd("Trouble diagnostics toggle") end },
        { label = "Open Current File Problems", run = function() vim.cmd("Trouble diagnostics toggle filter.buf=0") end },
        { label = "Open References Panel", run = function() vim.cmd("Trouble lsp_references toggle") end },
        { label = "Open Symbols Panel", run = function() vim.cmd("Trouble symbols toggle focus=false") end },
        { label = "Open Quickfix Panel", run = function() vim.cmd("Trouble qflist toggle") end },
        { label = "Open Location List Panel", run = function() vim.cmd("Trouble loclist toggle") end },
        { label = "Find Files", run = function() builtin.find_files({ hidden = true }) end },
        { label = "Search Text In Files", run = builtin.live_grep },
        { label = "Find Open Files", run = builtin.buffers },
        { label = "Find Recent Files", run = builtin.oldfiles },
        { label = "Find Shortcuts", run = builtin.keymaps },
        { label = "Find Help Pages", run = builtin.help_tags },
        { label = "Open Git Diff View", run = function() vim.cmd("DiffviewOpen") end },
        { label = "Close Git Diff View", run = function() vim.cmd("DiffviewClose") end },
        { label = "Toggle Markdown Preview", run = function() vim.cmd("MarkdownPreviewToggle") end },
        { label = "Restore Session For This Folder", run = function() require("persistence").load() end },
        { label = "Restore Last Session", run = function() require("persistence").load({ last = true }) end },
        { label = "Show Code Actions", run = vim.lsp.buf.code_action },
        { label = "Go To Definition", run = vim.lsp.buf.definition },
        { label = "Find All References", run = vim.lsp.buf.references },
        { label = "Format Current File", run = vim.lsp.buf.format },
      }

      local function open_command_palette()
        pickers.new({}, {
          prompt_title = "Command Palette",
          finder = finders.new_table({
            results = palette_items,
            entry_maker = function(item)
              return {
                value = item,
                display = item.label,
                ordinal = item.label,
              }
            end,
          }),
          sorter = conf.generic_sorter({}),
          attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
              local selection = action_state.get_selected_entry()
              actions.close(prompt_bufnr)
              if selection and selection.value and selection.value.run then
                selection.value.run()
              end
            end)
            return true
          end,
        }):find()
      end

      -- Show hidden files in file finder (e.g. .env, .gitignore)
      vim.keymap.set('n', '<C-p>', function()
        builtin.find_files({ hidden = true })
      end, { desc = "Telescope: Find files (incl. dotfiles)" })
      vim.keymap.set('n', '<leader>ff', function()
        builtin.find_files({ hidden = true })
      end, { desc = "Find files" })

      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope: Live grep" })
      vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = "Search in files" })
      vim.keymap.set('n', '<leader><leader>', open_command_palette, { desc = "Open command palette" })
      vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = "Find keymaps" })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find help" })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find open files" })
      vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = "Find recent files" })
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
