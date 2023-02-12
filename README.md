# JJs-Admin-Menu
## JJ's Administration Menu
### Setup
JJAM is a server side mod, this means it is a mod that is ran by the server **ONLY** it doesn't need to be downloaded / ran by the client.<br>
To get JJAM working you need to clone the repo to your server and add it as a `-servermod`<br>
Edit the init.sqf inside JJ's Admin Menu >> addons >> main >> fnc >> init.sqf and add you / your admins Steam64 IDs to the JJAM_admins array.
Save the init.sqf then go back to JJ's Admin Menu >> addons turn the main folder here into a .pbo file (pboManager works for this)

### Features
- N/A

### Plans
- Base menu
- Basic administrative features

### Issues
- ```player call JJMC_fnc_isAdmin``` will not function on a live server as only server knows that JJMC_fnc_isAdmin exists.

<br><br>
*This content is covered under ADPL-SA licence (Arma and Dayz Public License Share Alike)* <br>
[<img src="https://www.bohemia.net/assets/img/licenses/APL-SA.png">](https://www.bohemia.net/community/licenses/arma-and-dayz-public-license-share-alike-adpl-sa/)
