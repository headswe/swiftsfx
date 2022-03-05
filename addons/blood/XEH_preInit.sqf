#include "script_component.hpp"
#include "XEH_PREP.sqf"

GVAR(splatters) = [];
GVAR(textures) = [
	"\x\swift\addons\blood\data\textures\blood\1.paa",
	"\x\swift\addons\blood\data\textures\blood\10.paa",
	"\x\swift\addons\blood\data\textures\blood\11.paa",
	"\x\swift\addons\blood\data\textures\blood\12.paa",
	"\x\swift\addons\blood\data\textures\blood\13.paa",
	"\x\swift\addons\blood\data\textures\blood\14.paa",
	"\x\swift\addons\blood\data\textures\blood\15.paa",
	"\x\swift\addons\blood\data\textures\blood\16.paa",
	"\x\swift\addons\blood\data\textures\blood\2.paa",
	"\x\swift\addons\blood\data\textures\blood\3.paa",
	"\x\swift\addons\blood\data\textures\blood\4.paa",
	"\x\swift\addons\blood\data\textures\blood\5.paa",
	"\x\swift\addons\blood\data\textures\blood\6.paa",
	"\x\swift\addons\blood\data\textures\blood\7.paa",
	"\x\swift\addons\blood\data\textures\blood\8.paa",
	"\x\swift\addons\blood\data\textures\blood\9.paa"
];
GVAR(hitsounds) = [
	"x\swift\addons\blood\data\sounds\hitsounds\body\6.wav",
	"x\swift\addons\blood\data\sounds\hitsounds\body\7.wav",
	"x\swift\addons\blood\data\sounds\hitsounds\body\1.wav",
	"x\swift\addons\blood\data\sounds\hitsounds\body\8.wav",
	"x\swift\addons\blood\data\sounds\hitsounds\body\9.wav",
	"x\swift\addons\blood\data\sounds\hitsounds\body\10.wav"
];

[QGVAR(ENABLE), "CHECKBOX", ["Enable bloodsplatters", ""], ["SwiftSFX", "Blood"], true] call CBA_fnc_addSetting;
[QGVAR(MAX), "SLIDER",   ["Max number of bloodsplatters",   ""], ["SwiftSFX", "Blood"], [100, 500, 500, 0]] call CBA_fnc_addSetting;
[QGVAR(DECAY_TIME), "TIME",   ["Bloodsplatter lifetime",   ""], ["SwiftSFX", "Blood"], [60, 3600, 3600]] call CBA_fnc_addSetting;
