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

adminMenuString= "

waitUntil{!isNull (findDisplay 46)};
disableSerialization;
private _adminMenuDisplay = findDisplay 46 createDisplay ''RscDisplayEmpty'';
private _ctrlBackground = _adminMenuDisplay ctrlCreate [''RscBackgroundGUI'', 2200];
private _ctrltxtName = _adminMenuDisplay ctrlCreate [''RscText'', 1000];
private _ctrlbtnClose = _adminMenuDisplay ctrlCreate [''RscButton'', 1600];
private _ctrlbtnHealAll = _adminMenuDisplay ctrlCreate [''RscButton'', 1601];
private _ctrlbtnNotification = _adminMenuDisplay ctrlCreate [''RscButton'', 1602];
private _ctrlbtnGroups = _adminMenuDisplay ctrlCreate [''RscButton'', 1603];
private _ctrlbtnFullAdmin = _adminMenuDisplay ctrlCreate [''RscButton'', 1604];
_ctrlBackground ctrlSetPosition [0.224931, 0.34, 0.550138, 0.32];
_ctrlBackground ctrlCommit 0;
_ctrltxtName ctrlSetPosition [0.224931, 0.34, 0.525132, 0.04];
_ctrltxtName ctrlSetText ''JJ''''s Player Menu'';
_ctrltxtName ctrlCommit 0;
_ctrlbtnClose ctrlSetPosition [0.750063, 0.34, 0.0250063, 0.04];
_ctrlbtnClose ctrlSetText ''X'';
_ctrlbtnClose ctrlSetTextColor [1, 0, 0, 1];
_ctrlbtnClose ctrlSetTooltip ''Close the menu.'';
_ctrlbtnClose ctrlAddEventHandler [''ButtonClick'', {
	params [''_ctrl''];
	_display = ctrlParent _ctrl;
	_display closeDisplay 1;
	if (JJPlayerMenu) then {
		[player] remoteExec [''JJAM_fnc_playerMenu'', 2];
	};
}];
_ctrlbtnClose ctrlCommit 0;
_ctrlbtnHealAll ctrlSetPosition [0.249937, 0.42, 0.150038, 0.08];
_ctrlbtnHealAll ctrlSetText ''Heal All'';
_ctrlbtnHealAll ctrlSetTooltip ''Arma Heal or Ace Heal all players.'';
_ctrlbtnHealAll ctrlAddEventHandler [''ButtonClick'', {
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
_ctrlbtnHealAll ctrlCommit 0;
_ctrlbtnNotification ctrlSetPosition [0.424982, 0.42, 0.150038, 0.08];
_ctrlbtnNotification ctrlSetText ''Notification Menu'';
_ctrlbtnNotification ctrlSetTooltip ''Open the Notifiction Menu.'';
_ctrlbtnNotification ctrlAddEventHandler [''ButtonClick'', {
	//GUIseption
	params [''_ctrl''];
	_display = ctrlParent _ctrl;
	_display closeDisplay 1;
	private _notificationMenuDisplay = findDisplay 46 createDisplay ''RscDisplayEmpty'';
	private _ctrlBackground = _notificationMenuDisplay ctrlCreate [''RscBackgroundGUI'', 2200];
	private _ctrltxtName = _notificationMenuDisplay ctrlCreate [''RscText'', 1000];
	private _ctrlbtnClose = _notificationMenuDisplay ctrlCreate [''RscButton'', 1600];
	private _ctrledtTitle = _notificationMenuDisplay ctrlCreate [''RscEdit'', 1400];
	private _ctrledtDescription = _notificationMenuDisplay ctrlCreate [''RscEdit'', 1401];
	private _ctrlbtnSend = _notificationMenuDisplay ctrlCreate [''RscButton'', 1601];
	_ctrlBackground ctrlSetPosition [0.386534 * safezoneW + safezoneX, 0.412 * safezoneH + safezoneY, 0.226932 * safezoneW, 0.176 * safezoneH];
	_ctrlBackground ctrlCommit 0;
	_ctrltxtName ctrlSetPosition [0.386534 * safezoneW + safezoneX, 0.412 * safezoneH + safezoneY, 0.216617 * safezoneW, 0.022 * safezoneH];
	_ctrltxtName ctrlSetText ''JJ''''s Notification Menu'';
	_ctrltxtName ctrlCommit 0;
	_ctrlbtnClose ctrlSetPosition [0.603151 * safezoneW + safezoneX, 0.412 * safezoneH + safezoneY, 0.0103151 * safezoneW, 0.022 * safezoneH];
	_ctrlbtnClose ctrlSetText ''X'';
	_ctrlbtnClose ctrlSetTextColor [1, 0, 0, 1];
	_ctrlbtnClose ctrlSetTooltip ''Close the menu.'';
	_ctrlbtnClose ctrlAddEventHandler [''ButtonClick'', {
		params [''_ctrl''];
		_display = ctrlParent _ctrl;
		_display closeDisplay 1;
		[player] remoteExec [''JJAM_fnc_adminMenu'', 2];
	}];
	_ctrledtTitle ctrlSetPosition [0.396849 * safezoneW + safezoneX, 0.456 * safezoneH + safezoneY, 0.206302 * safezoneW, 0.044 * safezoneH];
	_ctrledtTitle ctrlSetTooltip ''Input the title for the notification.'';
	_ctrledtTitle ctrlCommit 0;
	_ctrledtDescription ctrlSetPosition [0.396849 * safezoneW + safezoneX, 0.522 * safezoneH + safezoneY, 0.144411 * safezoneW, 0.044 * safezoneH];
	_ctrledtDescription ctrlSetTooltip ''Input the description for the notification.'';
	_ctrledtDescription ctrlCommit 0;
	_ctrlbtnSend ctrlSetPosition [0.551575 * safezoneW + safezoneX, 0.522 * safezoneH + safezoneY, 0.0515754 * safezoneW, 0.044 * safezoneH];
	_ctrlbtnSend ctrlSetText ''Send!'';
	_ctrlbtnSend ctrlSetTooltip ''Send the notification using the above details.';
	_ctrlbtnSend ctrlAddEventHandler [''ButtonClick'', {
		[''Custom'',[format[''%1'',ctrlText 1401],format[''%1'',ctrlText 1402]]] remoteExec [''bis_fnc_showNotification'', 0]; //This wont work as the custom notification doesn't exist on the client
	}];
	_ctrlbtnSend ctrlCommit 0;
}];
_ctrlbtnNotification ctrlCommit 0;
_ctrlbtnGroups ctrlSetPosition [0.249937, 0.54, 0.150038, 0.08];
_ctrlbtnGroups ctrlSetText ''Group Menu'';
_ctrlbtnGroups ctrlSetTooltip ''Open the Group Menu'';
_ctrlbtnGroups ctrlAddEventHandler [''ButtonClick'', {
	params [''_ctrl''];
	_display = ctrlParent _ctrl;
	_display closeDisplay 1;
	private _groupMenuDisplay = findDisplay 46 createDisplay ''RscDisplayEmpty'';
	private _ctrlBackground = _groupMenuDisplay ctrlCreate [''RscBackgroundGUI'', 2200];
	private _ctrlBackground2 = _groupMenuDisplay ctrlCreate [''RscBackgroundGUI'', 2201];
	private _ctrltxtName = _groupMenuDisplay ctrlCreate [''RscText'', 1000];
	private _ctrlbtnClose = _groupMenuDisplay ctrlCreate [''RscButton'', 1600];
	private _ctrllstPlayers = _groupMenuDisplay ctrlCreate [''RscListbox'', 1520];
	private _ctrllstGroups = _groupMenuDisplay ctrlCreate [''RscListbox'', 1521];
	private _ctrlbtnRename = _groupMenuDisplay ctrlCreate [''RscButton'', 1601];
	private _ctrledtRename = _groupMenuDisplay ctrlCreate [''RscEdit'', 1420];
	_ctrlBackground ctrlSetPosition [0.386534 * safezoneW + safezoneX, 0.412 * safezoneH + safezoneY, 0.226932 * safezoneW, 0.176 * safezoneH];
	_ctrlBackground ctrlCommit 0;
	_ctrlBackground2 ctrlSetPosition [0.54126 * safezoneW + safezoneX, 0.511 * safezoneH + safezoneY, 0.0618905 * safezoneW, 0.044 * safezoneH];
	_ctrlBackground2 ctrlCommit 0;
	_ctrltxtName ctrlSetPosition [0.386534 * safezoneW + safezoneX, 0.412 * safezoneH + safezoneY, 0.226932 * safezoneW, 0.176 * safezoneH];
	_ctrltxtName ctrlSetText ''JJ''''s Group Menu'';
	_ctrltxtName ctrlCommit 0;
	_ctrlbtnClose ctrlSetPosition [0.603151 * safezoneW + safezoneX, 0.412 * safezoneH + safezoneY, 0.0103151 * safezoneW, 0.022 * safezoneH];
	_ctrlbtnClose ctrlSetText ''X'';
	_ctrlbtnClose ctrlSetTextColor [1, 0, 0, 1];
	_ctrlbtnClose ctrlSetTooltip ''Close the menu.'';
	_ctrlbtnClose ctrlAddEventHandler [''ButtonClick'', {
		params [''_ctrl''];
		_display = ctrlParent _ctrl;
		_display closeDisplay 1;
		[player] remoteExec [''JJAM_fnc_adminMenu'', 2];
	}];
	_ctrlbtnClose ctrlCommit 0;
	_ctrllstPlayers ctrlSetPosition [0.396849 * safezoneW + safezoneX, 0.445 * safezoneH + safezoneY, 0.0618905 * safezoneW, 0.132 * safezoneH];
	_ctrllstPlayers ctrlCommit 0;
	_ctrllstGroups ctrlSetPosition [0.469055 * safezoneW + safezoneX, 0.445 * safezoneH + safezoneY, 0.0618905 * safezoneW, 0.132 * safezoneH];
	_ctrllstGroups ctrlCommit 0;
	_ctrlbtnRename ctrlSetPosition [0.54126 * safezoneW + safezoneX, 0.445 * safezoneH + safezoneY, 0.0618905 * safezoneW, 0.044 * safezoneH];
	_ctrlbtnRename ctrlSetText ''Rename'';
	_ctrlbtnRename ctrlSetTooltip ''Select a group and wright the name below'';
	_ctrlbtnRename ctrlAddEventHandler [''ButtonClick'', {
		lbCurSel 
	}];
	_ctrlbtnRename ctrlCommit 0;
	_ctrledtRename ctrlSetPosition [0.54126 * safezoneW + safezoneX, 0.511 * safezoneH + safezoneY, 0.0618905 * safezoneW, 0.044 * safezoneH];
	_ctrledtRename ctrlCommit 0;

	//while loop to update list boxes.
}];
_ctrlbtnGroups ctrlCommit 0;
_ctrlbtnFullAdmin ctrlSetPosition [0.6, 0.54, 0.15, 0.08];
_ctrlbtnFullAdmin ctrlSetText ''Admin Menu'';
_ctrlbtnFullAdmin ctrlSetTooltip ''Open the Admin Menu'';
_ctrlbtnFullAdmin ctrlAddEventHandler [''ButtonClick'', {
	params [''_ctrl''];
	_display = ctrlParent _ctrl;
	_display closeDisplay 1;
	[player] remoteExec [''JJAM_fnc_superAdminMenu'', 2];
}];
_ctrlbtnFullAdmin ctrlCommit 0;

";

JJAM_adminMenuCode = compileFinal adminMenuString;
owner _player publicVariableClient "JJAM_adminMenuCode";
remoteExec ["JJAM_adminMenuCode", _player];
true

