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

private _fileName = "fn_init";
JJAM_logLevel = 2;
//Exit if mod is being ran by anything apart from a server (hosted or dedicated)
if (!isServer) exitWith {[1, "Executed by client. This addon is designed to be ran by a server!", _fileName] call JJAM_fnc_log;};
[2, "Loading started", _fileName] call JJAM_fnc_log;

publicVariable "JJPlayerMenu";
publicVariable "JJZeusMenu";
publicVariable "JJAdminMenu";

//Code that will be ran by each client that connect to the server
JJAM_init = {
	if (!hasInterface) exitWith {};
	//use spawn to pass code to scheduler (execution time is uncertan(allows sleeping))
	0 spawn {
		[2, "JJ's Admin Menu is enabled on this server!", "fn_init", [true, player]] remoteExec ["JJAM_fnc_log", 2];
		[2, "Init Started!", "fn_init", [true, player]] remoteExec ["JJAM_fnc_log", 2];
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
		[2, "Init Finished!", "fn_init", [true, player]] remoteExec ["JJAM_fnc_log", 2];
	};
};
publicVariable "JJAM_init";
remoteExec ["JJAM_init", -2, true];

waitUntil { time > 0 };
[2, "Loading Done!", _fileName] call JJAM_fnc_log;
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
