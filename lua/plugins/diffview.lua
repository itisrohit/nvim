return {
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "DiffviewOpen", "DiffviewClose" },
    keys = {
      {
        "<leader>gv",
        "<Cmd>DiffviewOpen<CR>",
        desc = "Open Git Diff View",
      },
      {
        "<leader>gc",
        "<Cmd>DiffviewClose<CR>",
        desc = "Close Git Diff View",
      },
    },
  },
}
