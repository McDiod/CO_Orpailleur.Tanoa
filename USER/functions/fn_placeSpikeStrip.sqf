params ["_unit"];

private _stripDir = (getDir _unit) + 90;
private _stripPos = _unit getPos [5.0,getDir _unit];
_stripPos set [2,-1.5];

private _strip = "Land_Razorwire_F" createVehicle _stripPos;
_strip setDir _stripDir;
_strip setPosASL ATLToASL _stripPos;

[_strip,"orp_spikestrip"] remoteExec ["say3D",0,false];

[_strip] call orp_fnc_addSpikeStripInteraction;
