// Edit these setting to your liking
// Add steamID64 IDs to JJAM_admins to give specifc users access to the admin menu
// Setting JJLoginAdmins to false won't give admin right to people who have logged in as an admin using the #login in-game command
// Setting JJPlayerMenu to false will disable to player menu
// Setting JJZeusMenu to false will disable to zeus menu, The Zeus menu is only accessibly if the player menu is enabled.
// Setting JJAdminMenu to false will disable the admin menu


//Private (Only the server will know these values)
JJAM_admins = [
	"_SP_PLAYER_",		 //SinglePlayer ID
	"76561198119540788", //JJ
	"76500000000000000"  //Example
	];
JJLoginAdmins = true;


//Public (All connected client will know these values)
JJPlayerMenu = true;
JJZeusMenu = true;
JJAdminMenu = true;




// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!

//Exit it mod is being ran by anything apart from a server (hosted or dedicated)
if (!isServer) exitWith {diag_log text "[JJAM] Executed by client. This addon is designed to be ran by the server!";};
diag_log text "[JJAM] Loading started!";

publicVariable "JJPlayerMenu";
publicVariable "JJZeusMenu";
publicVariable "JJAdminMenu";

//Code that will be ran by each client that connect to the server
JJAM_init = {
	if (isDedicated) exitWith {};
	//use spawn to pass code to scheduler (execution time is uncertan(allows sleeping))
	0 spawn {
		diag_log text "[JJAM] JJ's Admin Menu is enabled on this server!";
		diag_log text "[JJAM] Init started!";
		[player] remoteExec ["JJAM_fnc_isAdmin", 2];
		if ((roleDescription player) find "Engineer" >= 0) then {
			player setVariable ["ace_isEngineer", 1, true];
		};

		waituntil {!(IsNull (findDisplay 46))};

		player setVariable ["steamName", profileNameSteam, true];
		if (JJPlayerMenu) then {
			systemchat "JJ's Player Menu Enabled! Press F1 to open it!";
			[player] remoteExec ["JJAM_fnc_playerMenu", 2];
		} else {
			if (JJAdminMenu && JJAM_isAdmin) then {
				systemChat "JJ's Admin Menu Enabled! Press F1 to open it!";
				[player] remoteExec ["JJAM_fnc_adminMenu", 2];
			};
		};
		//start loops
		if (JJZeusMenu) then {
			0 spawn JJAM_fnc_loop_fps;
		};
		0 spawn JJAM_fnc_loop_rapid;
		diag_log text "JJAM: Init done!";
	};
};
publicVariable "JJAM_init";
remoteExec ["JJAM_init", -2, true];

waitUntil { time > 0 };
diag_log text "[JJAM] Loading done!";
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
