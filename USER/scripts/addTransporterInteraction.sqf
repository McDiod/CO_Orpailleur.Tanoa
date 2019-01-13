params ["_veh"];

private _act = ["orp_breakTransporterAction","Geldtransporter aufbrechen","",{
    params ["_veh","_unit"];

    if (_veh getVariable ["orp_beingBroken",false]) exitWith {
        ["grad_notification1",["BESETZT","Jemand arbeitet bereits an diesem Fahrzeug."]] call BIS_fnc_showNotification;
    };

    private _relDir = _veh getRelDir _unit;
    if !(_relDir > 165.597 && _relDir < 198.354) exitWith {
        hint "Die Hintertür sieht am leichtesten aufzubrechen aus.";
    };

    _veh setVariable ["orp_beingBroken",true,true];

    private _soundDummy = "CBA_NamespaceDummy" createVehicle (getPos _veh);
    _soundDummy attachTo [_unit,[0,0,0]];
    [_soundDummy,"orp_burner"] remoteExec ["say3D",0,false];

    [_unit,(configFile >> "ACE_Repair" >> "Actions" >> "FullRepair")] call orp_fnc_breakInAnim;

    private _fnc_onFinish = {
        (_this select 0) params ["_veh","_unit","_soundDummy"];
        deleteVehicle _soundDummy;
        _veh setVariable ["orp_transporterBroken",true,true];
        _veh setVariable ["orp_beingBroken",false,true];
        _veh animateDoor ["Door_4_source",1];
        _veh lock 3;
        {[_x] remoteExec ["doGetOut",_x,false]} forEach crew _veh;
        [_unit,"",false] call orp_fnc_breakInAnim;
    };
    private _fnc_onFailure = {
        (_this select 0) params ["_veh","_unit","_soundDummy"];
        deleteVehicle _soundDummy;
        _veh setVariable ["orp_beingBroken",false,true];
        [_unit,"",false] call orp_fnc_breakInAnim;
        ["grad_notification1",["ABGEBROCHEN","Du hast die Arbeit am Fahrzeug abgebrochen."]] call BIS_fnc_showNotification;
    };

    [50,[_veh,_unit,_soundDummy],_fnc_onFinish,_fnc_onFailure] call ace_common_fnc_progressBar;

},{!((_this select 0) getVariable ["orp_transporterBroken",false])}] call ace_interact_menu_fnc_createAction;

[_veh,0,["ACE_MainActions"],_act] call ace_interact_menu_fnc_addActionToObject;



private _act = ["orp_takeMoneyAction","Geldkoffer nehmen","",{
    params ["_veh","_unit"];

    private _allBriefcases = (attachedObjects _veh) select {typeOf _x == "Land_Suitcase_F"};

    if (count _allBriefcases == 0) exitWith {
        ["grad_notification1",["LEER","Das Fahrzeug ist leer."]] call BIS_fnc_showNotification;
    };

    if (!isNull (_unit getVariable ["orp_briefcaseInHand",objNull])) exitWith {
        ["grad_notification1",["FEHLER","Du trägst bereits Geld."]] call BIS_fnc_showNotification;
    };

    _unit playAction "PutDown";

    private _briefcase = _allBriefcases param [0,objNull];
    [_unit,_briefcase] call orp_fnc_attachBriefcase;

},{(_this select 0) getVariable ["orp_transporterBroken",false]}] call ace_interact_menu_fnc_createAction;

[_veh,0,["ACE_MainActions"],_act] call ace_interact_menu_fnc_addActionToObject;
