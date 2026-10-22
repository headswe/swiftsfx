#include "\x\swift\addons\interaction_sfx\script_component.hpp"
(_this # 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfacetype", "_isDirect"];
if (!_isDirect || {headgear _target == ""} || {_selection findIf {toLowerANSI _x == "head"} < 0}) exitWith {};
// headgear without HitpointsProtectionInfo (caps, hats) returns 0
private _helmProtection = getNumber (configFile >> "CfgWeapons" >> headgear _target >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor");
if (_helmProtection < 2) exitWith {};
[_target, selectRandom GVAR(helmet_hit), 90, 9, "Head"] remoteExec [QFUNC(playSound), [0, -2] select isDedicated];
