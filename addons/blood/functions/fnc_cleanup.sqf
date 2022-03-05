#include "\x\swift\addons\blood\script_component.hpp"
for "_i" from 0 to (count GVAR(splatters)) do {
	(GVAR(splatters) # _i) params ['_splat', '_time'];
	if ((time - _time) > GVAR(DECAY)) then {
		deleteVehicle _splat;
	};
}
