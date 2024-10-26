#include "script_component.hpp"

class cfgPatches
{
    class ADDON
    {
        name = "SwiftSFX: Blood";
        author = "Head";
        url = "http://www.teamonetactical.com";
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"swift_main"};
        VERSION_CONFIG;
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
class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE( call COMPILE_FILE(XEH_postInit) );
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE( call COMPILE_FILE(XEH_preInit) );
    };
};
class Extended_PreStart_EventHandlers {                 
    class ADDON {                                       
        init = QUOTE( call COMPILE_FILE(XEH_preStart) );
    };                                                  
}