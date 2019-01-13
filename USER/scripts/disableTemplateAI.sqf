params ["_trigger"];


private _allTemplateUnits = allUnits inAreaArray _trigger;

{
    _x disableAI "ALL";
} forEach _allTemplateUnits;
