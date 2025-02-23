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
_isAdmin = _player call JJAM_fnc_isAdmin;

if (!JJZeusMenu) exitWith {false};
if (isNull getAssignedCuratorLogic _player && !_isAdmin) exitWith {false};

zeusMenuString= '

with uiNamespace do {
	zeusMenuDisplay = findDisplay 46 createDisplay "RscDisplayEmpty";
	ctrlBackground = zeusMenuDisplay ctrlCreate ["RscBackgroundGUI", 2200];
	ctrltxtName = zeusMenuDisplay ctrlCreate ["RscText", 1000];
	ctrlbtnClose = zeusMenuDisplay ctrlCreate ["RscButton", 1600];
	ctrlbtnHeal = zeusMenuDisplay ctrlCreate ["RscButton", 1601];
	ctrlbtnFPS = zeusMenuDisplay ctrlCreate ["RscButton", 1602];
	ctrlBackground ctrlSetPosition [0.224931, 0.34, 0.550138, 0.32];
	ctrlBackground ctrlCommit 0;
	ctrltxtName ctrlSetPosition [0.224931, 0.34, 0.525132, 0.04];
	ctrltxtName ctrlSetText "JJs Zeus Menu";
	ctrltxtName ctrlCommit 0;
	ctrlbtnClose ctrlSetPosition [0.750063, 0.34, 0.0250063, 0.04];
	ctrlbtnClose ctrlSetText "X";
	ctrlbtnClose ctrlSetTextColor [1, 0, 0, 1];
	ctrlbtnClose ctrlSetTooltip "Close the menu.";
	ctrlbtnClose ctrlAddEventHandler ["ButtonClick", {
		params ["_ctrl"];
		if (JJPlayerMenu) then {
			[] remoteExec ["JJAM_playerMenuCode", player];
		} else {
			_display = ctrlParent _ctrl;
			_display closeDisplay 1;
		};
	}];
	ctrlbtnClose ctrlCommit 0;
	ctrlbtnHeal ctrlSetPosition [0.249937, 0.42, 0.150038, 0.08];
	ctrlbtnHeal ctrlSetText "Heal all";
	ctrlbtnHeal ctrlSetTooltip "Arma Heal or Ace Heal all players.";
	ctrlbtnHeal ctrlAddEventHandler ["ButtonClick", {
		if (isClass (configFile >> "CfgPatches" >> "ace_medical")) then {
			{
				[player] remoteExecCall ["ace_medical_treatment_fnc_fullHealLocal", _x];
				[player, false] remoteExecCall ["ace_medical_fnc_setUnconscious", _x];
			} forEach allPlayers;
		} else {
			{
				[player setDamage 0] remoteExec ["call", _x];
			} forEach allPlayers;
		};
		hintSilent parseText format ["%1You healed all players", hintHeader];
		player setVariable ["hintTimer", 3];
	}];
	ctrlbtnHeal ctrlCommit 0;
	ctrlbtnFPS ctrlSetPosition [0.424982, 0.42, 0.150038, 0.08];
	ctrlbtnFPS ctrlsetText "Toggle FPS";
	ctrlbtnFPS ctrlSetTooltip "Overlays players FPS next to their charecter.";
	ctrlbtnFPS ctrlAddEventHandler ["ButtonClick", {
		if (isNil {player getVariable "fpsToggle"}) then {
			player setVariable ["fpsToggle", true];
		};

		if (player getVariable "fpsToggle") then {
			player setVariable ["fpsToggle", false];
			fpsHandler = addMissionEventHandler ["Draw3D", {
				{
					_distance = (ATLToASL (positionCameraToWorld [0,0,0])) distance _x;
					if (_distance < 800) then {
						_playerFPS = _x getVariable ["PlayerFPS", -1];
						if (_playerFPS == -1) then
						{
							drawIcon3D
							["", [1,0.65,0,1], ASLToAGL getPosASL _x, 1, 2, 0, "FPS Error", 2, 0.03, "PuristaMedium", "center"];
						} else {
							if (_playerFPS  <20) then 
							{
								drawIcon3D
								["", [1,0,0,1], ASLToAGL getPosASL _x, 1, 2, 0, format["%1 FPS: %2", name _x, str _playerFPS], 2, 0.05, "PuristaMedium", "center"];
							}
							else
							{
								drawIcon3D
								["", [0,1,0,0.8], ASLToAGL getPosASL _x, 1, 2, 0, format["%1 FPS: %2", name _x, str _playerFPS], 2, 0.03,"PuristaMedium", "center"];
							};
						};
					};
				} forEach allPlayers;
			}];
		} else {
			player setVariable ["fpsToggle", true];
			removeMissionEventHandler ["Draw3D", fpsHandler];
		};
		if (player getVariable "fpsToggle") then {
			player setVariable ["toggleText", "disabled"];
		} else {
			player setVariable ["toggleText", "enabled"];
		};
		hintSilent parseText format ["%1You <t color=""#42ebf4"">%2</t> player FPS", hintHeader, player getVariable "toggleText"];
		player setVariable ["hintTimer", 3];
	}];
	ctrlbtnFPS ctrlCommit 0;	
};

';

JJAM_zeusMenuCode = compile zeusMenuString;
owner _player publicVariableClient "JJAM_zeusMenuCode";
[] remoteExec ["JJAM_zeusMenuCode", _player];
true
