-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
--
local utils = require "astronvim.utils"
local get_icon = utils.get_icon
local e = { desc = get_icon("Edit", 1, true) .. "Edit" }
return {
  -- first key is the mode
  n = {
    ["<leader>e"] = e,
    ["<leader>ez"] = { "<cmd>ZenMode<CR>", desc = "ZenMode" },
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<leader>bx"] = {
      function()
        local current = vim.api.nvim_get_current_buf()
        require("astronvim.utils.buffer").close(current)
      end,
      desc = "Close current buffer",
    },
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>w"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
    ["<leader>la"] = {
      function() require("actions-preview").code_actions() end,
      desc = "Code action",
    },
    ["L"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["H"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
  },
  i = {
    -- ["<ctrl><space>"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code action" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
