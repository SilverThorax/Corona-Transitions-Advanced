local transition2 = require( "transition2" )

local r = display.newRect( 100, 100, 60, 60 )
local t = transition2.to( r, { x = r.x + 200, y = r.y + 600, time = 3000 } )
timer.performWithDelay( 1000, function() transition2.cancel( t ) end )

