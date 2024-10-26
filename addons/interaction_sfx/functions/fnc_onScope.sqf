#include "\x\swift\addons\interaction_sfx\script_component.hpp"
params ['_unit', '_view', '_prevView'];
if (currentWeapon _unit == '' || {!GVAR(IRONSIGHTS_ENABLE)} ||  {isNull cameraOn} || {is3DEN}) exitWith {};
private _playSound = true;
if (!isNull objectParent _unit) then {
    private _seats = (fullCrew objectParent _unit) select {(_x#0) == _unit};
    if(count _seats > 1) exitWith {_playSound = false;};
    private _personTurret = (_seats # 0) # 4;
    if(!_personTurret) exitWith {_playSound = false;};
};
if (!_playSound) exitWith {};

private _sound = '';
if (_view == 'GUNNER') then {
    _sound = selectRandom ["weapon_draw_01","weapon_draw_02","weapon_draw_03","ironsight_in_01","ironsight_in_02"];
} else {
    _sound = selectRandom ["ironsight_out_01","ironsight_out_02","weapon_holster_01","weapon_holster_02","weapon_holster_03"];
};
playSound [_sound, true];