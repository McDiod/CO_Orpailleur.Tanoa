params [["_unit",objNull],["_briefcase",objNull]];

private _prevOwner = _briefcase getVariable ["orp_briefcaseOwner",objNull];
if (!isNull _prevOwner) then {
    _prevOwner setVariable ["orp_briefcaseInHand",objNull,true];
    [_prevOwner,true] remoteExec ["allowSprint",_prevOwner,false];
    [_prevOwner,"orp_briefcaseFatigue",30,false] call ace_common_fnc_setAimCoef;
};

private _fnc_attach = {
    params ["_briefcase","_unit"];
    _briefcase attachTo [_unit,[-0.03,-0.06,-0.19],"RightHand"];
    _briefcase setVectorDirAndUp [[1,0,0],[0,0,1]];
};

[[_briefcase,_unit],_fnc_attach] remoteExec ["call",_briefcase,false];

[_unit,false] remoteExec ["allowSprint",_unit,false];
[_unit,"orp_briefcaseFatigue",30,true] call ace_common_fnc_setAimCoef;
_unit setVariable ["orp_briefcaseInHand",_briefcase,true];
_briefcase setVariable ["orp_briefcaseOwner",_unit,true];

if (currentWeapon _unit != "") then {
    [_unit,["SwitchWeapon",_unit,_unit,99]] remoteExec ["action",_unit,false];
};
