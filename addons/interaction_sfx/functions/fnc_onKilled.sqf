#include "\x\swift\addons\interaction_sfx\script_component.hpp"
params ["_unit", "_killer", "_instigator", "_useEffects"];
if (!_useEffects || {isNull _unit}) exitWith {};
// check if unit is inside

private _vehicle = objectParent _unit;
private _randomFall = '';
private _deathSound = '';
private _hitHead = _unit getHit "head";
if (isNull _vehicle) then {
	_randomFall = selectRandom GVAR(fallsounds);
};

if(_hitHead >= 1) then {
	_deathSound = selectRandom GVAR(suffcationSounds);
} else {
	if(behaviour _unit == 'COMBAT') then {
		_deathSound = selectRandom GVAR(deathSounds);
	} else {
		_deathSound = selectRandom GVAR(stealthDeathSounds);
	};
};

if (_hitHead >= 1) then {
	[_unit, _deathSound, 90, 9, "Head"] remoteExec [QFUNC(playSound)];
} else {
	[_unit, _deathSound, 90] remoteExec [QFUNC(playSound)];
};

[
	{
		_this remoteExec [QFUNC(playSound)];
	},
	[_unit, _randomFall, 70],
	0.7
] call CBA_fnc_waitAndExecute;
