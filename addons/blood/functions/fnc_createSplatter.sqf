#include "\x\swift\addons\blood\script_component.hpp"
params ["_posASL", "_vectorDir", "_vectorUp", "_textureIndex"];
if (!hasInterface || {!GVAR(ENABLE)}) exitWith {};

private _splatter = createSimpleObject ["Usertexture1m_F", [0, 0, 0], true];
_splatter setObjectTexture [0, GVAR(textures) # _textureIndex];
_splatter setPosASL _posASL;
_splatter setVectorDirAndUp [_vectorDir, _vectorUp];
GVAR(splatters) pushBack [_splatter, time];
if (count GVAR(splatters) > GVAR(MAX)) then {
    deleteVehicle ((GVAR(splatters) deleteAt 0) # 0);
};
