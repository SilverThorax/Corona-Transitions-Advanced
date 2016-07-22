local M = {}

M._transitions = {}

M._non_tween_keys = { 'time', 'iterations', 'tag', 'transition', 'delay', 'delta', 'onStart', 'onComplete', 'onPause', 'onResume', 'onCancel', 'onRepeat' }

-------------------------------------------------------------------------------
-- The functions below have not been extended yet.

function M.cancel ( ... ) return transition.cancel( unpack( arg ) ) end
function M.from ( ... ) return transition.from( unpack( arg ) ) end
function M.pause ( ... ) return transition.pause( unpack( arg ) ) end
function M.resume ( ... ) return transition.resume( unpack( arg ) ) end
function M.blink ( ... ) return transition.blink( unpack( arg ) ) end
function M.dissolve ( ... ) return transition.dissolve( unpack( arg ) ) end
function M.fadeIn ( ... ) return transition.fadeIn( unpack( arg ) ) end
function M.fadeOut ( ... ) return transition.fadeOut( unpack( arg ) ) end
function M.moveBy ( ... ) return transition.moveBy( unpack( arg ) ) end
function M.moveTo ( ... ) return transition.moveTo( unpack( arg ) ) end
function M.scaleBy ( ... ) return transition.scaleBy( unpack( arg ) ) end
function M.scaleTo ( ... ) return transition.scaleTo( unpack( arg ) ) end

-------------------------------------------------------------------------------
-- Only the functions below have been extended.

function M.to ( ... )
	local id = transition.to( unpack( arg ) )
	if arg.n > 1 then
		local target = arg[1]
		local params = arg[2]
		M._transitions[id] = { initialValues = {}, finalValues = {}, target = target }
		for i,key in ipairs( M._non_tween_keys ) do if params[key] then params[key] = nil end end
		for key,finalValue in pairs( params ) do
			M._transitions[id].initialValues[key] = target[key]
			M._transitions[id].finalValues[key] = finalValue
		end
	end
	return id
end

-------------------------------------------------------------------------------
-- The functions below don't exist (yet? :P) in the original library.

function M.complete( ... )
	if arg.n == 1 then
	    print( type(arg[1]) )
	end
end

return M