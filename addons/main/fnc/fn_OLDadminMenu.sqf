/*
 * fn_adminMenu.sqf
 * Author: JJ
 *
 * Args:
 * 1: the player to open the admin menu <OBJECT>
 *
 * Return Value:
 * 1: true if menu opened, false if menu not opened <BOOL>
 *
 */
params["_player"];

_isAdmin = _player call JJAM_fnc_isAdmin;

if (!_isAdmin) exitWith {false};
if (!JJAdminMenu) exitWith {false};

adminMenuString = '

createAdminMenu = {
	with uiNamespace do {
		JJPlayerMenu = missionNamespace getVariable "JJPlayerMenu";
		adminMenuDisplay = findDisplay 46 createDisplay "RscDisplayEmpty";
		ctrlBackground = adminMenuDisplay ctrlCreate ["RscBackgroundGUI", 2200];
		ctrltxtName = adminMenuDisplay ctrlCreate ["RscText", 1000];
		ctrlbtnClose = adminMenuDisplay ctrlCreate ["RscButton", 1600];
		ctrlbtnHealAll = adminMenuDisplay ctrlCreate ["RscButton", 1601];
		ctrlbtnNotification = adminMenuDisplay ctrlCreate ["RscButton", 1602];
		ctrlbtnGroups = adminMenuDisplay ctrlCreate ["RscButton", 1603];
		ctrlbtnFullAdmin = adminMenuDisplay ctrlCreate ["RscButton", 1604];
		ctrlBackground ctrlSetPosition [0.224931, 0.34, 0.550138, 0.32];
		ctrlBackground ctrlCommit 0;
		ctrltxtName ctrlSetPosition [0.224931, 0.34, 0.525132, 0.04];
		ctrltxtName ctrlSetText "JJs Admin Menu";
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
		ctrlbtnHealAll ctrlSetPosition [0.249937, 0.42, 0.150038, 0.08];
		ctrlbtnHealAll ctrlSetText "Heal All";
		ctrlbtnHealAll ctrlSetTooltip "Arma Heal or Ace Heal all players.";
		ctrlbtnHealAll ctrlAddEventHandler ["ButtonClick", {
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
		ctrlbtnHealAll ctrlCommit 0;
		ctrlbtnNotification ctrlSetPosition [0.424982, 0.42, 0.150038, 0.08];
		ctrlbtnNotification ctrlSetText "Notification Menu";
		ctrlbtnNotification ctrlSetTooltip "Open the Notifiction Menu.";
		ctrlbtnNotification ctrlAddEventHandler ["ButtonClick", {
			[player] remoteExec ["JJAM_fnc_notificationMenu", 2];
		}];
		ctrlbtnNotification ctrlCommit 0;
		ctrlbtnGroups ctrlSetPosition [0.249937, 0.54, 0.150038, 0.08];
		ctrlbtnGroups ctrlSetText "Group Menu";
		ctrlbtnGroups ctrlSetTooltip "Open the Group Menu";
		ctrlbtnGroups ctrlAddEventHandler ["ButtonClick", {
			[player] remoteExec ["JJAM_fnc_groupMenu", 2];	
		}];
		ctrlbtnGroups ctrlCommit 0;
		ctrlbtnFullAdmin ctrlSetPosition [0.6, 0.54, 0.15, 0.08];
		ctrlbtnFullAdmin ctrlSetText "Admin Menu";
		ctrlbtnFullAdmin ctrlSetTooltip "Open the SuperAdmin Menu";
		ctrlbtnFullAdmin ctrlAddEventHandler ["ButtonClick", {
			[player] remoteExec ["JJAM_fnc_superAdminMenu", 2];
		}];
		ctrlbtnFullAdmin ctrlCommit 0;
	};
};

if (!isNil "JJAM_keydown") exitWith {call createAdminMenu};

JJAM_keydown = (findDisplay 46) displayAddEventHandler ["KeyDown", {
	if (_this select 1 == 59) then {
		call createAdminMenu;
		diag_log text "JJAM: Menu triggered!";
		true
	}
}];

';

JJAM_adminMenuCode = compile adminMenuString;
owner _player publicVariableClient "JJAM_adminMenuCode";
[] remoteExec ["JJAM_adminMenuCode", _player];
true
