//make animals
for [{_i=0}, {_i < (count huntingarray)},{_i=_i+1}] do {

	_pos  	= getmarkerpos ((huntingarray select _i) select 0);
	_area 	= (huntingarray select _i) select 1;
	_exit 	= false;

	_boars 	= nearestobjects [_pos, ["wildboar"], _area];
	_boars2 = nearestobjects [_pos, ["wildboar"], (_area + 200)]; 
	if(count _boars2 > count _boars)then{deletevehicle (_boars2 select (count _boars2 - 1))};

	_cows 	= nearestobjects [_pos, ["cow01"], _area];
	_cows2 = nearestobjects [_pos, ["cow01"], (_area + 200)]; 
	if(count _cows2 > count _cows)then{deletevehicle (_cows2 select (count _cows2 - 1))};

	{if(_x distance _pos < _area)exitwith{_exit=true}} foreach playableUnits; 

	if(_exit)exitwith{};

	_boars = nearestobjects [_pos, ["wildboar"], _area];
	if(count _boars < maxboars)then{createAgent ["Wildboar", _pos, [], _area, "NONE"];};

	_cows = nearestobjects [_pos, ["cow01"], _area];
	if(count _cows < maxcows)then{createAgent ["Cow01", _pos, [], _area, "NONE"];};			
};