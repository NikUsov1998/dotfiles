-- Remove global default key mapping
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "gO")

-- Create new keymapping for lsps
-- LspAttach: After an LSP Client performs "initialize" and attaches to a buffer.
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local keymap = vim.keymap
		local lsp = vim.lsp
		local bufopts = { noremap = true, silent = true }

		keymap.set("n", "gr", lsp.buf.references, bufopts)
		keymap.set("n", "gd", lsp.buf.definition, bufopts)
		keymap.set("n", "<space>rn", lsp.buf.rename, bufopts)
		--keymap.set("n", "K", lsp.buf.hover, bufopts)
        vim.api.nvim_create_autocmd("WinEnter", {
            callback = function()
                if vim.api.nvim_win_get_config(0).relative ~= "" then
                    -- В плавающем окне используем m для man
                    vim.keymap.set("n", "m", function()
                        local word = vim.fn.expand("<cword>")
                        vim.cmd("wincmd p")
                        vim.cmd("Man " .. word)
                    end, { noremap = true, silent = true, buffer = 0 })
                end
            end,
        })
		keymap.set({ "n", "v" }, "<space>f", function()
			local mode = vim.api.nvim_get_mode().mode

			if vim.startswith(string.lower(mode), "v") then
				require("conform").format({ lsp_fallback = true, async = true, timeout_ms = 1000 }, function(err)
					if not err then
						if vim.startswith(string.lower(mode), "v") then
							vim.api.nvim_feedkeys(
								vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
								"n",
								false
							)
						end
					end
				end)
			else
				require("conform").format({
					lsp_fallback = true,
					async = true,
					timeout_ms = 1000,
				})
			end
		end, bufopts)
	end,
})

-- CursorHold: When the user doesn't press a key for the time specified with 'updatetime'
--             By default, `updatetime` is equal to 4000 ms
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focusable = false, source = "if_many", updatetime = 2000 })
	end,
})

vim.lsp.enable({
	"clangd",
	"lua_ls",
	"ty",
    "python",
    "bash"
})
