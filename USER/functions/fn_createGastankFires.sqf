params ["_gasTank"];

if (!hasInterface) exitWith {};

// explosions
_emitter = "#particlesource" createVehicleLocal getPos _gasTank;
_emitter setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,2,80,0],"","Billboard",1,1,[0,0,0],[0,0,1],0,2,3,0.1,[5,8,0,0,15],[[1,1,1,-20],[1,1,1,-15],[1,1,1,-10],[1,1,1,-6],[1,1,1,-2]],[0.25,0,0,0],0.2,0.1,"","","",0,false,0,[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]];
_emitter setParticleRandom [0.8,[5,5,6],[2,2,0.5],25,0.4,[0,0,0,0.3],0.2,0.05,1,0];
_emitter setDropInterval 0.01;

// smoke
_emitter = "#particlesource" createVehicleLocal getPos _gasTank;
_emitter setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02.p3d",8,0,40,1],"","Billboard",1,40,[0,0,0],[0,0,2.5],1,0.05,0.07,0.05,[2,20,0,0,0,0,0,0],[[0.35,0.35,0.35,0.6],[0.35,0.35,0.35,0.75],[0.35,0.35,0.35,0.45],[0.42,0.42,0.42,0.28],[0.42,0.42,0.42,0.16],[0.42,0.42,0.42,0.09],[0.42,0.42,0.42,0.06],[0.5,0.5,0.5,0.02],[0.5,0.5,0.5,0]],[1,0.55,0.35,0,0,0,0,0],0.3,0.2,"","","",0,false,0,[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]];
_emitter setParticleRandom [8,[0.15,0.15,0.15],[0.25,0.25,0.5],0.5,0,[0,0,0,0.06],0,0,0.5,0];
_emitter setParticleCircle [1,[0,0,0]];
_emitter setDropInterval 0.08;

// sparks
_emitter = "#particlesource" createVehicleLocal getPos _gasTank;
_emitter setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,13,2,0],"","Billboard",1,6,[0,0,0],[0,0,1.5],1,1.05,1.8,0.17,[0.1,0.1,0.1,0.1,0.1,0.08,0.08,0.08,0.08,0],[[1,0.3,0.3,-6.5],[1,0.3,0.3,-6],[1,0.3,0.3,-5.5],[1,0.3,0.3,-4.5],[1,1,1,-1],[1,1,1,-1],[1,1,1,-1],[1,1,1,-1],[1,1,1,-1]],[1000,0,0,0,0,0,0,0,0],0.5,0.55,"","","",0,false,0,[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]];
_emitter setParticleRandom [2.5,[8,8,0.2],[0.2,0.2,1],2,0.04,[0,0.15,0.15,0],0.3,0.15,360,0];
_emitter setDropInterval 0.05;

// fire
_emitter = "#particlesource" createVehicleLocal getPos _gasTank;
_emitter setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,10,32,1],"","Billboard",1,3,[0,0,0],[0,0,2.4],0,0.085,0.2,0.05,[7,0.12],[[1,1,1,-1]],[0.5,1],0,0,"","","",0,false,0,[[0,0,0,0]]];
_emitter setParticleRandom [0.4,[2,2,2],[0.1,0.1,0.5],10,0.1,[0.1,0.1,0.1,0],0,0,0.1,0];
_emitter setParticleCircle [6,[0,0,0]];
_emitter setDropInterval 0.01;

// random small fires
for "_i" from 0 to 35 do {
    _randomPos = _gasTank getPos [7 + (random 40),random 360];
    _emitter = "#particlesource" createVehicleLocal _randomPos;
    _emitter setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,10,32,1],"","Billboard",1,1,[0,0,0],[0,0,1],0,0.085,0.2,0.05,[1,0.12],[[1,1,1,-1]],[0.5,1],0,0,"","","",0,false,0,[[0,0,0,0]]];
    _emitter setParticleRandom [0.4,[2,2,2],[0.1,0.1,0.5],10,0.1,[0.1,0.1,0.1,0],0,0,0.1,0];
    _emitter setParticleCircle [0.7,[0,0,0]];
    _emitter setDropInterval 0.01;
};
