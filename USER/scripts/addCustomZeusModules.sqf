private _categoryName = "ORPAILLEUR";

[
    _categoryName,
    "Konvoi Nord starten",
    {
        if (missionNamespace getVariable ["orp_convoyNorthStarted",false]) exitWith {};
        [[true],"USER\scripts\startConvoy.sqf"] remoteExec ["execVM",2,false];
    }
] call Ares_fnc_RegisterCustomModule;

[
    _categoryName,
    "Konvoi Süd starten",
    {
        if (missionNamespace getVariable ["orp_convoySouthStarted",false]) exitWith {};
        [[false],"USER\scripts\startConvoy.sqf"] remoteExec ["execVM",2,false];
    }
] call Ares_fnc_RegisterCustomModule;
