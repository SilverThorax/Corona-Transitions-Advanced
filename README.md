# Corona Transitions Advanced

An extension of the basic Corona transition library.

Overview
--------

Adds a .complete() and a .restart() method to the transition library.


```lua

require( "transition3" )

local myRectangle = display.newRect( 100, 100, 50, 50 )

local myTransition = transition.to(
	myRectangle,
	{ x = 300, y = 700, time = 5000, onComplete = function() myRectangle:setFillColor( 1,0,0 ) end }
)

timer.performWithDelay( 2000, function()
	transition.complete( myTransition )
end )

```

For a more detailed example, cf. main.lua


transition.complete()
---------------------

The transition.complete() function completes one of the following, depending on the passed parameter:
- All transitions in progress, when called with no parameters.
- A specific transition, when called with a transition reference.
- All transitions on a specific display object, when called with a display object reference.
- All transitions with a specific tag, when called with a string parameter representing a tag.

The final values are set and if defined, the onComplete callback is called.

Then the transition is terminated.

Syntax

```lua

transition.complete()
transition.complete( transitionReference )
transition.complete( displayObject )
transition.complete( tagName )
```


transition.restart()
---------------------

The transition.restart() function restarts one of the following, depending on the passed parameter:
- All transitions in progress, when called with no parameters.
- A specific transition, when called with a transition reference.
- All transitions on a specific display object, when called with a display object reference.
- All transitions with a specific tag, when called with a string parameter representing a tag.

The initial values are set and if defined, the onStart callback is called.

Then the transition runs normally.

Syntax

```lua

transition.restart()
transition.restart( transitionReference )
transition.restart( displayObject )
transition.restart( tagName )
```


License
-------


Corona Transitions Advanced is a Corona SDK library hack meant to provide advanced features to developers in a transparent way (by invisibly wrapping code over the original 'transition' library instead of providing a new one).
Copyright (C) 2016  David Roulin.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

For the complete terms of the GNU General Public License, please see this URL:
http://www.gnu.org/licenses/gpl-2.0.html
