params ["_trigger","_disable"];

private _allPowerplantUnits = allUnits inAreaArray _trigger;

if (_disable) then {
    {
        _x disableAI "ALL";
        _x hideObjectGlobal true;
    } forEach _allPowerplantUnits;
} else {
    {
        _x enableAI "ALL";
        _x hideObjectGlobal false;
    } forEach _allPowerplantUnits;
};
