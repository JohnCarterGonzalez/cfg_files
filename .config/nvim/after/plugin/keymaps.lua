local g = vim.g
local api = vim.api
local keymap = vim.keymap.set

-- Space as leader key
g.mapleader = ""
g.maplocalleader = ""

-- Word wrap
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Telescope
local builtin = require('telescope.builtin')
keymap("n", "<leader>ff", builtin.find_files, {})
keymap("n", "<leader>fg", builtin.live_grep, {})
keymap("n", "<leader>fb", builtin.buffers, {})
keymap("n", "<leader>fh", builtin.help_tags, {})

-- jk to ESC
keymap("i", "jk", "<ESC>", { noremap = true, silent = true })
keymap("n", "<leader>n", ":bn<CR>", { noremap = true, silent = true })
keymap("n", "<leader>p", ":bp<CR>", { noremap = true, silent = true })

-- Trouble
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })

-- Harpoon
keymap("n", "<leader>hm", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", { silent = true, noremap = true })
keymap("n", "<leader>p", ":lua require('harpoon.ui').nav_prev()<cr>", { silent = true, noremap = true })
keymap("n", "<leader>n", ":lua require('harpoon.ui').nav_next()<cr>", { silent = true, noremap = true })
keymap("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<cr>", { silent = true, noremap = true })

-- local keys = {
--   ['cr']        = api.nvim_replace_termcodes('<CR>', true, true, true),
--   ['ctrl-y']    = api.nvim_replace_termcodes('<C-y>', true, true, true),
--   ['ctrl-y_cr'] = api.nvim_replace_termcodes('<C-y><CR>', true, true, true),
-- }
-- 
-- _G.cr_action = function()
--   if api.nvim_call_function("pumvisible", {}) ~= 0 then
--     -- If popup is visible, confirm selected item or add new line otherwise
--     local item_selected = api.nvim_call_function("complete_info", { "selected" }) ~= -1
--     return item_selected and keys['ctrl-y'] or keys['ctrl-y_cr']
--   else
--     -- If popup is not visible, use plain `<CR>`. You might want to customize
--     -- according to other plugins. For example, to use 'mini.pairs', replace
--     -- next line with `return require('mini.pairs').cr()`
--     return keys['cr']
--   end
-- end
-- api.nvim_set_keymap('i', '<CR>', 'v:lua._G.cr_action()', { noremap = true, expr = true })-

vim.cmd [[
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
]]
