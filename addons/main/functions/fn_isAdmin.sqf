/*
 * fn_isAdmin.sqf
 * Author: JJ
 *
 * Args:
 * 1: the player you want to check if they are an admin <OBJECT>
 *
 * Return Value:
 * true if player is admin, false is player is not admin <BOOL>
 *
 */

params["_player"];

_uid = getPlayerUID _player;
JJAM_isAdmin = false;


if (_uid in JJAM_admins) then {
	JJAM_isAdmin = true;
};
if (isDedicated && JJLoginAdmins) then {
	if (admin owner _player == 2) then {
		JJAM_isAdmin = true;
	};
};

owner _player publicVariableClient "JJAM_isAdmin";
JJAM_isAdmin
