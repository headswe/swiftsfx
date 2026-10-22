#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = "SwiftSFX";
        author = "Head";
        url = "http://www.teamonetactical.com";
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        /* Require CBA and all components below */
        requiredAddons[] = {"cba_main"};
        VERSION_CONFIG;
    };
};

class CfgMods {
    class PREFIX {
        action = "http://www.teamonetactical.com";
        dir = "";
        hideName = 0;
        hidePicture = 0;
        logo = "x\swift\addons\main\logo_tmf_ca.paa";
        logoOver = "x\swift\addons\main\logo_tmf_ca.paa";
        logoSmall = "x\swift\addons\main\logo_tmf_ca.paa";
        name = "SwiftSFX";
        overview = "SwiftSFX";
        picture = "x\swift\addons\main\logo_tmf_ca.paa";
        tooltip = "SwiftSFX";
    };
};
