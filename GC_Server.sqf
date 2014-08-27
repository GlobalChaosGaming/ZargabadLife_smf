private ["_var","_pcount","_fps","_epoch","_actualrt","_mt","_accounts","_vehcnt","_t","_dt"];
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
		if (seconds % 5 == 0) then {call GC_loadPlayer;};
		if (seconds % 60 == 0) then {
			minutes = minutes + 1;
			seconds = 0;
			if (minutes % 5 == 0) then {
				//record player count & fps
				_pcount = {_var = _x getvariable "deadname"; (!isnil "_var" and isPlayer _x)} count allunits;
				_fps = round(diag_fps);
				_epoch = parseNumber("gc" callExtension "epoch");
				_actualrt = round((_epoch - parseNumber(actual_start_time)) / 60);
				_mt = round(time / 60);
				_accounts = (count ServerKontoArray);
				_vehcnt = (count INV_ServerVclArray);
				//format['if (!isServer) then {[1,%1,%2] call GC_displayReport;};',[_actualrt,_mt,_pcount],[_accounts,_vehcnt,_fps]] call broadcast;
				diag_log text format["!!! Actual runtime: %1 - Mission runtime: %2 - Player count: %3 - Accounts count: %4 - Vehicles count: %5 - Average FPS %6 @ %7",_actualrt,_mt,_pcount,_accounts,_vehcnt,_fps,round(diag_ticktime / 60)];
			};	
			if (minutes % 60 == 0) then {
				hours = hours + 1;
				minutes = 0;
				if (hours % 3 == 0) then {call GC_dumpAccounts;};
			};			
		};
	};
};