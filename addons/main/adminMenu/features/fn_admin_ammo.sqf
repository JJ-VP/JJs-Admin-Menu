/*
 * fn_admin_ammo.sqf
 * Author: JJ
 *
 * Args:
 * 1: the index of the player(from allPlayers) to toggle infinite ammo <INT>
 *
 * Return Value:
 * none
 *
 */

params["_selectedIndex"];
_player = allPlayers select _selectedIndex;
if (!(_player isKindOf "CAManBase")) exitWith {};
_hint = "";

//Check if the target player is in a vehicle or not and set the _object variable suitably
// if (objectParent player isEqualTo objNull) then {
// 	_object = player;
// } else {
// 	_object = objectParent player;
// };
_object = [objectParent _player, _player] select (objectParent _player isEqualTo objNull);

//Main code
//Check if the object already has infinite ammo
if (isNil {_object getvariable "JJAM_var_ammo"} || (_object getvariable "JJAM_var_ammo") == false) then {
	//flip the return value

	//Add an eventhandler to set the targets ammo to max when they shoot (this is the implementation of infinite ammo)
	ammoHandler = _object addEventHandler ["fired", {_this select 0 setAmmo [_this select 1, 1000000];}];

	//Set the targets current ammo to max incase they currently don't have max ammo and haven't triggered the eventhandler yet
	_object setAmmo [currentWeapon _object, 1000000];

	//Set a variable so we can remotly check the targets infinite ammo status
	_object setVariable ["JJAM_var_ammo", true, true];

	//Set a hint that will be returned to the admin that execute the feature
	_hint = "%1You <t color='#1DA0FF'>enabled</t> Infinite Ammo for<br/><t color='#1DA0FF'>%2</t>";

	//Send a hint to the target
	[parseText format ["%1An admin <t color='#1DA0FF'>enabled</t> infinite ammo for you.", playerHeader]] remoteExec ["hintSilent", _object];uiSleep 5;[""] remoteExec ["hintSilent", _object];
} else {
	//Remove eventHandler
	_object removeEventHandler ["fired", ammoHandler];
	//Set a variable so we can remotly check the targets infinite ammo status
	_object setVariable ["JJAM_var_ammo", false, true];
	//Set a hint that will be returned to the admin that execute the feature
	_hint = "%1You <t color='#1DA0FF'>disabled</t> Infinite Ammo for<br/><t color='#1DA0FF'>%2</t>";
	//Send a hint to the target
	[parseText format ["%1An admin <t color='#1DA0FF'>disabled</t> infinite ammo for you.", playerHeader]] remoteExec ["hintSilent", _object];uiSleep 5;[""] remoteExec ["hintSilent", _object];
};

//Hint return
//Check if this function was executed remotly (by an admin)
if (remoteExecutedOwner isEqualTo 0) then {
	//function wasn't executed by a remote machine, just hint locally
	hintSilent parseText format [_hint, adminHeader, name _object];
	player setVariable ["hintimer", 3];
} else {
	//Function was executed remotly, send the hint to the admin that triggered the execution
	[parseText format [_hint, adminHeader, name _object]] remoteExec ["hintSilent", remoteExecutedOwner];uiSleep 3;[""] remoteExec ["hintSilent", remoteExecutedOwner];
};
