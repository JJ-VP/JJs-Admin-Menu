/*
 * fn_log.sqf
 * Author: JJ
 *
 * Args:
 * 1: type, what type of log is it? 1(Error)/2(Info)/3(Verbose) <NUMBER>
 * 2: text, contents of the log <STRING>
 * 3: file, where was the log called from <STRING>
 * 4: remote, should it also be logged on a remote machine <ARRAY> [<BOOL>,<OBJECT(local to remote machine eg player)> or <MachineNetworkID>]
 *
 * Return Value:
 * none
 *
 */
 params[
	["_type", 2, [0]],
	["_text", "No Message Specified", [""]],
	["_file", "No File Specified", [""]],
	["_remote", [false], [[]], 2]
];

if (_level > JJAM_logLevel) exitWith {};

private _isRemote = _remote select 0;
private _remoteMachine = [objNull,_remote select 1] select _remote;


private _logText = if (_type > 0 && _type < 4 && owner _remoteMachine > 0) then {
	"[JJAM] | " + ["Error", "Info", "Verbose"] select (_type - 1) + " | File=" + _file + " | " + _text;
} else {
	"[JJAM] | Error | File=fn_log | Log Invalid | Input=" + str _this;
};

if (_level == 1 && hasInterface && _isRemote == 0) then {
	[_remoteMachine, "player", _logText, false] remoteExec [JJAM_fnc_hint, 2];
	[1, _text, _file, [true, 2]] call JJAM_fnc_log;
};

[
	diag_log text _logText,
	_logText = _logText + " | Client: " + str name player + " [MNetID: " + str owner player + " ]";
	[text _logText] remoteExec ["diag_log", _remoteMachine]
] select _isRemote;
