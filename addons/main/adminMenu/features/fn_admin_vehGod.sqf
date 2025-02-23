/*
 * fn_admin_vehGod.sqf
 * Author: JJ
 *
 * Args:
 * 1: the index of the player(from allPlayers) who's vehicle you want to toggle god mode <INT>
 *
 * Return Value:
 * none
 *
 */

params["_selectedIndex"];
_player = allPlayers select _selectedIndex;
if (!(_player isKindOf "CAManBase")) exitWith {};
_vehicle = objectParent _player;
_hint = "";
if (_vehicle isEqualTo objNull) then {
	_hint = "%1<t color='#42ebf4'>%2</t><br />is not in a vehicle.";
} else {
	if (isDamageAllowed _vehicle) then {
		[_vehicle, false] remoteExec ["allowDamage", owner objectParent _player];
		_hint = "%1You made<br /><t color='#42ebf4'>%2's</t><br /> vehicle <t color='#42ebf4'>immortal</t>";
	} else {
		[_vehicle, true] remoteExec ["allowDamage", owner objectParent _player];
		_hint = "%1You made<br /><t color='#42ebf4'>%2's</t><br /> vehicle <t color='#42ebf4'>mortal</t>";
	};
};

if (remoteExecutedOwner isEqualTo 0) then {
	hintSilent parseText format [_hint, adminHeader, name _player];
	player setVariable ["hintimer", 3];
} else {
	hintTimer = 3;
	[parseText format [_hint, adminHeader, name _player]] remoteExec ["hintSilent"];
	remoteExecutedOwner publicVariableClient "hintTimer";
};
