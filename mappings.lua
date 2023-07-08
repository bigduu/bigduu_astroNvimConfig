-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>w"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
    ["<leader>e"] = false,
    ["gl"] = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", desc = "show_cursor_diagnostics" },
    ["gp"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "show_cursor_diagnostics" },
    ["gn"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "show_cursor_diagnostics" },
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
    ["<ctrl><space>"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code action" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
