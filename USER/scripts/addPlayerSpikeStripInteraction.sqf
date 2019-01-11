private _act = ["orp_placeSpikeStripAction","Nagelstreifen platzieren","",{
    params ["_unit"];

    [_unit] call orp_fnc_placeSpikeStrip;
    _unit setVariable [
        "orp_spikeStripAmount",
        (_unit getVariable ["orp_spikeStripAmount",0]) - 1,
        true
    ];
},{((_this select 0) getVariable ["orp_spikeStripAmount",0]) > 0}] call ace_interact_menu_fnc_createAction;

["CAManBase",1,["ACE_SelfActions"],_act,true] call ace_interact_menu_fnc_addActionToClass
