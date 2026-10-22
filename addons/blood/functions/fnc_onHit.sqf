#include "\x\swift\addons\blood\script_component.hpp"
// shared splatters are filtered by each receiver's own ENABLE setting
if (!GVAR(SHARE) && {!GVAR(ENABLE)}) exitWith {};
// one HitPart call can hold several entries for the same bullet, only use the first direct one
private _index = _this findIf {_x # 10};
if (_index < 0) exitWith {};
(_this # _index) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfacetype", "_isDirect"];

playSound3D [selectRandom GVAR(hitsounds), _target, false, _position, 5, 1, 20];

private _directionVector = vectorNormalized _velocity;
if (_directionVector isEqualTo [0, 0, 0]) exitWith {};
private _endPos = (_position vectorAdd (_directionVector vectorMultiply 4)) vectorAdd [
    0.15 - (random (0.15 * 2)),
    0.15 - (random (0.15 * 2)),
    0.15 - (random (0.15 * 2))
];
private _intersects = lineIntersectsSurfaces [_position, _endPos, _target, _shooter, true, 1];
if (_intersects isEqualTo []) exitWith {};
(_intersects # 0) params ["_intersectPos", "_surfaceNormal", "_intersectobject", "_parentobject"];

// if the surface normal points away, flip it. This happens in weird places like the stratis pier
if (_surfaceNormal vectorDotProduct (_endPos vectorDiff _position) > 0) then {
    _surfaceNormal = _surfaceNormal vectorMultiply -1;
};

private _v1 = vectorNormalized (_surfaceNormal vectorMultiply -1);
// on walls (>20º from horizontal) point vup upward, on floors along the bullet direction
private _ref = [_endPos vectorDiff _position, [0, 0, 1]] select (abs (_v1 # 2) < 0.94);
private _side = _v1 vectorCrossProduct _ref;
// bullet travelling straight into the floor, any reference will do
if (vectorMagnitude _side < 0.01) then {
    _side = _v1 vectorCrossProduct [0, 1, 0];
};
_side = vectorNormalized _side;
private _up = _side vectorCrossProduct _v1;
// rotate vup around the surface normal for some variation
private _angle = random 45;
_up = (_up vectorMultiply cos _angle) vectorAdd (_side vectorMultiply sin _angle);

private _args = [
    _intersectPos vectorAdd (_surfaceNormal vectorMultiply 0.03),
    _v1,
    _up,
    floor random count GVAR(textures)
];
// HitPart only fires on the shooter's machine, share the splatter so everyone sees it
if (GVAR(SHARE)) then {
    [QGVAR(createSplatter), _args] call CBA_fnc_globalEvent;
} else {
    _args call FUNC(createSplatter);
};
