local M = {}

function M.cancel ( ... ) return transition.cancel( unpack( arg ) ) end
function M.from ( ... ) return transition.from( unpack( arg ) ) end
function M.pause ( ... ) return transition.pause( unpack( arg ) ) end
function M.resume ( ... ) return transition.resume( unpack( arg ) ) end
function M.to ( ... ) return transition.to( unpack( arg ) ) end
function M.blink ( ... ) return transition.blink( unpack( arg ) ) end
function M.dissolve ( ... ) return transition.dissolve( unpack( arg ) ) end
function M.fadeIn ( ... ) return transition.fadeIn( unpack( arg ) ) end
function M.fadeOut ( ... ) return transition.fadeOut( unpack( arg ) ) end
function M.moveBy ( ... ) return transition.moveBy( unpack( arg ) ) end
function M.moveTo ( ... ) return transition.moveTo( unpack( arg ) ) end
function M.scaleBy ( ... ) return transition.scaleBy( unpack( arg ) ) end
function M.scaleTo ( ... ) return transition.scaleTo( unpack( arg ) ) end

return M