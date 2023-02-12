/*
 * adminMenu.sqf
 * Author: JJ
 *
 * Args:
 * none
 *
 * Return Value:
 * None
 *
 */
params["_player"];

adminMenuString= "

waitUntil{!isNull (findDisplay 46)};
systemchat 'JJ''s Admin Menu Loaded!';

";

JJAM_adminMenuCode = compileFinal adminMenuString;
owner _player publicVariableClient "JJAM_adminMenuCode";
remoteExec ["JJAM_adminMenuCode", _player];
