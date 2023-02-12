// Edit these setting to your liking
// Add Steam64 ID's to _JJAM_admins to give specifc users access to the admin menu
// Setting _JJLoginAdmins to false won't give admin right to people who have logged in as an admin using the #login in-game command
// Setting _JJAdminMenu to false will disable the admin menu
// Setting _JJPlayerMenu to false will disable to player menu

_toCompile = compileFinal "
	JJAM_admins = ['76561198119540788','76500000000000000'];
	JJLoginAdmins = true;
	JJPlayerMenu = true;
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
}];
true
