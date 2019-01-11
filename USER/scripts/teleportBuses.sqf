params ["_bus"];

private _crew = crew _bus;
private _players = _crew arrayIntersect playableUnits;

private _fnc_teleportBus = {
    params ["_bus","_pos","_dir"];
    _bus setDir _dir;
    _bus setPos _pos;
};

private _fnc_cutScene = {
    params ["_unit","_pos","_dir"];

    private _cam = objNull;
    if (_unit == player) then {
        private _bus = vehicle player;
        private _camStartPos = ASLToAGL eyePos player;
        _cam = "camera" camCreate _camStartPos;
        _cam cameraEffect ["internal", "BACK"];
        showCinemaBorder true;
        _cam camSetTarget _bus;
        _cam camSetFOV 0.4;
        _cam camSetPos [_camStartPos select 0,_camStartPos select 1,(_camStartPos select 2) + 20];

        _cam camCommit 10;
        sleep 8;

        99998 cutText ["","BLACK OUT",2,true];
        sleep 3;
        99999 cutText ["<t size='2.4'>einige Minuten später...</t>","BLACK OUT",2,true,true];
        sleep 4;
        99999 cutText ["<t size='2.4'>einige Minuten später...</t>","BLACK IN",2,true,true];

    } else {
        sleep 15;
    };

    _this spawn {
        params ["_unit","_pos","_dir"];
        _unit allowDamage false;
        moveOut _unit;
        _unit setPos _pos;
        _unit setDir _dir;
        sleep 3;
        _unit allowDamage true;
    };

    if (_unit == player) then {
        sleep 2;
        _cam cameraEffect ["terminate", "BACK"];
        camDestroy _cam;
        showCinemaBorder false;
        sleep 3;
        99998 cutText ["","BLACK IN",2,true];
    };
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

private _isNorthBus = _bus isEqualTo orp_bus1;
private _playerDir = [184,39] select _isNorthBus;
private _playerPosArray = [_southPlayerPositions,_northPlayerPositions] select _isNorthBus;

{
    _playerPos = _playerPosArray param [_forEachIndex,_playerPosArray select 0];
    [[_x,_playerPos,_playerDir],_fnc_cutScene] remoteExec ["spawn",_x,false];
} forEach _players;

waitUntil {
    {_x in _bus} count playableUnits == 0
};

private _busPos = [[4604.06,8816.24,2],[7559.62,10536.6,0]] select _isNorthBus;
private _busDir = [247,59] select _isNorthBus;

[[_bus,_busPos,_busDir],_fnc_teleportBus] remoteExec ["call",_bus,false];
