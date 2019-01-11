sleep 2;

private _bus = vehicle player;
private _camStartPos = ASLToAGL eyePos player;
private _cam = "camera" camCreate _camStartPos;
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
sleep 2;
_cam cameraEffect ["terminate", "BACK"];
camDestroy _cam;
showCinemaBorder false;
sleep 1;
99998 cutText ["","BLACK IN",2,true];
