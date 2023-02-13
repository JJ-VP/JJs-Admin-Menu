// Edit these setting to your liking
// Add Steam64 IDs to JJAM_admins to give specifc users access to the admin menu
// Setting JJLoginAdmins to false won't give admin right to people who have logged in as an admin using the #login in-game command
// Setting JJPlayerMenu to false will disable to player menu
// Setting JJZeusMenu to false will disable to zeus menu, The Zeus menu is only accessibly if the player menu is enabled.
// Setting JJAdminMenu to false will disable the admin menu

_toCompile = compileFinal "
	JJAM_admins = ['76561198119540788','76500000000000000'];
	JJLoginAdmins = true;
	JJPlayerMenu = true;
	JJZeusMenu = true;
	JJAdminMenu = true;
	";


// Don't touch anything below here!
// Don't touch anything below here!
// Don't touch anything below here!


call _toCompile;
addMissionEventHandler ["PlayerConnected", {
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	if (_name == "__SERVER__") exitWith {};
	_player = _uid call BIS_fnc_getUnitByUID;
	if (JJPlayerMenu) then {_player call JJAM_fnc_playerMenu;} else {
		if (JJAdminMenu) then {["JJ's Admin Menu Enabled! Press F1 to open it!"] remoteExec ["systemChat", _player];_player call JJAM_fnc_adminMenu}
	};
	if (JJZeusMenu) then {
		[
			[] spawn {
				while {true} do {
						player setVariable ["PlayerFPS", floor diag_fps, true];
						sleep 0.1;
					};
				}
		] remoteExec ["Call", _player];
	};
}];
true
