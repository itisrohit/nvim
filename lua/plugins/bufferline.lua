return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
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
      vim.keymap.set("n", "<leader>x", "<Cmd>bdelete<CR>", { desc = "Close current file" })
    end,
  },
}
