/*
 * fn_notificationMenu.sqf
 * Author: JJ
 *
 * Args:
 * 1: the player to open the notification menu <OBJECT>
 *
 * Return Value:
 * none
 *
 */
params["_player"];

notificationMenuString = '

with uiNamespace do {
	notificationMenuDisplay = findDisplay 46 createDisplay "RscDisplayEmpty";
	ctrlBackground = notificationMenuDisplay ctrlCreate ["RscBackgroundGUI", 2200];
	ctrlBackground2 = notificationMenuDisplay ctrlCreate ["RscBackgroundGUI", 2201];
	ctrlBackground3 = notificationMenuDisplay ctrlCreate ["RscBackgroundGUI", 2202];
	ctrltxtName = notificationMenuDisplay ctrlCreate ["RscText", 1000];
	ctrlbtnClose = notificationMenuDisplay ctrlCreate ["RscButton", 1600];
	ctrledtTitle = notificationMenuDisplay ctrlCreate ["RscEditMulti", 1400];
	ctrledtDuration = notificationMenuDisplay ctrlCreate ["RscEdit", 1401];
	ctrlbtnSend = notificationMenuDisplay ctrlCreate ["RscButton", 1601];
	ctrlBackground ctrlSetPosition [0.224931, 0.34, 0.550138, 0.32];
	ctrlBackground ctrlCommit 0;
	ctrlBackground2 ctrlSetPosition [0.6, 0.42, 0.15, 0.08];
	ctrlBackground2 ctrlCommit 0;
	ctrlBackground3 ctrlSetPosition [0.249937, 0.42, 0.33, 0.19];
	ctrlBackground3 ctrlCommit 0;
	ctrltxtName ctrlSetPosition [0.224931, 0.34, 0.525132, 0.04];
	ctrltxtName ctrlSetText "JJs Notification Menu";
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
	ctrledtTitle ctrlSetPosition [0.249937, 0.42, 0.33, 0.19];
	ctrledtTitle ctrlSetTooltip "Input the text for the notification. Use \ n for a new line.";
	ctrledtTitle ctrlCommit 0;
	ctrledtDuration ctrlSetPosition [0.6, 0.42, 0.15, 0.08];
	ctrledtDuration ctrlSetTooltip "Input the duration for the notification.";
	ctrledtDuration ctrlCommit 0;
	ctrlbtnSend ctrlSetPosition [0.6, 0.54, 0.15, 0.08];
	ctrlbtnSend ctrlSetText "Send!";
	ctrlbtnSend ctrlSetTooltip "Send the notification using the above details.";
	ctrlbtnSend ctrlAddEventHandler ["ButtonClick", {
		[] spawn {
			if (ctrlText ctrledtDuration == "") then {
				ctrledtDuration ctrlSetText "10";
			};
			ctrlText ctrledtTitle remoteExec ["hintSilent", 0];
			uiSleep parseNumber ctrlText ctrledtDuration;
			"" remoteExec ["hintSilent", 0];
		};
	}];
	ctrlbtnSend ctrlCommit 0;
};

';

JJAM_notificationMenuCode = compile notificationMenuString;
owner _player publicVariableClient "JJAM_notificationMenuCode";
[] remoteExec ["JJAM_notificationMenuCode", _player];
