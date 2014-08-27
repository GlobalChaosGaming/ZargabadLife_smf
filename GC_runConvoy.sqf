diag_log text format ["starting %1 at %2",__FILE__,time];

_added = false;
_sidewon = "Neither";
_counter = 0;
_counter2 = 0;

//Gets position to spawn
_array  = [[VIPspawn1, 10], [VIPspawn2, 10], [VIPspawn3, 10], [VIPspawn4, 10], [VIPspawn5, 10]];
_spawn   = (floor(random(count _array)));
_pos    = (_array select _spawn) select 0;
_radius = (_array select _spawn) select 1;

// spawn markers truck and soldiers
_markerobj = createMarker ["convoy",[0,0]];
_markername = "convoy";
_markerobj setMarkerShape "ICON";
"convoy" setMarkerType "Marker";
"convoy" setMarkerColor "ColorRed";
"convoy" setMarkerText "Government convoy";

convoy_marker_active = 1;
convoyhascash=true; publicvariable "convoyhascash";

convoytruck = "Ural_TK_CIV_EP1" createVehicle getPos _pos;

convoytruck setVehicleInit "
convoytruck = this;
this setVehicleVarName ""convoytruck"";
this setAmmoCargo 0;
clearweaponcargo this;
clearmagazinecargo this;
";
processinitcommands;
publicvariable "convoytruck";
convoytruck setDir (getDir _pos);

convoysoldier = govconvoygroup createUnit ["GUE_Commander", _pos, [], _radius, "FORM"];
convoysoldier setvehicleinit 'convoysoldier = this;this setVehicleVarName "convoysoldier";';
convoysoldier setskill 0.55;

convoyguard1 = govconvoygroup createUnit ["GUE_Soldier_2", _pos, [], _radius, "FORM"];
convoyguard1 setvehicleinit 'convoyguard1 = this;this setVehicleVarName "convoyguard1";';
convoysoldier setskill 0.55;

convoyguard2 = govconvoygroup createUnit ["GUE_Soldier_2", _pos, [], _radius, "FORM"];
convoyguard2 setvehicleinit 'convoyguard2 = this;this setVehicleVarName "convoyguard2";';
convoysoldier setskill 0.55;

convoyguard3 = govconvoygroup createUnit ["GUE_Soldier_2", _pos, [], _radius, "FORM"];
convoyguard3 setvehicleinit 'convoyguard3 = this;this setVehicleVarName "convoyguard3";';
convoysoldier setskill 0.55;

convoyguard4 = govconvoygroup createUnit ["GUE_Soldier_2", _pos, [], _radius, "FORM"];
convoyguard4 setvehicleinit 'convoyguard4 = this;this setVehicleVarName "convoyguard4";';
convoysoldier setskill 0.55;

processInitCommands;

govconvoygroup selectLeader convoysoldier;

convoysoldier moveInDriver convoytruck;
convoysoldier assignAsDriver convoytruck;

//make guards follow convoysoldier
convoyguard1 dofollow convoysoldier;
convoyguard2 dofollow convoysoldier;
convoyguard3 dofollow convoysoldier;
convoyguard4 dofollow convoysoldier;

govconvoygroup setbehaviour "AWARE";
govconvoygroup setCombatMode "GREEN";

//put guards in car with convoysoldier
convoyguard1 moveincargo convoytruck;
convoyguard1 assignAsCargo convoytruck;
convoyguard2 moveInCargo convoytruck;
convoyguard2 assignAsCargo convoytruck;
convoyguard3 moveInCargo convoytruck;
convoyguard3 assignAsCargo convoytruck;
convoyguard4 moveInCargo convoytruck;
convoyguard4 assignAsCargo convoytruck;
sleep 2;
convoysoldier commandMove getmarkerpos "policebase";

convoytruck setVehicleLock "locked";
convoytruck lock true;

_truckpos = [];

//start mission loop
"server globalchat ""The supply truck has spawned! Civs: kill the driver to stop it and steal the government funds. Cops: your bonuses are inside, make sure it gets to the base!"";" call broadcast;
while {true} do {

	"if(alive player and isciv and player distance convoytruck <= 150)then{titleText [""The Government is operating in this area! Turn back or you will be shot!"", ""plain down""]};" call broadcast;
	"convoy" setmarkerpos getpos convoytruck;


	if (!convoyhascash) exitwith
		{
		_sidewon = "Civs";
		_truckpos = getPosASL convoytruck;
		deletevehicle convoytruck;
		
		};

	if (!alive convoyguard1) then {deletevehicle convoyguard1;};
	if (!alive convoyguard2) then {deletevehicle convoyguard2;};
	if (!alive convoyguard3) then {deletevehicle convoyguard3;};
	if (!alive convoyguard4) then {deletevehicle convoyguard4;};

	if (!alive convoysoldier and !_added) then {
		_added = true;
		govconvoygroup setbehaviour "AWARE";
		govconvoygroup setCombatMode "RED";
		"if (isciv) then {server sidechat ""The government convoy driver is dead. Steal the police paycheck."";};" call broadcast;
		"if (iscop) then {server sidechat ""The governemnt convoy driver is dead. Get in his truck and drive it to the Cop Base"";};" call broadcast;
		convoytruck setVehicleLock "unlocked";
		convoytruck lock false;
		[convoyguard1, convoyguard2,convoyguard3,convoyguard4] orderGetIn false;
		unassignVehicle convoyguard1;
		unassignVehicle convoyguard2;
		unassignVehicle convoyguard3;
		unassignVehicle convoyguard4;
		convoyguard1 action ["eject", convoytruck];
		convoyguard2 action ["eject", convoytruck];
		convoyguard3 action ["eject", convoytruck];
		convoyguard4 action ["eject", convoytruck];
		convoyguard1 dofollow convoytruck;
		convoyguard2 dofollow convoytruck;
		convoyguard3 dofollow convoytruck;
		convoyguard4 dofollow convoytruck;
	};

	if (_counter >= 15 and !_added) then {
		govconvoygroup setBehaviour "AWARE";
		govconvoygroup setSpeedMode "LIMITED";
		convoysoldier commandmove getmarkerpos "policebase";
		[convoyguard1, convoyguard2,convoyguard3,convoyguard4] orderGetIn true;
		_counter = 0;
	};

	if (convoytruck distance getmarkerpos "policebase" < 150) exitwith
		{
		"if (iscop) then {Kontostand = (Kontostand + govconvoybonus); player sidechat format[""you received $%1 for the successfully escorting the convoy"", govconvoybonus];};" call broadcast;
		_sidewon = "Cops";
		deletevehicle convoytruck;
		convoyhascash=false; publicvariable "convoyhascash";
		};

	if (_counter2 >= 900) exitwith
		{
		_sidewon = "Neither";
		deletevehicle convoytruck;
		convoyhascash=false; publicvariable "convoyhascash";
		};

	if (GETDAMMAGE convoytruck >= 0.8) exitwith {
		"server globalchat ""The government truck has been destroyed the money has burned"";" call broadcast;
		_sidewon = "Neither";
		[convoytruck,60,false] execVM "ammo_burn.sqf";
		convoytruck setdammage 1;
		convoyhascash=false; publicvariable "convoyhascash";
	};

	{
		if (vehicle _x != _x) then {
			if (alive vehicle _x and driver vehicle _x in playableunits and side _x != west) then {
				private["_pos", "_cfymax", "_cfymin", "_cfxmin", "_cfxmax", "_myx", "_myy"];
				_cfymax = 4217;
				_cfymin = 4096;
				_cfxmax = 4346;
				_cfxmin = 4192;

				_pos = getPosATL _x;
				_myx = _pos select 0;
				_myy = _pos select 1;

				if !((_myx < _cfxmax and _myx > _cfxmin) and (_myy < _cfymax and _myy > _cfymin)) then {
					if (alive convoyguard1) then {convoyguard1 doWatch _x;convoyguard1 dofire _x;};
					if (alive convoyguard2) then {convoyguard2 doWatch _x;convoyguard2 dofire _x;};
					if (alive convoyguard3) then {convoyguard3 doWatch _x;convoyguard3 dofire _x;};
					if (alive convoyguard4) then {convoyguard4 doWatch _x;convoyguard4 dofire _x;};
				};
			};
		 } else {
		 	if (alive _x and _x in playableunits and side _x != west) then {
		 		if (count (weapons _x - nonlethalweapons) > 0) then {
					private["_pos", "_cfymax", "_cfymin", "_cfxmin", "_cfxmax", "_myx", "_myy"];
					_cfymax = 4217;
					_cfymin = 4096;
					_cfxmax = 4346;
					_cfxmin = 4192;

					_pos = getPosATL _x;
					_myx = _pos select 0;
					_myy = _pos select 1;

					if !((_myx < _cfxmax and _myx > _cfxmin) and (_myy < _cfymax and _myy > _cfymin)) then {
						if (alive convoyguard1) then {convoyguard1 doWatch _x;convoyguard1 dofire _x;};
						if (alive convoyguard2) then {convoyguard2 doWatch _x;convoyguard2 dofire _x;};
						if (alive convoyguard3) then {convoyguard3 doWatch _x;convoyguard3 dofire _x;};
						if (alive convoyguard4) then {convoyguard4 doWatch _x;convoyguard4 dofire _x;};
					};
				};
			};
		};
	} forEach (nearestObjects [convoytruck, ["Man","LandVehicle","Tank","Air","Ship"], 150]);

	_counter2 = _counter2 + 1;

	_counter = _counter + 1;

	sleep 1;
};

//drop weapons

if (_sidewon == "Civs") then {
	_ctime = round(time);
	_numAKs = floor(random 4) + 1;
	call compile format ['
		waffenhalter%1 = "weaponholder" createVehicle _truckpos;
		waffenhalter%1 setVehicleInit "this setVehicleVarName ""waffenhalter%1""; waffenhalter%1 = this;";
		processInitCommands;
	', _ctime];
	sleep 0.5;
	format ["for ""_i"" from 0 to %2 do {waffenhalter%1 addWeaponCargo [""AKS_GOLD"", 1]; waffenhalter%1 addMagazineCargo [""30Rnd_762x39_AK47"", 12]}; waffenhalter%1 setposASL %3;", _ctime, _numAKs, _truckpos] call broadcast;
};

//mission has ended resetting vars and deleting units
(format ['server globalChat "%2 side won the government convoy mission, next truck leaves in %1 minutes!";', 30, _sidewon]) call broadcast;
deletevehicle convoyguard1;
deletevehicle convoyguard2;
deletevehicle convoyguard3;
deletevehicle convoyguard4;
deletevehicle convoysoldier;
deletemarker "convoy";

moneyintruck = true;

nextconvoytime = time + 1800;

diag_log text format ["finished %1 at %2",__FILE__,time];