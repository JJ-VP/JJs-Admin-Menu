/*
 * fn_hint.sqf
 * Author: JJ
 *
 * Args:
 * 1: player, who to show the hint to <OBJECT(UNIT)>
 * 2: type, should be player/admin/zeus <STRING>
 * 3: text, what to display in the hint <STRING>
 * 4: silent, should the hint be silent? <BOOL>
 *
 * Return Value:
 * none
 *
 */
params[
	["_player", ""],
	["_type", "player", [""]],
	["_text", "missing text", [""]],
	["_silent", true, [false]]
];

private _playerHeader = "<t color='#1DA0FF' size='2' shadow='1' shadowColor='#1A1F33' font='PuristaBold'>JJ's Player Menu</t>";
private _adminHeader = "<t color='#1DA0FF' size='2' shadow='1' shadowColor='#1A1F33' font='PuristaBold'>JJ's Admin Menu</t>";
private _zeusHeader = "<t color='#1DA0FF' size='2' shadow='1' shadowColor='#1A1F33' font='PuristaBold'>JJ's Zeus Menu</t>";
private _antistasi = isClass (configFile >> "A3A");
private _fulltype = "";
call compile format ["_fullType = _%1Header", _type];

[
	[_fullType, _text, _silent] remoteExec ["A3A_fnc_customHint", _player],
	[
		[format ["%1%2", _fullType, _text]] remoteExec ["hint", _player],
		[format ["%1%2", _fullType, _text]] remoteExec ["hintSilent", _player]
	] select _silent;
] select _antistasi; // The holy 1 liner
