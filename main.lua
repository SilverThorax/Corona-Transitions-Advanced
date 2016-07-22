require('_dont_commit_utils')

require( "transition3" )

local r = display.newRect( 100, 100, 60, 60 )

local t = transition.to( r, { x = r.x + 200, y = r.y + 600, time = 2000, tag = 'truc', onComplete = function()
	print("finish")
end } )

timer.performWithDelay( 1000, function()
	-- transition.pause( t )
	-- transition.pause()
	-- transition.pause( r )
	transition.pause( 'truc' )
end )

timer.performWithDelay( 2000, function()
	-- transition.resume( t )
	-- transition.resume()

	-- transition.complete( t )
	-- transition.complete()
	-- transition.complete( r )
	transition.complete( 'truc' )

end )
