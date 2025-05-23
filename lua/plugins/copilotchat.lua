return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",  -- MacOS/Linux only
    opts = {
      window = {
        layout   = "vertical",  -- 'float' | 'vertical' | 'horizontal'
        position = "right",     -- only for vertical
        width    = 0.4,         -- 40% of editor width
      },
    },
    keys = {
      { "<Leader>zc", ":CopilotChat<CR>",        mode = "n", desc = "Chat with Copilot" },
      { "<Leader>ze", ":CopilotChatExplain<CR>", mode = "v", desc = "Explain Code" },
      { "<Leader>zr", ":CopilotChatReview<CR>",  mode = "v", desc = "Review Code" },
      { "<Leader>zf", ":CopilotChatFix<CR>",     mode = "v", desc = "Fix Code Issues" },
      { "<Leader>zo", ":CopilotChatOptimize<CR>",mode = "v", desc = "Optimize Code" },
      { "<Leader>zd", ":CopilotChatDocs<CR>",    mode = "v", desc = "Generate Docs" },
      { "<Leader>zt", ":CopilotChatTests<CR>",   mode = "v", desc = "Generate Tests" },
      { "<Leader>zm", ":CopilotChatCommit<CR>",  mode = "n", desc = "Commit Message" },
      { "<Leader>zs", ":CopilotChatCommit<CR>",  mode = "v", desc = "Commit for Selection" },
    },
  },
}


