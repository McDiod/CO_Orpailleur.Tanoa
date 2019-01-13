params ["_veh"];

private _act = ["orp_deliverBriefcaseAction","Geld abliefern","",{
    params ["_veh","_unit"];

    private _briefcase = _unit getVariable ["orp_briefcaseInHand",objNull];
    [_unit,true] remoteExec ["allowSprint",_unit,false];
    [_unit,"orp_briefcaseFatigue",30,false] call ace_common_fnc_setAimCoef;
    _unit setVariable ["orp_briefcaseInHand",objNull,true];

    private _attachedBriefcases = (attachedObjects _veh) select {typeOf _x == "Land_Suitcase_F"};
    private _offset = [-0.3,-2.15,-0.42];
    _offset set [1,(_offset select 1) - (count _attachedBriefcases) * 0.15];

    _briefcase attachTo [_veh,_offset];
    _briefcase setVectorDirAndUp [[0.5,1,1],[0,0,0]];

    ["grad_notification1",["ABGEGEBEN","Du hast das Geld in das Fahrzeug geladen."]] call BIS_fnc_showNotification;

},{!isNull ((_this select 1) getVariable ["orp_briefcaseInHand",objNull])},{},[],[0,0,1]] call ace_interact_menu_fnc_createAction;

[_veh,0,["ACE_MainActions"],_act] call ace_interact_menu_fnc_addActionToObject;


private _act = ["orp_takeWeaponAction","Ausrüstung nehmen","",{
    params ["_veh","_unit"];

    _unit setVariable ["orp_hasTakenGear",true,true];

    removeHeadgear _unit;
    _unit addHeadgear "rhssaf_helmet_m97_woodland";

    private _vestItems = vestItems _unit;
    removeVest _unit;
    _unit addVest "rhssaf_vest_md99_woodland_rifleman";
    for "_i" from 0 to 6 do {_unit addItemToVest "rhssaf_30Rnd_762x39mm_M67"};
    {
        if (_unit canAddItemToVest _x) then {
            _unit addItemToVest _x;
        } else {
            if (_unit canAddItemToUniform _x) then {
                _unit addItemToUniform _x;
            } else {
                _unit addItemToBackpack _x;
            };
        };

    } forEach _vestItems;

    _unit removeWeapon (primaryWeapon _unit);
    _unit addWeapon "rhs_weap_m70b3n";

},{

    params ["_veh","_unit"];
    _attachedBriefcases = (attachedObjects _veh) select {typeOf _x == "Land_Suitcase_F"};
    ((count _attachedBriefcases == 4) || (missionNamespace getVariable ["orp_takeWeaponOverride",false])) &&
    !(_unit getVariable ["orp_hasTakenGear",false])

},{},[],[0,0,1]] call ace_interact_menu_fnc_createAction;

[_veh,0,["ACE_MainActions"],_act] call ace_interact_menu_fnc_addActionToObject;
