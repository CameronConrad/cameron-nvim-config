local map = vim.api.nvim_set_keymap

map("n", "<Space>", "", {})
vim.g.mapleader = " "

local noremap_options = { noremap = true }

--NOTE: Sensible remaps, some from the Primeagen
map("x", "p", '"_dP', noremap_options)
map("v", "K", ":m '<-2<CR>gv=gv", noremap_options)
map("v", "J", ":m '>+1<CR>gv=gv", noremap_options)
map("i", "<C-j>", "<esc>:m .+1<CR>==", noremap_options)
map("i", "<C-k>", "<esc>:m .-2<CR>==", noremap_options)
map("n", "<leader>k", ":m .-2<CR>==", noremap_options)
map("n", "<leader>j", ":m .+1<CR>==", noremap_options)
map("n", "Y", "y$", noremap_options)
map("n", "n", "nzz", noremap_options)

--NOTE: Experimental remaps
map("n", "rm{", "di{va{p", noremap_options)
map("n", "rm[", "di[va[p", noremap_options)
map("n", "rm(", "di(va(p", noremap_options)
map("n", "rm<", "di<va<p", noremap_options)

--NOTE: Lua output date for zettels
-- map('n', '<leader>z', ':lua print_current_date()<cr>', noremap_options)
-- function print_current_date()
--   local current_date = os.date("%Y%m%d%H%M%S")
--   local r, c = unpack(vim.api.nvim_win_get_cursor(0))
--   local lines = vim.api.nvim_buf_get_lines(0, r-1, r, false)
--   local line = unpack(lines)
--   vim.api.nvim_buf_set_lines(0, r-1, r, -1, {current_date .. line})
-- end

--NOTE: Obsidian remaps
-- map("n", "<leader>zn", ":ObsidianNew ", noremap_options)
-- map("n", "<leader>zt", ":ObsidianTemplate<cr>", noremap_options)

--NOTE: Helix inspired mappings
map("n", "gl", "$", noremap_options)
map("n", "gh", "^", noremap_options)
map("n", "ge", "GG", noremap_options)

--NOTE: My sensible remap for deleting words backwards
--This will delete the character under the cursor when deleting backwards
--Then it will place the cursor on the left of the single or double quotes
map("n", 'dT"', 'dT"dlh', noremap_options)
map("n", "dT'", "dT'dlh", noremap_options)
map("n", 'cT"', 'dT"dlha', noremap_options)
map("n", "cT'", "dT'dlha", noremap_options)

-- BUG: This currently doesn't work/I haven't configured it for lua
-- Search with visually selected text
-- map('v', '//', 'y\\/V<C-R>=escape(@","/\")<CR><CR>', noremap_options)

--NOTE: Fugitive Keybinding
map("n", "<leader>gfn", ":diffget //3<CR>", {})
map("n", "<leader>gft", ":diffget //2<CR>", {})
map("n", "<leader>gs", ":G<CR>", {})
--
--NOTE: Git Worktrees Bindings
map("n", "<leader>gw", ':lua require("telescope").extensions.git_worktree.git_worktrees()<cr>', noremap_options)
map("n", "<leader>gc", ':lua require("telescope").extensions.git_worktree.create_git_worktree()<cr>', noremap_options)

--NOTE: I use the Meld command here because that's my favorite gui application for
--handling merge conflicts
vim.cmd([[command! -nargs=0 Meld Gvdiffsplit!]])

--NOTE: Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", noremap_options)
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", noremap_options)
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", noremap_options)
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", noremap_options)
map("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<cr>", noremap_options)
map("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", noremap_options)
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", noremap_options)

--NOTE: Emacs window hopping
map("n", "<leader>wh", ":wincmd h<CR>", noremap_options)
map("n", "<leader>wj", ":wincmd j<CR>", noremap_options)
map("n", "<leader>wk", ":wincmd k<CR>", noremap_options)
map("n", "<leader>wl", ":wincmd l<CR>", noremap_options)

--NOTE: Window sizing
map("n", "<leader>+", ":vertical resize +5<CR>", noremap_options)
map("n", "<leader>-", ":vertical resize -5<CR>", noremap_options)

--NOTE: Generate a UUID
map("i", "<c-u>", "<c-r>=trim(system('uuidgen'))<cr>", noremap_options)

--NOTE: Hex 2 RGBA Plugin
map("n", "<leader>cs", ':lua require("hex2rgba").hex2rgba()<cr>', noremap_options)

--TODO: Move these into my actual snippets with luasnip
--Dotfiles snippets
map("n", ",html", ":-1read $HOME/.dotfiles/skeletons/skeleton.html<CR>3jwf>a", noremap_options)
map("n", ",react", ":-1read $HOME/.dotfiles/skeletons/skeleton.jsx<CR>2j3wce", noremap_options)
map("n", ",vue", ":-1read $HOME/.dotfiles/skeletons/skeleton.vue<CR>ja", noremap_options)
map("n", ",csdto", ":-1read $HOME/.dotfiles/skeletons/csdto.cs<CR>4jwce", noremap_options)

--NOTE: Disable Escape p for Auto Pairs. Escape p trigger auto pairs to toggle
map("n", "<M-p>", "<Nop>", noremap_options)

--TODO: Find the code that was handling this, I had a simple plugin that would toggle a menu
--Keybindings popup
map("n", "<leader>test", ':lua require("nvimkeybindsnippet").toggle_keybinding_menu()<CR>', noremap_options)

--NOTE: GoTo Preview Keybindings
-- DO NOT USE THE LEADER KEY!!!
-- I have <leader>gp mapped to vim.diagnostic.goto_prev
map("n", "gpd", ':lua require("goto-preview").goto_preview_definition()<CR>', noremap_options)
map("n", "gpt", ':lua require("goto-preview").goto_preview_type_definition()<CR>', noremap_options)
map("n", "gpi", ':lua require("goto-preview").goto_preview_implementation()<CR>', noremap_options)
map("n", "gP", ':lua require("goto-preview").close_all_win()<CR>', noremap_options)

--NOTE: Only set if you have telescope installed
map("n", "gpr", ':lua require("goto-preview").goto_preview_references()<CR>', noremap_options)

--NOTE: Autocommands
vim.cmd([[
  autocmd FileType markdown setlocal wrap
  autocmd FileType markdown setlocal linebreak
]])

--NOTE: Keymap to exit out of a file in normal mode
vim.keymap.set("n", "-", ":Ex<CR>", noremap_options)

--NOTE: LSP Keybindings
vim.keymap.set("n", "K", vim.lsp.buf.hover, noremap_options)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, noremap_options)
vim.keymap.set("n", "<leader>gp", vim.diagnostic.goto_prev, noremap_options)
vim.keymap.set("n", "<leader>gn", vim.diagnostic.goto_next, noremap_options)
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.rename, noremap_options)
vim.keymap.set("n", "<leader>gR", vim.lsp.buf.references, noremap_options)
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, noremap_options)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, noremap_options)
vim.keymap.set("n", "<leader>gl", "<cmd>Telescope diagnostics<cr>", noremap_options)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, noremap_options)

--NOTE: Format Code
vim.keymap.set("n", "<leader>pc", vim.lsp.buf.format, noremap_options)

--NOTE: Note taking and other miscellaneous keybindings
vim.keymap.set("i", "<D-.>", "<esc>^i  • <esc>$a", noremap_options)
vim.keymap.set("n", "<D-.>", "^i	• <esc>$", noremap_options)

--NOTE: Copilot
vim.keymap.set("i", "<C-n>", "<cmd>lua require('copilot').complete()<CR>", noremap_options)
