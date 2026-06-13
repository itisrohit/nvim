return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local function next_listed_buffer(exclude)
        for _, buf in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
          if buf.bufnr ~= exclude and vim.api.nvim_buf_is_valid(buf.bufnr) then
            return buf.bufnr
          end
        end
      end

      local function close_buffer(bufnr)
        bufnr = bufnr or vim.api.nvim_get_current_buf()
        if not vim.api.nvim_buf_is_valid(bufnr) then
          return
        end

        local replacement = next_listed_buffer(bufnr)
        if not replacement then
          replacement = vim.api.nvim_create_buf(true, false)
        end

        for _, tabpage in ipairs(vim.api.nvim_list_tabpages()) do
          for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tabpage)) do
            if vim.api.nvim_win_is_valid(win) and vim.api.nvim_win_get_buf(win) == bufnr then
              vim.api.nvim_win_set_buf(win, replacement)
            end
          end
        end

        vim.api.nvim_buf_delete(bufnr, { force = false })
      end

      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          left_mouse_command = "buffer %d",
          right_mouse_command = close_buffer,
          close_command = close_buffer,
          show_close_icon = false,
          show_buffer_close_icons = true,
          always_show_bufferline = true,
          hover = {
            enabled = true,
            delay = 150,
            reveal = { "close" },
          },
          offsets = {
            {
              filetype = "neo-tree",
              text = "Files",
              highlight = "Directory",
              text_align = "left",
            },
          },
        },
      })

      vim.keymap.set("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous tab" })
      vim.keymap.set("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next tab" })
      vim.keymap.set("n", "<leader>x", close_buffer, { desc = "Close current file" })
    end,
  },
}
