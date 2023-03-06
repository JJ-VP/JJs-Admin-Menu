// Edit these setting to your liking
// Add Steam64 IDs to JJAM_admins to give specifc users access to the admin menu
// Add Steam64 IDs to JJAM_superAdmins to give specifc users access to the super admin menu
// Setting JJLoginAdmins to false won't give admin right to people who have logged in as an admin using the #login in-game command
// Setting JJPlayerMenu to false will disable to player menu
// Setting JJZeusMenu to false will disable to zeus menu, The Zeus menu is only accessibly if the player menu is enabled.
// Setting JJAdminMenu to false will disable the admin menu
// Setting JJSuperAdminMenu to false will disable the super admin menu

//Private
JJAM_admins = ["76561198119540788","76500000000000000"];
JJAM_superAdmins = ["76561198119540788"];
JJLoginAdmins = true;

//Public
JJPlayerMenu = true;
JJZeusMenu = true;
JJAdminMenu = true;
JJSuperAdminMenu = true;


// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!

JJAM_isAdmin = false;
JJAM_zeuslist = [];

diag_log text "JJAM: Server Init started";
publicVariable "JJPlayerMenu";
publicVariable "JJZeusMenu";
publicVariable "JJAdminMenu";
publicVariable "JJSuperAdminMenu";
publicVariable "JJAM_isAdmin";

hintHeader = "<t color='#41f48c' size='2' font='PuristaBold'>JJ's Player Menu</t><br />-------- -_- --------<br /><br />";
publicVariable hintHeader;

JJAM_init = {
	[] spawn {
		diag_log text "JJAM: JJ's Admin Menu is enabled on this server!";
		diag_log text "JJAM: Init started!";
		if ((roleDescription player) find "Engineer" >= 0) then {
			player setVariable ["ace_isEngineer", 1, true];
		};

		waituntil {!(IsNull (findDisplay 46))};

		_isAdmin = player getVariable "JJAM_isAdmin";
		player setVariable ["steamName", profileNameSteam, true];
		if (JJPlayerMenu) then {
			systemchat "JJ's Player Menu Enabled! Press F1 to open it!";
			[player] remoteExec ["JJAM_fnc_playerMenu", 2];
		} else {
			if (JJAdminMenu && _isAdmin) then {
				systemChat "JJ's Admin Menu Enabled! Press F1 to open it!";
				[player] remoteExec ["JJAM_fnc_adminMenu", 2];
			};
		};
		if (JJZeusMenu) then {
			while {true} do {
				player setVariable ["PlayerFPS", floor diag_fps, true];
				sleep 0.1;
			};
		};
		diag_log text "JJAM: Init done!";
	};
};
publicVariable "JJAM_init";
addMissionEventHandler ["PlayerConnected", {
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	if (_name == "__SERVER__") exitWith {};
	_player = _uid call BIS_fnc_getUnitByUID;
	remoteExec ["JJAM_init", _player];
	diag_log text format ["JJAM: Init player: %1", name _player]
}];

waitUntil { time > 0 };
while {true} do {
	JJAM_zeuslist = [];
	{
		JJAM_zeuslist pushBack getAssignedCuratorUnit _x;
		_x addCuratorEditableObjects [allUnits, true];
    	_x addCuratorEditableObjects [vehicles, true];
	} forEach allCurators;
	publicVariable "JJAM_zeuslist";
	uiSleep 30;
};
