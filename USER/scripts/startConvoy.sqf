params ["_isNorth"];

private _pointsNorth = [[5914.51,10903.5,0],[5938.42,10913.4,0],[5969.64,10924.2,0],[6014.31,10935,0],[6067.46,10945.3,0],[6114.31,10953.7,0],[6162.86,10960.7,0],[6218.18,10967.6,0],[6273.92,10961.5,0],[6330.92,10933.2,0],[6367.23,10902.4,0],[6386.23,10861.6,0],[6397.64,10821.3,0],[6410.51,10776.1,0],[6424.87,10728.2,0],[6444.51,10683,0],[6459.07,10664,0],[6477.44,10648.2,0],[6495.6,10633.2,0],[6517.34,10621.6,0],[6549.44,10612.9,0],[6578.15,10608.7,0],[6617.63,10598,0],[6660.49,10578.9,0],[6722.77,10544.5,0],[6774.28,10519.6,0],[6803,10509.7,0],[6824.74,10507.8,0],[6850.71,10513.7,0],[6868.87,10529.5,0],[6907.72,10599.2,0],[6927.35,10635.3,0],[6936.22,10649.5,0],[6949.1,10662.1,0],[6967.67,10670.4,0],[6994.91,10673.5,0],[7029.53,10671.8,0],[7148.4,10666.4,0],[7218.7,10663.2,0],[7279.72,10660,0],[7371.77,10655.8,0],[7413.15,10650.3,0],[7443.97,10639.3,0],[7465.72,10624.3,0],[7499.5,10596.1,0]];

private _pointsSouth = [];

private _points = [_pointsSouth,_pointsNorth] select _isNorth;

private _convoyNorth = [orp_convoyNorthVeh1,orp_convoyNorthVeh2,orp_transporter,orp_convoyNorthVeh3,orp_convoyNorthVeh4];
private _convoySouth = [orp_convoySouthVeh1,orp_convoySouthVeh2,orp_transporter_fake,orp_convoySouthVeh3,orp_convoySouthVeh4];

private _convoy = [_convoySouth,_convoyNorth] select _isNorth;
(_convoy select 0) setDriveOnPath _points;

for [{_i=0},{_i<count _convoy},{_i=_i+1}] do {
    [{
        params ["_vehicles","_handle"];
        _vehicles params ["_leader","_thisVeh","_follower","_log"];

        private _distFront = _thisVeh distance _leader;
        private _distBack = _thisVeh distance _follower;

        if (!isNull _leader) then {
            if (_distFront < 5) then {
                _thisVeh limitSpeed 0.5;
            } else {
                _thisVeh setDriveOnPath [getPos _thisVeh,_thisVeh getPos [0.8 * _distFront,_thisVeh getDir _leader]];
                private _speedLimit = if (_distFront > 15) then {if (_distFront < 20) then {30} else {34}} else {26};
                _thisVeh limitSpeed _speedLimit;
            };
        };

        if (!isNull _follower && {_distBack > 50}) then {
            _thisVeh limitSpeed 0.5;
        } else {
            if (isNull _leader) then {
                _thisVeh limitSpeed 30;
            };
        };

        if (_log) then {
            systemChat str [_distFront,_distBack,_leader,_follower];
        };

    },0.5,[_convoy param [_i-1,objNull],_convoy select _i,_convoy param [_i+1,objNull],_i==0]] call CBA_fnc_addPerFrameHandler;
};
