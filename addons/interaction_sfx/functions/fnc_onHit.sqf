#include "\x\swift\addons\interaction_sfx\script_component.hpp"
(_this # 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfacetype", "_isDirect"];
if ( _selection findIf {toLower _x == "head"} < 0 || {headgear _target == ""} ) exitWith {};
private _helmProtection = (configfile >> "CfgWeapons" >> headgear _target >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") call BIS_fnc_GetCfgData;
if (_helmProtection < 2) exitWith {};
[_target, selectRandom GVAR(helmet_hit), 90, 9, "Head"] remoteExec [QFUNC(playSound)];