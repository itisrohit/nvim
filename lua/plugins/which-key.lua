return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      delay = 300,
      spec = {
        { "<leader>", group = "Press Space, then..." },
        { "<leader>e", desc = "Open File Sidebar" },
        { "<leader>d", desc = "Go To Definition" },
        { "<leader>r", desc = "Find All References" },
        { "<leader>a", desc = "Show Code Actions" },
        { "<leader>b", desc = "Toggle Git Blame" },
        { "<leader>j", desc = "Jump To Visible Text" },
        { "<leader>f", group = "Find / Search" },
        { "<leader>ff", desc = "Find Files" },
        { "<leader>fs", desc = "Search Text In Files" },
        { "<leader>g", group = "Git / Format" },
        { "<leader>gf", desc = "Format Current File" },
        { "<leader>gp", desc = "Preview Git Change" },
        { "<leader>q", group = "Sessions" },
        { "<leader>qs", desc = "Restore Session For This Folder" },
        { "<leader>ql", desc = "Restore Last Session" },
        { "<leader>qd", desc = "Stop Saving Session" },
      },
    },
  },
}
