if (!isServer) exitWith {};

private _chairData = [[[11224.6,8682.73,367.177],346.217],[[11223.9,8682.55,367.142],351.294],[[11221.7,8681.89,367.027],332.301],[[11221.1,8681.39,367],313.68],[[11220.6,8680.75,366.957],300.382],[[11220.4,8680.05,366.912],282.557],[[11220.3,8679.28,366.878],263.696],[[11220.5,8678.49,366.855],250.198],[[11220.8,8677.72,366.838],240.981],[[11221.3,8676.97,366.807],230.823],[[11225.7,8676.13,367.015],167.294],[[11226.3,8676.39,367.072],159.1],[[11226.9,8676.7,367.128],154.429],[[11227.4,8677.17,367.196],137.979],[[11227.9,8677.75,367.257],127.63],[[11228.2,8678.48,367.301],103.925],[[11228.2,8679.35,367.335],86.4388],[[11228,8680.17,367.351],65.7077],[[11227.5,8681.02,367.353],55.029],[[11224.9,8676.05,366.961],179.338],[[11224.1,8676.04,366.891],188.078],[[11222.6,8676.19,366.804],207.828],[[11221.9,8676.54,366.8],217.437],[[11226.3,8682.26,367.279],33.0961],[[11223.1,8682.39,367.099],343.032],[[11222.4,8682.24,367.061],343.084],[[11223.3,8675.93,366.822],194.971]];

private _allChairs = [orp_chair1,orp_chair2];
{
    _x params ["_posASL","_dir"];
    _chair = "Land_CampingChair_V2_F" createVehicle [0,0,0];
    _chair setDir _dir;
    _chair setPosASL _posASL;
    _allChairs pushBack _chair;
} forEach _chairData;


private _fnc_cutScene = {
    params ["_unit","_chair"];

    private _cam = objNull;
    if (_unit == player) then {
        private _camStartPos = ASLToAGL eyePos player;

        _cam = "camera" camCreate _camStartPos;
        _cam cameraEffect ["internal", "BACK"];
        showCinemaBorder true;

        _cam camSetTarget orp_camTargetEnd1;
        _cam camSetFOV 0.6;
        _cam camSetPos [7362.017,8732.993,80.176];
        _cam camCommit 20;

        sleep 18;
        99998 cutText ["","BLACK OUT",2,true];
        sleep 3;
        99999 cutText ["<t size='2.4'>Mission erfolgreich.</t>","BLACK OUT",2,true,true];
        sleep 3;
        99999 cutText ["<t size='2.4'>Mission erfolgreich.</t>","BLACK IN",2,true,true];
        sleep 2;
        99999 cutText ["<t size='2.4'>Etwas später...</t>","BLACK OUT",2,true,true];
        sleep 2;
    } else {
        sleep 28;
    };

    [_unit,_unit] call ace_medical_fnc_treatmentAdvanced_fullHealLocal;
    _unit allowDamage false;

    if (isNull _chair) then {
        _unit setPos [11212.9,8675.97,0.00161743];
    } else {
        [_chair,_unit] call acex_sitting_fnc_sit;
    };


    if (_unit == player) then {
        _cam camSetPos [11169.8,8669.61,2.32571];
        _cam camSetTarget orp_camTargetEnd2;
        _cam camCommit 0;

        _cam camSetPos [11206.7,8672.97,5.03052];
        _cam camCommit 10;
        sleep 2;
        99999 cutText ["<t size='2.4'>Etwas später...</t>","BLACK IN",2,true,true];
        99998 cutText ["","BLACK IN",2,true];
        sleep 6;
        99998 cutText ["","BLACK OUT",2,true];
        sleep 2;
        _cam cameraEffect ["terminate", "BACK"];
        camDestroy _cam;
        showCinemaBorder false;
        99998 cutText ["","BLACK IN",2,true];
    };
};

{[[_x,_allChairs param [_forEachIndex,objNull]],_fnc_cutScene] remoteExec ["spawn",_x,false]} forEach playableUnits;
