private ["_terrorcamp","_code","_foreachindex","_weptypes","_wepcounts","_magtypes","_magcounts","_read","_pos","_dir","_weps","_mags","_class","_holder","_counter","_mounter","_on","_bon","_mountinit","_bskin","_arr","_damage","_name","_trunk","_nitro","_tuning","_caralarm","_customhorn","_radar","_mount","_skin","_bunny","_fuel","_vehicle","_parent","_mountst","_mountar","_mv","_droparray","_obj"];
_terrorcamp = [
    ["CampEast",[2.5332,-0.311768,0.039999],283.332,1,0,"this allowdamage false"],
	["Land_fort_bagfence_long",[0.247314,-3.61646,0.000640869],12.3775,1,0,"this allowdamage false"],
	["Land_fort_bagfence_long",[2.41748,3.2937,0.00101471],12.3775,1,0,"this allowdamage false"],
	["Land_fort_bagfence_long",[3.26733,-4.30664,0.000642776],12.3775,1,0,"this allowdamage false"],
	["Land_fort_bagfence_long",[-5.39453,2.56592,0.00132561],283.214,1,0,"this allowdamage false"],
	["Land_fort_bagfence_long",[5.4375,2.6438,0.00102806],12.3775,1,0,"this allowdamage false"],
	["Land_fort_bagfence_long",[-6.2146,-0.564209,0.00132561],283.214,1,0,"this allowdamage false"],
	["Land_BagFenceShort",[-1.10132,6.48828,-0.00555801],11.2312,1,0,"this allowdamage false"],
	["Land_fort_bagfence_long",[-4.60449,5.57593,0.00132561],283.214,1,0,"this allowdamage false"],
	["Fort_RazorWire",[-7.01611,1.68457,0.025835],103.734,1,0,"this allowdamage false"],
	["Paleta2",[0.870117,7.27393,-0.305582],0,1,0,"this allowdamage false"],
	["Land_BagFenceRound",[7.45068,-2.10229,0.0373478],327.793,1,0,"this allowdamage false"],
	["Land_Misc_deerstand",[-6.68457,-4.98682,0.0129738],98.4784,1,0,"this allowdamage false"],
	["Land_fort_bagfence_long",[-0.134521,7.92578,0.00132561],283.214,1,0,"this allowdamage false"],
	["Paleta1",[1.52002,8.97192,3.62396e-005],33.3458,1,0,"this allowdamage false"],
	["Land_fort_bagfence_long",[-3.85449,8.48584,0.000516891],283.214,1,0,"this allowdamage false"],
	["Land_fort_bagfence_round",[-9.44019,-4.36401,-0.00476646],276.808,1,0,"this allowdamage false"],
	["Land_fort_bagfence_long",[-5.93237,-7.89648,0.00102615],11.5005,1,0,"this allowdamage false"],
	["Fort_RazorWire",[0.127441,-10.2043,-0.0012188],10.8805,1,0,"this allowdamage false"],
	["Land_BagFenceShort",[-2.82129,10.0686,-0.00297546],11.2312,1,0,"this allowdamage false"],
	["Land_fort_bagfence_long",[0.316406,11.0063,0.000499725],279.914,1,0,"this allowdamage false"],
	["Land_A_tent",[10.1558,-5.00244,0.000844955],108.817,1,0,"this allowdamage false"],
	["Land_A_tent",[11.0476,-2.62378,0.000871658],91.9025,1,0,"this allowdamage false"],
	["Land_fort_bagfence_long",[5.47729,-10.0566,0.000650406],12.3775,1,0,"this allowdamage false"],
	["Land_fort_bagfence_long",[9.87646,-6.53491,0.000814438],17.6635,1,0,"this allowdamage false"],
	["Land_A_tent",[11.876,-0.132324,0.00130844],106.923,1,0,"this allowdamage false"],
	["Land_BagFenceLong",[8.42163,8.57031,-0.0331078],102.951,1,0,"this allowdamage false"],
	["Land_BagFenceShort",[4.5979,11.2478,-0.00428963],15.8855,1,0,"this allowdamage false"],
	["Barrel5",[9.68604,-7.42261,0.000579834],359.983,1,0,"this allowdamage false"],
	["Paleta2",[8.76343,-8.50952,-0.305826],347.89,1,0,"this allowdamage false"],
	["Land_BagFenceLong",[2.26294,12.0293,-0.00639153],12.148,1,0,"this allowdamage false"],
	["Land_A_tent",[12.5449,2.48828,0.00069809],114.811,1,0,"this allowdamage false"],
	["Barrel5",[10.396,-7.59253,0.000579834],359.983,1,0,"this allowdamage false"],
	["Barrel5",[9.83594,-8.33276,0.000570297],359.983,1,0,"this allowdamage false"],
	["Fort_RazorWire",[3.84741,12.479,0.00153542],14.1548,1,0,"this allowdamage false"],
	["Land_BagFenceLong",[12.801,-2.90039,-0.0584106],106.41,1,0,"this allowdamage false"],
	["Land_BagFenceLong",[11.821,-5.82056,-0.0610714],106.368,1,0,"this allowdamage false"],
	["Land_fort_bagfence_long",[8.69116,-10.2813,0.000963211],355.662,1,0,"this allowdamage false"],
	["Land_BagFenceLong",[13.5771,0.0673828,-0.0514469],105.692,1,0,"this allowdamage false"],
	["Land_BagFenceLong",[10.9211,-8.70044,-0.0610542],105.692,1,0,"this allowdamage false"],
	["Land_BagFenceLong",[10.1038,9.67871,-0.00797844],15.305,1,0,"this allowdamage false"],
	["Fort_RazorWire",[-1.73315,14.356,0.0020504],16.6972,1,0,"this allowdamage false"],
	["Fort_RazorWire",[14.4099,-1.67603,-0.0181541],287.502,1,0,"this allowdamage false"],
	["Land_BagFenceLong",[14.4629,2.94238,-0.0252361],106.368,1,0,"this allowdamage false"],
	["Land_BagFenceLong",[15.4412,5.84961,-0.0448494],106.41,1,0,"this allowdamage false"],
	["Land_BagFenceCorner",[15.9612,7.95825,-0.00975227],15.1558,1,0,"this allowdamage false"],
	["Fort_RazorWire",[16.7024,5.52368,-0.0130482],288.006,1,0,"this allowdamage false"]
];
_house1 = [
  ["Land_House_C_4_EP1",[0,0,0],-5,1,0,"this addeventhandler [""HandleDamage"",{false}];"],
  ["Fence_corrugated_plate",[-3,3.7,.50],175,1,0,"this addeventhandler [""HandleDamage"",{false}];"],
  ["Fence_corrugated_plate",[-2.25,-2.75,4.55],85,1,0,"this addeventhandler [""HandleDamage"",{false}]; this setvectorup [0,0,-1];"],
  ["UNBasicAmmunitionBox_EP1",[7.15,1,3.7],84.25,1,0,"this addeventhandler [""HandleDamage"",{false}]; this setvectorup [0,0,1];clearMagazineCargo this;clearWeaponCargo this;"],
  ["Land_Ind_Garage01_EP1",[13,0,0],-5,1,0,"this addeventhandler [""HandleDamage"",{false}];"]
];
_house2 = [
  ["Land_House_C_5_EP1",[0,0,0],80,1,0,"this addeventhandler [""HandleDamage"",{false}]; this setvectorup [0,0,1];"],
  ["Fence_corrugated_plate",[4,-3.90,.15],-10.5,1,0,"this addeventhandler [""HandleDamage"",{false}];"],
  ["UNBasicAmmunitionBox_EP1",[-1.25,1.25,.35],170,1,0,"this addeventhandler [""HandleDamage"",{false}]; this setvectorup [0,0,1];clearMagazineCargo this;clearWeaponCargo this;"],
  ["Land_Ind_Garage01_EP1",[11,3,0],170,1,0,"this addeventhandler [""HandleDamage"",{false}];"]
];
_house3 = [
  ["Land_House_L_6_EP1",[0,0,0],270,1,0,"this addeventhandler [""HandleDamage"",{false}];"],
  ["Fence_corrugated_plate",[0,1,3],0,1,0,"this addeventhandler [""HandleDamage"",{false}];"],
  ["Fence_corrugated_plate",[3.25,-3.5,0.35],270,1,0,"this addeventhandler [""HandleDamage"",{false}];"],
  ["UNBasicAmmunitionBox_EP1",[-1,5.75,2.75],0,1,0,"this addeventhandler [""HandleDamage"",{false}]; this setvectorup [0,0,1];clearMagazineCargo this;clearWeaponCargo this;"],
  ["Land_Ind_Garage01_EP1",[-9,-2.5,0],1,1,0,"this addeventhandler [""HandleDamage"",{false}];"]
];

_house4 = [
	["Land_House_L_7_EP1",[0,0,0],175,1,0,"this addeventhandler [""HandleDamage"",{false}];"],
	["Fence_corrugated_plate",[-0.25,3.15,0.28],88,1,0,"this allowdamage false"],
	["Land_Ind_Garage01_EP1",[10.70,-0.75,0],0,1,0,"this addeventhandler [""HandleDamage"",{false}];"],
	["UNBasicAmmunitionBox_EP1",[1,6.85,0.15],-5,1,0,"this addeventhandler [""HandleDamage"",{false}]; this setvectorup [0,0,1];clearMagazineCargo this;clearWeaponCargo this;"]
];

[[3173.26,-14.6467,6.79589],330,_terrorcamp] call GC_objMapper; //----> Terror Camp
[[4152.25,3846.35,16.5164],215.697,_house1] call GC_objMapper; //----> House Model 1 (Genfac Road)
[[4496.3,3959.22,18.5798],123.263,_house1] call GC_objMapper; //----> House Model 1_1 (Mari Sell)
[[3742.38,4184.7,15.1921],370,_house2] call GC_objMapper; //----> House Model 2 (City Hall)
[[4529.98,4229.07,17.6137],-1,_house2] call GC_objMapper;  //----> House Model 2_1 (Cop Road)
[[3807.06,4455.88,15.4726],242,_house2] call GC_objMapper;  //----> House Model 2_2 (Meth Lab)
[[4224.2,4345.48,16.294],267.271,_house3] call GC_objMapper; //----> House Model 3 (Fosters House)
[[4295.79,3376.23,16.484],290,_house3] call GC_objMapper;  //----> House Model 3_1 (GA3)
[[4523.13,3942.39,18.4379],129.274,_house4] call GC_objMapper; //---->House Model 4 (Jesus house)

hf1 = "Fence_corrugated_plate" createvehicle [4152.45,3852.375,17.1925];
hf1 setposasl [4152.45,3852.375,17.1925];
hf1 setdir 212; publicvariable "hf1";
hs1 = "SignM_FARP_Winchester_EP1" createvehicle [4157.04,3853.08,16.8055];
hs1 setposasl [4157.04,3852.40,16.8055];
hs1 setdir 212; publicvariable "hs1";
hf1_1 = "Fence_corrugated_plate" createvehicle [4490.35,3959.07,19.1394];
hf1_1 setposasl [4490.25,3959.07,19];
hf1_1 setdir 119; publicvariable "hf1_1";
hs1_1 = "SignM_FARP_Winchester_EP1" createvehicle [4490.01,3963.82,18.6458];
hs1_1 setposasl [4490.01,3963.78,18.6458];
hs1_1 setdir 120; publicvariable "hs1_1";

hf2 = "Fence_corrugated_plate" createvehicle [3738.40,4189.9,15.425];
hf2 setposasl [3738.40,4189.9,15.425];
hf2 setdir 180; publicvariable "hf2";
hs2 = "SignM_FARP_Winchester_EP1" createvehicle [3742.64,4191.46,15.3873];
hs2 setposasl [3742.64,4191.46,15.3873];
hs2 setdir 180; publicvariable "hs2";
hf2_1 = "Fence_corrugated_plate" createvehicle [4525.25,4233.04,17.9];
hf2_1 setposasl [4525.25,4233.50,17.9];
hf2_1 setdir 170; publicvariable "hf2_1";
hs2_1 = "SignM_FARP_Winchester_EP1" createvehicle [4528.34,4236.42,17.7419];
hs2_1 setposasl [4528.34,4236.42,17.7419];
hs2_1 setdir 168; publicvariable "hs2_1";
hf2_2 = "Fence_corrugated_plate" createvehicle [3805.5,4449.61,15.843];
hf2_2 setposasl [3805.25,4449.58,15.75];
hf2_2 setdir 52.15; publicvariable "hf2_2";
hs2_2 = "SignM_FARP_Winchester_EP1" createvehicle [3801.78,4451.14,15.2865];
hs2_2 setposasl [3801.78,4451.14,15.2865];
hs2_2 setdir 52; publicvariable "hs2_2";

hs3 = "SignM_FARP_Winchester_EP1" createvehicle [4232.43,4348.05,16.4942];
hs3 setposasl [4232.43,4348.05,16.4942];
hs3 setdir 270; publicvariable "hs3";
hf3 = "Fence_corrugated_plate" createvehicle [4229.97,4344.89,16.6454];
hf3 setposasl [4230.35,4344.89,16.57];
hf3 setdir 270; publicvariable "hf3";
hs3_1 = "SignM_FARP_Winchester_EP1" createvehicle [4304.06,3374.58,16.7186];
hs3_1 setposasl [4304.06,3374.58,16.7186];
hs3_1 setdir 292; publicvariable "hs3_1";
hf3_1 = "Fence_corrugated_plate" createvehicle [4301.34,3373.29,16.7481];
hf3_1 setposasl [4301.34,3373.29,16.70];
hf3_1 setdir 290.5; publicvariable "hf3_1";

hf4 = "Fence_corrugated_plate" createvehicle [4520.9,3946.94,19.38];
hf4 setposasl [4520.9,3947.20,19.38];
hf4 setdir 125; publicvariable "hf4";
hs4 = "SignM_FARP_Winchester_EP1" createvehicle [4521.45,3950.8,18.5895];
hs4 setposasl [4521.45,3950.8,18.5895];
hs4 setdir 126; publicvariable "hs4";

hobjs = [
	hf1,hs1,
	hf1_1,hs1_1,
	hf2,hs2,
	hf2_1,hs2_1,
	hf2_2,hs2_2,
	hf3,hs3,
	hf3_1,hs3_1,
	hf5,hs5
];
{_x addeventhandler ["HandleDamage",{false}];} foreach hobjs;

//Meth Lab
_table = "FoldTable" createvehicle [3746.25,4517.525,15.5365];
_table setposasl [3746.25,4517.525,15.5365];
_table setdir 282.55;
_jug = "Land_Canister_EP1" createvehicle [3746.41,4515.99,15.6257];
_jug setposasl [3745.925,4516.19,15.6257];
_jug setdir 192.80;
_barrel = "Land_Barrel_empty" createvehicle [3746.155,4517.07,16.325];
_barrel setposasl [3746.155,4517.07,16.325];
_barrel setvectorup [0,0,1];
_barrel2 = "Land_Barrel_empty" createvehicle [3746.365,4518,16.325];
_barrel2 setposasl [3746.365,4518,16.325];
_barrel2 setvectorup [0,0,1];
_fire = "Land_Fire_burning" createvehicle [3746.15,4517.07,15.5365];
_fire setposasl [3746.155,4517.07,15.5365];
_fire setvectorup [0,0,1];
_fire2 = "Land_Fire_burning" createvehicle [3746.365,4518,15.5365];
_fire2 setposasl [3746.365,4518,15.5365];
_fire2 setvectorup [0,0,1];
_methlabitems = [_table,_jug,_barrel,_barrel2];
{
	_x allowdammage false;
	_x enablesimulation false;
} foreach _methlabitems;

/*
//dropped weapons
_counter = 0;
while{true} do {
	_read = "gc" callExtension format["R|%1|%2|%3","__SERVER__","GC_WeaponHolders",_counter];
	if (_read == "") exitWith {};
	_read = call compile _read;
	_pos = _read select 0;
	_dir = _read select 1;
	_weps = _read select 2;
	_mags = _read select 3;
	_class = _read select 4;
	_code = "";
	if (count _weps > 0) then {
		_weptypes = _weps select 0;
		_wepcounts = _weps select 1;
		{
			_code = _code + format['this addweaponcargo ["%1",%2];',_x,(_wepcounts select _foreachindex)];
		} foreach _weptypes;
	};
	if (count _mags > 0) then {
		_magtypes = _mags select 0;
		_magcounts = _mags select 1;
		{
			_code = _code + format['this addmagazinecargo ["%1",%2];',_x,(_magcounts select _foreachindex)];
		} foreach _magtypes;
	};
	_holder = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
	diag_log _read;
	_holder setposASL _pos;
	_holder setdir _dir;
	_holder setVehicleInit format['%1',_code];
	processInitCommands;
	_counter = _counter + 1;
};
*/
// dropped suitcases
_counter = 0;
while{true} do {
	_read = "gc" callExtension format["R|%1|%2|%3","__SERVER__","GC_Objects",_counter];
	if (_read == "") exitWith {};
	_read = call compile _read;
	_pos = _read select 0;
	_dir = _read select 1;
	_class = _read select 2;
	_droparray = _read select 3;
	_obj = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
	diag_log _read;
	_obj setposASL _pos;
	_obj setdir _dir;
	_obj setvariable["droparray",_droparray,true];
	_counter = _counter + 1;
};

//parked vehicles
reattach = [];
_counter = 0;
while{true} do {
	_read = "gc" callExtension format["R|%1|%2|%3","__SERVER__","GC_Vehicles",_counter];
	if (_read == "") exitWith {};
	_read = call compile _read;
	_pos = _read select 0;
	_dir = _read select 1;
	_damage = _read select 2;
	_class = _read select 3;
	_name = _read select 4;
	_weps = _read select 5;
	_mags = _read select 6;
	_trunk = _read select 7;
	_nitro = (_read select 8) call ISSE_str_StrToInt;
	_tuning = (_read select 9) call ISSE_str_StrToInt;
	_caralarm = (_read select 10) call ISSE_str_StrToInt;
	_customhorn = _read select 11;
	_radar = (_read select 12) call ISSE_str_StrToInt;
	_mount = _read select 13;
	_mounter = 0;
	if (_mount != "") then {
		_mounter = 1;
	};
	_skin = _read select 14;
	_bunny = _read select 15 call ISSE_str_StrToInt;
	_fuel = _read select 16;
	_on = _read select 17;
	_mountinit = "";
	_bon = false;
	if (_on != "" and _on != "<NULL-object>") then {
		_on = call compile _on;
		_bon = true;
		_mountinit = format['
			if (this iskindof "ATV_Base_EP1") then {
				this attachto[%1,[0.0,-1.35,0.80]];
			} else {
				if (this iskindof "Bicycle") then {
					this attachto[%1,[0.0,-1.4,0.27]];
				} else {
					this attachto[%1,[0.0,-1.65,0.80]];
				};
			};
			this setdir 0;
		',_on];
	};
	_code = "";
	_bskin = false;
	if (_skin != "") then {
		_code = format['this setObjectTexture [0, "%1"];',_skin];
		_bskin = true;
	};
	if (count _weps > 0) then {
		_weptypes = _weps select 0;
		_wepcounts = _weps select 1;
		{
			_code = _code + format['this addweaponcargo ["%1",%2];',_x,(_wepcounts select _foreachindex)];
		} foreach _weptypes;
	};
	if (count _mags > 0) then {
		_magtypes = _mags select 0;
		_magcounts = _mags select 1;
		{
			_code = _code + format['this addmagazinecargo ["%1",%2];',_x,(_magcounts select _foreachindex)];
		} foreach _magtypes;
	};

	_vehicle = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
	diag_log _read;
	_vehicle setposASL _pos;
	if (!_bon) then {_vehicle setdir _dir;};
	_vehicle setVariable["created",time,true];
	_vehicle setVehicleInit format['
		[this,%5] execVM "mountOnVcl\mount_vcl_init.sqf";
		this setdamage %3;
		this setfuel %4;
		this addEventHandler ["GetIn", {_this call onGetIn;}];
		this setVehicleVarName "%1";
		%1 = this;
		clearWeaponCargo this;
		clearMagazineCargo this;
		%1 removeWeapon "FFARLauncher_14";
		%1 lock true;
		%2
		%6
	',_name,_code,_damage,_fuel,_mounter,_mountinit];
	processInitCommands;
	if (count _trunk > 0) then {
		call compile format['
			%1_storage = %2;
			publicVariable "%1_storage";
		',_name,_trunk];
	};
	if (_bskin) then {_vehicle setvariable["customskin",_skin,true];};
	if (_nitro > 0) then {_vehicle setvariable["nitro",_nitro,true];};
	if (_tuning > 0) then {_vehicle setvariable["tuning",_tuning,true];};
	if (_caralarm > 0) then {
		_vehicle setvariable["caralarm",_caralarm,true];
		_vehicle setvariable["rolenum",0,true]; // will this work ok?
		_vehicle setVariable ["nextalarmtime", time, true];
		_vehicle addEventHandler ["Dammaged", {[_this] call onHit;}];	//will this work here?
	};
	if (_customhorn != "") then {_vehicle setvariable["customhorn",_customhorn,true];};
	if (_radar > 0) then {_vehicle setvariable["radar",_radar,true];};
	if (_bunny > 0) then {_vehicle setvariable["bunnyhop",_bunny,true];};
	if (_mounter == 1) then {
		_arr = [];
		call compile format['
			_arr = [%1,"%2"];
			reattach = reattach + [_arr];
		',_vehicle,_mount];

	};
	if (_mountinit != "") then {_vehicle setvariable["mountedon",_on,true];};
	call compile format ['INV_ServerVclArray = INV_ServerVclArray + [%1]',_name];
	_counter = _counter + 1;
};
{
	_parent = _x select 0;
	_mountst = _x select 1;
	_mountar = call compile _mountst;
	_mv = _mountar select 1;
	if (_mv iskindof "ATV_Base_EP1") then {
		_mv attachto[_parent,[0.0,-1.35,0.80]];
	} else {
		if (_mv iskindof "Bicycle") then {
			_mv attachto[_parent,[0.0,-1.4,0.27]];
		} else {
			_mv attachto[_parent,[0.0,-1.65,0.80]];
		};
	};
	_parent setvariable["mount",_mountar,true];
	_mv setdir 0;
} foreach reattach;

actual_load_time = "gc" callExtension "epoch";
"gc" callExtension format["W|%1|%2|%3|%4","__SERVER__","GC_Server","LT",actual_load_time];