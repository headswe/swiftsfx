#include "script_component.hpp"

class cfgPatches
{
    class ADDON
    {
        name = "SwiftSFX: Sounds";
        author = "Head";
        url = "http://www.teamonetactical.com";
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"swift_main"};
        VERSION_CONFIG;
    };
};
class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE( call COMPILE_FILE(XEH_preInit) );
    };
};
class Extended_Killed_Eventhandlers
{
    class CAManBase
    {
        class GVAR(KILLED)
        {
            killed = QUOTE(_this call FUNC(onKilled));         
        };
    };
};
class Extended_HitPart_EventHandlers
{
	class CAManBase
	{
		class GVAR(HitPart)
		{
            hitPart = QUOTE(_this call FUNC(onHit));
		};
	};
};

class CfgSounds {
#include "sounds_deathscreams.hpp"
#include "sounds_ironsights.hpp"
}