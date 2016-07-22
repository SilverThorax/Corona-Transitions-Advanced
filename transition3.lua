transition.version = 3

function transition.complete( ... )
	local ts = {}
	-- gathering
	if arg.n == 1 then
		if type(arg[1]) == 'table' then
			if arg[1]._transition then
				-- transition reference
				ts[1] = arg[1]
			elseif arg[1]._class.addEventListener then
				-- display object
				for i,t in ipairs(transition._transitionTable) do
					if t._target == arg[1] then
						ts[#ts+1] = t
					end
				end
			end
		elseif type(arg[1]) == 'string' then
			-- tag
			for i,t in ipairs(transition._transitionTable) do
				if t.tag == arg[1] then
					ts[#ts+1] = t
				end
			end
		end
	elseif arg.n == 0 then
		-- all
		for i,t in ipairs(transition._transitionTable) do
			ts[#ts+1] = t
		end
	end
	-- processing
	if #ts > 0 then
		for i,t in ipairs(ts) do
			if t._onPause then t._onPause = nil end
			transition.pause( t )
			for k,v in pairs( t._keysFinish ) do
				t._target[k] = v
			end
			local callback = t._onComplete
			if t._onCancel then t._onCancel = nil end
			transition.cancel( t )
			if callback then pcall( callback ) end
		end
	end
end

function transition.restart( ... )
	if arg.n == 1 then
		if type(arg[1]) == 'table' then
			if arg[1]._transition then
				-- transition reference
			elseif arg[1]._class.addEventListener then
				-- display object
			end
		elseif type(arg[1]) == 'string' then
			-- tag
		end
	elseif arg.n == 0 then
		-- all
	end
end