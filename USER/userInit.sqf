/*
*   Wird zum Missionsstart auf Server und Clients ausgeführt.
*   Funktioniert wie die init.sqf.
*/

[] execVM "USER\scripts\addPlayerSpikeStripInteraction.sqf";
[] execVM "USER\scripts\addUnitsBriefcaseInteractions.sqf";
[] execVM "USER\scripts\addCustomZeusModules.sqf";

if (isServer) then {
    orp_powerPlantDisabled = true;
    publicVariable "orp_powerPlantDisabled";
};
