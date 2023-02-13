/*
 * fn_isAdmin.sqf
 * Author: JJ
 *
 * Args:
 * 1: the player you want to check if they are an admin <OBJECT>
 *
 * Return Value:
 * true if player is admin, false if player is not admin <BOOL>
 *
 */

params["_player"];

_uid = getPlayerUID _player;

if (_uid in JJAM_admins) exitWith {true};
if (isDedicated && JJLoginAdmins) then {
	if (admin owner _player == 2) exitWith {true};
};

false
