class CfgPatches
{
	class JJAM_Addon
	{
		author="JJ";
		requiredAddons[]={};
		requiredVersion=0.1;
		version=0.1;
		units[] = {};
		weapons[] = {};
	};
};
class CfgFunctions {
	class JJAM {
		class fnc {
			file = "main\fnc";
			class init {postInit = 1;};
			class isAdmin {};
			class playerMenu {};
			class zeusMenu {};
			class adminMenu {};
		};
	}; 
};
class cfgMods {
	author="JJ";
};
class cfgNotifications {
    class Custom {
        title = "%1";
        description = "%2";
        iconPicture="\A3\ui_f\data\map\markers\military\warning_ca.paa";
        duration = 10;
        priority = 9;
    };
};
