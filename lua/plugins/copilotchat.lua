return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      window = {
        layout = "vertical", -- vertical split
        position = "right",  -- set to "right" to open on right side
        width = 0.4,         -- optional: control width as a fraction (0.4 = 40%)
      },
    },
    keys = {
      { "<Leader>zc", ":CopilotChat<CR>",           mode = "n", desc = "Chat with Copilot" },
      { "<Leader>ze", ":CopilotChatExplain<CR>",    mode = "v", desc = "Explain Code" },
      { "<Leader>zr", ":CopilotChatReview<CR>",     mode = "v", desc = "Review Code" },
      { "<Leader>zf", ":CopilotChatFix<CR>",        mode = "v", desc = "Fix Code Issues" },
      { "<Leader>zo", ":CopilotChatOptimize<CR>",   mode = "v", desc = "Optimize Code" },
      { "<Leader>zd", ":CopilotChatDocs<CR>",       mode = "v", desc = "Generate Docs" },
      { "<Leader>zt", ":CopilotChatTests<CR>",      mode = "v", desc = "Generate Tests" },
      { "<Leader>zm", ":CopilotChatCommit<CR>",     mode = "n", desc = "Generate Commit Message" },
      { "<Leader>zs", ":CopilotChatCommit<CR>",     mode = "v", desc = "Generate Commit for Selection" },
    },
  },
}

