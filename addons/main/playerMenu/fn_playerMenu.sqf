/*
 * fn_playerMenu.sqf
 * Author: JJ
 *
 * Open the player menu
 *
 * Args:
 * 1: the player to open the player menu <OBJECT>
 *
 * Return Value:
 * 1: true if menu opened, false if menu not opened <BOOL>
 *
 */
params["_player"];

if (!JJPlayerMenu) exitWith {false};

playerMenuString = '

private _fileName = "fn_playerMenu";
[2, "PlayerMenu Started!", _fileName] call JJAM_fnc_log;
createPlayerMenu = {
	with uiNamespace do {
		JJZeusMenu = missionNamespace getVariable "JJZeusMenu";
		JJAdminMenu = missionNamespace getVariable "JJAdminMenu";
		JJAM_isAdmin = missionNamespace getVariable "JJAM_isAdmin";
		JJAM_isZeus = missionNamespace getVariable "JJAM_isZeus";
		playerMenuDisplay = findDisplay 46 createDisplay "RscDisplayEmpty";
		ctrlBackground = playerMenuDisplay ctrlCreate ["RscBackgroundGUI", 2200];
		ctrltxtName = playerMenuDisplay ctrlCreate ["RscText", 1000];
		ctrlbtnClose = playerMenuDisplay ctrlCreate ["RscButton", 1600];
		ctrlbtnBackpack = playerMenuDisplay ctrlCreate ["RscButton", 1601];
		ctrlbtnGrass = playerMenuDisplay ctrlCreate ["RscButton", 1602];
		ctrlbtnSync = playerMenuDisplay ctrlCreate ["RscButton", 1603];
		ctrlbtnZeus = playerMenuDisplay ctrlCreate ["RscButton", 1604];
		ctrlbtnAdmin = playerMenuDisplay ctrlCreate ["RscButton", 1605];
		ctrlbtnKeys = playerMenuDisplay ctrlCreate ["RscButton", 1606];
		ctrlBackground ctrlSetPosition [0.224931, 0.34, 0.550138, 0.32];
		ctrlBackground ctrlCommit 0;
		ctrltxtName ctrlSetPosition [0.224931, 0.34, 0.525132, 0.04];
		ctrltxtName ctrlSetText "JJs Player Menu";
		ctrltxtName ctrlCommit 0;
		ctrlbtnClose ctrlSetPosition [0.750063, 0.34, 0.0250063, 0.04];
		ctrlbtnClose ctrlSetText "X";
		ctrlbtnClose ctrlSetTextColor [1, 0, 0, 1];
		ctrlbtnClose ctrlSetTooltip "Close the menu";
		ctrlbtnClose ctrlAddEventHandler ["ButtonClick", {
			params ["_ctrl"];
			_display = ctrlParent _ctrl;
			_display closeDisplay 1;
		}];
		ctrlbtnClose ctrlCommit 0;
		ctrlbtnBackpack ctrlSetPosition [0.249937, 0.42, 0.150038, 0.08];
		ctrlbtnBackpack ctrlSetText "Toggle Backpack";
		ctrlbtnBackpack ctrlSetTooltip "Toggle the visibility of your backpack";
		ctrlbtnBackpack ctrlAddEventHandler ["ButtonClick", {
			if (!isNull unitBackpack player) then {
				if (isObjectHidden unitBackpack player) then {
					[unitBackpack player, false] remoteExec ["hideObjectGlobal", 2];
					hintSilent parseText format ["%1Made backpack <t color=""#42ebf4"">visible</t>", playerHeader];
					player setVariable ["hintTimer", 3];
				} else {
					[unitBackpack player, true] remoteExec ["hideObjectGlobal", 2];
					hintSilent parseText format ["%1Made backpack <t color=""#42ebf4"">invisible</t>", playerHeader];
					player setVariable ["hintTimer", 3];
				};
			} else {
				hintSilent parseText format ["%1You do not have a backpack eqipped", playerHeader];
				player setVariable ["hintTimer", 3];
			};
		}];
		ctrlbtnBackpack ctrlCommit 0;
		ctrlbtnGrass ctrlSetPosition [0.424982, 0.42, 0.150038, 0.08];
		ctrlbtnGrass ctrlSetText "Toggle Grass";
		ctrlbtnGrass ctrlSetTooltip "Toggle the visibility of grass";
		ctrlbtnGrass ctrlAddEventHandler ["ButtonClick", {
			if (getTerrainGrid < 50) then {
				setTerrainGrid 50;
				hintSilent parseText format ["%1Grass <t color=""#42ebf4"">disabled</t>", playerHeader];
				player setVariable ["hintTimer", 3];
			} else {
				setTerrainGrid 12.5;
				hintSilent parseText format ["%1Grass <t color=""#42ebf4"">enabled</t>", playerHeader];
				player setVariable ["hintTimer", 3];
			};
		}];
		ctrlbtnGrass ctrlCommit 0;
		ctrlbtnSync ctrlSetPosition [0.249937, 0.54, 0.150038, 0.08];
		ctrlbtnSync ctrlSetText "Sync Clothes";
		ctrlbtnSync ctrlSetTooltip "If someone says you have no clothes when you do, click me";
		ctrlbtnSync ctrlAddEventHandler ["ButtonClick", {
			player setUnitLoadout (getUnitLoadout player);
			hintSilent parseText format ["%1Synced clothing</t>", playerHeader];
			player setVariable ["hintTimer", 3];
		}];
		ctrlbtnSync ctrlCommit 0;
		ctrlbtnZeus ctrlSetPosition [0.424982, 0.54, 0.150038, 0.08];
		ctrlbtnZeus ctrlSetText "Zeus Menu";
		if (JJZeusMenu && (JJAM_isZeus || JJAM_isAdmin)) then {
			ctrlbtnZeus ctrlSetTooltip "Open the Zeus menu";
			ctrlbtnZeus ctrlAddEventHandler ["ButtonClick", {
				[player] remoteExec ["JJAM_fnc_zeusMenu", 2];
				false
			}];
		} else {
			ctrlbtnZeus ctrlSetTooltip "Not enough permissions";
			ctrlbtnZeus ctrlEnable false;
		};
		ctrlbtnZeus ctrlCommit 0;
		ctrlbtnAdmin ctrlSetPosition [0.6, 0.54, 0.15, 0.08];
		ctrlbtnAdmin ctrlSetText "Admin Menu";
		if (JJAM_isAdmin && JJAdminMenu) then { 
			ctrlbtnAdmin ctrlSetTooltip "Open the Admin Menu";
			ctrlbtnAdmin ctrlAddEventHandler ["ButtonClick", {
				[player] remoteExec ["JJAM_fnc_adminMenu", 2];
				false
			}];
		} else {
			ctrlbtnAdmin ctrlSetTooltip "Not enough permissions";
			ctrlbtnAdmin ctrlEnable false;
		};
		ctrlbtnAdmin ctrlCommit 0;
		ctrlbtnKeys ctrlSetPosition [0.6, 0.42, 0.15, 0.08];
		ctrlbtnKeys ctrlSetText "Toggle keybinds";
		ctrlbtnKeys ctrlSetTooltip "Not implemented";
		ctrlbtnKeys ctrlEnable false;
		ctrlbtnKeys ctrlAddEventHandler ["ButtonClick", {
			hintSilent "Not implemented yet";
		}];
		ctrlbtnKeys ctrlCommit 0;
	};

};

if (!isNil "JJAM_keydown") exitWith {call createPlayerMenu};

JJAM_keydown = (findDisplay 46) displayAddEventHandler ["KeyDown", {
	if (_this select 1 == 59) then {
		call createPlayerMenu;
		true
	}
}];

';

JJAM_playerMenuCode = compileFinal playerMenuString;
owner _player publicVariableClient "JJAM_playerMenuCode";
[] remoteExec ["JJAM_playerMenuCode", _player];
