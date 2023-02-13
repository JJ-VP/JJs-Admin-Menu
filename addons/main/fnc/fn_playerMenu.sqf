/*
 * fn_playerMenu.sqf
 * Author: JJ
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

playerMenuString = "

params['_isAdmin'];

waitUntil{!isNull (findDisplay 46)};
systemchat 'JJ''s Player Menu Enabled! Press F1 to open it!';
_keydown = (findDisplay 46) displayAddEventHandler ['KeyDown', 'if (_this select 1 == 59) then {
	if (!isNull (findDisplay _playerMenuDisplay)) exitWith {_playerMenuDisplay closeDisplay 1;};
	disableSerialization;
	private _playerMenuDisplay = findDisplay 46 createDisplay ''RscDisplayEmpty'';
	private _ctrlBackground = _playerMenuDisplay ctrlCreate [''RscBackgroundGUI'', 2200];
	private _ctrltxtName = _playerMenuDisplay ctrlCreate [''RscText'', 1000];
	private _ctrlbtnClose = _playerMenuDisplay ctrlCreate [''RscButton'', 1600];
	private _ctrlbtnBackpack = _playerMenuDisplay ctrlCreate [''RscButton'', 1601];
	private _ctrlbtnGrass = _playerMenuDisplay ctrlCreate [''RscButton'', 1602];
	private _ctrlbtnSync = _playerMenuDisplay ctrlCreate [''RscButton'', 1603];
	private _ctrlbtnZeus = _playerMenuDisplay ctrlCreate [''RscButton'', 1604];
	private _ctrlbtnAdmin = _playerMenuDisplay ctrlCreate [''RscButton'', 1605];
	private _ctrlbtnPlaceholder = _playerMenuDisplay ctrlCreate [''RscButton'', 1606];
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
	}];
	_ctrlbtnClose ctrlCommit 0;
	_ctrlbtnBackpack ctrlSetPosition [0.249937, 0.42, 0.150038, 0.08];
	_ctrlbtnBackpack ctrlSetText ''Toggle Backpack'';
	_ctrlbtnBackpack ctrlSetTooltip ''Toggle the visibility of your backpack.'';
	_ctrlbtnBackpack ctrlAddEventHandler [''ButtonClick'', {
		if (isObjectHidden unitBackpack player) then {
			[unitBackpack player, false] remoteExec [''hideObjectGlobal'', 2];
		} else {
			[unitBackpack player, true] remoteExec [''hideObjectGlobal'', 2];
		};
	}];
	_ctrlbtnBackpack ctrlCommit 0;
	_ctrlbtnGrass ctrlSetPosition [0.424982, 0.42, 0.150038, 0.08];
	_ctrlbtnGrass ctrlSetText ''Toggle Grass'';
	_ctrlbtnGrass ctrlSetTooltip ''Toggle the visibility of grass'';
	_ctrlbtnGrass ctrlAddEventHandler [''ButtonClick'', {
		if (getTerrainGrid < 50) then {
			setTerrainGrid 50;
		} else {
			setTerrainGrid 12.5;
		};
	}];
	_ctrlbtnGrass ctrlCommit 0;
	_ctrlbtnSync ctrlSetPosition [0.249937, 0.54, 0.150038, 0.08];
	_ctrlbtnSync ctrlSetText ''Sync Clothes'';
	_ctrlbtnSync ctrlSetTooltip ''If someone says you have no clothes when you do, click me.'';
	_ctrlbtnSync ctrlAddEventHandler [''ButtonClick'', {
		player setUnitLoadout (getUnitLoadout player);
	}];
	_ctrlbtnSync ctrlCommit 0;
	_ctrlbtnZeus ctrlSetPosition [0.424982, 0.54, 0.150038, 0.08];
	_ctrlbtnZeus ctrlSetText ''Zeus Menu'';
	_ctrlbtnZeus ctrlSetTooltip ''Open the Zeus menu'';
	_zeusState = call BIS_fnc_admin;
	if (JJZeusMenu && (_zeusState == 2 || _isAdmin)) then {
		_ctrlbtnZeus ctrlAddEventHandler [''ButtonClick'', {
			params [''_ctrl''];
			_display = ctrlParent _ctrl;
			_display closeDisplay 1;
			[player] remoteExec [''JJAM_fnc_zeusMenu'', 2];
		}];
	} else {
		ctrlDelete _ctrlbtnZeus; 
	};
	_ctrlbtnZeus ctrlCommit 0;
	_ctrlbtnAdmin ctrlSetPosition [0.6, 0.54, 0.15, 0.08];
	_ctrlbtnAdmin ctrlSetText ''Admin Menu'';
	_ctrlbtnAdmin ctrlSetTooltip ''Open the Admin Menu'';
	if (_isAdmin && JJAdminMenu) then {
		_ctrlbtnAdmin ctrlAddEventHandler [''ButtonClick'', {
			params [''_ctrl''];
			_display = ctrlParent _ctrl;
			_display closeDisplay 1;
			[player] remoteExec [''JJAM_fnc_adminMenu'', 2];

		}];
	} else {
		ctrlDelete _ctrlbtnAdmin;
	};
	_ctrlbtnAdmin ctrlCommit 0;
	_ctrlbtnPlaceholder ctrlSetPosition [0.6, 0.42, 0.15, 0.08];
	_ctrlbtnPlaceholder ctrlSetTooltip ''This button is a placeholder'';
	_ctrlbtnPlaceholder ctrlCommit 0;
	true
}'];

";

_isAdmin = _player call JJAM_fnc_isAdmin;

JJAM_playerMenuCode = compileFinal playerMenuString;
owner _player publicVariableClient "JJAM_playerMenuCode";
[_isAdmin] remoteExec ["JJAM_playerMenuCode", _player];
true