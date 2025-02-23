/*
 * fn_admin_god.sqf
 * Author: JJ
 *
 * Args:
 * 1: the index of the player(from allPlayers) to toggle god mode <INT>
 *
 * Return Value:
 * none
 *
 */

params["_selectedIndex"];
_player = allPlayers select _selectedIndex;
if (!(_player isKindOf "CAManBase")) exitWith {};
_value = !isDamageAllowed _player;
[_player, _value] remoteExec ["allowDamage", _player];
_hint = [format ["You made<br/><t color='#42ebf4'>%1</t><br />immortal", name _player], format ["You made<br/><t color='#42ebf4'>%1</t><br />mortal", name _player]] select _value;
_player setVariable ["JJAM_var_god", !_value, true];

[
	[player, "admin", _hint, true] remoteExec ["JJAM_fnc_hint", 2],
	[remoteExecutedOwner, "admin", _hint, true] remoteExec ["JJAM_fnc_hint", 2]
] select remoteExecutedOwner isEqualTo 0;