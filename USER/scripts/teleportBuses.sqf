diag_log "teleportBuses.sqf";

private _northCrew = crew orp_bus1;
private _southCrew = crew orp_bus2;
private _northPlayers = _northCrew arrayIntersect playableUnits;
private _southPlayers = _southCrew arrayIntersect playableUnits;

private _fnc_teleportBus = {
    params ["_bus","_pos","_dir"];
    _bus setDir _dir;
    _bus setPos _pos;
};

private _fnc_teleportUnit = {
    params ["_unit","_pos","_dir"];

    _unit allowDamage false;
    _unit setPos _pos;
    _unit setDir _dir;
    sleep 3;
    _unit allowDamage true;
};

private _northPlayerPositions = [
    [7544.79,10505.4,0.00402069],
    [7543.29,10506.9,0.00414276],
    [7542.67,10509.2,0.00337219],
    [7544.51,10508.4,0.00364685],
    [7545.88,10507.3,0.00406647],
    [7546.54,10509.3,0.00369263],
    [7544.58,10510.7,0.003685],
    [7542.73,10511.7,0.00387573],
    [7542.12,10514.2,0.00369263],
    [7544.19,10513.4,0.00367737],
    [7546,10512.2,0.00371552],
    [7540.51,10512.4,0.00382996],
    [7539.44,10515.6,0.00428009],
    [7539.29,10518.4,0.00418091],
    [7539.35,10520.4,0.00357056],
    [7541.35,10517,0.00415802],
    [7543.24,10516,0.00410461],
    [7545.04,10515.2,0.00411224],
    [7541.63,10519.1,0.00345612],
    [7543.17,10518.2,0.00411987],
    [7540.87,10521.5,0.00344849],
    [7542.22,10521.5,0.00344849],
    [7540.18,10524.5,0.00294495],
    [7547.31,10506.3,0.00405884],
    [7548.46,10504.3,0.00408173]
];

private _southPlayerPositions = [
    [7544.79,10505.4,0.00402069],
    [7543.29,10506.9,0.00414276],
    [7542.67,10509.2,0.00337219],
    [7544.51,10508.4,0.00364685],
    [7545.88,10507.3,0.00406647],
    [7546.54,10509.3,0.00369263],
    [7544.58,10510.7,0.003685],
    [7542.73,10511.7,0.00387573],
    [7542.12,10514.2,0.00369263],
    [7544.19,10513.4,0.00367737],
    [7546,10512.2,0.00371552],
    [7540.51,10512.4,0.00382996],
    [7539.44,10515.6,0.00428009],
    [7539.29,10518.4,0.00418091],
    [7539.35,10520.4,0.00357056],
    [7541.35,10517,0.00415802],
    [7543.24,10516,0.00410461],
    [7545.04,10515.2,0.00411224],
    [7541.63,10519.1,0.00345612],
    [7543.17,10518.2,0.00411987],
    [7540.87,10521.5,0.00344849],
    [7542.22,10521.5,0.00344849],
    [7540.18,10524.5,0.00294495],
    [7547.31,10506.3,0.00405884],
    [7548.46,10504.3,0.00408173]
];

{moveOut _x} forEach playableUnits;

sleep 1;

[[orp_bus1,[7559.62,10536.6,0],59],_fnc_teleportBus] remoteExec ["call",orp_bus1,false];
[[orp_bus2,[4604.06,8816.24,2],247],_fnc_teleportBus] remoteExec ["call",orp_bus2,false];

{
    _playerPos = _northPlayerPositions param [_forEachIndex,_northPlayerPositions select 0];
    [[_x,_playerPos,39],_fnc_teleportUnit] remoteExec ["spawn",_x,false];
} forEach _northPlayers;

{
    _playerPos = _southPlayerPositions param [_forEachIndex,_southPlayerPositions select 0];
    [[_x,_playerPos,185],_fnc_teleportUnit] remoteExec ["spawn",_x,false];
} forEach _southPlayers;
