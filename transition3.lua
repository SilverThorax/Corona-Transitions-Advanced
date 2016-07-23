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
			-- prevent pause callback from being called
			if t._onPause then t._onPause = nil end
			transition.pause( t )
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

function transition.restart( ... )
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
			-- save pause callback but prevent it from being called
			local _pauseCallback = nil
			if t._onPause then
				_pauseCallback = t._onPause
				t._onPause = nil
			end
			transition.pause( t )
			if _pauseCallback then
				t._onPause = _pauseCallback
			end
			-- set initial values
			for k,v in pairs( t._keysStart ) do
				t._target[k] = v
			end
			-- reset timer
			t._timeStart = system.getTimer()
			-- save pause callback but prevent it from being called
			local _resumeCallback = nil
			if t._onResume then
				_resumeCallback = t._onResume
				t._onResume = nil
			end
			transition.resume( t )
			if _resumeCallback then
				t._onResume = _resumeCallback
			end
			-- start callback
			local callback = t._onStart
			if callback then pcall( callback ) end
		end
	end
end