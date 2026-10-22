#include "\x\swift\addons\interaction_sfx\script_component.hpp"
params ["_unit", "_killer", "_instigator", "_useEffects"];
if (!_useEffects || {isNull _unit}) exitWith {};

private _vehicle = objectParent _unit;
private _deathSound = '';
private _hitHead = _unit getHit "head";

// check if unit is inside: a building roof above its head
private _inside = false;
if (GVAR(INSIDE_ENABLE) && {isNull _vehicle}) then {
	private _eyePos = eyePos _unit;
	private _roof = lineIntersectsSurfaces [_eyePos, _eyePos vectorAdd [0, 0, 15], _unit, objNull, true, 1, "GEOM", "NONE"];
	if (_roof isNotEqualTo []) then {
		(_roof # 0) params ["", "", "_intersectObject", "_parentObject"];
		private _building = [_parentObject, _intersectObject] select (isNull _parentObject);
		_inside = _building isKindOf "Building";
	};
};

if(_hitHead >= 1) then {
	_deathSound = selectRandom GVAR(suffcationSounds);
} else {
	if (_inside) exitWith {
		_deathSound = selectRandom GVAR(deathSounds_inside);
	};
	if(behaviour _unit == 'COMBAT') then {
		_deathSound = selectRandom GVAR(deathSounds);
	} else {
		_deathSound = selectRandom GVAR(stealthDeathSounds);
	};
};

private _targets = [0, -2] select isDedicated;
if (_hitHead >= 1) then {
	[_unit, _deathSound, 90, 9, "Head"] remoteExec [QFUNC(playSound), _targets];
} else {
	[_unit, _deathSound, 90] remoteExec [QFUNC(playSound), _targets];
};
if (isNull _vehicle) then {
	private _randomFall = selectRandom GVAR(fallsounds);
	[
		{
			if (isNull (_this # 0)) exitWith {};
			_this remoteExec [QFUNC(playSound), [0, -2] select isDedicated];
		},
		[_unit, _randomFall, 70],
		0.7
	] call CBA_fnc_waitAndExecute;
};

