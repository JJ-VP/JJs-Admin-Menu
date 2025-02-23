/*
 * fn_isZeus.sqf
 * Author: JJ
 *
 * Args:
 * 1: the player you want to check if they are assigned a curator logic <OBJECT>
 *
 * Return Value:
 * true if player is zeus, false is player is not zeus <BOOL>
 *
 */

params["_player"];

JJAM_isZeus = false;

if (!(isNull getAssignedCuratorLogic _player) || JJAM_isAdmin) then {
	JJAM_isZeus = true;
};

owner _player publicVariableClient "JJAM_isZeus";
JJAM_isZeus
