params ["_strip"];

private _act = ["orp_getSpikeStripAction","Nagelstreifen abbauen","",{
    params ["_strip","_unit"];

    deleteVehicle _strip;
    _unit setVariable [
        "orp_spikeStripAmount",
        (_unit getVariable ["orp_spikeStripAmount",0]) + 1,
        true
    ];
},{alive (_this select 0)},{},[],[0,0,1]] call ace_interact_menu_fnc_createAction;

[_strip,0,[],_act] call ace_interact_menu_fnc_addActionToObject;
