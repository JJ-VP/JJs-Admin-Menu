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
