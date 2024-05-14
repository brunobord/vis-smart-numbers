require("vis")

-- Set relative line numbers in normal mode, and regular line numbers in insert mode.

vis.events.subscribe(vis.events.INIT, function()

	-- returns a fuctnion that when called runs vis:feedkeys(keys)
	local fk = function(keys)
		return function ()
			vis:feedkeys(keys)
		end
	end

	-- key mappings

	-- normal
	vis:map(vis.modes.NORMAL, "i", fk(":set numbers<Enter><vis-mode-insert>"),
	"Enter insert mode")

	vis:map(vis.modes.NORMAL, "I", fk(":set numbers<Enter><vis-mode-insert>"),
	"Insert text before the first non-blank in the line")

	vis:map(vis.modes.NORMAL, "a", fk(":set numbers<Enter><vis-append-char-next>"),
	"Append text after the cursor")

	vis:map(vis.modes.NORMAL, "A", fk(":set numbers<Enter><vis-append-line-end>"),
	"Append text after the end of the line")

	-- insert
	vis:map(vis.modes.INSERT, "<Escape>", fk("<vis-mode-normal>:set relativenumber<Enter>"),
	"Enter normal mode")
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win) -- luacheck: no unused args
	vis:command('set relativenumber')
end)

