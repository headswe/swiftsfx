#include "\x\swift\addons\blood\script_component.hpp"
// splatters are pushed in time order, so drop expired ones from the front
while {GVAR(splatters) isNotEqualTo [] && {(time - ((GVAR(splatters) # 0) # 1)) > GVAR(DECAY_TIME)}} do {
	deleteVehicle ((GVAR(splatters) deleteAt 0) # 0);
};
