/*
 * fn_superAdminMenu.sqf
 * Author: JJ
 *
 * Args:
 * 1: the player to open the super Admin menu <OBJECT>
 *
 * Return Value:
 * none
 *
 */
params["_player"];

JJAM_fnc_isSuperAdmin = {
	params["_player"];
	_uid = getPlayerUID _player;
	if (_uid in JJAM_superAdmins) exitWith {true};
	false
};
_isAdmin = _player call JJAM_fnc_isSuperAdmin;

if (!JJSuperAdminMenu) exitWith {};
if (!_isAdmin) exitWith {};

JJAM_superAdminMenuString = '

[] spawn {
	with uiNamespace do {
		hintHeader = "<t color=""#41f48c"" size=""2"">JJx Admin Menu</t><br /><t size=""0.68"">by JJ</t><br />-------- -_- --------<br /><br />";
		superAdminMenuDisplay = findDisplay 46 createDisplay "RscDisplayEmpty";
		ctrlBackground = superAdminMenuDisplay ctrlCreate ["RscBackgroundGUI", 2200];
		ctrlBackground2 = superAdminMenuDisplay ctrlCreate ["RscBackgroundGUI", 2201];
		ctrlBackground3 = superAdminMenuDisplay ctrlCreate ["RscBackgroundGUI", 2201];
		ctrltxtName = superAdminMenuDisplay ctrlCreate ["RscText", 1000];
		ctrlbtnClose = superAdminMenuDisplay ctrlCreate ["RscButton", 1600];
		ctrllstPlayers = superAdminMenuDisplay ctrlCreate ["RscListBox", 1500];
		ctrltxtPlayers = superAdminMenuDisplay ctrlCreate ["RscText", 1001];
		ctrllstFeatures = superAdminMenuDisplay ctrlCreate ["RscListBox", 1501];
		ctrltxtFeatures = superAdminMenuDisplay ctrlCreate ["RscText", 1002];
		ctrlbtnExec = superAdminMenuDisplay ctrlCreate ["RscButton", 1601];
		ctrlbtnVariables = superAdminMenuDisplay ctrlCreate ["RscButton", 1604];
		ctrlbtnSpawn = superAdminMenuDisplay ctrlCreate ["RscButton", 1606];
		ctrlbtnDebug = superAdminMenuDisplay ctrlCreate ["RscButton", 1605];
		ctrltxtLoadouts = superAdminMenuDisplay ctrlCreate ["RscText", 1005];
		ctrllstLoadouts = superAdminMenuDisplay ctrlCreate ["RscListBox", 1502];
		ctrledtLoadoutName = superAdminMenuDisplay ctrlCreate ["RscEdit", 1400];
		ctrlbtnLoad = superAdminMenuDisplay ctrlCreate ["RscButton", 1602];
		ctrlbtnSave = superAdminMenuDisplay ctrlCreate ["RscButton", 1603];
		ctrlbtnDelete = superAdminMenuDisplay ctrlCreate ["RscButton", 1607];
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
			with uiNamespace do {
				//do stuff
			};
			false
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
			//execute feature
		}];
		ctrlbtnExec ctrlCommit 0;
		ctrlbtnVariables ctrlSetText "Variable";
		ctrlbtnVariables ctrlSetTooltip "Open Variable menu";
		ctrlbtnVariables ctrlSetPosition [0.23775, 0.72, 0.149852, 0.08];
		ctrlbtnVariableS ctrlAddEventHandler ["ButtonClick", {
			//do stuff
		}];
		ctrlbtnVariables ctrlCommit 0;
		ctrlbtnSpawn ctrlSetText "IDK";
		ctrlbtnSpawn ctrlSetTooltip "Not used";
		ctrlbtnSpawn ctrlSetPosition [0.4125, 0.72, 0.149852, 0.08];
		ctrlbtnSpawn ctrlAddEventHandler ["ButtonClick", {
			//do stuff
		}];
		ctrlbtnSpawn ctrlCommit 0;
		ctrlbtnDebug ctrlSetText "IDK2";
		ctrlbtnDebug ctrlSetTooltip "Not used";
		ctrlbtnDebug ctrlSetPosition [0.575, 0.72, 0.149852, 0.08];
		ctrlbtnDebug ctrlAddEventHandler ["ButtonClick", {
			//do stuff
		}];
		ctrlbtnDebug ctrlCommit 0;
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
					_allLoadouts = profileNamespace getVariable ["jjx_loadouts", []];
					_name = ctrllstLoadouts lbText _index;
					_loadout = _allLoadouts select _index select 1;
					player setUnitLoadout _loadout;
					[_name] spawn {hintSilent parseText format ["%1You equiped loadout<br/><t color=""#42ebf4"">%2</t>", hintHeader, _this select 0];uiSleep 3;hintSilent "";}
				} else { 
					[] spawn {hintSilent parseText format ["%1You need to select a loadout", hintHeader];uiSleep 3;hintSilent "";} 
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
					_allLoadouts = profileNamespace getVariable ["jjx_loadouts", []]; 
					_allLoadouts append [[[_loadoutName], _currentLoadout]]; 
					profileNamespace setVariable ["jjx_loadouts", _allLoadouts];
					[_loadoutName] spawn {hintSilent parseText format ["%1You created loadout<br/><t color=""#42ebf4"">%2</t>", hintHeader, _this select 0];uiSleep 3;hintSilent "";}
				} else {
					[] spawn {hintSilent parseText format ["%1You need to specify a loadout name", hintHeader];uiSleep 3;hintSilent "";}
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
					_allLoadouts = profileNamespace getVariable ["jjx_loadouts", []];
					_name = ctrllstLoadouts lbText _index;
					_allLoadouts deleteAt _index;
					profileNamespace setVariable ["jjx_loadouts", _allLoadouts];
					[_name] spawn {hintSilent parseText format ["%1You deleted loadout<br/><t color=""#42ebf4"">%2</t>", hintHeader, _this select 0];uiSleep 3;hintSilent "";}
				} else { 
					[] spawn {hintSilent parseText format ["%1You need to select a loadout", hintHeader];uiSleep 3;hintSilent "";}
				};
			};
		}];
		ctrlbtnDelete ctrlCommit 0;

		waitUntil {!isNull superAdminMenuDisplay};
		while {!isNull superAdminMenuDisplay} do {
			with uiNamespace do {

				{
					ctrllstPlayers lbAdd name _x;
					ctrllstPlayers ctrlSetEventHandler ["LBDblClick", "call JJAM_admin_playerInfo"];
					ctrllstPlayers lbSetTooltip [ _forEachIndex, format ["Name: %1 ~ Steam: %2 ~ UID: %3", name _x, _x getVariable "steamName", getPlayerUID _x]];
				} forEach allPlayers;

				_allLoadouts = profileNamespace getVariable ["jjx_loadouts", []];
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
							lbAdd [1501, _x select 0];
							lbSetColor [1501,  _forEachIndex, jjx_admin_custom];
						};
						case "god": {
							_player = playerList select (lbCurSel 1500);
							if (isDamageAllowed _player) then {
								lbAdd [1501, format ["%1 - OFF", _x select 0]];
								lbSetColor [1501,  _forEachIndex, jjx_admin_red];
								lbSetTooltip [1501, _forEachIndex, _x select 3];
							} else {
								lbAdd [1501, format ["%1 - ON", _x select 0]];
								lbSetColor [1501, _forEachIndex, jjx_admin_green];
								lbSetTooltip [1501, _forEachIndex, _x select 3];
							};
						};
						case "vehGod": {
							_player = playerList select (lbCurSel 1500);
							_vehicle = objectParent _player;
							if (isNull _vehicle) then {
								lbAdd [1501, format ["%1 - OFF", _x select 0]];
								lbSetColor [1501,  _forEachIndex, jjx_admin_red];
								lbSetTooltip [1501, _forEachIndex, _x select 3];
							} else {
								if (isDamageAllowed _vehicle) then {
									lbAdd [1501, format ["%1 - OFF", _x select 0]];
									lbSetColor [1501,  _forEachIndex, jjx_admin_red];
									lbSetTooltip [1501, _forEachIndex, _x select 3];
								} else {
									lbAdd [1501, format ["%1 - ON", _x select 0]];
									lbSetColor [1501, _forEachIndex, jjx_admin_green];
									lbSetTooltip [1501, _forEachIndex, _x select 3];
								};
							};
						};
						case "ammo": {
							if ((lbCurSel 1500) != -1) then {
								if (isNil {((playerList select (lbCurSel 1500)) getVariable "jjx_ammo")} || {!((playerList select (lbCurSel 1500)) getVariable "jjx_ammo")}) then {
									lbAdd [1501, format ["%1 - OFF", _x select 0]];
									lbSetColor [1501,  _forEachIndex, jjx_admin_red];
									lbSetTooltip [1501, _forEachIndex, _x select 3];
								} else {
									lbAdd [1501, format ["%1 - ON", _x select 0]];
									lbSetColor [1501, _forEachIndex, jjx_admin_green];
									lbSetTooltip [1501, _forEachIndex, _x select 3];
								};
							} else {
								lbAdd [1501, format ["%1 - OFF", _x select 0]];
								lbSetColor [1501,  _forEachIndex, jjx_admin_red];
								lbSetTooltip [1501, _forEachIndex, _x select 3];
							};
						};
						case "invis": {
							_player = playerList select (lbCurSel 1500);
							if (isObjectHidden _player) then {
								lbAdd [1501, format ["%1 - ON", _x select 0]];
								lbSetColor [1501, _forEachIndex, jjx_admin_green];
								lbSetTooltip [1501, _forEachIndex, _x select 3];
							} else {
								lbAdd [1501, format ["%1 - OFF", _x select 0]];
								lbSetColor [1501,  _forEachIndex, jjx_admin_red];
								lbSetTooltip [1501, _forEachIndex, _x select 3];
							};
						};
						case "rapid": {
							if ((lbCurSel 1500) != -1) then {
								if (isNil {((playerList select (lbCurSel 1500)) getVariable "jjx_rapid")} || {!((playerList select (lbCurSel 1500)) getVariable "jjx_rapid")}) then {
									lbAdd [1501, format ["%1 - OFF", _x select 0]];
									lbSetColor [1501,  _forEachIndex, jjx_admin_red];
									lbSetTooltip [1501, _forEachIndex, _x select 3];
								} else {
									lbAdd [1501, format ["%1 - ON", _x select 0]];
									lbSetColor [1501, _forEachIndex, jjx_admin_green];
									lbSetTooltip [1501, _forEachIndex, _x select 3];
								};
							} else {
								lbAdd [1501, format ["%1 - OFF", _x select 0]];
								lbSetColor [1501,  _forEachIndex, jjx_admin_red];
								lbSetTooltip [1501, _forEachIndex, _x select 3];
							};
						};
						case "recoil": {
							_player = playerList select (lbCurSel 1500);
							if (unitRecoilCoefficient _player != 0) then {
								lbAdd [1501, format ["%1 - OFF", _x select 0]];
								lbSetColor [1501,  _forEachIndex, jjx_admin_red];
								lbSetTooltip [1501, _forEachIndex, _x select 3];
							} else {
								lbAdd [1501, format ["%1 - ON", _x select 0]];
								lbSetColor [1501, _forEachIndex, jjx_admin_green];
								lbSetTooltip [1501, _forEachIndex, _x select 3];
							};
						};
						case "sway": {
							if ((lbCurSel 1500) != -1) then {
								if (isNil {((playerList select (lbCurSel 1500)) getVariable "jjx_sway")} || {!((playerList select (lbCurSel 1500)) getVariable "jjx_sway")}) then {
									lbAdd [1501, format ["%1 - OFF", _x select 0]];
									lbSetColor [1501,  _forEachIndex, jjx_admin_red];
									lbSetTooltip [1501, _forEachIndex, _x select 3];
								} else {
									lbAdd [1501, format ["%1 - ON", _x select 0]];
									lbSetColor [1501, _forEachIndex, jjx_admin_green];
									lbSetTooltip [1501, _forEachIndex, _x select 3];
								};
							} else {
								lbAdd [1501, format ["%1 - OFF", _x select 0]];
								lbSetColor [1501,  _forEachIndex, jjx_admin_red];
								lbSetTooltip [1501, _forEachIndex, _x select 3];
							};
						};
						case "speed": {
							if ((lbCurSel 1500) != -1) then {
								if (isNil {((playerList select (lbCurSel 1500)) getVariable "jjx_speed")} || {!((playerList select (lbCurSel 1500)) getVariable "jjx_speed")}) then {
									lbAdd [1501, format ["%1 - OFF", _x select 0]];
									lbSetColor [1501,  _forEachIndex, jjx_admin_red];
									lbSetTooltip [1501, _forEachIndex, _x select 3];
								} else {
									lbAdd [1501, format ["%1 - ON", _x select 0]];
									lbSetColor [1501, _forEachIndex, jjx_admin_green];
									lbSetTooltip [1501, _forEachIndex, _x select 3];
								};
							} else {
								lbAdd [1501, format ["%1 - OFF", _x select 0]];
								lbSetColor [1501,  _forEachIndex, jjx_admin_red];
								lbSetTooltip [1501, _forEachIndex, _x select 3];
							};
						};
						case "mapTP": {
							if ((lbCurSel 1500) != -1) then {
								if (isNil {((playerList select (lbCurSel 1500)) getVariable "jjx_mapTP")} || {!((playerList select (lbCurSel 1500)) getVariable "jjx_mapTP")}) then {
									lbAdd [1501, format ["%1 - OFF", _x select 0]];
									lbSetColor [1501,  _forEachIndex, jjx_admin_red];
									lbSetTooltip [1501, _forEachIndex, _x select 3];
								} else {
									lbAdd [1501, format ["%1 - ON", _x select 0]];
									lbSetColor [1501, _forEachIndex, jjx_admin_green];
									lbSetTooltip [1501, _forEachIndex, _x select 3];
								};
							} else {
								lbAdd [1501, format ["%1 - OFF", _x select 0]];
								lbSetColor [1501,  _forEachIndex, jjx_admin_red];
								lbSetTooltip [1501, _forEachIndex, _x select 3];
							};
						};
						case "freeze": {
							if ((lbCurSel 1500) != -1) then {
								if (isNil {((playerList select (lbCurSel 1500)) getVariable "jjx_frozen")} || {!((playerList select (lbCurSel 1500)) getVariable "jjx_frozen")}) then {
									lbAdd [1501, format ["%1 - OFF", _x select 0]];
									lbSetColor [1501,  _forEachIndex, jjx_admin_red];
									lbSetTooltip [1501, _forEachIndex, _x select 3];
								} else {
									lbAdd [1501, format ["%1 - ON", _x select 0]];
									lbSetColor [1501, _forEachIndex, jjx_admin_green];
									lbSetTooltip [1501, _forEachIndex, _x select 3];
								};
							} else {
								lbAdd [1501, format ["%1 - OFF", _x select 0]];
								lbSetColor [1501,  _forEachIndex, jjx_admin_red];
								lbSetTooltip [1501, _forEachIndex, _x select 3];
							};
						};
						case "markers": {
							if ((lbCurSel 1500) != -1) then {
								if (isNil {((playerList select (lbCurSel 1500)) getVariable "mapMarkers")} || {!((playerList select (lbCurSel 1500)) getVariable "mapMarkers")}) then {
									lbAdd [1501, format ["%1 - OFF", _x select 0]];
									lbSetColor [1501,  _forEachIndex, jjx_admin_red];
									lbSetTooltip [1501, _forEachIndex, _x select 3];
								} else {
									lbAdd [1501, format ["%1 - ON", _x select 0]];
									lbSetColor [1501, _forEachIndex, jjx_admin_green];
									lbSetTooltip [1501, _forEachIndex, _x select 3];
								};
							} else {
								lbAdd [1501, format ["%1 - OFF", _x select 0]];
								lbSetColor [1501,  _forEachIndex, jjx_admin_red];
								lbSetTooltip [1501, _forEachIndex, _x select 3];
							};
						};
						default {
							lbAdd [1501, _x select 0];
							lbSetTooltip [1501, _forEachIndex, _x select 3];
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
	};
};

';

features = [
	["-=- Options -=-", "header", false, ""],
	["Kill", "kill", true, "Select a player to kill"],
	["Heal", "heal", true, "Select a player to heal"],
	["TP to player", "tpToPlayer", true, "Select a player to teleport to"],
	["TP player here", "tpPlayerHere", true, "Select a player to teleport them here"],
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
	["Go to lobby", "lobby", true, "Select a player to send them to the lobby"],
	["Player info", "info", true, "Get info on the selected player"]
];
featuresOff = [
	["-=- Toggleable -=-", "header", false, ""],
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

featuresList = [];
{
	featuresList pushback _x;
} forEach featuresOff;
{
	featuresList pushback _x;
} forEach features;
owner _player publicVariableClient "featuresList";

/*
JJAM_admin_ammo = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You toggled Infinite Ammo for<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];
	remoteExec ["jjx_admin_exec_ammo", _player];
	uiSleep 3;hintSilent "";
};
JJAM_admin_exec_ammo = {
	if (isNil {player getvariable "jjx_ammo"}) then {
		player setVariable ["jjx_ammo", false, true];
	};
	if (player getvariable "jjx_ammo") then {
		player removeEventHandler ["fired", ammoHandler];
		player setVariable ["jjx_ammo", false, true];
		hintSilent parseText format ["%1An admin <t color='#42ebf4'>disabled</t> infinite ammo for you.", hintHeader];[] spawn {uiSleep 3;hintSilent "";};
	} else {
		ammoHandler = player addEventHandler ["fired", {player setAmmo [currentWeapon player, 1000000];}];
		player setVariable ["jjx_ammo", true, true];
		hintSilent parseText format ["%1An admin <t color='#42ebf4'>enabled</t> infinite ammo for you.", hintHeader];[] spawn {uiSleep 3;hintSilent "";};
	};
};
*/

JJAM_superAdminMenuCode = compile JJAM_superAdminMenuString;
owner _player publicVariableClient "JJAM_superAdminMenuCode";
[] remoteExec ["JJAM_superAdminMenuCode", _player];

/*
		JJAM_admin_red = [ 1, 0.22, 0.22, 1];
		JJAM_admin_green = [ 0.22, 0.7, 0.2, 1];
		JJAM_admin_custom = [(profilenamespace getvariable ["GUI_BCG_RGB_R",0.13]),(profilenamespace getvariable ["GUI_BCG_RGB_G",0.54]),(profilenamespace getvariable ["GUI_BCG_RGB_B",0.21]),1];

		while {true} do {
			waitUntil {userInputDisabled};
			disableUserInput false;
			hintSilent parseText format ["%1 Someone tried to freeze you!<br />Don''t worry, I saved you", hintHeader];[] spawn {uiSleep 4;hintSilent "";};
		};

		JJAM_admin_exec = {
			params ["_player","_feature"];
			if (_feature != -1) then {
				JJAM_code = format ["[%1] spawn jjx_admin_%2", _player, (featuresList select _feature) select 1];
				publicVariableServer "JJAM_code";
				[compile JJAM_code] remoteExec ["call", 2];
			} else {
				hintSilent parseText format ["%1Please select a feature to execute.", hintHeader];[] spawn {;uiSleep 4;hintSilent "";};
			};
		};

		JJAM_admin_playerInfo = {
			params["_idc", "_selectedIndex"];
			_infoName = format ["Name: %1", name (playerList select _selectedIndex)];
			_infoSteam = format ["Steam: %1", (playerList select _selectedIndex) getVariable "steamName"];
			_infoUID = format ["UID: %1", getPlayerUID (playerList select _selectedIndex)];
			_infoLoadout = getUnitLoadout (playerList select _selectedIndex);
			copyToClipboard format ["%1 -> %2 ~ %3 ~ %4 ~~ -_- ~~ Loadout below %5", "JJX admin menu", _infoName, _infoSteam, _infoUID, _infoLoadout];
			hintSilent parseText format ["%1 %2 <br /> %3 <br /> %4 <br /><br /> <t size=''1.6'' color=''#f45f42''>The players equipment was copied to clipboard, press CTRL+V in a note program to paste it.</t>", hintHeader, _infoName, _infoSteam, _infoUID]; [] spawn {uiSleep 4;hintSilent "";};
		};
*/



/*
jjx_admin_update = {
	while {!isNull (findDisplay 1000)} do {


		{
			switch(_x select 1) do {
				case "header": {
					lbAdd [1501, _x select 0];
					lbSetColor [1501,  _forEachIndex, jjx_admin_custom];
				};
				case "god": {
					_player = playerList select (lbCurSel 1500);
					if (isDamageAllowed _player) then {
						lbAdd [1501, format ["%1 - OFF", _x select 0]];
						lbSetColor [1501,  _forEachIndex, jjx_admin_red];
						lbSetTooltip [1501, _forEachIndex, _x select 3];
					} else {
						lbAdd [1501, format ["%1 - ON", _x select 0]];
						lbSetColor [1501, _forEachIndex, jjx_admin_green];
						lbSetTooltip [1501, _forEachIndex, _x select 3];
					};
				};
				case "vehGod": {
					_player = playerList select (lbCurSel 1500);
					_vehicle = objectParent _player;
					if (isNull _vehicle) then {
						lbAdd [1501, format ["%1 - OFF", _x select 0]];
						lbSetColor [1501,  _forEachIndex, jjx_admin_red];
						lbSetTooltip [1501, _forEachIndex, _x select 3];
					} else {
						if (isDamageAllowed _vehicle) then {
							lbAdd [1501, format ["%1 - OFF", _x select 0]];
							lbSetColor [1501,  _forEachIndex, jjx_admin_red];
							lbSetTooltip [1501, _forEachIndex, _x select 3];
						} else {
							lbAdd [1501, format ["%1 - ON", _x select 0]];
							lbSetColor [1501, _forEachIndex, jjx_admin_green];
							lbSetTooltip [1501, _forEachIndex, _x select 3];
						};
					};
				};
				case "ammo": {
					if ((lbCurSel 1500) != -1) then {
						if (isNil {((playerList select (lbCurSel 1500)) getVariable "jjx_ammo")} || {!((playerList select (lbCurSel 1500)) getVariable "jjx_ammo")}) then {
							lbAdd [1501, format ["%1 - OFF", _x select 0]];
							lbSetColor [1501,  _forEachIndex, jjx_admin_red];
							lbSetTooltip [1501, _forEachIndex, _x select 3];
						} else {
							lbAdd [1501, format ["%1 - ON", _x select 0]];
							lbSetColor [1501, _forEachIndex, jjx_admin_green];
							lbSetTooltip [1501, _forEachIndex, _x select 3];
						};
					} else {
						lbAdd [1501, format ["%1 - OFF", _x select 0]];
						lbSetColor [1501,  _forEachIndex, jjx_admin_red];
						lbSetTooltip [1501, _forEachIndex, _x select 3];
					};
				};
				case "invis": {
					_player = playerList select (lbCurSel 1500);
					if (isObjectHidden _player) then {
						lbAdd [1501, format ["%1 - ON", _x select 0]];
						lbSetColor [1501, _forEachIndex, jjx_admin_green];
						lbSetTooltip [1501, _forEachIndex, _x select 3];
					} else {
						lbAdd [1501, format ["%1 - OFF", _x select 0]];
						lbSetColor [1501,  _forEachIndex, jjx_admin_red];
						lbSetTooltip [1501, _forEachIndex, _x select 3];
					};
				};
				case "rapid": {
					if ((lbCurSel 1500) != -1) then {
						if (isNil {((playerList select (lbCurSel 1500)) getVariable "jjx_rapid")} || {!((playerList select (lbCurSel 1500)) getVariable "jjx_rapid")}) then {
							lbAdd [1501, format ["%1 - OFF", _x select 0]];
							lbSetColor [1501,  _forEachIndex, jjx_admin_red];
							lbSetTooltip [1501, _forEachIndex, _x select 3];
						} else {
							lbAdd [1501, format ["%1 - ON", _x select 0]];
							lbSetColor [1501, _forEachIndex, jjx_admin_green];
							lbSetTooltip [1501, _forEachIndex, _x select 3];
						};
					} else {
						lbAdd [1501, format ["%1 - OFF", _x select 0]];
						lbSetColor [1501,  _forEachIndex, jjx_admin_red];
						lbSetTooltip [1501, _forEachIndex, _x select 3];
					};
				};
				case "recoil": {
					_player = playerList select (lbCurSel 1500);
					if (unitRecoilCoefficient _player != 0) then {
						lbAdd [1501, format ["%1 - OFF", _x select 0]];
						lbSetColor [1501,  _forEachIndex, jjx_admin_red];
						lbSetTooltip [1501, _forEachIndex, _x select 3];
					} else {
						lbAdd [1501, format ["%1 - ON", _x select 0]];
						lbSetColor [1501, _forEachIndex, jjx_admin_green];
						lbSetTooltip [1501, _forEachIndex, _x select 3];
					};
				};
				case "sway": {
					if ((lbCurSel 1500) != -1) then {
						if (isNil {((playerList select (lbCurSel 1500)) getVariable "jjx_sway")} || {!((playerList select (lbCurSel 1500)) getVariable "jjx_sway")}) then {
							lbAdd [1501, format ["%1 - OFF", _x select 0]];
							lbSetColor [1501,  _forEachIndex, jjx_admin_red];
							lbSetTooltip [1501, _forEachIndex, _x select 3];
						} else {
							lbAdd [1501, format ["%1 - ON", _x select 0]];
							lbSetColor [1501, _forEachIndex, jjx_admin_green];
							lbSetTooltip [1501, _forEachIndex, _x select 3];
						};
					} else {
						lbAdd [1501, format ["%1 - OFF", _x select 0]];
						lbSetColor [1501,  _forEachIndex, jjx_admin_red];
						lbSetTooltip [1501, _forEachIndex, _x select 3];
					};
				};
				case "speed": {
					if ((lbCurSel 1500) != -1) then {
						if (isNil {((playerList select (lbCurSel 1500)) getVariable "jjx_speed")} || {!((playerList select (lbCurSel 1500)) getVariable "jjx_speed")}) then {
							lbAdd [1501, format ["%1 - OFF", _x select 0]];
							lbSetColor [1501,  _forEachIndex, jjx_admin_red];
							lbSetTooltip [1501, _forEachIndex, _x select 3];
						} else {
							lbAdd [1501, format ["%1 - ON", _x select 0]];
							lbSetColor [1501, _forEachIndex, jjx_admin_green];
							lbSetTooltip [1501, _forEachIndex, _x select 3];
						};
					} else {
						lbAdd [1501, format ["%1 - OFF", _x select 0]];
						lbSetColor [1501,  _forEachIndex, jjx_admin_red];
						lbSetTooltip [1501, _forEachIndex, _x select 3];
					};
				};
				case "mapTP": {
					if ((lbCurSel 1500) != -1) then {
						if (isNil {((playerList select (lbCurSel 1500)) getVariable "jjx_mapTP")} || {!((playerList select (lbCurSel 1500)) getVariable "jjx_mapTP")}) then {
							lbAdd [1501, format ["%1 - OFF", _x select 0]];
							lbSetColor [1501,  _forEachIndex, jjx_admin_red];
							lbSetTooltip [1501, _forEachIndex, _x select 3];
						} else {
							lbAdd [1501, format ["%1 - ON", _x select 0]];
							lbSetColor [1501, _forEachIndex, jjx_admin_green];
							lbSetTooltip [1501, _forEachIndex, _x select 3];
						};
					} else {
						lbAdd [1501, format ["%1 - OFF", _x select 0]];
						lbSetColor [1501,  _forEachIndex, jjx_admin_red];
						lbSetTooltip [1501, _forEachIndex, _x select 3];
					};
				};
				case "freeze": {
					if ((lbCurSel 1500) != -1) then {
						if (isNil {((playerList select (lbCurSel 1500)) getVariable "jjx_frozen")} || {!((playerList select (lbCurSel 1500)) getVariable "jjx_frozen")}) then {
							lbAdd [1501, format ["%1 - OFF", _x select 0]];
							lbSetColor [1501,  _forEachIndex, jjx_admin_red];
							lbSetTooltip [1501, _forEachIndex, _x select 3];
						} else {
							lbAdd [1501, format ["%1 - ON", _x select 0]];
							lbSetColor [1501, _forEachIndex, jjx_admin_green];
							lbSetTooltip [1501, _forEachIndex, _x select 3];
						};
					} else {
						lbAdd [1501, format ["%1 - OFF", _x select 0]];
						lbSetColor [1501,  _forEachIndex, jjx_admin_red];
						lbSetTooltip [1501, _forEachIndex, _x select 3];
					};
				};
				case "markers": {
					if ((lbCurSel 1500) != -1) then {
						if (isNil {((playerList select (lbCurSel 1500)) getVariable "mapMarkers")} || {!((playerList select (lbCurSel 1500)) getVariable "mapMarkers")}) then {
							lbAdd [1501, format ["%1 - OFF", _x select 0]];
							lbSetColor [1501,  _forEachIndex, jjx_admin_red];
							lbSetTooltip [1501, _forEachIndex, _x select 3];
						} else {
							lbAdd [1501, format ["%1 - ON", _x select 0]];
							lbSetColor [1501, _forEachIndex, jjx_admin_green];
							lbSetTooltip [1501, _forEachIndex, _x select 3];
						};
					} else {
						lbAdd [1501, format ["%1 - OFF", _x select 0]];
						lbSetColor [1501,  _forEachIndex, jjx_admin_red];
						lbSetTooltip [1501, _forEachIndex, _x select 3];
					};
				};
				default {
					lbAdd [1501, _x select 0];
					lbSetTooltip [1501, _forEachIndex, _x select 3];
				};
			};
		} forEach featuresList;

	};
};



// FEATURES


jjx_admin_god = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	if (isDamageAllowed _player) then {
		[_player, false] remoteExec ["allowDamage", 2];
		hintSilent parseText format ["%1You made<br/><t color='#42ebf4'>%2</t><br />immortal", hintHeader, name _player];uiSleep 3;hintSilent "";
	} else {
		[_player, true] remoteExec ["allowDamage", 2];
		hintSilent parseText format ["%1You made<br/><t color='#42ebf4'>%2</t><br />mortal", hintHeader, name _player];uiSleep 3;hintSilent "";
	};
};

jjx_admin_vehGod = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	_vehicle = objectParent _player;
	if (_vehicle isEqualTo objNull) then {
		hintSilent parseText format ["%1<t color='#42ebf4'>%2</t><br />is not in a vehicle.", hintHeader, _player];
	} else {
		if (isDamageAllowed _vehicle) then {
			[objectParent _player, false] remoteExec ["allowDamage", 2];
			hintSilent parseText format ["%1You made<br /><t color='#42ebf4'>%2's</t><br /> vehicle <t color='#42ebf4'>immortal</t>", hintHeader, _player];[] spawn {uiSleep 3;hintSilent "";};
		} else {
			[objectParent _player, true] remoteExec ["allowDamage", 2];
			hintSilent parseText format ["%1You made<br /><t color='#42ebf4'>%2's</t><br /> vehicle <t color='#42ebf4'>mortal</t>", hintHeader, _player];[] spawn {uiSleep 3;hintSilent "";};
		};
	};
};

jjx_admin_ammo = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You toggled Infinite Ammo for<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];
	remoteExec ["jjx_admin_exec_ammo", _player];
	uiSleep 3;hintSilent "";
};

jjx_admin_invis = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You toggled Invisability for<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];
	if (isObjectHidden _player) then {
		[_player, false] remoteExec ["hideObjectGlobal", 2];
	} else {
		[_player, true] remoteExec ["hideObjectGlobal", 2];
	};
	uiSleep 3;hintSilent "";
};

jjx_admin_rapid = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You toggled Rapid fire for<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];
	remoteExec ["jjx_admin_exec_rapid", _player];
	uiSleep 3;hintSilent "";
};

jjx_admin_recoil = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You toggled zero recoil for<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];
	remoteExec ["jjx_admin_exec_recoil", _player];
	uiSleep 3;hintSilent "";
};

jjx_admin_sway = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You toggled zero sway for<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];
	remoteExec ["jjx_admin_exec_sway", _player];
	uiSleep 3;hintSilent "";
};

jjx_admin_speed = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You toggled speed for<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];
	remoteExec ["jjx_admin_exec_speed", _player];
	uiSleep 3;hintSilent "";
};

jjx_admin_kill = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You killed<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];
	[_player, 1] remoteExec ["setDamage", 2];
	uiSleep 3;hintSilent "";
};

jjx_admin_heal = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	if (isClass (configFile >> 'CfgPatches' >> 'ace_main')) then {
		[player] remoteExecCall ["ace_medical_treatment_fnc_fullHealLocal", _player];
		hintSilent parseText format ["%1You Ace healed<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];
	} else {
		[_player, 0] remoteExec ["setDamage", 2];
		hintSilent parseText format ["%1You healed<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];
	};
	uiSleep 3;hintSilent "";
};

jjx_admin_tpToPlayer = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You teleported to<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];
	player setPosASL (getPosASL _player);
	uiSleep 3;hintSilent "";
};

jjx_admin_tpPlayerHere = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You teleported<br/><t color='#42ebf4'>%2</t><br />to you", hintHeader, name _player];
	_player setPosASL (getPosASL player);
	uiSleep 3;hintSilent "";
};

jjx_admin_mapTP = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You toggled map TP for<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];
	remoteExec ["jjx_admin_exec_mapTP", _player];
	uiSleep 3;hintSilent "";
};

jjx_admin_freeze = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	if (_player == player) then {
		hintSilent parseText format ["%1You tried to freeze yourself!<br />Don't worry I saved you", hintHeader];uiSleep 3;hintSilent "";
	} else {
		hintSilent parseText format ["%1You toggled freeze for<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];
		remoteExec ["jjx_admin_exec_freeze", _player];
		uiSleep 3;hintSilent "";
	};
};

jjx_admin_repair = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You repaired<br/><t color='#42ebf4'>%2's</t><br />vehicle", hintHeader, name _player];
	[objectParent _player, 0] remoteExec ["setDamage", 2];
	uiSleep 3;hintSilent "";
};

jjx_admin_delete = {
	if !(isNull objectParent player) then {
		hintSilent parseText format ["%1You deleted your<br/><t color='#42ebf4'>%2</t>", hintHeader, typeOf objectParent player];
		deleteVehicle (objectParent player);
		uiSleep 3;hintSilent "";
	} else {
		hintSilent parseText format ["%1You deleted<br/><t color='#42ebf4'>%2</t>", hintHeader, typeOf cursorObject];
		deleteVehicle cursorObject;
		uiSleep 3;hintSilent "";
	};
};

jjx_admin_explode = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You exploded<br/><t color='#42ebf4'>%2's</t><br />vehicle", hintHeader, name _player];
	[objectParent _player, [1, true]] remoteExec ["setDamage", 2];
	uiSleep 3;hintSilent "";
};
jjx_admin_destroy = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You destroyed<br/><t color='#42ebf4'>%2's</t><br />vehicle", hintHeader, name _player];
	[objectParent _player, [1, false]] remoteExec ["setDamage", 2];
	uiSleep 3;hintSilent "";
};

jjx_admin_spectator = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	if (_player == player) then {
		hintSilent parseText format ["%1You can't spectate yourself!", hintHeader];uiSleep 3;hintSilent "";
	} else {
		hintSilent parseText format ["%1You are now spectating<br/><t color='#42ebf4'>%2</t><br />to stop spectating press F10", hintHeader, name _player];
		switchCamera _player;
		stopSpectating = (findDisplay 46) displayAddEventHandler ["KeyDown",
			"if ((_this select 1) == 68) then {
				(findDisplay 46) displayRemoveEventHandler ['KeyDown', stopSpectating];
				switchCamera player;
			};false"
		];
		uiSleep 3;hintSilent "";
	};
};

jjx_admin_markers = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You enabled map markers for<br/><t color='#42ebf4'>%2</t>", hintHeader, name _player];
	remoteExec ["jjx_admin_exec_markers", _player];
	uiSleep 3;hintSilent "";
};

jjx_admin_freecam = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You put<br/><t color='#42ebf4'>%2</t><br />in to spectator", hintHeader, name _player];
	([] execVM "a3\functions_f\Debug\fn_camera.sqf") remoteExec ["call", _player];
	if (_player == player) then {closeDialog 2;};
	uiSleep 3;hintSilent "";
};

jjx_admin_lobby = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You sent<br/><t color='#42ebf4'>%2</t><br />to the lobby", hintHeader, name _player];
	((findDisplay 46) closeDisplay 0)remoteExec ["call", _player];
	uiSleep 3;hintSilent "";
};

jjx_admin_arsenal = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You put<br/><t color='#42ebf4'>%2</t><br />in to the arsenal", hintHeader, name _player];
	if (isClass (configFile >> 'CfgPatches' >> 'ace_main')) then {
		[_player, _player, true] remoteExec ["ace_arsenal_fnc_openBox", 2];
	} else {
		["Open", true] remoteExec ["BIS_fnc_arsenal", _player];
	};
	if (player == _player) then {
		closeDialog 2;
	};
	uiSleep 3;hintSilent "";
};
jjx_admin_remoteArsenal = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You opened<br/><t color='#42ebf4'>%2</t>'s<br />arsenal", hintHeader, name _player];
	if (isClass (configFile >> 'CfgPatches' >> 'ace_main')) then {
		[_player, player, true] remoteExec ["ace_arsenal_fnc_openBox", 2];
	} else {
		["Open", [true, _player, _player]] call BIS_fnc_arsenal;
	};
	if (player == _player) then {
		closeDialog 2;
	};
	uiSleep 3;hintSilent "";
};

jjx_admin_garage = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You put<br/><t color='#42ebf4'>%2</t><br />in to the garage", hintHeader, name _player];
	_pos = _player getPos [30, getDir _player];
	_vehicle = createVehicle [ "Land_HelipadEmpty_F", _pos, [], 0, "CAN_COLLIDE"];
	if (player == _player) then {
		closeDialog 2;
		waitUntil {isNull (findDisplay 1000)};
		["Open", [true, _vehicle]] remoteExec ["BIS_fnc_garage", _player];
	} else {
		["Open", [true, _vehicle]] remoteExec ["BIS_fnc_garage", _player];
	};
	uiSleep 3;hintSilent "";
};

jjx_admin_takeLoadout = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You took<br/><t color='#42ebf4'>%2's</t><br />loadout", hintHeader, name _player];
	player setUnitLoadout (getUnitLoadout _player);
	uiSleep 3;hintSilent "";
};

jjx_admin_giveLoadout = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You gave<br/><t color='#42ebf4'>%2</t><br />your loadout", hintHeader, name _player];
	_player setUnitLoadout (getUnitLoadout player);
	uiSleep 3;hintSilent "";
};

jjx_admin_info = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1<t size='1.2' color='#f4e242'>Name: </t><br />%2<br /><br /><t size='1.2' color='#f4e242'>UID: </t><br />%3<br /><br /><t size='1.2' color='#f4e242'>Position: </t><br />%4<br /><br /><t size='1.2' color='#f4e242'>Equiptment: </t><br />%5<br /><br /><t size='1.6' color='#f45f42'>Player equipment copied to clipboard.</t>", hintHeader, name _player, getPlayerUID _player, position _player, getUnitLoadout _player];
	copyToClipboard str(getUnitLoadout _player);
	uiSleep 10;hintSilent "";
};

jjx_admin_pee = {
	params["_selectedIndex"];
	_player = playerList select _selectedIndex;
	hintSilent parseText format ["%1You made<br/><t color='#42ebf4'>%2</t><br />have a sudden urge to pee", hintHeader, name _player];
	remoteExec ["jjx_admin_exec_pee", _player];
	uiSleep 3;hintSilent "";
};

// REMOTE code

jjx_admin_exec_ammo = {
	if (isNil {player getvariable "jjx_ammo"}) then {
		player setVariable ["jjx_ammo", false, true];
	};
	if (player getvariable "jjx_ammo") then {
		player removeEventHandler ["fired", ammoHandler];
		player setVariable ["jjx_ammo", false, true];
		hintSilent parseText format ["%1An admin <t color='#42ebf4'>disabled</t> infinite ammo for you.", hintHeader];[] spawn {uiSleep 3;hintSilent "";};
	} else {
		ammoHandler = player addEventHandler ["fired", {player setAmmo [currentWeapon player, 1000000];}];
		player setVariable ["jjx_ammo", true, true];
		hintSilent parseText format ["%1An admin <t color='#42ebf4'>enabled</t> infinite ammo for you.", hintHeader];[] spawn {uiSleep 3;hintSilent "";};
	};
};

jjx_admin_exec_rapid = {
	if (isNil {player getvariable "jjx_rapid"}) then {
		player setVariable ["jjx_rapid", false, true];
	};
	if (player getvariable "jjx_rapid") then {
		player setVariable ["jjx_rapid", false, true];
		hintSilent parseText format ["%1An admin <t color='#42ebf4'>disabled</t> rapid fire for you.", hintHeader];[] spawn {uiSleep 3;hintSilent "";};
	} else {
		player setVariable ["jjx_rapid", true, true];
		hintSilent parseText format ["%1An admin <t color='#42ebf4'>enabled</t> rapid fire fro you.", hintHeader];[] spawn {uiSleep 3;hintSilent "";};
	};
	while {player getvariable "jjx_rapid"} do {
		_vehicle = objectParent player;
		if (isNull _vehicle) then {
			player setWeaponReloadingTime[player, currentWeapon player, 0];
		} else {
			_vehicle setWeaponReloadingTime[_vehicle, currentWeapon _vehicle, 0];
		};
    	uiSleep 0.01;
	};
};

jjx_admin_exec_recoil = {
	if (unitRecoilCoefficient player == 0) then {
		player setUnitRecoilCoefficient 1;
		hintSilent parseText format ["%1An admin <t color='#42ebf4'>disabled</t> weapon recoil for you.", hintHeader];[] spawn {uiSleep 3;hintSilent "";};
	} else {
		player setUnitRecoilCoefficient 0;
		hintSilent parseText format ["%1An admin <t color='#42ebf4'>enable</t> weapon recoil for you.", hintHeader];[] spawn {uiSleep 3;hintSilent "";};
	};
};

jjx_admin_exec_sway = {
	if (isNil {player getvariable "jjx_sway"}) then {
		player setVariable ["jjx_sway", false];
	};
	if (player getvariable "jjx_sway") then {
		player setVariable ["jjx_sway", false];
		hintSilent parseText format ["%1An admin <t color='#42ebf4'>disabled</t> weapon sway for you.", hintHeader];[] spawn {uiSleep 3;hintSilent "";};
	} else {
		player setVariable ["jjx_sway", true];
		hintSilent parseText format ["%1An admin <t color='#42ebf4'>enable</t> weapon sway fro you.", hintHeader];[] spawn {uiSleep 3;hintSilent "";};
	};
	while {player getvariable "jjx_sway"} do {
		player setCustomAimCoef 0;
	};
	player setCustomAimCoef 1;
};

jjx_admin_exec_speed = {
	if (isNil {player getvariable "jjx_speed"}) then {
		player setVariable ["jjx_speed", false];
		call "jjx_admin_exec_speed";
	};
	if (player getvariable "jjx_speed") then {
		player setVariable ["jjx_speed", false];
		hintSilent parseText format ["%1An admin <t color='#42ebf4'>disabled</t> speed for you.", hintHeader];[] spawn {uiSleep 3;hintSilent "";};
	} else {
		player setVariable ["jjx_speed", true];
		hintSilent parseText format ["%1An admin <t color='#42ebf4'>enable</t> speed for you.", hintHeader];[] spawn {uiSleep 3;hintSilent "";};
	};
	while {player getvariable "jjx_speed"} do {
		player setAnimSpeedCoef 5;
	};
	player setAnimSpeedCoef 1;
};

jjx_admin_exec_mapTP = {
	if ((isNil {player getVariable "jjx_mapTP"}) || {!(player getVariable "jjx_mapTP")}) then {
		player setVariable ["jjx_mapTP", true, true];
		hint parseText format ["%1 An admin has enabled map teleportation for you!<br /><t color='#f45f42'>ALT + click</t><br />on the map to teleport", hintHeader];
		player onMapSingleClick "if (_alt) then { player setPosATL _pos }";
		uiSleep 5;hintSilent "";
	} else {
		player setVariable ["jjx_mapTP", false, true];
		hint parseText format ["%1 An admin has disabled map teleportation for you!", hintHeader];
		player onMapSingleClick "if (_alt) then {};";
		uiSleep 5;hintSilent "";
	};
};

jjx_admin_exec_freeze = {
	if (userInputDisabled) then {
		disableUserInput false;
		player setVariable ["jjx_frozen", false, true];
	} else {
		disableUserInput true;
		player setVariable ["jjx_frozen", true, true];
	};
};

jjx_admin_exec_markers = {
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

jjx_admin_exec_pee = {
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

// LOADOUT MENU

jjx_loadout_save = {
	_loadoutName = ctrlText 1400;
	if (_loadoutName != "") then {
		_currentLoadout = getUnitLoadout player; 
		_allLoadouts = profileNamespace getVariable ["jjx_loadouts", []]; 
		_allLoadouts append [[[_loadoutName], _currentLoadout]]; 
		profileNamespace setVariable ["jjx_loadouts", _allLoadouts];
		[_loadoutName] spawn {hintSilent parseText format ["%1You created loadout<br/><t color='#42ebf4'>%2</t>", hintHeader, _this select 0];}
	} else { 
		[] spawn {hintSilent parseText format ["%1You need to specify a loadout name", hintHeader];uiSleep 3;hintSilent "";}
	};
};

jjx_loadout_load = {
	_index = lbCurSel 1502;
	if (_index != -1) then {
		_allLoadouts = profileNamespace getVariable ["jjx_loadouts", []];
		_name = lbText [1502, _index];
		_loadout = _allLoadouts select _index select 1;
		player setUnitLoadout _loadout;
		[_name] spawn {hintSilent parseText format ["%1You equiped loadout<br/><t color='#42ebf4'>%2</t>", hintHeader, _this select 0];}
	} else { 
		[] spawn {hintSilent parseText format ["%1You need to select a loadout", hintHeader];uiSleep 3;hintSilent "";} 
	};
};

jjx_loadout_delete = {
	_index = lbCurSel 1502;
	if (_index != -1) then {
		_allLoadouts = profileNamespace getVariable ["jjx_loadouts", []];
		_name = lbText [1502, _index];
		_allLoadouts deleteAt _index;
		profileNamespace setVariable ["jjx_loadouts", _allLoadouts];
		[_name] spawn {hintSilent parseText format ["%1You deleted loadout<br/><t color='#42ebf4'>%2</t>", hintHeader, _this select 0];}
	} else { 
		[] spawn {hintSilent parseText format ["%1You need to select a loadout", hintHeader];uiSleep 3;hintSilent "";}
	};
};
*/