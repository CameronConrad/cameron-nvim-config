local harpoon = require("harpoon")

harpoon:setup()

-- basic telescope configuration
-- local conf = require("telescope.config").values
-- local function toggle_telescope(harpoon_files)
--     local file_paths = {}
--     for _, item in ipairs(harpoon_files.items) do
--         table.insert(file_paths, item.value)
--     end

--     require("telescope.pickers").new({}, {
--         prompt_title = "Harpoon",
--         finder = require("telescope.finders").new_table({
--             results = file_paths,
--         }),
--         previewer = conf.file_previewer({}),
--         sorter = conf.generic_sorter({}),
--     }):find()
-- end

-- NOTE: Harpoon Key Bindings
vim.keymap.set('n', '<leader>ha', function() harpoon:list():add() end)
vim.keymap.set('n', '<leader>hs', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set('n', '<leader>hq', function() harpoon:list():select(1) end)
vim.keymap.set('n', '<leader>hw', function() harpoon:list():select(2) end)
vim.keymap.set('n', '<leader>he', function() harpoon:list():select(3) end)
vim.keymap.set('n', '<leader>hr', function() harpoon:list():select(4) end)
