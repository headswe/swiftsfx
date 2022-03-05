#include "\x\swift\addons\blood\script_component.hpp"
if (!GVAR(ENABLE)) exitWith {}; 
{
    _x params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfacetype", "_isDirect"];
    if (_isDirect == false) then {
        continue;
    };
    private _directionVector = (_position vectorFromTo (eyePos _shooter));
    private _endPos = (_position vectorAdd ((_directionVector vectorMultiply -1) vectorMultiply 4)) vectorAdd [
        0.15 - (random (0.15 * 2)),
        0.15 - (random (0.15 * 2)),
        0.15 - (random (0.15 * 2))
    ];
    private _intersects = lineIntersectsSurfaces [_position, _endPos, _target, _shooter, true, 1];
    if(count _intersects <= 0) then {
        continue;
    };
    playSound3D [selectRandom GVAR(hitsounds), _target, false, _position,5,1,20];
    private _intersect = _intersects # 0;
    _intersect params ["_intersectPos", "_surfaceNormal", "_intersectobject", "_parentobject"];
    
    private _splatter = createSimpleObject ["Usertexture1m_F", [0, 0, 0], true];
    
    // if the surface normal points away, flip it. This happens in weird places like the stratis pier
    if (_surfaceNormal vectorDotProduct (_endPos vectorDiff _position) > 0) then {
        _surfaceNormal = _surfaceNormal vectorMultiply -1;
    };
    
    // Check if its a valid surface: big enough, reasonably plane
    private _v1 = vectorNormalized (_surfaceNormal vectorMultiply -1);
    private _v2 = [];
    private _v3 = [];
    // if the surface is not horizontal (>20º), create vup _v2 pointing upward instead of away
    private _vectorDirandUp = [];
    private _randomizeAngle = random 1;
    if (abs (_v1 select 2) < 0.94) then {
        _v3 = _v1 vectorCrossProduct [0, 0, 1];
        _v2 = _v3 vectorCrossProduct _v1;
        _vectorDirandUp = [_v1, _v2];
    } else {
        _v2 = vectorNormalized (_v1 vectorCrossProduct (_endPos vectorDiff _position));
        _v3 = _v2 vectorCrossProduct _v1;
        _vectorDirandUp = [_v1, _v3]
    };
    _vectorDirandUp set [1, (_vectorDirandUp # 1) vectorAdd [random 1,0,0]];

    
    _splatter setObjectTexture [0, selectRandom GVAR(TEXTURES)];
    private _pos = _intersectPos vectorAdd (_surfaceNormal vectorMultiply 0.03);
    _splatter setPosASL _pos;
    _splatter setVectorDirAndUp _vectorDirandUp;
    GVAR(splatters) pushBack [_splatter, time];
    if(count GVAR(splatters) > GVAR(MAX)) then {
       (GVAR(splatters) deleteAt 0) params ['_splat'];
       deleteVehicle _splat;
    }
} forEach _this;