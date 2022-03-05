#include "script_component.hpp"
GVAR(cleanup_handler) = [FUNC(cleanup), 60] call CBA_fnc_addPerFrameHandler;