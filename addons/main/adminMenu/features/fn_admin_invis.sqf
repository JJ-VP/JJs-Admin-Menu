/*
 * fn_admin_invis.sqf
 * Author: JJ
 *
 * Args:
 * 1: the index of the player(from allPlayers) to toggle invisibility <INT>
 *
 * Return Value:
 * none
 *
 */

params["_selectedIndex"];
_player = allPlayers select _selectedIndex;
if (!(_player isKindOf "CAManBase")) exitWith {};
_value = !isObjectHidden _player;
[_player, _value] remoteExec ["hideObjectGlobal", 2];
_hint = ["%1You made<br/><t color='#42ebf4'>%2</t><br />visible", "%1You made<br/><t color='#42ebf4'>%2</t><br />invisible"] select _value;
_player setVariable ["JJAM_var_invis", !_value, true];

if (remoteExecutedOwner isEqualTo 0) then {
	hintSilent parseText format [_hint, adminHeader, name _player];
	player setVariable ["hintimer", 3];
} else {
	hintTimer = 3;
	[parseText format [_hint, adminHeader, name _player]] remoteExec ["hintSilent"];
	remoteExecutedOwner publicVariableClient "hintTimer";
};
