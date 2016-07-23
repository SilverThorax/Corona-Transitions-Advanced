transition.version = 3

transition.to2 = transition.to

transition.to = function ( ... )
	local _onStartCopy = nil
	if arg.n > 1 and arg[2].onStart then
		_onStartCopy = arg[2].onStart
	end
	local t = transition.to2( unpack( arg ) )
	if _onStartCopy then
		t._onStartCopy = _onStartCopy
	end
	return t
end

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
			-- set final values
			for k,v in pairs( t._keysFinish ) do
				t._target[k] = v
			end
			-- extract complete callback before cancel
			local callback = t._onComplete
			-- cancel
			if t._onCancel then t._onCancel = nil end
			transition.cancel( t )
			-- call complete callback
			if callback then pcall( callback ) end
		end
	end
end

function transition.rewind( ... )
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
			-- set initial values
			for k,v in pairs( t._keysStart ) do
				t._target[k] = v
			end
			-- reset timer
			t._timeStart = system.getTimer()
			-- start callback
			local callback = t._onStartCopy
			if callback then pcall( callback ) end
		end
	end
end