
require( "transition3" )

local rwh = 60

local r = display.newRect( rwh/2, rwh/2, rwh, rwh )

local t = transition.to( r, { x = display.viewableContentWidth - rwh/2, y = display.viewableContentHeight - rwh/2, time = 2000, tag = 'truc'
	,onComplete = function()
		print("Complete")
	end
	,onStart = function()
		print("Start")
	end
	,onResume = function()
		print("Resume")
	end
	,onPause = function()
		print("Pause")
	end
	,onCancel = function()
		print("Cancel")
	end
} )


timer.performWithDelay( 1000, function()
	-- transition.pause( t )
	-- transition.pause()
	-- transition.pause( r )
	-- transition.pause( 'truc' )

	-- print( "" )
	-- print( "" )
	-- print( "PAUSE" )
	-- print( "" )
	-- print( "" )

	-- t._transition = function()
	-- 	print("pssht")
	-- end

	-- transition.resume( t )

	transition.restart( t )

end )

timer.performWithDelay( 1600, function()
	-- transition.resume( t )
	-- transition.resume()

	-- transition.complete( t )
	-- transition.complete()
	-- transition.complete( r )
	-- transition.complete( 'truc' )

	-- transition.restart( t )

	transition.pause( t )

end )

