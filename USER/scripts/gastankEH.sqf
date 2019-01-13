// if (isServer) then {[this] execVM "USER\scripts\gasTankEH.sqf"};

params ["_logic"];

private _gasTank = nearestObject [getPos _logic,"Land_dp_bigTank_F"];

_gasTank addEventHandler ["Killed",{
    params ["_gasTank"];

    private _fnc_randomExplosions = {
        [{
            params ["_gasTankPos","_fnc_randomExplosions"];

            ((selectRandom ["BO_GBU12_LGB","M_Sidewinder_AA","R_SMAW_HEDP","R_57mm_HE"]) createVehicle _gasTankPos) setDamage 1;
            [_gasTankPos,_fnc_randomExplosions] call _fnc_randomExplosions;
        },_this,random 2.5] call CBA_fnc_waitAndExecute;
    };

    [getPos _gasTank,_fnc_randomExplosions] call _fnc_randomExplosions;
    [_gasTank] remoteExec ["orp_fnc_createGastankFires",0,false];
}];
