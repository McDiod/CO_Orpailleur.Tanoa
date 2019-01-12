private _act = ["orp_giveBriefcase","Geldkoffer geben","",{
    params ["_target","_caller"];

    private _briefcase = _caller getVariable ["orp_briefcaseInHand",objNull];
    [_target,_briefcase] call orp_fnc_attachBriefcase;

},{
    !isNull ((_this select 1) getVariable ["orp_briefcaseInHand",objNull]) &&
    {isNull ((_this select 0) getVariable ["orp_briefcaseInHand",objNull])
}}] call ace_interact_menu_fnc_createAction;

["CAManBase",0,["ACE_MainActions"],_act,true] call ace_interact_menu_fnc_addActionToClass;


private _act = ["orp_takeBriefcase","Geldkoffer nehmen","",{
    params ["_target","_caller"];

    private _briefcase = _target getVariable ["orp_briefcaseInHand",objNull];
    [_caller,_briefcase] call orp_fnc_attachBriefcase;

},{
    !isNull ((_this select 0) getVariable ["orp_briefcaseInHand",objNull]) &&
    {(_this select 0) getVariable ["ACE_isUnconscious",false]} &&
    {isNull ((_this select 1) getVariable ["orp_briefcaseInHand",objNull])}
}] call ace_interact_menu_fnc_createAction;

["CAManBase",0,["ACE_MainActions"],_act,true] call ace_interact_menu_fnc_addActionToClass;
