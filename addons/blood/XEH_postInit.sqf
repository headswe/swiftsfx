#include "script_component.hpp"
[QGVAR(createSplatter), FUNC(createSplatter)] call CBA_fnc_addEventHandler;
GVAR(cleanup_handler) = [FUNC(cleanup), 60] call CBA_fnc_addPerFrameHandler;
