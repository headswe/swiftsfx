#include "script_component.hpp"
#include "XEH_PREP.sqf"

GVAR(ENABLE) = true;
GVAR(IRONSIGHTS_ENABLE) = true;
GVAR(fallsounds) = ["body_fall_01_wave","body_fall_02_wave","body_fall_03_wave","body_fall_04_wave","body_impact_01","body_impact_02","body_impact_03","body_impact_04"];
GVAR(suffcationSounds) = ["dob_scream_1","dob_scream_2","dob_scream_3","dob_scream_4","dob_scream_5","dob_scream_6","dob_scream_7","dob_scream_8","dob_scream_9","dob_scream_10","dob_scream_11","stealh_scream4","stealh_scream5","suffocation_4","suffocation_5","suffocation_6","suffocation_7","suffocation_8","suffocation_9"];
GVAR(deathSounds) = ["death_1","death_2","death_3","death_4","death_5","death_6","death_7","death_8","death_9","death_10","death_11","death_12","death_13","death_14","death_15","death_16","death_17","death_18","death_19","death_20","death_21","death_22","death_23","death_24","death_25"];
GVAR(stealthDeathSounds) = ["stealh_scream1","stealh_scream2","stealh_scream3","stealh_scream4","stealh_scream5","stealh_scream6","stealh_scream7","stealh_scream8","stealh_scream9","death_20"];
GVAR(deathSounds_inside) = ["death_Inside_building_1","death_Inside_building_2","death_Inside_building_3","death_Inside_building_4","death_Inside_building_5","death_Inside_building_6","death_Inside_building_7","death_Inside_building_8","death_Inside_building_9","death_Inside_building_10","death_Inside_building_11","death_Inside_building_12"];
GVAR(helmet_hit) = ["bullet_impact_helmet_01_wave","bullet_impact_helmet_02_wave","bullet_impact_helmet_03_wave"];



["cameraView", FUNC(onScope)] call CBA_fnc_addPlayerEventHandler;

[QGVAR(ENABLE), "CHECKBOX", ["Enable death sounds", ""], ["SwiftSFX", "Sounds"], true] call CBA_fnc_addSetting;
[QGVAR(IRONSIGHTS_ENABLE), "CHECKBOX", ["Enable ironsight sounds", ""], ["SwiftSFX", "Sounds"], true] call CBA_fnc_addSetting;