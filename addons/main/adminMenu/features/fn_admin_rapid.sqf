/*
 * fn_admin_invis.sqf
 * Author: JJ
 *
 * Args:
 * 1: the index of the player(from allPlayers) to toggle rapid fire <INT>
 *
 * Return Value:
 * none
 *
 */

params["_selectedIndex"];
_player = allPlayers select _selectedIndex;
if (!(_player isKindOf "CAManBase")) exitWith {};
hint = "";

if (isNil {_player getvariable "JJAM_var_rapid"} || (_player getvariable "JJAM_var_rapid") == false) then {
	_player setVariable ["JJAM_var_rapid", true, true];
	_hint = "%1You <t color='#1DA0FF'>enabled</t> Rapid fire for<br/><t color='#1DA0FF'>%2</t>";
	[parseText format ["%1An admin <t color='#1DA0FF'>enabled</t> Rapid fire for you.", playerHeader]] remoteExec ["hintSilent", _object];uiSleep 5;[""] remoteExec ["hintSilent", _object];
} else {
	_player setVariable ["JJAM_var_rapid", false, true];
	_hint = "%1You <t color='#1DA0FF'>disabled</t> Rapid fire for<br/><t color='#1DA0FF'>%2</t>";
	[parseText format ["%1An admin <t color='#1DA0FF'>enabled</t> Rapid fire for you.", playerHeader]] remoteExec ["hintSilent", _object];uiSleep 5;[""] remoteExec ["hintSilent", _object];
};

if (remoteExecutedOwner isEqualTo 0) then {
	hintSilent parseText format [_hint, adminHeader, name _player];
	player setVariable ["hintimer", 3];
} else {
	hintTimer = 3;
	[parseText format [_hint, adminHeader, name _player]] remoteExec ["hintSilent"];
	remoteExecutedOwner publicVariableClient "hintTimer";
};