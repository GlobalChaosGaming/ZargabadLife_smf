TankenCost = minPetrolPrice;
publicvariable "TankenCost";
//bombactive = false; publicvariable "bombactive";

cashCache = [];
loaded = [];

restrictedVehicles = [
    "M32_EP1",
    "M47Launcher_EP1",
    "MAAWS",
    "Mk13_EP1",
    "PipeBomb",
    "M249_TWS_EP1",
    "M249_m145_EP1",
    "Mk_48_DES_EP1",
    "m240_scoped_EP1",
    "UZI_SD_EP1",
    "AKS_74_NSPU",
    "FN_FA_ANPVS4",
    "M4A3_RCO_GL_EP1",
    "SCAR_H_STD_EGLM_Spect",
    "SCAR_L_CQC_EGLM_Holo",
    "SCAR_L_STD_EGLM_RCO",
    "SCAR_L_STD_EGLM_TWS",
    "M110_NVG_EP1",
    "M110_TWS_EP1",
    "M24_des_EP1",
    "SCAR_H_LNG_Sniper",
    "SCAR_H_LNG_Sniper_SD",
    "SCAR_H_STD_TWS_SD",
    "SVD_NSPU_EP1",
    "SVD_des_EP1",
    "m107_TWS_EP1",
    "2b14",
    "AGS_TK",
    "AGS_UN",
    "D30",
    "DSHKM_TK_INS_EP1",
    "DSHkM_Mini_Tripod",
    "Igla_AA_pod_TK_EP1",
    "M119_US_EP1",
    "M252_US_EP1",
    "M2HD_mini_TriPod_US_EP1",
    "MK19_TriPod_US_EP1",
    "Metis_TK_EP1",
    "SPG9_TK_INS_EP1",
    "Stinger_Pod_US_EP1",
    "TOW_TriPod_US_EP1",
    "ZU23_TK_EP1",
    "ZU23_TK_GUE_EP1",
    "ZU23_TK_INS_EP1",
    "A10_US_EP1",
    "AH64D_EP1",
    "C130J_US_EP1",
    "CH_47F_EP1",
    "Chukar_EP1",
    "L39_TK_EP1",
    "MQ9PredatorB_US_EP1",
    "Su25_TK_EP1",
    "UH60M_MEV_EP1",
    "ParachuteBigEast_EP1",
    "ParachuteBigWest_EP1",
    "ParachuteMediumEast_EP1",
    "BMP2_HQ_TK_EP1",
    "BMP2_TK_EP1",
    "BMP2_UN_EP1",
    "M113Ambul_TK_EP1",
    "M113Ambul_UN_EP1",
    "M113_TK_EP1",
    "M113_UK_EP1",
    "M1A1_US_DES_EP1",
    "M1A2_US_TUSK_MG_EP1",
    "M2A2_EP1",
    "M2A3_EP1",
    "M6_EP1",
    "MLRS_DES_EP1",
    "T34_TK_GUE_EP1",
    "T55_TK_EP1",
    "T55_TK_GUE_EP1",
    "T72_TK_EP1",
    "ZSU_TK_EP1",
    "BRDM2_ATGM_TK_EP1",
    "BRDM2_HQ_TK_GUE_EP1",
    "BRDM2_TK_EP1",
    "BRDM2_TK_GUE_EP1",
    "BTR40_MG_TK_GUE_EP1",
    "BTR40_MG_TK_INS_EP1",
    "BTR40_TK_GUE_EP1",
    "BTR40_TK_INS_EP1",
    "BTR60_TK_EP1",
    "GRAD_TK_EP1",
    "HMMWV_Ambulance_CZ_DES_EP1",
    "HMMWV_Ambulance_DES_EP1",
    "HMMWV_DES_EP1",
    "HMMWC_M1035_DES_EP1",
    "HMMWV_M998A2_SOV_DES_EP1",
    "HMMWV_TOW_DES_EP1",
    "HMMWV_Terminal_EP1",
    "LandRover_MG_TK_INS_EP1",
    "LandRover_SPG9_TK_INS_EP1",
    "LandRover_Special_CZ_EP1",
    "M1128_MGS_EP1",
    "M1129_MC_EP1",
    "M1133_MEV_EP1",
    "M1135_ATGMV_EP1",
    "MAZ_543_SCUD_TK_EP1",
    "MtvrReammo_DES_EP1",
    "MtvrRefuel_DES_EP1",
    "MtvrRepair_DES_EP1",
    "MtvrSalvage_DES_EP1",
    "MtvrSupply_DES_EP1",
    "S1203_ambulance_EP1",
    "UralSalvage_TK_EP1",
    "UralSupply_TK_EP1",
    "Ural_ZU23_TK_GUE_EP1",
    "V3S_Reammo_TK_GUE_EP1",
    "V3S_Refuel_TK_GUE_EP1",
    "V3S_Salvage_TK_GUE_EP1",
    "Goat01_EP1",
    "Goat02_EP1",
    "Sheep01_EP1",
    "Sheep02_EP1",
    "2b14_82mm_TK_Bag_EP1",
    "2b14_82mm_TK_GUE_Bag_EP1",
    "2b14_82mm_TK_INS_Bag_EP1",
    "AGS_TK_Bag_EP1",
    "AGS_TK_GUE_Bag_EP1",
    "AGS_TK_INS_Bag_EP1",
    "AGS_UN_Bag_EP1",
    "CZ_Backpack_EP1",
    "CZ_VestPouch_EP1",
    "DSHKM_TK_GUE_Bag_EP1",
    "DSHKM_TK_INS_Bag_EP1",
    "DSHkM_Mini_TriPod_TK_GUE_Bag_EP1",
    "DSHkM_Mini_TriPod_TK_INS_Bag_EP1",
    "KORD_TK_Bag_EP1",
    "KORD_UN_Bag_EP1",
    "M252_US_Bag_EP1",
    "M2HD_mini_TriPod_US_Bag_EP1",
    "MK19_TriPod_US_Bag_EP1",
    "Metis_TK_Bag_EP1",
    "SPG9_TK_GUE_Bag_EP1",
    "SPG9_TK_INS_Bag_EP1",
    "TK_ALICE_Pack_EP1",
    "TK_Assault_Pack_EP1",
    "TOW_TriPod_US_Bag_EP1",
    "USBasicBag",
    "US_Assault_Pack_EP1",
    "US_Backpack_EP1",
    "US_Patrol_Pack_EP1",
    "US_UAV_Pack_EP1",
    "Igla",
    "Javelin",
    "MetisLauncher",
    "RPG18",
    "Strela",
    "MG36",
    "Mk_48",
    "Pecheneg",
    "AKS_74_UN_kobra",
    "AKS_74_pso",
    "AK_107_GL_kobra",
    "AK_107_GL_pso",
    "AK_107_kobra",
    "AK_107_pso",
    "Bizon",
    "G36_C_SD_eotech",
    "M16A2GL",
    "M16A4_ACG",
    "M16A4_ACG_GL",
    "M16A4_GL",
    "M4A1_AIM_SD_camo",
    "M4A1_Aim",
    "M4A1_Aim_camo",
    "M4A1_HWS_GL",
    "M4A1_HWS_GL_SD_Camo",
    "M4A1_HWS_GL_camo",
    "M4A1_RCO_GL",
    "VSS_Vintorez",
    "2b14_82mm",
    "2b14_82mm_CDF",
    "2b14_82mm_GUE",
    "2b14_82mm_INS",
    "AGS_CDF",
    "AGS_Ins",
    "AGS_RU",
    "D30_CDF",
    "D30_Ins",
    "D30_RU",
    "DSHKM_CDF",
    "DSHKM_Gue",
    "DSHKM_Ins",
    "DSHkM_Mini_TriPod",
    "DSHkM_Mini_TriPod_CDF",
    "Igla_AA_pod_East",
    "KORD",
    "M119",
    "M252",
    "M2HD_mini_TriPod",
    "MK19_TriPod",
    "Metis",
    "Stinger_Pod",
    "TOW_TriPod",
    "ZU23_CDF",
    "ZU23_Gue",
    "ZU23_Ins",
    "Saiga12K",
    "A10",
    "AH1z",
    "AH64D",
    "AH64D_Sidewinders",
    "AV8B",
    "AV8B2",
    "C130J",
    "Chukar",
    "CruiseMissile1",
    "CruiseMissile2",
    "F35B",
    "Ka52",
    "Ka52Black",
    "MH60S",
    "MQ9PredatorB",
    "MV22",
    "Mi17_rockets_RU",
    "Mi24_D",
    "Mi24_P",
    "Mi24_V",
    "ParachuteBigEast",
    "ParachuteBigWest",
    "Pchela1T",
    "Su25_CDF",
    "Su25_Ins",
    "Su34",
    "Su39",
    "UH1Y",
    "2S6M_Tunguska",
    "AAV",
    "BMP2_Ambul_CDF",
    "BMP2_Ambul_INS",
    "BMP2_CDF",
    "BMP2_Gue",
    "BMP2_HQ_CDF",
    "BMP2_HQ_INS",
    "BMP2_INS",
    "BMP3",
    "M1A1",
    "M1A2_TUSK_MG",
    "MLRS",
    "T72_CDF",
    "T72_Gue",
    "T72_INS",
    "T72_RU",
    "T90",
    "ZSU_CDF",
    "ZSU_INS",
    "Fishing_Boat",
    "RHIB",
    "RHIB2Turret",
    "SeaFox",
    "Smallboat_1",
    "Smallboat_2",
    "Zodiac",
    "BRDM2_ATGM_CDF",
    "BRDM2_ATGM_INS",
    "BRDM2_Gue",
    "BRDM2_HQ_Gue",
    "BRDM2_INS",
    "BTR90",
    "BTR90_HQ",
    "GAZ_Vodnik_HMG",
    "GAZ_Vodnik_MedEvac",
    "GRAD_CDF",
    "GRAD_INS",
    "GRAD_RU",
    "HMMWV_TOW",
    "LAV25",
    "LAV25_HQ",
    "Fin",
    "Goat",
    "Pastor",
    "Sheep"
];

if (isNil "workplacejob_taxi_serverarray") then {workplacejob_taxi_serverarray = []};

robpoolsafe1     	 = 0;
robpoolsafe2 		 = 0;
robpoolsafe3 		 = 0;

nextconvoytime = 0;

{_x setVariable ["height", 0, true];} forEach gangAreas;

serverKontoArray = [];
worldCenterPosition = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");

GC_Kills = []; //does nothing - tail_publicvariable.pl watches for this to update kills table
GC_Crimes = []; //does nothing - tail_publicvariable.pl watches for this to update crimes table

h1pin = ["2","5","1","5","9","#"]; publicvariable "h1pin";
h1_1pin = ["2","1","5","8","2","#"]; publicvariable "h1_1pin";
h2pin = ["2","5","5","1","0","#"]; publicvariable "h2pin";
h2_1pin = ["2","7","7","3","0","#"]; publicvariable "h2_1pin";
h2_2pin = ["0","0","7","5","7","9","#"]; publicvariable "h2_2pin";
h3pin = ["9","1","5","8","5","#"]; publicvariable "h4pin";
h3_1pin = ["2","2","7","2","3","#"]; publicvariable "h3_1pin";
h4pin = ["2","7","3","6","0","#"]; publicvariable "h4pin";

_dll = "gc" callExtension "version";
diag_log text _dll;

/*
_read = "gc" callExtension format["R|%1|%2|%3","__SERVER__","GC_Mission","gangsarray"];
if (_read != "") then {
	_read = call compile _read;
	gangsarray = _read;
	{
		_read = "gc" callExtension format["R|%1|%2|%3","__SERVER__","GC_Mission",_x];
		if (_read != "") then {
			_gangmarker = "";
			_label = "";
			_x setvariable["control",_read,true];
			if(_x == gangarea1) then {
				_label = format["%1's Area 1 (cocaine - lsd)", _read];
				_gangmarker = "gangmarker1";
			};
			if(_x == gangarea2) then {
				_label = format["%1's Area 2 (heroin - lsd)", _read];
				_gangmarker = "gangmarker2";
			};
			if(_x == gangarea3) then {
				_label = format["%1's Area 3 (heroin - marijuana)", _read];
				_gangmarker = "gangmarker3";
			};
			_gangmarker setMarkerColor "ColorOrange";
			_gangmarker setMarkerText _label;
		}
	} foreach gangareas;
};

_read = "gc" callExtension format["R|%1|%2|%3","__SERVER__","GC_Mission","DateStamp"];
if (_read != "") then {
	_read = call compile _read;
	setDate _read;
};
*/

diag_log text format["Count of allMissionObjects ""All"": %1",(count allMissionObjects "All")];
diag_log text format["Count of playableUnits: %1",(count playableUnits)];
diag_log text format["Count of allGroups: %1",(count allGroups)];
diag_log text format["Count of allUnits: %1",(count allUnits)];
diag_log text format["Count of vehicles: %1",(count vehicles)];
diag_log text format["Count of INV_ServerVclArray: %1",(count INV_ServerVclArray)];
diag_log text format["Count of ServerKontoArray: %1",(count ServerKontoArray)];
diag_log text format["Count of gangsarray: %1",(count gangsarray)];
diag_log text format["Count of publicarbeiterarctionarray: %1",(count publicarbeiterarctionarray)];
diag_log text format["Count of workplacejob_taxi_serverarray: %1",(count workplacejob_taxi_serverarray)];
diag_log text format["Count of cashCache: %1",(count cashCache)];
diag_log text format["Count of loaded: %1",(count loaded)];