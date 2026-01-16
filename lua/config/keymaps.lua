-- keymaps.lua: Floaterm 浮动终端最终版
-- 原理：按下快捷键时，弹出一个浮动终端窗口来执行命令。

-- F9: 在浮动终端中编译
vim.keymap.set("n", "<F9>", function()
  vim.cmd("w") -- 保存文件
  local compile_cmd = "clang++ -std=c++14 -Wall -O2 % -o %<"
  vim.cmd("FloatermNew --autoclose=0 " .. compile_cmd)
end, { desc = "Compile in Floaterm" })

-- F10: 在浮动终端中运行
vim.keymap.set("n", "<F10>", function()
  local run_cmd = "./%<"
  vim.cmd("FloatermNew " .. run_cmd)
end, { desc = "Run in Floaterm" })

-- F11: 在浮动终端中编译并运行 (核心功能)
vim.keymap.set("n", "<F11>", function()
  vim.cmd("w") -- 保存文件
  -- 先编译，如果成功(&&)，则清屏(clear)，然后运行(./%<)
  -- `read -p 'Press Enter to continue...'` 会让窗口执行完后暂停，等你按回车再自动关闭
  local exec_cmd = "clang++ -std=c++14 -Wall -O2 % -o %< && clear && ./%< && read -p 'Press Enter to continue...'"
  vim.cmd("FloatermNew " .. exec_cmd)
end, { desc = "Compile & Run in Floaterm" })

-- 你还可以设置一个快捷键来快速开关浮动终端，比如 F12
vim.keymap.set("n", "<F12>", "<cmd>FloatermToggle<cr>", { desc = "Toggle Floaterm" })

-- Ctrl + /: 行注释功能保留
vim.keymap.set({"n", "v"}, "<C-/>", "<Plug>(comment_toggle_linewise_current)", { desc = "Toggle Comment" })

vim.notify("✅ Floaterm keymaps loaded!", vim.log.levels.INFO)

