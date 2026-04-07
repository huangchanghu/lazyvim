-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- 1. 项目相关 (Project)
-- 将 <leader>p 设置为打开项目列表
map("n", "<leader>p", function()
  Snacks.picker.projects()
end, { desc = "Projects" })

-- 2. 禁用或覆盖默认的 <leader>fp
-- 在 Neovim 中，当你定义了更长的映射（如 <leader>fpf），
-- 原有的短映射（<leader>fp）会自动失效或变成等待状态。
-- 这里我们直接删除它，以防万一
pcall(vim.keymap.del, "n", "<leader>fp")

-- 3. 为 Which-key 注册分组标签 (让弹出菜单显示 "+file path")
local status_ok, wk = pcall(require, "which-key")
if status_ok then
  wk.add({
    { "<leader>fp", group = "file path" },
  })
end

-- 4. 文件路径相关 (File Path) 映射 - 使用 <leader>fp 前缀
-- 复制文件全路径 (Normal & Visual mode)
map({ "n", "v" }, "<leader>fpf", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify("📋 Copied: " .. path)
end, { desc = "Copy file path" })

-- 复制所在目录路径 (Normal & Visual mode)
map({ "n", "v" }, "<leader>fpd", function()
  local dir = vim.fn.expand("%:p:h")
  vim.fn.setreg("+", dir)
  vim.notify("📁 Copied: " .. dir)
end, { desc = "Copy directory path" })

-- 仅显示文件路径 (Normal & Visual mode)
map({ "n", "v" }, "<leader>fps", function()
  local path = vim.fn.expand("%:p")
  vim.notify("📋 Path: " .. path)
end, { desc = "Show file path" })
