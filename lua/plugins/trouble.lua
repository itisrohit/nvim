return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
    keys = {
      {
        "<leader>ux",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Show Errors And Warnings",
      },
      {
        "<leader>ur",
        "<cmd>Trouble lsp_references toggle<cr>",
        desc = "Show References List",
      },
      {
        "<leader>us",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Show File Symbols",
      },
    },
  },
}
