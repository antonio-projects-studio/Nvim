vim.keymap.set("n", "<leader>ga", vim.cmd.Git);
vim.keymap.set("n", "<leader>gc", ":Git commit -m \"\"<Left>" )
vim.keymap.set("n", "<leader>gp", ":Git push origin ")
vim.keymap.set("n", "<leader>gs", ":Git switch ")
vim.keymap.set("n", "<leader>gm", ":Gvdiffsplit HEAD~:%<Left><Left>") -- просмотр изменений в сравнении с другим коммитом
vim.keymap.set("n", "<leader>gdb", ":Git branch -d ") --удаляет ветку
vim.keymap.set("n", "<leader>grc", ":Git revert") --Откат комита на нужный
vim.keymap.set("n", "<leader>gl", ":Git log") --с параметром -p показывает изменения
vim.keymap.set("n", "<leader>gdc", ":Git reset HEAD~") --с параметром --hard удаляет полностью коммит
vim.keymap.set("n", "<leader>gnb", ":Git switch -c ") --Новая ветка
vim.keymap.set("n", "<leader>gm", ":Git merge") --сначала переключится на ту ветку, которую хочешь оставить







