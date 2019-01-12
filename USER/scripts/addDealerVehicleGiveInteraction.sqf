params ["_veh"];

private _act = ["orp_deliverBriefcaseAction","Geld abliefern","",{
    params ["_veh","_unit"];

    private _briefcase = _unit getVariable ["orp_briefcaseInHand",objNull];
    deleteVehicle _briefcase;
    [_unit,true] remoteExec ["allowSprint",_unit,false];
    [_unit,"orp_briefcaseFatigue",30,false] call ace_common_fnc_setAimCoef;

    ["grad_notification1",["ABGEGEBEN","Du hast das Geld in das Fahrzeug geladen."]] call BIS_fnc_showNotification;

},{!isNull ((_this select 1) getVariable ["orp_briefcaseInHand",objNull])},{},[],[0,0,1]] call ace_interact_menu_fnc_createAction;

[_veh,0,["ACE_MainActions"],_act] call ace_interact_menu_fnc_addActionToObject;
