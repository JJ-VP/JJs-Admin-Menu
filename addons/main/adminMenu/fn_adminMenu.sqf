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

// Sanity checks before running anything
if (!JJAdminMenu) exitWith {};
_isadmin = _player call JJAM_fnc_isAdmin;
if (!_isAdmin) exitWith {};

//Generate feature list
features = [
	// ["Display Name", "executableName", isExecutable],
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
	["", "", false, ""],
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
//Send feature list to player
owner _player publicVariableClient "features";

//Send GUI instructions to player
owner _player publicVariableClient "JJAM_fnc_adminMenuGUI";
// Render the UI on the player
0 remoteExec ["JJAM_fnc_adminMenuGUI", _player];
