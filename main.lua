
require( "transition3" )

local size = 60

local myRectangle = display.newRect( size/2, size/2, size, size )

local myTransition = transition.to(
	myRectangle,
	{
		x = display.viewableContentWidth - size/2,
		y = display.viewableContentHeight - size/2,
		time = 3000,
		tag = 'myTag',
		onComplete = function() print("Complete") end,
		onStart = function() print("Start") end,
		onResume = function() print("Resume") end,
		onPause = function() print("Pause") end,
		onCancel = function() print("Cancel") end
	}
)


timer.performWithDelay( 1000, function()

	-- transition.restart( myTransition )
	-- transition.restart()
	-- transition.restart( myRectangle )
	transition.restart( 'myTag' )

end )

timer.performWithDelay( 2000, function()

	-- transition.complete( myTransition )
	-- transition.complete()
	transition.complete( myRectangle )
	-- transition.complete( 'myTag' )

end )

