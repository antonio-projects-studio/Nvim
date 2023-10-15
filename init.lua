require("antonio")
if vim.g.vscode then
    -- VSCode extension
else
    require("plugins.packer_compiled")
    require("configs")
end
