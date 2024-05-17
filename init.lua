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

	vis:map(vis.modes.NORMAL, "o", fk(":set numbers<Enter><vis-open-line-below>"),
	"Begin a new line below the cursor")

	vis:map(vis.modes.NORMAL, "O", fk(":set numbers<Enter><vis-open-line-above>"),
	"Begin a new line above the cursor")

	-- TODO -- not working
	--vis:map(vis.modes.NORMAL, "c", fk(":set numbers<Enter><vis-operator-change>"),
	--"Change operator")

	vis:map(vis.modes.NORMAL, "s", fk(":set numbers<Enter>cn"),
	"cn")

	vis:map(vis.modes.NORMAL, "S", fk(":set numbers<Enter>^c$"),
	"^c$")

	-- operator pending

	-- TODO -- not working
	--vis:map(vis.modes.OPERATOR_PENDING, "c", fk(":set numbers<Enter><vis-operator-change>"),
	--"Change operator")

	-- visual
	vis:map(vis.modes.VISUAL, "c", fk(":set numbers<Enter><vis-operator-change>"),
	"Change operator")

	vis:map(vis.modes.VISUAL, "s", fk(":set numbers<Enter>c"),
	"c")

	-- insert
	vis:map(vis.modes.INSERT, "<Escape>", fk("<vis-mode-normal>:set relativenumber<Enter>"),
	"Enter normal mode")
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win) -- luacheck: no unused args
	vis:command('set relativenumber')
end)

