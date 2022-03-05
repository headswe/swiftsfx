#include "\x\swift\addons\interaction_sfx\script_component.hpp"
params ['_object', '_soundName', ['_distance', 30], ['_duration', 9], ['_attachPoint', '']];
if (!GVAR(ENABLE)) exitWith {}; 
private _deathsound = "Land_HelipadEmpty_F" createVehicleLocal [0,0,0];
if(_attachPoint != '') then {
    _deathsound attachTo [_object, [0, 0, 0], _attachPoint]; 
} else {
    _deathsound attachTo [_object, [0, 0, 0.5]]; 
};
_deathsound say3D [_soundName, _distance];
[
    {
        deleteVehicle _this;
    },
    _deathsound,
    _duration
] call CBA_fnc_waitAndExecute;