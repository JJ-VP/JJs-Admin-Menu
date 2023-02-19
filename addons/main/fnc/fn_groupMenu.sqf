/*
 * fn_groupMenu.sqf
 * Author: JJ
 *
 * Args:
 * 1: the player to open the group menu <OBJECT>
 *
 * Return Value:
 * none
 *
 */
params["_player"];

groupMenuString = '

[] spawn {
	with uiNamespace do {
		groupMenuDisplay = findDisplay 46 createDisplay "RscDisplayEmpty";
		ctrlBackground = groupMenuDisplay ctrlCreate ["RscBackgroundGUI", 2200];
		ctrlBackground2 = groupMenuDisplay ctrlCreate ["RscBackgroundGUI", 2201];
		ctrltxtName = groupMenuDisplay ctrlCreate ["RscText", 1000];
		ctrlbtnClose = groupMenuDisplay ctrlCreate ["RscButton", 1600];
		ctrllstPlayers = groupMenuDisplay ctrlCreate ["RscListbox", 1520];
		ctrllstGroups = groupMenuDisplay ctrlCreate ["RscListbox", 1521];
		ctrlbtnRename = groupMenuDisplay ctrlCreate ["RscButton", 1601];
		ctrledtRename = groupMenuDisplay ctrlCreate ["RscEdit", 1420];
		ctrlBackground ctrlSetPosition [0.224931, 0.34, 0.550138, 0.32];
		ctrlBackground ctrlCommit 0;
		ctrlBackground2 ctrlSetPosition [0.6, 0.54, 0.15, 0.08];
		ctrlBackground2 ctrlCommit 0;
		ctrltxtName ctrlSetPosition [0.224931, 0.34, 0.525132, 0.04];
		ctrltxtName ctrlSetText "JJs Group Menu";
		ctrltxtName ctrlCommit 0;
		ctrlbtnClose ctrlSetPosition [0.750063, 0.34, 0.0250063, 0.04];
		ctrlbtnClose ctrlSetText "X";
		ctrlbtnClose ctrlSetTextColor [1, 0, 0, 1];
		ctrlbtnClose ctrlSetTooltip "Close the menu.";
		ctrlbtnClose ctrlAddEventHandler ["ButtonClick", {
			params ["_ctrl"];
			_display = ctrlParent _ctrl;
			_display closeDisplay 1;
			[player] remoteExec ["JJAM_fnc_adminMenu", 2];
		}];
		ctrlbtnClose ctrlCommit 0;
		ctrllstPlayers ctrlSetPosition [0.396849 * safezoneW + safezoneX, 0.445 * safezoneH + safezoneY, 0.0618905 * safezoneW, 0.132 * safezoneH];
		ctrllstGroups ctrlSetPosition [0.469055 * safezoneW + safezoneX, 0.445 * safezoneH + safezoneY, 0.0618905 * safezoneW, 0.132 * safezoneH];
		ctrlbtnRename ctrlSetPosition [0.6, 0.42, 0.15, 0.08];
		ctrlbtnRename ctrlSetText "Rename";
		ctrlbtnRename ctrlSetTooltip "Select a group and wright the name below";
		ctrlbtnRename ctrlAddEventHandler ["ButtonClick", {
			if ((lbCurSel ctrllstGroups == -1) && (lbCurSel ctrllstPlayers == -1)) exitWith {hintSilent "Please select a player or group";};
			if (ctrlText ctrledtRename == "") exitWith {hintSilent "Please input a name";};
			if (lbCurSel ctrllstGroups != -1) then {
				_group = (allGroupsWithPlayers select (lbCurSel ctrllstGroups));
				_nameArray = [];
				_name = ctrlText ctrledtRename;
				_nameArray pushBack _name;
				_oldName = groupID _group;
				[_group, _nameArray] remoteExec ["setGroupIDGlobal", 2];
				[_oldName,_name] spawn {hintSilent parseText format ["Renamed <br /><t color=""#42ebf4"">%1</t> to <t color=""#42ebf4"">%2</t>", _this select 0, _this select 1];uiSleep 3; hintSilent "";};
			} else {
				_playerID = ctrllstPlayers lbData lbCurSel ctrllstPlayers;
				_player = getUserInfo _playerID select 10;
				_group = group _player;
				_nameArray = [];
				_name = ctrlText ctrledtRename;
				_nameArray pushBack _name;
				_oldName = groupID _group;
				hint str(_name);
				[_group, _nameArray] remoteExec ["setGroupIDGlobal", 2];
				[_oldName,_name] spawn {hintSilent parseText format ["Renamed <br /><t color=""#42ebf4"">%1</t> to <t color=""#42ebf4"">%2</t>", _this select 0, _this select 1];uiSleep 3; hintSilent "";};
			};
		}];
		ctrlbtnRename ctrlCommit 0;
		ctrledtRename ctrlSetPosition [0.6, 0.54, 0.15, 0.08];
		ctrledtRename ctrlCommit 0;

		waitUntil {!isNull groupMenuDisplay};
		while {!isNull groupMenuDisplay} do {
			with uiNamespace do {
				allGroupsWithPlayers = [];
				{allGroupsWithPlayers pushBackUnique group _x} forEach allPlayers;
				{
					ctrllstGroups lbadd str(_x);
				} forEach allGroupsWithPlayers;
				ctrllstGroups ctrlCommit 0;
				if (lbCurSel 1521 == -1) then {
					{
						_index = ctrllstPlayers lbAdd name _x;
						ctrllstPlayers lbSetData [_index, getPlayerID player];
					} forEach allPlayers;
				} else {
					{
						ctrllstPlayers lbAdd name _x;
					} forEach units (allGroupsWithPlayers select (lbCurSel 1521));
				};
				ctrllstPlayers ctrlCommit 0;
				uiSleep 0.05;
				lbClear ctrllstGroups;
				lbClear ctrllstPlayers;
				ctrllstGroups ctrlCommit 0;
				ctrllstPlayers ctrlCommit 0;
			};
		};
	};
};

';

JJAM_groupMenuCode = compile groupMenuString;
owner _player publicVariableClient "JJAM_groupMenuCode";
[] remoteExec ["JJAM_groupMenuCode", _player];
