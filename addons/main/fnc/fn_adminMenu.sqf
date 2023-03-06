/*
 * fn_adminMenu.sqf
 * Author: JJ
 *
 * Args:
 * 1: the player to open the admin menu <OBJECT>
 *
 * Return Value:
 * none
 *
 */
params["_player"];

_isAdmin = _player call JJAM_fnc_isAdmin;

if (!_isAdmin) exitWith {false};
if (!JJAdminMenu) exitWith {false};

JJAM_adminMenuString = '

[] spawn {
	with uiNamespace do {
		JJPlayerMenu = missionNamespace getVariable "JJPlayerMenu";
		adminHeader = missionNamespace getVariable "adminHeader";
		adminMenuDisplay = findDisplay 46 createDisplay "RscDisplayEmpty";
		ctrlBackground = adminMenuDisplay ctrlCreate ["RscBackgroundGUI", 2200];
		ctrlBackground2 = adminMenuDisplay ctrlCreate ["RscBackgroundGUI", 2201];
		ctrlBackground3 = adminMenuDisplay ctrlCreate ["RscBackgroundGUI", 2201];
		ctrltxtName = adminMenuDisplay ctrlCreate ["RscText", 1000];
		ctrlbtnClose = adminMenuDisplay ctrlCreate ["RscButton", 1600];
		ctrllstPlayers = adminMenuDisplay ctrlCreate ["RscListBox", 1500];
		ctrltxtPlayers = adminMenuDisplay ctrlCreate ["RscText", 1001];
		ctrllstFeatures = adminMenuDisplay ctrlCreate ["RscListBox", 1501];
		ctrltxtFeatures = adminMenuDisplay ctrlCreate ["RscText", 1002];
		ctrlbtnExec = adminMenuDisplay ctrlCreate ["RscButton", 1601];
		ctrlbtnVariables = adminMenuDisplay ctrlCreate ["RscButton", 1604];
		ctrlbtnNotification = adminMenuDisplay ctrlCreate ["RscButton", 1606];
		ctrlbtnGroups = adminMenuDisplay ctrlCreate ["RscButton", 1605];
		ctrltxtLoadouts = adminMenuDisplay ctrlCreate ["RscText", 1005];
		ctrllstLoadouts = adminMenuDisplay ctrlCreate ["RscListBox", 1502];
		ctrledtLoadoutName = adminMenuDisplay ctrlCreate ["RscEdit", 1400];
		ctrlbtnLoad = adminMenuDisplay ctrlCreate ["RscButton", 1602];
		ctrlbtnSave = adminMenuDisplay ctrlCreate ["RscButton", 1603];
		ctrlbtnDelete = adminMenuDisplay ctrlCreate ["RscButton", 1607];
		ctrlBackground ctrlSetPosition [0.0505, 0.16, 0.699308, 0.68];
		ctrlBackground ctrlCommit 0;
		ctrlBackground2 ctrlSetPosition [0.77475, 0.16, 0.174828, 0.68];
		ctrlBackground2 ctrlCommit 0;
		ctrlBackground3 ctrlSetPosition [0.7875, 0.6, 0.149852, 0.04];
		ctrlBackground3 ctrlCommit 0;
		ctrltxtName ctrlSetText "JJs Admin Menu";
		ctrltxtName ctrlSetPosition [0.0505008, 0.16, 0.674334, 0.04];
		ctrltxtName ctrlCommit 0;
		ctrlbtnClose ctrlSetText "X";
		ctrlbtnClose ctrlSetTooltip "Close the menu";
		ctrlbtnClose ctrlSetTextColor [1, 0, 0, 1];
		ctrlbtnClose ctrlSetPosition [0.72475, 0.16, 0.0249754, 0.04];
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
		ctrllstPlayers ctrlSetPosition [0.0755, 0.28, 0.224778, 0.4];
		ctrllstPlayers ctrlCommit 0;
		ctrltxtPlayers ctrlSetText "Players";
		ctrltxtPlayers ctrlSetPosition [0.063, 0.22, 0.237266, 0.04];
		ctrltxtPlayers ctrlCommit 0;
		ctrllstFeatures ctrlSetPosition [0.32525, 0.28, 0.399605, 0.4];
		ctrllstFeatures ctrlCommit 0;
		ctrltxtFeatures ctrlSetText "Features";
		ctrltxtFeatures ctrlSetPosition [0.32525, 0.22, 0.399605, 0.04];
		ctrltxtFeatures ctrlCommit 0;
		ctrlbtnExec ctrlSetText "Execute";
		ctrlbtnExec ctrlSetTooltip "Execute the selected feature on the selected player";
		ctrlbtnExec ctrlSetPosition [0.0755, 0.72, 0.149852, 0.08];
		ctrlbtnExec ctrlAddEventHandler ["ButtonClick", {
			with uiNamespace do {
				[lbCurSel ctrllstPlayers, lbCurSel ctrllstFeatures] call JJAM_execute;	
			};
		}];
		ctrlbtnExec ctrlCommit 0;
		ctrlbtnVariables ctrlSetText "Variable";
		ctrlbtnVariables ctrlSetTooltip "Open Variable menu";
		ctrlbtnVariables ctrlSetPosition [0.23775, 0.72, 0.149852, 0.08];
		ctrlbtnVariableS ctrlAddEventHandler ["ButtonClick", {
			//do stuff
		}];
		ctrlbtnVariables ctrlEnable false;
		ctrlbtnVariables ctrlCommit 0;
		ctrlbtnNotification ctrlSetText "Notification";
		ctrlbtnNotification ctrlSetTooltip "Open the notification menu";
		ctrlbtnNotification ctrlSetPosition [0.4125, 0.72, 0.149852, 0.08];
		ctrlbtnNotification ctrlAddEventHandler ["ButtonClick", {
			[player] remoteExec ["JJAM_fnc_notificationMenu", 2];
		}];
		ctrlbtnNotification ctrlCommit 0;
		ctrlbtnGroups ctrlSetText "Groups";
		ctrlbtnGroups ctrlSetTooltip "Open the group menu";
		ctrlbtnGroups ctrlSetPosition [0.575, 0.72, 0.149852, 0.08];
		ctrlbtnGroups ctrlAddEventHandler ["ButtonClick", {
			[player] remoteExec ["JJAM_fnc_groupMenu", 2];
		}];
		ctrlbtnGroups ctrlCommit 0;
		ctrltxtLoadouts ctrlSetText "Loadouts";
		ctrltxtLoadouts ctrlSetPosition [0.77475, 0.16, 0.174828, 0.04];
		ctrltxtLoadouts ctrlCommit 0;
		ctrllstLoadouts ctrlSetPosition [0.78725, 0.22, 0.149852, 0.36];
		ctrllstLoadouts ctrlCommit 0;
		ctrledtLoadoutName ctrlSetPosition [0.7875, 0.6, 0.149852, 0.04];
		ctrledtLoadoutName ctrlCommit 0;
		ctrlbtnLoad ctrlSetText "Load";
		ctrlbtnLoad ctrlSetTooltip "Equip the selected loadout";
		ctrlbtnLoad ctrlSetPosition [0.78725, 0.72, 0.149852, 0.04];
		ctrlbtnLoad ctrlAddEventHandler ["ButtonClick", {
			with uiNamespace do {
				_index = lbCurSel ctrllstLoadouts;
				if (_index != -1) then {
					_allLoadouts = profileNamespace getVariable ["JJAM_loadouts", []];
					_name = ctrllstLoadouts lbText _index;
					_loadout = _allLoadouts select _index select 1;
					player setUnitLoadout _loadout;
					hintSilent parseText format ["%1You equiped loadout<br/><t color=""#42ebf4"">%2</t>", adminHeader, _name];
					player setVariable ["hintTimer", 3];
				} else { 
					hintSilent parseText format ["%1You need to select a loadout", adminHeader];
					player setVariable ["hintTimer", 3];
				};
			};
		}];
		ctrlbtnLoad ctrlCommit 0;
		ctrlbtnSave ctrlSetText "Save";
		ctrlbtnSave ctrlSetTooltip "Save your current loadout using the name above";
		ctrlbtnSave ctrlSetPosition [0.78725, 0.66, 0.149852, 0.04];
		ctrlbtnSave ctrlAddEventHandler ["ButtonClick", {
			with uiNamespace do {
				_loadoutName = ctrlText ctrledtLoadoutName;
				if (_loadoutName != "") then {
					_currentLoadout = getUnitLoadout player; 
					_allLoadouts = profileNamespace getVariable ["JJAM_loadouts", []]; 
					_allLoadouts append [[[_loadoutName], _currentLoadout]]; 
					profileNamespace setVariable ["JJAM_loadouts", _allLoadouts];
					hintSilent parseText format ["%1You created loadout<br/><t color=""#42ebf4"">%2</t>", adminHeader, _loadoutName];
					player setVariable ["hintTimer", 3];
				} else {
					hintSilent parseText format ["%1You need to specify a loadout name", adminHeader];
					player setVariable ["hintTimer", 3];
				};
			};
		}];
		ctrlbtnSave ctrlCommit 0;
		ctrlbtnDelete ctrlSetText "Delete";
		ctrlbtnDelete ctrlSetTooltip "Delete the selected loadout";
		ctrlbtnDelete ctrlSetPosition [0.78725, 0.78, 0.149852, 0.04];
		ctrlbtnDelete ctrlAddEventHandler ["ButtonClick", {
			with uiNamespace do {
				_index = lbCurSel ctrllstLoadouts;
				if (_index != -1) then {
					_allLoadouts = profileNamespace getVariable ["JJAM_loadouts", []];
					_name = ctrllstLoadouts lbText _index;
					_allLoadouts deleteAt _index;
					profileNamespace setVariable ["JJAM_loadouts", _allLoadouts];
					hintSilent parseText format ["%1You deleted loadout<br/><t color=""#42ebf4"">%2</t>", adminHeader, _name];
					player setVariable ["hintTimer", 3];
				} else { 
					hintSilent parseText format ["%1You need to select a loadout", adminHeader];
					player setVariable ["hintTimer", 3];
				};
			};
		}];
		ctrlbtnDelete ctrlCommit 0;

		JJAM_admin_red = [ 1, 0.22, 0.22, 1];
		JJAM_admin_green = [ 0.22, 0.7, 0.2, 1];
		JJAM_admin_custom = [(profilenamespace getvariable ["GUI_BCG_RGB_R",0.13]),(profilenamespace getvariable ["GUI_BCG_RGB_G",0.54]),(profilenamespace getvariable ["GUI_BCG_RGB_B",0.21]),1];

		waitUntil {!isNull adminMenuDisplay};
		while {!isNull adminMenuDisplay} do {
			with uiNamespace do {

				{
					ctrllstPlayers lbAdd name _x;
					ctrllstPlayers ctrlSetEventHandler ["LBDblClick", "call JJAM_admin_playerInfo"];
					ctrllstPlayers lbSetTooltip [ _forEachIndex, format ["Name: %1 ~ Steam: %2 ~ UID: %3", name _x, _x getVariable "steamName", getPlayerUID _x]];
				} forEach allPlayers;

				_allLoadouts = profileNamespace getVariable ["JJAM_loadouts", []];
				_loadoutIndex = 0;
				{
					_name = _allLoadouts select _loadoutIndex select 0 select 0;
					ctrllstLoadouts lbAdd _name;
					_loadoutIndex = _loadoutIndex + 1;
				} forEach _allLoadouts;

				if (lbCurSel ctrllstPlayers == -1) then {
					ctrllstPlayers lbSetCurSel  0;
				};
				
				featuresList = missionNamespace getVariable "featuresList";
				{
					switch(_x select 1) do {
						case "header": {
							ctrllstFeatures lbAdd (_x select 0);
							ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_custom];
						};
						case "god": { 
							_player = allPlayers select (lbCurSel ctrllstPlayers);
							if (isDamageAllowed _player) then {
								ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
								ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
								ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							} else {
								ctrllstFeatures lbAdd format ["%1 - ON", _x select 0];
								ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_green];
								ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							};
						};
						case "vehGod": {
							_player = allPlayers select (lbCurSel ctrllstPlayers);
							_vehicle = objectParent _player;
							if (isNull _vehicle) then {
								ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
								ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
								ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							} else {
								if (isDamageAllowed _vehicle) then {
									ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
									ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
									ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
								} else {
									ctrllstFeatures lbAdd format ["%1 - ON", _x select 0];
									ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_green];
									ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
								};
							};
						};
						case "ammo": {
							if ((lbCurSel ctrllstPlayers) != -1) then {
								if (isNil {((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_ammo")} || {!((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_ammo")}) then {
									ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
									ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
									ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
								} else {
									ctrllstFeatures lbAdd format ["%1 - ON", _x select 0];
									ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_green];
									ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
								};
							} else {
								ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
								ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
								ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							};
						};
						case "invis": {
							_player = allPlayers select (lbCurSel ctrllstPlayers);
							if (isObjectHidden _player) then {
								ctrllstFeatures lbAdd format ["%1 - ON", _x select 0];
								ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_green];
								ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							} else {
								ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
								ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
								ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							};
						};
						case "rapid": {
							if ((lbCurSel ctrllstPlayers) != -1) then {
								if (isNil {((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_rapid")} || {!((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_rapid")}) then {
									ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
									ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
									ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
								} else {
									ctrllstFeatures lbAdd format ["%1 - ON", _x select 0];
									ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_green];
									ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
								};
							} else {
								ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
								ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
								ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							};
						};
						case "recoil": {
							_player = allPlayers select (lbCurSel ctrllstPlayers);
							if (unitRecoilCoefficient _player != 0) then {
								ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
								ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
								ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							} else {
								ctrllstFeatures lbAdd format ["%1 - ON", _x select 0];
								ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_green];
								ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							};
						};
						case "sway": {
							if ((lbCurSel ctrllstPlayers) != -1) then {
								if (isNil {((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_sway")} || {!((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_sway")}) then {
									ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
									ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
									ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
								} else {
									ctrllstFeatures lbAdd format ["%1 - ON", _x select 0];
									ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_green];
									ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
								};
							} else {
								ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
								ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
								ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							};
						};
						case "speed": {
							if ((lbCurSel ctrllstPlayers) != -1) then {
								if (isNil {((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_speed")} || {!((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_speed")}) then {
									ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
									ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
									ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
								} else {
									ctrllstFeatures lbAdd format ["%1 - ON", _x select 0];
									ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_green];
									ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
								};
							} else {
								ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
								ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
								ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							};
						};
						case "mapTP": {
							if ((lbCurSel ctrllstPlayers) != -1) then {
								if (isNil {((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_mapTP")} || {!((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_mapTP")}) then {
									ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
									ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
									ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
								} else {
									ctrllstFeatures lbAdd format ["%1 - ON", _x select 0];
									ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_green];
									ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
								};
							} else {
								ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
								ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
								ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							};
						};
						case "freeze": {
							if ((lbCurSel ctrllstPlayers) != -1) then {
								if (isNil {((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_frozen")} || {!((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_frozen")}) then {
									ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
									ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
									ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
								} else {
									ctrllstFeatures lbAdd format ["%1 - ON", _x select 0];
									ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_green];
									ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
								};
							} else {
								ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
								ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
								ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							};
						};
						case "markers": {
							if ((lbCurSel ctrllstPlayers) != -1) then {
								if (isNil {((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_mapMarkers")} || {!((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_mapMarkers")}) then {
									ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
									ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
									ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
								} else {
									ctrllstFeatures lbAdd format ["%1 - ON", _x select 0];
									ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_green];
									ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
								};
							} else {
								ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
								ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
								ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							};
						};
						default {
							ctrllstFeatures lbAdd (_x select 0);
							ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
						};
					};
				} forEach featuresList;

				uiSleep 0.02;
				lbClear ctrllstPlayers;
				lbClear ctrllstFeatures;
				lbClear ctrllstLoadouts;
				ctrllstPlayers ctrlCommit 0;
				ctrllstFeatures ctrlCommit 0;
				ctrllstLoadouts ctrlCommit 0;
			};
		};

		JJAM_execute = {
			params ["_player","_feature"];
			if (_feature != -1) then {
				if ((featuresList select _feature) select 2 == false) exitWith {};
				JJAM_code = format ["[%1] spawn JJAM_admin_%2", _player, (featuresList select _feature) select 1];
				missionNamespace setVariable ["JJAM_code", JJAM_code];
				publicVariableServer "JJAM_code";
				[compile JJAM_code] remoteExec ["call", 2];
			} else {
				hintSilent parseText format ["%1Please select a feature to execute.", adminHeader];
				player setVariable ["hintTimer", 5];
			};
		};

		while {true} do {
			waitUntil {userInputDisabled};
			disableUserInput false;
			hintSilent parseText format ["%1 Someone tried to freeze you!<br />Don''t worry, I saved you", adminHeader];
			player setVariable ["hintTimer", 5];
		};
	};
};

';

features = [
	["-=- Options -=-", "header", false, "Options that are executed once"],
	["Kill", "kill", true, "Select a player to kill"],
	["Heal", "heal", true, "Select a player to heal"],
	["TP to player", "tpToPlayer", true, "Select a player to teleport to"],
	["TP player here", "tpPlayerHere", true, "Select a player to teleport them here"],
	["Get in vehcile", "getIn", true, "Get in to the select players vehicle"],
	["Move in vehicle", "moveIn", true, "Move the select player in to your vehicle"],
	["Repair", "repair", true, "Select a player to repair their vehicle or don't select a player to repair whatever you are looking at"],
	["Delete", "delete", false, "Select a player to delete their vehicle or don't select a player to delete whatever you are looking at"],
	["Explode vehicle", "explode", true, "Select a player to destroy their vehicle"],
	["Destroy vehicle", "destroy", true, "Select a player to destroy their vehicle (No explosion)"],
	["Spectate", "spectator", true, "Select a player to spectate"],
	["Freecam", "freecam", true, "Select a player to put them into freecam"],
	["Arsenal", "arsenal", true, "Open the arsenal for select player"],
	["Remote Arsenal", "remoteArsenal", true, "Open select players arsenal for you"],
	["Garage", "garage", true, "Select a player to open the garage for them"],
	["Take loadout", "takeLoadout", true, "Select a player to take their loadout"],
	["Give loadout", "giveLoadout", true, "Select a player to give them your loadout"],
	["Piss", "pee", true, "Make the player you select have the sudden urge to piss"],
	["", "", false, ""],
	["-=- Utility -=-", "header", false, ""],
	["Send to lobby", "lobby", true, "Select a player to send them to the lobby"],
	["Player info", "info", true, "Get info on the selected player"]
];
featuresOff = [
	["-=- Toggleable -=-", "header", false, "Options that can be enabled or disabled"],
	["God", "god", true, "Toggle invulnerability."],
	["Vehicle God", "vehGod", true, "Toggle invulnerability for the current vehicle."],
	["Infinite Ammo", "ammo", true, "Toggle infinite ammo."],
	["Invisible / NoClip", "invis", true, "Toggle invisability."],
	["Rapid Fire", "rapid", true, "Toggle rapid fire."],
	["No recoil", "recoil", true, "Toggle weapon recoil."],
	["No sway", "sway", true, "Toggle weapon sway."],
	["Snort speed", "speed", true, "toggle speed hack."],
	["Map TP", "mapTP", true, "Select a player to toggle their map teleportation"],
	["Freeze", "freeze", true, "Select a player to toggle freeze them"],
	["Map Markers", "markers", true, "Select a player to toggle map markers for them"],
	["", "", false, ""]
	
];

adminHeader = "<t color='#41f48c' size='2' font='PuristaBold'>JJ's Admin Menu</t><br />-------- -_- --------<br /><br />";
owner _player publicVariableClient "adminHeader";

JJAM_admin_god = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	if (isDamageAllowed _player) then {
		[_player, false] remoteExec ["allowDamage", 2];
		hintSilent parseText format ["%1You made<br/><t color='#42ebf4'>%2</t><br />immortal", adminHeader, name _player];
	} else {
		[_player, true] remoteExec ["allowDamage", 2];
		hintSilent parseText format ["%1You made<br/><t color='#42ebf4'>%2</t><br />mortal", adminHeader, name _player];
	};
	player setVariable ["hintTimer", 3];
};

JJAM_admin_vehGod = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	_vehicle = objectParent _player;
	if (_vehicle isEqualTo objNull) then {
		hintSilent parseText format ["%1<t color='#42ebf4'>%2</t><br />is not in a vehicle.", adminHeader, _player];
	} else {
		if (isDamageAllowed _vehicle) then {
			[objectParent _player, false] remoteExec ["allowDamage", 2];
			hintSilent parseText format ["%1You made<br /><t color='#42ebf4'>%2's</t><br /> vehicle <t color='#42ebf4'>immortal</t>", adminHeader, _player];
		} else {
			[objectParent _player, true] remoteExec ["allowDamage", 2];
			hintSilent parseText format ["%1You made<br /><t color='#42ebf4'>%2's</t><br /> vehicle <t color='#42ebf4'>mortal</t>", adminHeader, _player];
		};
	};
	player setVariable ["hintTimer", 3];
};

JJAM_admin_ammo = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	hintSilent parseText format ["%1You toggled Infinite Ammo for<br/><t color='#42ebf4'>%2</t>", adminHeader, name _player];
	remoteExec ["JJAM_admin_exec_ammo", _player];
	player setVariable ["hintTimer", 3];
};

JJAM_admin_invis = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	hintSilent parseText format ["%1You toggled Invisability for<br/><t color='#42ebf4'>%2</t>", adminHeader, name _player];
	if (isObjectHidden _player) then {
		[_player, false] remoteExec ["hideObjectGlobal", 2];
	} else {
		[_player, true] remoteExec ["hideObjectGlobal", 2];
	};
	player setVariable ["hintTimer", 3];
};

JJAM_admin_rapid = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	hintSilent parseText format ["%1You toggled Rapid fire for<br/><t color='#42ebf4'>%2</t>", adminHeader, name _player];
	remoteExec ["JJAM_admin_exec_rapid", _player];
	player setVariable ["hintTimer", 3];
};

JJAM_admin_recoil = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	hintSilent parseText format ["%1You toggled zero recoil for<br/><t color='#42ebf4'>%2</t>", adminHeader, name _player];
	remoteExec ["JJAM_admin_exec_recoil", _player];
	player setVariable ["hintTimer", 3];
};

JJAM_admin_sway = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	hintSilent parseText format ["%1You toggled zero sway for<br/><t color='#42ebf4'>%2</t>", adminHeader, name _player];
	remoteExec ["JJAM_admin_exec_sway", _player];
	player setVariable ["hintTimer", 3];
};

JJAM_admin_speed = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	hintSilent parseText format ["%1You toggled speed for<br/><t color='#42ebf4'>%2</t>", adminHeader, name _player];
	remoteExec ["JJAM_admin_exec_speed", _player];
	player setVariable ["hintTimer", 3];
};

JJAM_admin_kill = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	hintSilent parseText format ["%1You killed<br/><t color='#42ebf4'>%2</t>", adminHeader, name _player];
	[_player, 1] remoteExec ["setDamage", 2];
	player setVariable ["hintTimer", 3];
};

JJAM_admin_heal = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
		[player] remoteExecCall ["ace_medical_treatment_fnc_fullHealLocal", _player];
		hintSilent parseText format ["%1You Ace healed<br/><t color='#42ebf4'>%2</t>", adminHeader, name _player];
	} else {
		[_player, 0] remoteExec ["setDamage", 2];
		hintSilent parseText format ["%1You healed<br/><t color='#42ebf4'>%2</t>", adminHeader, name _player];
	};
	player setVariable ["hintTimer", 3];
};

JJAM_admin_tpToPlayer = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	hintSilent parseText format ["%1You teleported to<br/><t color='#42ebf4'>%2</t>", adminHeader, name _player];
	player setPosASL (getPosASL _player);
	player setVariable ["hintTimer", 3];
};

JJAM_admin_tpPlayerHere = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	hintSilent parseText format ["%1You teleported<br/><t color='#42ebf4'>%2</t><br />to you", adminHeader, name _player];
	_player setPosASL (getPosASL player);
	player setVariable ["hintTimer", 3];
};

JJAM_admin_mapTP = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	hintSilent parseText format ["%1You toggled map TP for<br/><t color='#42ebf4'>%2</t>", adminHeader, name _player];
	remoteExec ["JJAM_admin_exec_mapTP", _player];
	player setVariable ["hintTimer", 3];
};

JJAM_admin_freeze = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	if (_player == player) then {
		hintSilent parseText format ["%1You tried to freeze yourself!<br />Don't worry I saved you", adminHeader];
	} else {
		hintSilent parseText format ["%1You toggled freeze for<br/><t color='#42ebf4'>%2</t>", adminHeader, name _player];
		remoteExec ["JJAM_admin_exec_freeze", _player];
	};
	player setVariable ["hintTimer", 3];
};

JJAM_admin_repair = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	hintSilent parseText format ["%1You repaired<br/><t color='#42ebf4'>%2's</t><br />vehicle", adminHeader, name _player];
	[objectParent _player, 0] remoteExec ["setDamage", 2];
	player setVariable ["hintTimer", 3];
};

JJAM_admin_delete = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	if !(isNull objectParent _player) then {
		hintSilent parseText format ["%1You deleted <t color='#42ebf4'>%2</t>'s<br/><t color='#42ebf4'>%3</t>", adminHeader, name _player, typeOf objectParent player];
		[objectparent player] remoteExec ["deleteVehicleCrew", owner objectParent _player];
		[objectparent player] remoteExec ["deleteVehicle", owner objectParent _player];
	} else {
		hintSilent parseText format ["%1<t color='#42ebf4'>%2</t> is not in a vehicle", adminHeader, name _player];
	};
	player setVariable ["hintTimer", 3];
};

JJAM_admin_explode = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	hintSilent parseText format ["%1You exploded<br/><t color='#42ebf4'>%2's</t><br />vehicle", adminHeader, name _player];
	[objectParent _player, [1, true]] remoteExec ["setDamage", 2];
	player setVariable ["hintTimer", 3];
};

JJAM_admin_destroy = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	hintSilent parseText format ["%1You destroyed<br/><t color='#42ebf4'>%2's</t><br />vehicle", adminHeader, name _player];
	[objectParent _player, [1, false]] remoteExec ["setDamage", 2];
	player setVariable ["hintTimer", 3];
};

JJAM_admin_getIn = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	if !(isNull objectParent _player) then {
		_seats = objectParent player emptyPositions "";
		if ( _seats > 0) then {
			moveOut player;
			player moveInAny objectParent _player;
			hintSilent parseText format ["%1You entered<br/><t color='#42ebf4'>%2's</t><br />vehicle", adminHeader, name _player];
		} else {
			hintSilent parseText format ["%Thre is no seats in<br/><t color='#42ebf4'>%2's</t><br />vehicle", adminHeader, name _player];
		};
	} else {
		hintSilent parseText format ["%<t color='#42ebf4'>%2</t><br />is not in a vehicle", adminHeader, name _player];
	};
	player setVariable ["hintTimer", 3];
};

JJAM_admin_moveIn = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	if !(isNull objectParent player) then {
		_seats = objectParent _player emptyPositions "";
		if (_seats > 0) then {
			moveOut _player;
			_player moveInCargo objectParent player;
			hintSilent parseText format ["%1You moved<br/><t color='#42ebf4'>%2's</t><br />in to your vehicle", adminHeader, name _player];
		} else {
			hintSilent parseText format ["%1There are no seats in your vehicle", adminHeader, name _player];
		};
	} else {
		hintSilent parseText format ["%1You are not in a vehicle", adminHeader, name _player];
	};
	player setVariable ["hintTimer", 3];
};

JJAM_admin_spectator = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	if (_player == player) then {
		hintSilent parseText format ["%1You can't spectate yourself!", adminHeader];
	} else {
		hintSilent parseText format ["%1You are now spectating<br/><t color='#42ebf4'>%2</t><br />to stop spectating press <t color='#42ebf4'>F10</t>", adminHeader, name _player];
		switchCamera _player;
		stopSpectating = (findDisplay 46) displayAddEventHandler ["KeyDown",
		{
			if ((_this select 1) == 68) then {
				(findDisplay 46) displayRemoveEventHandler ["KeyDown", stopSpectating];
				switchCamera player;
			};
		}];
	};
	player setVariable ["hintTimer", 3];
};

JJAM_admin_markers = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	hintSilent parseText format ["%1You enabled map markers for<br/><t color='#42ebf4'>%2</t>", adminHeader, name _player];
	remoteExec ["JJAM_admin_exec_markers", _player];
	player setVariable ["hintTimer", 3];
};

JJAM_admin_freecam = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	hintSilent parseText format ["%1You put<br/><t color='#42ebf4'>%2</t><br />in to spectator", adminHeader, name _player];
	([] execVM "a3\functions_f\Debug\fn_camera.sqf") remoteExec ["call", _player];
	if (_player == player) then {closeDialog 2;};
	player setVariable ["hintTimer", 3];
};

JJAM_admin_arsenal = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	hintSilent parseText format ["%1You put<br/><t color='#42ebf4'>%2</t><br />in to the arsenal", adminHeader, name _player];
	if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
		[_player, _player, true] remoteExec ["ace_arsenal_fnc_openBox", 2];
	} else {
		["Open", true] remoteExec ["BIS_fnc_arsenal", _player];
	};
	if (player == _player) then {
		closeDialog 2;
	};
	player setVariable ["hintTimer", 3];
};

JJAM_admin_remoteArsenal = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	hintSilent parseText format ["%1You opened<br/><t color='#42ebf4'>%2</t>'s<br />arsenal", adminHeader, name _player];
	if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
		[_player, player, true] remoteExec ["ace_arsenal_fnc_openBox", 2];
	} else {
		["Open", [true, _player, _player]] call BIS_fnc_arsenal;
	};
	if (player == _player) then {
		closeDialog 2;
	};
	player setVariable ["hintTimer", 3];
};

JJAM_admin_garage = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	hintSilent parseText format ["%1You put<br/><t color='#42ebf4'>%2</t><br />in to the garage", adminHeader, name _player];
	_pos = _player getPos [30, getDir _player];
	_vehicle = createVehicle [ "Land_HelipadEmpty_F", _pos, [], 0, "CAN_COLLIDE"];
	if (player == _player) then {
		closeDialog 2;
		waitUntil {isNull (findDisplay 1000)};
		["Open", [true, _vehicle]] remoteExec ["BIS_fnc_garage", _player];
	} else {
		["Open", [true, _vehicle]] remoteExec ["BIS_fnc_garage", _player];
	};
	player setVariable ["hintTimer", 3];
};

JJAM_admin_takeLoadout = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	hintSilent parseText format ["%1You took<br/><t color='#42ebf4'>%2's</t><br />loadout", adminHeader, name _player];
	player setUnitLoadout (getUnitLoadout _player);
	player setVariable ["hintTimer", 3];
};

JJAM_admin_giveLoadout = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	hintSilent parseText format ["%1You gave<br/><t color='#42ebf4'>%2</t><br />your loadout", adminHeader, name _player];
	_player setUnitLoadout (getUnitLoadout player);
	player setVariable ["hintTimer", 3];
};

JJAM_admin_info = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	hintSilent parseText format ["%1<t size='1.2' color='#f4e242'>Name: </t><br />%2<br /><br /><t size='1.2' color='#f4e242'>UID: </t><br />%3<br /><br /><t size='1.2' color='#f4e242'>Position: </t><br />%4<br /><br /><t size='1.2' color='#f4e242'>Equiptment: </t><br />%5<br /><br /><t size='1.6' color='#f45f42'>Player equipment copied to clipboard.</t>", adminHeader, name _player, getPlayerUID _player, position _player, getUnitLoadout _player];
	copyToClipboard str(getUnitLoadout _player);
	player setVariable ["hintTimer", 3];
};

JJAM_admin_pee = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	hintSilent parseText format ["%1You made<br/><t color='#42ebf4'>%2</t><br />have a sudden urge to pee", adminHeader, name _player];
	remoteExec ["JJAM_admin_exec_pee", _player];
	player setVariable ["hintTimer", 3];
};

JJAM_admin_playerInfo = {
	params["_idc", "_selectedIndex"];
	_infoName = format ["Name: %1", name (allPlayers select _selectedIndex)];
	_infoSteam = format ["Steam: %1", (allPlayers select _selectedIndex) getVariable "steamName"];
	_infoUID = format ["UID: %1", getPlayerUID (allPlayers select _selectedIndex)];
	_infoLoadout = getUnitLoadout (allPlayers select _selectedIndex);
	copyToClipboard format ["%1 -> %2 ~ %3 ~ %4 ~~ -_- ~~ Loadout below %5", "JJ admin menu", _infoName, _infoSteam, _infoUID, _infoLoadout];
	hintSilent parseText format ["%1 %2 <br /> %3 <br /> %4 <br /><br /> <t size='1.6' color='#f45f42'>The players equipment was copied to clipboard, press CTRL+V in a note program to paste it.</t>", adminHeader, _infoName, _infoSteam, _infoUID];
	player setVariable ["hintTimer", 10];
};

JJAM_admin_lobby = {
	params["_selectedIndex"];
	_player = allPlayers select _selectedIndex;
	hintSilent parseText format ["%1You sent<br/><t color='#42ebf4'>%2</t><br />to the lobby", adminHeader, name _player];
	((findDisplay 46) closeDisplay 0)remoteExec ["call", _player];
	player setVariable ["hintTimer", 3];
};

JJAM_admin_exec_ammo = {
	if (isNil {player getvariable "JJAM_ammo"}) then {
		player setVariable ["JJAM_ammo", false, true];
	};
	if (player getvariable "JJAM_ammo") then {
		player removeEventHandler ["fired", ammoHandler];
		player setVariable ["JJAM_ammo", false, true];
		hintSilent parseText format ["%1An admin <t color='#42ebf4'>disabled</t> infinite ammo for you.", hintHeader];
	} else {
		ammoHandler = player addEventHandler ["fired", {player setAmmo [currentWeapon player, 1000000];}];
		player setVariable ["JJAM_ammo", true, true];
		hintSilent parseText format ["%1An admin <t color='#42ebf4'>enabled</t> infinite ammo for you.", hintHeader];
	};
	player setVariable ["hintTimer", 3];
};

JJAM_admin_exec_rapid = {
	if (isNil {player getvariable "JJAM_rapid"}) then {
		player setVariable ["JJAM_rapid", false, true];
	};
	if (player getvariable "JJAM_rapid") then {
		player setVariable ["JJAM_rapid", false, true];
		hintSilent parseText format ["%1An admin <t color='#42ebf4'>disabled</t> rapid fire for you.", hintHeader];
	} else {
		player setVariable ["JJAM_rapid", true, true];
		hintSilent parseText format ["%1An admin <t color='#42ebf4'>enabled</t> rapid fire fro you.", hintHeader];
	};
	player setVariable ["hintTimer", 3];
	while {player getvariable "JJAM_rapid"} do {
		_vehicle = objectParent player;
		if (isNull _vehicle) then {
			player setWeaponReloadingTime[player, currentWeapon player, 0];
		} else {
			_vehicle setWeaponReloadingTime[_vehicle, currentWeapon _vehicle, 0];
		};
    	uiSleep 0.01;
	};
};

JJAM_admin_exec_recoil = {
	if (unitRecoilCoefficient player == 0) then {
		player setUnitRecoilCoefficient 1;
		hintSilent parseText format ["%1An admin <t color='#42ebf4'>disabled</t> weapon recoil for you.", hintHeader];
	} else {
		player setUnitRecoilCoefficient 0;
		hintSilent parseText format ["%1An admin <t color='#42ebf4'>enable</t> weapon recoil for you.", hintHeader];
	};
	player setVariable ["hintTimer", 3];
};

JJAM_admin_exec_sway = {
	if (isNil {player getvariable "JJAM_sway"}) then {
		player setVariable ["JJAM_sway", false, true];
	};
	if (player getvariable "JJAM_sway") then {
		player setVariable ["JJAM_sway", false, true];
		hintSilent parseText format ["%1An admin <t color='#42ebf4'>disabled</t> weapon sway for you.", hintHeader];
	} else {
		player setVariable ["JJAM_sway", true, true];
		hintSilent parseText format ["%1An admin <t color='#42ebf4'>enable</t> weapon sway fro you.", hintHeader];
	};
	player setVariable ["hintTimer", 3];
	while {player getvariable "JJAM_sway"} do {
		player setCustomAimCoef 0;
	};
	player setCustomAimCoef 1;
};

JJAM_admin_exec_speed = {
	if (isNil {player getvariable "JJAM_speed"}) then {
		player setVariable ["JJAM_speed", false, true];
	};
	if (player getvariable "JJAM_speed") then {
		player setVariable ["JJAM_speed", false, true];
		hintSilent parseText format ["%1An admin <t color='#42ebf4'>disabled</t> speed for you.", hintHeader];
	} else {
		player setVariable ["JJAM_speed", true, true];
		hintSilent parseText format ["%1An admin <t color='#42ebf4'>enable</t> speed for you.", hintHeader];
	};
	player setVariable ["hintTimer", 3];
	while {player getvariable "JJAM_speed"} do {
		player setAnimSpeedCoef 5;
	};
	player setAnimSpeedCoef 1;
};

JJAM_admin_exec_mapTP = {
	if ((isNil {player getVariable "JJAM_mapTP"}) || {!(player getVariable "JJAM_mapTP")}) then {
		player setVariable ["JJAM_mapTP", true, true];
		hint parseText format ["%1 An admin has enabled map teleportation for you!<br /><t color='#f45f42'>ALT + click</t><br />on the map to teleport", hintHeader];
		player onMapSingleClick "if (_alt) then { player setPosATL _pos }";
	} else {
		player setVariable ["JJAM_mapTP", false, true];
		hint parseText format ["%1 An admin has disabled map teleportation for you!", hintHeader];
		player onMapSingleClick "if (_alt) then {};";
	};
	player setVariable ["hintTimer", 6];
};

JJAM_admin_exec_freeze = {
	if (userInputDisabled) then {
		disableUserInput false;
		player setVariable ["JJAM_frozen", false, true];
	} else {
		disableUserInput true;
		player setVariable ["JJAM_frozen", true, true];
	};
	player setVariable ["hintTimer", 3];
};
//Add hint telling the person they have been frozen???

JJAM_admin_exec_markers = {
	if (((isNil {player getVariable "mapMarkers"}) || (isNil {player getVariable "markerList"})) || {!(player getVariable "mapMarkers")}) then {
		player setVariable ["mapMarkers", true, true];
		player setVariable ["markerList", [], true];
		{
			pName = "";
			{pName = pName + _x; pName} forEach ((name _x) splitString " ");
			_markerTest = format ["marker_%1", pName];
			if (!(_markerTest in allMapMarkers)) then {
				_code = format ['createMarkerLocal ["marker_%1", [%2, %3]];
				"marker_%1" setMarkerShapeLocal "ICON";
				"marker_%1" setMarkerTypeLocal "mil_dot";
				"marker_%1" setMarkerColorLocal "ColorPink";
				"marker_%1" setMarkerTextLocal "%1";
				', pName, (position _x select 0), (position _x select 1)];
				call compile _code;
				(player getVariable "markerList") pushback _x;
			};
		} forEach allPlayers;

		[] spawn {
			while {(player getVariable "mapMarkers")} do {
				{
					sName = "";
					{sName = sName + _x; sName} forEach ((name _x) splitString " ");
					_code = format ['"marker_%1" setMarkerPosLocal [%2, %3]',
					sName, (position _x select 0), (position _x select 1)];
					call compile _code;
				} forEach (player getVariable "markerList");
				uiSleep 0.01;
			};
		};
		exit;
	} else {
		player setVariable ["mapMarkers", false, true];
		{
			xName = "";
			{xName = xName + _x; xName} forEach ((name _x) splitString " ");
			deleteMarkerLocal format ["marker_%1", xName];
		} forEach (player getVariable "markerList");

		player setVariable ["markerList", [], true];
	};
};

JJAM_admin_exec_pee = {
	player playMove "Acts_AidlPercMstpSlowWrflDnon_pissing"; sleep 4;
	player allowDamage true; 
	player enableSimulation true;
	player enableSimulationGlobal true;
	player triggerDynamicSimulation true;
	_updateDir = true;
	[_updateDir] spawn {
		while {_this select 0} do {
			pissDir = getDir player;
			uiSleep 0.05;
		};
	};
	[] spawn {
		_stream = "#particlesource" createVehicleLocal [0,0,0];
		_stream setParticleRandom [0,[0.004,0.004,0.004],[0.01,0.01,0.01],30,0.01,[0,0,0,0],1,0.02,360];
		_stream setDropInterval 0.001;
		_stream attachTo [player,[0.1,0.15,-0.10],"Pelvis"] ;
		for "_i" from 0 to 1 step 0.01 do { _stream setParticleParams [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8],"","BillBoard",1,3,[0,0,0],[sin (pissDir) * _i,cos (pissDir) * _i,0],0,1.5,1,0.1,[0.02,0.02,0.1],[[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0]],[1],1,0,"","",_stream,0,true,0.1,[[0.8,0.7,0.2,0]]]; sleep 0.02; }; sleep 4;
		for "_i" from 1 to 0.4 step -0.01 do { _stream setParticleParams [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8],"","BillBoard",1,3,[0,0,0],[sin (pissDir) * _i,cos (pissDir) * _i,0],0,1.5,1,0.1,[0.02,0.02,0.1],[[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0]],[1],1,0,"","",_stream,0,true,0.1,[[0.8,0.7,0.2,0]]]; sleep 0.02;};
		for "_i" from 0.4 to 0.8 step 0.02 do { _stream setParticleParams [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8],"","BillBoard",1,3,[0,0,0],[sin (pissDir) * _i,cos (pissDir) * _i,0],0,1.5,1,0.1,[0.02,0.02,0.1],[[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0]],[1],1,0,"","",_stream,0,true,0.1,[[0.8,0.7,0.2,0]]]; sleep 0.0};
		for "_i" from 0.8 to 0.2 step -0.01 do { _stream setParticleParams [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8],"","BillBoard",1,3,[0,0,0],[sin (pissDir) * _i,cos (pissDir) * _i,0],0,1.5,1,0.1,[0.02,0.02,0.1],[[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0]],[1],1,0,"","",_stream,0,true,0.1,[[0.8,0.7,0.2,0]]]; sleep 0.02;};
		for "_i" from 0.2 to 0.3 step 0.02 do { _stream setParticleParams [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8],"","BillBoard",1,3,[0,0,0],[sin (pissDir) * _i,cos (pissDir) * _i,0],0,1.5,1,0.1,[0.02,0.02,0.1],[[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0]],[1],1,0,"","",_stream,0,true,0.1,[[0.8,0.7,0.2,0]]]; sleep 0.02;};
		for "_i" from 0.3 to 0.1 step -0.01 do { _stream setParticleParams [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8],"","BillBoard",1,3,[0,0,0],[sin (pissDir) * _i,cos (pissDir) * _i,0],0,1.5,1,0.1,[0.02,0.02,0.1],[[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0.1],[0.8,0.7,0.2,0]],[1],1,0,"","",_stream,0,true,0.1,[[0.8,0.7,0.2,0]]]; sleep 0.02;};
		for "_i" from 0.1 to 0 step -0.01 do { _stream setParticleParams [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,8],"","BillBoard",1,3,[0,0,0],[sin (pissDir) * _i,cos (pissDir) * _i,0],0,1.5,1,0.1,[0.02,0.02,0.1],[[0.8,0.7,0.2,_i],[0.8,0.7,0.2,_i],[0.8,0.7,0.2,0]],[1],1,0,"","",_stream,0,true,0.1,[[0.8,0.7,0.2,0]]]; sleep 0.02;};
		deleteVehicle _stream;
	};
	sleep 4.12;
	_updateDir = false;
};

featuresList = [];
{
	featuresList pushback _x;
} forEach featuresOff;
{
	featuresList pushback _x;
} forEach features;
owner _player publicVariableClient "featuresList";

{
	if (_x select 2 == false) exitWith {};
	publicVariable format ["JJAM_admin_exec_%1", _x select 1];
} forEach featuresOff;

{
	if (_X select 2 == false) exitWith {};
	owner _player publicVariableClient format ["JJAM_admin_%1", _x select 1];
} forEach featuresList;

JJAM_adminMenuCode = compile JJAM_adminMenuString;
owner _player publicVariableClient "JJAM_adminMenuCode";
[] remoteExec ["JJAM_adminMenuCode", _player];
