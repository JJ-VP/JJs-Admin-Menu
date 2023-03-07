# JJs-Admin-Menu
## JJ's Administration Menu
JJAM is a server sided Player, Zeus and administration menu providing a large variety of features for players and admins alike, each menu can be enabled and used seperatly or when everything is enabled you can navigate between each menu if you have the right access. The player menu is enabled for all players, the zeus menu is avalible to any player that has access to the curator interface and admin access is assigned though the configuration section of the init file.

### Setup
JJAM is a server side mod, this means it is a mod that is ran by the server **ONLY** it doesn't need to be downloaded / ran by the client.<br>
To get JJAM working you need to clone the repo to your server and add it as a `-servermod`<br>
Edit the init.sqf inside JJ's Admin Menu >> addons >> main >> fnc >> init.sqf and add you / your admins Steam64 IDs to the JJAM_admins array.
Save the init.sqf then go back to JJ's Admin Menu >> addons turn the main folder here into a .pbo file `main.pbo` (pboManager or PBO Viewer work for this)

### Features
- Player Menu
  - Toggle backpack visibility
  - Toggle grass visibility
- Zeus Menu
  - Show players FPS
  - Heal all
- Admin Menu (All features can be enabled for any player on the server not just yourself)
  - God mode
  - Vehicle god mode
  - Infinite ammo
  - Invisible / noclip
  - Infinite ammo
  - Rapid fire
  - No recoil
  - No sway
  - Movement speed
  - Map TP (click on map to teleport there)
  - Map markers (view all players on map)
  - Freeze player
  - Heal players
  - Kill players
  - TP to plyer
  - TP player to you
  - Repair players vehicle
  - Explode players vehicle
  - Destroy players vehicle (no explosion)
  - Set player in to BIS Spectator
  - Put player into arsenal (ACE arsneal if it is avalible or BIS arsenal if it is not)
  - View players arsenal remotly (ACE arsneal if it is avalible or BIS arsenal if it is not)
  - Put player into BIS Garage (vehicle won't spawn on the server, only the client in the garage can see it)
  - Take players loadout
  - Give player your loadout
  - Make player pee
  - View players info (name, steam name, location, loadout)
  - Send player to lobby
  - Loadout system, (save and load loadout (saves between games))

### Plans
- Player menu
- Zeus menu
- Admin menu

### Issues
- N/A

<br><br>
*This content is covered under APL-SA licence (Arma Public License Share Alike)* <br>
[<img src="https://www.bohemia.net/assets/img/licenses/APL-SA.png">](https://www.bohemia.net/community/licenses/arma-public-license-share-alike)
