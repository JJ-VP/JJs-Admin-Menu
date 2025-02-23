while (true) do {
	waitUntil {player getvariable "JJAM_fnc_rapid"};
	_object = [objectParent player, player] select (isNull objectParent player);
	_object setWeaponReloadingTime[_object, currentWeapon _object, 0];
	uiSleep 0.01;
};