_uid = _this select 0;
_option = _this select 1;
_name = "";

if (count _this == 3) then {
  _name = _this select 2;
};

_startingMoney = 50000;
_paycheckMoney = 0;
_chaos = false;

// Foster Expires On 2018-12-31
if (_uid == "10036422") then {
  _startingMoney = 2500000;
  _paycheckMoney = 50000;
};

// Romans Expires On 2018-12-31
if (_uid == "322624") then {
  _startingMoney = 450000;
  _paycheckMoney = 10000;
};


if (_uid == "10036422") then {_chaos = true;}; // amerine can add a column to donators NYI

_i = -1;
{
  _found = _x find _name;
  if (_found == 0) then {_i = _forEachIndex};
} forEach cashCache;

if (_i >= 0) then {
  _konto = (cashCache select _i) select 1;
  if (!(isNil "_konto")) then {
    _startingMoney = (cashCache select _i) select 1;
  };
};

if (_option == "load") then {
  [_name,"Kontostand",_startingMoney] call ServerSavePVar;
  [_name,"donatorcashbonus",_paycheckMoney] call ServerSavePVar;
  if (!(_name in loaded)) then {
  	[_name,"PlayerUID",[_uid]] call ServerSavePVar;
  	[_name,"chaos",_chaos] call ServerSavePVar;
  };
  loaded = loaded + [_name];
  diag_log text format["loaded donator for %1",_name];  
};

if (_option == "save") then {
	if (_name in loaded) then {
	  diag_log text format["saving donator for %1",_name];
	  _konto = [_name, "kontostand"] call ServerGetVar;

	  if (!(isNil "_konto")) then {
	    _i = -1;
	    {
	      _found = _x find _name;
	      if (_found == 0) then {_i = _forEachIndex};
	    } forEach cashCache;

	    if (_i >= 0) then {
	      (cashCache select _i) set [1, _konto];
	    } else {
	      cashCache = cashCache + [[_name, _konto]];
	    };
	  };
	  loaded = loaded - [_name];
	} else {
		diag_log text format["NOT saving donator for %1",_name];
	};
};