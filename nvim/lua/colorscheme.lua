-- Define your colorscheme here.
local colorscheme = "retrobox"
-- local colorscheme = "darkblue"
-- local colorscheme = ""
-- local colorscheme = ""

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
