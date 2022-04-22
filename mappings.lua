return {
  setup = function()
    local unmap = vim.keymap.del
    local map = vim.keymap.set

    unmap("n", "<A-j>")
    unmap("n", "<A-k>")
    unmap("n", "<C-Down>")
    unmap("n", "<C-Left>")
    unmap("n", "<C-Right>")
    unmap("n", "<C-Up>")
    unmap("n", "<C-\\>")
    unmap("n", "<C-q>")
    unmap("n", "<C-s>")
    unmap("v", "<A-j>")
    unmap("v", "<A-k>")
    unmap("v", "<")
    unmap("v", ">")
    unmap("v", "J")
    unmap("v", "K")

    -- resize with arrows
    map("n", "<Up>", function()
      require("smart-splits").resize_up(2)
    end, { desc = "Resize split up" })
    map("n", "<Down>", function()
      require("smart-splits").resize_down(2)
    end, { desc = "Resize split down" })
    map("n", "<Left>", function()
      require("smart-splits").resize_left(2)
    end, { desc = "Resize split left" })
    map("n", "<Right>", function()
      require("smart-splits").resize_right(2)
    end, { desc = "Resize split right" })
    -- navigating wrapped lines
    map({ "n", "v" }, "j", "gj", { desc = "Nagivate down" })
    map({ "n", "v" }, "k", "gk", { desc = "Navigate up" })
    -- easy splits
    map("n", "\\", "<cmd>split<cr>", { desc = "Horizontal split" })
    map("n", "|", "<cmd>vsplit<cr>", { desc = "Vertical split" })
    -- better increment/decrement
    map("n", "-", "<c-x>", { desc = "Descrement number" })
    map("n", "+", "<c-a>", { desc = "Increment number" })
    map("x", "+", "g<c-a>", { desc = "Increment number" })
    map("x", "-", "g<c-x>", { desc = "Descrement number" })
    -- line text-objects
    map("x", "il", "g_o^", { desc = "Inside line text object" })
    map("o", "il", ":normal vil<cr>", { desc = "Inside line text object" })
    map("x", "al", "$o^", { desc = "Around line text object" })
    map("o", "al", ":normal val<cr>", { desc = "Around line text object" })
    -- type template string
    map("i", ";mk", "<++>", { desc = "Insert template string" })
    map("i", "<S-Tab>", "<C-V><Tab>", { desc = "Tab character" })
    -- terminal mappings
    map("t", "<leader><esc>", "<c-\\><c-n>", { desc = "Terminal normal mode" })
    map("t", "<esc><esc>", "<c-\\><c-n>:q<cr>", { desc = "Terminal quite" })
    map("t", "<c-h>", "<c-\\><c-n><c-w>h", { desc = "Terminal left window" })
    map("t", "<c-j>", "<c-\\><c-n><c-w>j", { desc = "Terminal below window" })
    map("t", "<c-k>", "<c-\\><c-n><c-w>k", { desc = "Terminal above window" })
    map("t", "<c-l>", "<c-\\><c-n><c-w>l", { desc = "Terminal right window" })
    -- cmp lsp auto complete
    map("i", "<c-x><c-o>", function()
      require("cmp").complete { config = { sources = { { name = "nvim_lsp" } } } }
    end, { desc = "Complete LSP" })
    map("", "<c-e><c-e>", "<Plug>SendLine", { desc = "Send line to REPL" })
    map("", "<c-e>", "<Plug>Send", { desc = "Send to REPL" })

    map("x", "J", function()
      require("syntax-tree-surfer").surf("next", "visual")
    end, { desc = "Surf next tree-sitter object" })
    map("x", "K", function()
      require("syntax-tree-surfer").surf("prev", "visual")
    end, { desc = "Surf previous tree-sitter object" })
    map("x", "H", function()
      require("syntax-tree-surfer").surf("parent", "visual")
    end, { desc = "Surf parent tree-sitter object" })
    map("x", "L", function()
      require("syntax-tree-surfer").surf("child", "visual")
    end, { desc = "Surf child tree-sitter object" })
    map("x", "<c-j>", function()
      require("syntax-tree-surfer").surf("next", "visual", true)
    end, { desc = "Surf next tree-sitter object" })
    map("x", "<c-l>", function()
      require("syntax-tree-surfer").surf("next", "visual", true)
    end, { desc = "Surf next tree-sitter object" })
    map("x", "<c-k>", function()
      require("syntax-tree-surfer").surf("prev", "visual", true)
    end, { desc = "Surf previous tree-sitter object" })
    map("x", "<c-h>", function()
      require("syntax-tree-surfer").surf("prev", "visual", true)
    end, { desc = "Surf previous tree-sitter object" })
    map("n", "<c-down>", function()
      require("syntax-tree-surfer").move("n", false)
    end, { desc = "Swap next tree-sitter object" })
    map("n", "<c-right>", function()
      require("syntax-tree-surfer").move("n", false)
    end, { desc = "Swap next tree-sitter object" })
    map("n", "<c-up>", function()
      require("syntax-tree-surfer").move("n", true)
    end, { desc = "Swap previous tree-sitter object" })
    map("n", "<c-left>", function()
      require("syntax-tree-surfer").move("n", true)
    end, { desc = "Swap previous tree-sitter object" })
  end,
}
