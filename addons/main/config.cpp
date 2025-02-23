class CfgPatches
{
	class JJAM_Addon
	{
		author="JJ";
		requiredAddons[]={};
		requiredVersion=0.1;
		version=1.0;
		units[] = {};
		weapons[] = {};
	};
};
class CfgFunctions {
	class JJAM {
		class fnc {
			file = "main\functions";
			class hint {};
			class init {postInit = 1;};
			class isAdmin {};
			class isZeus {};
			class log {};
		};
		class admin {
			file = "main\adminMenu";
			class adminMenu {};
			class adminMenuGUI {};
		};
		class fetures {
			file = "main\adminMenu\features";
			class admin_ammo {};
			class admin_god {};
			class admin_invis {};
			class admin_rapid {};
			class admin_vehGod {};
		};
		class zeus {
			file = "main\zeusMenu";
			class zeusMenu {};
		};
		class player {
			file = "main\playerMenu";
			class playerMenu {};
		};
		class notification {
			file = "main\notificationMenu";
			class notificationMenu {};
		};
		class group {
			file = "main\groupMenu";
			class groupMenu {};
		};
		class loops {
			file = "main\loops";
			class loop_fps {};
			class loop_rapid {};
		};
	}; 
};
class cfgMods {
	author="JJ";
};
