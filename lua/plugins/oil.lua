return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- 可选：用于显示文件图标
  -- 插件加载时机
  cmd = "Oil",
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
    { "<leader>fo", "<CMD>Oil --float<CR>", desc = "Open Oil in float" }, -- 额外添加一个浮窗模式
  },
  opts = {
    -- 默认快捷键配置
    default_file_explorer = true, -- 替代 netrw
    delete_to_trash = true, -- 删除到回收站
    -- skip_confirm_for_simple_edits = true, -- 简单修改不弹出确认框
    view_options = {
      show_hidden = true, -- 默认显示隐藏文件
    },
    -- 悬浮窗配置
    float = {
      padding = 2,
      max_width = 0,
      max_height = 0,
      border = "rounded",
    },
  },
}
