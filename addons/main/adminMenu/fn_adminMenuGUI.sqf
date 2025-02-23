[] spawn {
	with uiNamespace do {
		JJPlayerMenu = missionNamespace getVariable "JJPlayerMenu";
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
				[player] remoteExec ["JJAM_fnc_playerMenu", 2];
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
				if (_index == -1) exitWith {[player, "admin", "You need to select a loadout."] remoteExec ["JJAM_fnc_hint", 2]};
				_allLoadouts = profileNamespace getVariable ["JJAM_loadouts", []];
				_name = ctrllstLoadouts lbText _index;
				_loadout = _allLoadouts select _index select 1;
				player setUnitLoadout _loadout;
				[player, "admin", parseText (["You equiped loadout<br/><t color='#42ebf4'>", _name, "</t>"] joinString "")] remoteExec ["JJAM_fnc_hint", 2];
			};
		}];
		ctrlbtnLoad ctrlCommit 0;
		ctrlbtnSave ctrlSetText "Save";
		ctrlbtnSave ctrlSetTooltip "Save your current loadout using the name above";
		ctrlbtnSave ctrlSetPosition [0.78725, 0.66, 0.149852, 0.04];
		ctrlbtnSave ctrlAddEventHandler ["ButtonClick", {
			with uiNamespace do {
				_loadoutName = ctrlText ctrledtLoadoutName;
				if (_loadoutName == "") exitWith {[player, "admin", "You need to specify a loadout name."] remoteExec ["JJAM_fnc_hint", 2]};
				_currentLoadout = getUnitLoadout player; 
				_allLoadouts = profileNamespace getVariable ["JJAM_loadouts", []]; 
				_allLoadouts append [[[_loadoutName], _currentLoadout]]; 
				profileNamespace setVariable ["JJAM_loadouts", _allLoadouts];
				[player, "admin", parseText (["You created loadout<br/><t color='#42ebf4'>", _loadoutName, "</t>"] joinString "")] remoteExec ["JJAM_fnc_hint", 2];
			};
		}];
		ctrlbtnSave ctrlCommit 0;
		ctrlbtnDelete ctrlSetText "Delete";
		ctrlbtnDelete ctrlSetTooltip "Delete the selected loadout";
		ctrlbtnDelete ctrlSetPosition [0.78725, 0.78, 0.149852, 0.04];
		ctrlbtnDelete ctrlAddEventHandler ["ButtonClick", {
			with uiNamespace do {
				_index = lbCurSel ctrllstLoadouts;
				if (_index == -1) exitWith {[player, "admin", "You need to select a loadout"] remoteExec ["JJAM_fnc_hint", 2]};
				_allLoadouts = profileNamespace getVariable ["JJAM_loadouts", []];
				_name = ctrllstLoadouts lbText _index;
				_allLoadouts deleteAt _index;
				profileNamespace setVariable ["JJAM_loadouts", _allLoadouts];
				[player, "admin", parseText (["You deleted loadout<br/><t color='#42ebf4'>", _name, "</t>"])] remoteExec ["JJAM_fnc_hint", 2];
			};
		}];
		ctrlbtnDelete ctrlCommit 0;

		JJAM_admin_red = [ 1, 0.22, 0.22, 1];
		JJAM_admin_green = [ 0.22, 0.7, 0.2, 1];

		waitUntil {!isNull adminMenuDisplay};
		while {!isNull adminMenuDisplay} do {
			with uiNamespace do {

				{
					ctrllstPlayers lbAdd name _x;
					ctrllstPlayers ctrlSetEventHandler ["LBDblClick", "call JJAM_admin_playerInfo"];
					ctrllstPlayers lbSetTooltip [ _forEachIndex, format ["Name: %1 ~ Steam: %2 ~ UID: %3", name _x, _x getVariable "steamName", getPlayerUID _x]];
					[_x setVariable ["JJAM_var_vehGod", !isDamageAllowed objectParent _x], _x setVariable ["JJAM_var_vehGod", false]] select (objectParent _x isEqualTo objNull);
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
				if (lbCurSel ctrllstFeatures == -1) then {
					ctrllstFeatures lbSetCurSel 0;
				};
				
				features = missionNamespace getVariable "features";
				{
					switch(_x select 1) do {
						case "god";
						case "vehGod";
						case "ammo";
						case "invis";
						case "rapid";
						case "recoil";
						case "swap";
						case "mapTP";
						case "speed";
						case "freeze";
						case "markers": {
							if (isNil {((allPlayers select (lbCurSel ctrllstPlayers)) getVariable format ["JJAM_var_%1", _x select 1])} || {!((allPlayers select (lbCurSel ctrllstPlayers)) getVariable format ["JJAM_var_%1", _x select 1])}) then {
								ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
								ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
								ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							} else {
								ctrllstFeatures lbAdd format ["%1 - ON", _x select 0];
								ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_green];
								ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							};
						};
						default {
							ctrllstFeatures lbAdd (_x select 0);
							ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
						};
						{
							//indented so I can hide it, remember to remove if I revert this setHit

							// case "god": { 
							// 	_player = allPlayers select (lbCurSel ctrllstPlayers);
							// 	if (isDamageAllowed _player) then {
							// 		ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
							// 		ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
							// 		ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 	} else {
							// 		ctrllstFeatures lbAdd format ["%1 - ON", _x select 0];
							// 		ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_green];
							// 		ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 	};
							// };
							// case "vehGod": {
							// 	_player = allPlayers select (lbCurSel ctrllstPlayers);
							// 	_vehicle = objectParent _player;
							// 	if (isNull _vehicle) then {
							// 		ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
							// 		ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
							// 		ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 	} else {
							// 		if (isDamageAllowed _vehicle) then {
							// 			ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
							// 			ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
							// 			ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 		} else {
							// 			ctrllstFeatures lbAdd format ["%1 - ON", _x select 0];
							// 			ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_green];
							// 			ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 		};
							// 	};
							// };
							// case "ammo": {
							// 	if ((lbCurSel ctrllstPlayers) != -1) then {
							// 		if (isNil {((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_ammo")} || {!((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_ammo")}) then {
							// 			ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
							// 			ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
							// 			ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 		} else {
							// 			ctrllstFeatures lbAdd format ["%1 - ON", _x select 0];
							// 			ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_green];
							// 			ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 		};
							// 	} else {
							// 		ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
							// 		ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
							// 		ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 	};
							// };
							// case "invis": {
							// 	_player = allPlayers select (lbCurSel ctrllstPlayers);
							// 	if (isObjectHidden _player) then {
							// 		ctrllstFeatures lbAdd format ["%1 - ON", _x select 0];
							// 		ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_green];
							// 		ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 	} else {
							// 		ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
							// 		ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
							// 		ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 	};
							// };
							// case "rapid": {
							// 	if ((lbCurSel ctrllstPlayers) != -1) then {
							// 		if (isNil {((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_rapid")} || {!((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_rapid")}) then {
							// 			ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
							// 			ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
							// 			ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 		} else {
							// 			ctrllstFeatures lbAdd format ["%1 - ON", _x select 0];
							// 			ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_green];
							// 			ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 		};
							// 	} else {
							// 		ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
							// 		ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
							// 		ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 	};
							// };
							// case "recoil": {
							// 	_player = allPlayers select (lbCurSel ctrllstPlayers);
							// 	if (unitRecoilCoefficient _player != 0) then {
							// 		ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
							// 		ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
							// 		ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 	} else {
							// 		ctrllstFeatures lbAdd format ["%1 - ON", _x select 0];
							// 		ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_green];
							// 		ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 	};
							// };
							// case "sway": {
							// 	if ((lbCurSel ctrllstPlayers) != -1) then {
							// 		if (isNil {((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_sway")} || {!((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_sway")}) then {
							// 			ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
							// 			ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
							// 			ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 		} else {
							// 			ctrllstFeatures lbAdd format ["%1 - ON", _x select 0];
							// 			ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_green];
							// 			ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 		};
							// 	} else {
							// 		ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
							// 		ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
							// 		ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 	};
							// };
							// case "speed": {
							// 	if ((lbCurSel ctrllstPlayers) != -1) then {
							// 		if (isNil {((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_speed")} || {!((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_speed")}) then {
							// 			ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
							// 			ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
							// 			ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 		} else {
							// 			ctrllstFeatures lbAdd format ["%1 - ON", _x select 0];
							// 			ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_green];
							// 			ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 		};
							// 	} else {
							// 		ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
							// 		ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
							// 		ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 	};
							// };
							// case "mapTP": {
							// 	if ((lbCurSel ctrllstPlayers) != -1) then {
							// 		if (isNil {((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_mapTP")} || {!((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_mapTP")}) then {
							// 			ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
							// 			ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
							// 			ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 		} else {
							// 			ctrllstFeatures lbAdd format ["%1 - ON", _x select 0];
							// 			ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_green];
							// 			ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 		};
							// 	} else {
							// 		ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
							// 		ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
							// 		ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 	};
							// };
							// case "freeze": {
							// 	if ((lbCurSel ctrllstPlayers) != -1) then {
							// 		if (isNil {((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_frozen")} || {!((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_frozen")}) then {
							// 			ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
							// 			ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
							// 			ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 		} else {
							// 			ctrllstFeatures lbAdd format ["%1 - ON", _x select 0];
							// 			ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_green];
							// 			ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 		};
							// 	} else {
							// 		ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
							// 		ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
							// 		ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 	};
							// };
							// case "markers": {
							// 	if ((lbCurSel ctrllstPlayers) != -1) then {
							// 		if (isNil {((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_mapMarkers")} || {!((allPlayers select (lbCurSel ctrllstPlayers)) getVariable "JJAM_mapMarkers")}) then {
							// 			ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
							// 			ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
							// 			ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 		} else {
							// 			ctrllstFeatures lbAdd format ["%1 - ON", _x select 0];
							// 			ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_green];
							// 			ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 		};
							// 	} else {
							// 		ctrllstFeatures lbAdd format ["%1 - OFF", _x select 0];
							// 		ctrllstFeatures lbSetColor [_forEachIndex, JJAM_admin_red];
							// 		ctrllstFeatures lbSetTooltip [_forEachIndex, _x select 3];
							// 	};
							// };
						}
					};
				} forEach features;

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
			if (_feature == -1 || _player == -1) exitWith {/* log error */};
			if ((features select _feature) select 2 == false) exitWith {};
			_code = compile format ["[_player] remoteExec ['JJAM_fnc_admin_%1',2]", (features select _feature) select 1];
			call _code;
		};
	};
};