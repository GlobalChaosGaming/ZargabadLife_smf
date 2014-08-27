{
	_loaded = _x getvariable "loaded";
	_deadname = _x getvariable "deadname";
	if (!isnil "_deadname") then {
		if (alive _x and isnil "_loaded" and name _x == _deadname) then {
			_x setvariable["loaded",true,false];
			[_x] call GC_preloadStats;
		};
	};
} foreach playableunits;