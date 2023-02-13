/*
 * fn_zeusMenu.sqf
 * Author: JJ
 *
 * Args:
 * 1: the player to open the zeus menu <OBJECT>
 *
 * Return Value:
 * 1: true if menu opened, false if menu not opened <BOOL>
 *
 */
params["_player"];

_zeusState = call BIS_fnc_admin;

if (_zeusState != 2) exitWith {false};
if (!JJZeusMenu) exitWith {false};

zeusMenuString= "

waitUntil{!isNull (findDisplay 46)};
systemchat 'JJ''s Admin Menu Loaded!';
disableSerialization;
private _zeusMenuDisplay = findDisplay 46 createDisplay ''RscDisplayEmpty'';
private _ctrlBackground = _zeusMenuDisplay ctrlCreate [''RscBackgroundGUI'', 2200];
private _ctrltxtName = _zeusMenuDisplay ctrlCreate [''RscText'', 1000];
private _ctrlbtnClose = _zeusMenuDisplay ctrlCreate [''RscButton'', 1600];
private _ctrlbtnHeal = _zeusMenuDisplay ctrlCreate [''RscButton'', 1601];
private _ctrlbtnFPS = _zeusMenuDisplay ctrlCreate [''RscButton'', 1602];
_ctrlBackground ctrlSetPosition [0.224931, 0.34, 0.550138, 0.32];
_ctrlBackground ctrlCommit 0;
_ctrltxtName ctrlSetPosition [0.224931, 0.34, 0.525132, 0.04];
_ctrltxtName ctrlSetText ''JJ''''s Zeus Menu'';
_ctrltxtName ctrlCommit 0;
_ctrlbtnClose ctrlSetPosition [0.750063, 0.34, 0.0250063, 0.04];
_ctrlbtnClose ctrlSetText ''X'';
_ctrlbtnClose ctrlSetTextColor [1, 0, 0, 1];
_ctrlbtnClose ctrlSetTooltip ''Close the menu.'';
_ctrlbtnClose ctrlAddEventHandler [''ButtonClick'', {
	params [''_ctrl''];
	_display = ctrlParent _ctrl;
	_display closeDisplay 1;
}];
_ctrlbtnClose ctrlCommit 0;
_ctrlbtnHeal ctrlSetPosition [0.249937, 0.42, 0.150038, 0.08];
_ctrlbtnHeal ctrlSetText ''Heal all'';
_ctrlbtnHeal ctrlSetTooltip ''Arma Heal or Ace Heal all players.'';
_ctrlbtnHeal ctrlAddEventHandler [''ButtonClick'', {
	if (isClass (configFile >> ''CfgPatches'' >> ''ace_medical'')) then {
		{
			[player] remoteExecCall [''ace_medical_treatment_fnc_fullHealLocal'', _x];
			[player, false] remoteExecCall [''ace_medical_fnc_setUnconscious'', _x];
		} forEach allPlayers;
	} else {
		{
			[player setDamage 0] remoteExec [''call'', _x];
		} forEach allPlayers;
	};
}];
_ctrlbtnHeal ctrlCommit 0;
_ctrlbtnFPS ctrlSetPosition [0.424982, 0.42, 0.150038, 0.08];
_ctrlbtnFPS setText ''Toggle FPS'';
_ctrlbtnFPS ctrlSetTooltip ''Overlays players FPS next to their charecter.'';
_ctrlbtnFPS ctrlAddEventHandler [''ButtonClick'', {
	if (isNil ''_fpsToggle'') then {
		_fpsToggle = true;
	};

	if (_fpsToggle) then {
		_fpsToggle = false;
		fpsHandler = addMissionEventHandler [''Draw3D'', {
			{
				_distance = (ATLToASL (positionCameraToWorld [0,0,0])) distance _x;
				if (_distance < 800) then {
					_playerFPS = _x getVariable [''PlayerFPS'', -1];
					if (_playerFPS == -1) then
					{
						drawIcon3D
						["", [1,0.65,0,1], ASLToAGL getPosASL _x, 1, 2, 0, ''FPS Error'', 2, 0.03, ''PuristaMedium'', ''center''];
					}
					else {
						if (_playerFPS  <20) then 
						{
							drawIcon3D
							["", [1,0,0,1], ASLToAGL getPosASL _x, 1, 2, 0, format[''%1 FPS: %2'', name _x, str _playerFPS], 2, 0.05, ''PuristaMedium'', ''center''];
						}
						else
						{
							drawIcon3D
							["", [0,1,0,0.8], ASLToAGL getPosASL _x, 1, 2, 0, format[''%1 FPS: %2'', name _x, str _playerFPS], 2, 0.03,''PuristaMedium'', ''center''];
						};
					}
				};
			} forEach allPlayers;
		}];
	} else {
		_fpsToggle = true;
		removeMissionEventHandler [''Draw3D'', fpsHandler];
	};
}];
_ctrlbtnFPS ctrlCommit 0;

";

JJAM_zeusMenuCode = compileFinal zeusMenuString;
owner _player publicVariableClient "JJAM_zeusMenuCode";
remoteExec ["JJAM_zeusMenuCode", _player];
true