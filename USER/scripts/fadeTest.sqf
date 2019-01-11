sleep 2;
99999 cutText ["Hello World!","BLACK OUT",2,true];

private _bus = vehicle player;
private _cam = "camera" camCreate (ASLToAGL eyePos player);
_cam camSetTarget _bus;

sleep 10;
99999 cutText ["","BLACK IN",2,true];
