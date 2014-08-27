private ["_t","_dt","_var","_pcount","_fps","_epoch","_actualrt","_mt","_accounts","_vehcnt"];

actual_start_time = "gc" callExtension "epoch";
"gc" callExtension format["W|%1|%2|%3|%4","__SERVER__","GC_Server","ST",actual_start_time];

{call compile format["%1money = 10000; publicvariable ""%1money"";", _x];} forEach robbable;
govconvoygroup = createGroup RESISTANCE;
govconvoygroup allowFleeing 0;

convoy_handle = [] spawn {};
convoy_time = 0;

lastraidcount = 0;

one_stamp =  0;
seconds = 0;
minutes = 0;
hours = 0;
onEachFrame {
	_t = diag_ticktime;
	_dt = _t - one_stamp;
	if (_dt >= 1) then {
		one_stamp = _t;
		seconds = seconds + 1;
		if (seconds % 3 == 0) then {call GC_loadPlayer;};
		if (seconds % 5 == 0) then {call GC_cleanVehicles;};
		if (seconds % 7 == 0) then {call GC_lowerGates;};
		if (seconds % 30 == 0) then {
			call GC_updateRobMoney;
			call GC_cleanRaids;
		};
		if (seconds % 60 == 0) then {
			minutes = minutes + 1;
			seconds = 0;
			call GC_cleanObjects;
			call GC_cleanJail;
			if (minutes % 2 == 0) then {
				call GC_cleanNarcs;
				call GC_cleanTaxiNPCs;
			};
			if (minutes % 3 == 0) then {call GC_writeObjects;};
			/*
			if (minutes % 4 == 0) then {
				//record player count & fps
				_pcount = {_var = _x getvariable "deadname"; (!isnil "_var" and isPlayer _x)} count allunits;
				_fps = round(diag_fps);
				_epoch = parseNumber("gc" callExtension "epoch");
				_actualrt = round((_epoch - parseNumber(actual_start_time)) / 60);
				_mt = round(time / 60);
				_accounts = (count ServerKontoArray);
				_vehcnt = (count INV_ServerVclArray);
				format['if (!isServer) then {[1,%1,%2] call GC_displayReport;};',[_actualrt,_mt,_pcount],[_accounts,_vehcnt,_fps]] call broadcast;
				diag_log text format["!!! Actual runtime: %1 - Mission runtime: %2 - Player count: %3 - Accounts count: %4 - Vehicles count: %5 - Average FPS %6 @ %7",_actualrt,_mt,_pcount,_accounts,_vehcnt,_fps,round(diag_ticktime / 60)];
			};
			*/
			if (minutes % 5 == 0) then {
				call GC_cleanGroups;
				call GC_mateAnimals;
				//call GC_deleteRestricted;
			};
			if (minutes % 7 == 0) then {call GC_deleteDead;};
			if (minutes % 20 == 0) then {"if (!isServer) then {[] spawn BANK_zinsen;};" call broadcast;};
			if (minutes % 28 == 0) then {"if (!isServer) then {hint ""The Government convoy will leave in a couple minutes."";};" call broadcast;};
			if (minutes % 30 == 0) then {
				if (scriptDone convoy_handle) then { convoy_handle = [] spawn GC_runConvoy; convoy_time = _t;};
			};
			if (minutes % 60 == 0) then {
				hours = hours + 1;
				minutes = 0;
				call GC_deleteVehicles;
				if (hours % 3 == 0) then {call GC_dumpAccounts;};
			};
		};
	};
};
