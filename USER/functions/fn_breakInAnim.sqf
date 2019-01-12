/*  Credits to ACE-team - this is from the repair component, slightly modified
*
*/

params ["_caller","_animation",["_start",true]];

if (!_start) exitWith {
    if (primaryWeapon _caller == "ACE_FakePrimaryWeapon") then {
        _caller removeWeapon "ACE_FakePrimaryWeapon";
    };
    if (vehicle _caller == _caller) then {
        [_caller, _caller getVariable ["orp_prevAnimCaller", ""], 2] call ace_common_fnc_doAnimation;
    };
    _caller setVariable ["orp_prevAnimCaller", nil];

    _weaponSelect = (_caller getVariable ["orp_selectedWeaponOnAnimation", ""]);
    if (_weaponSelect != "") then {
        _caller selectWeapon _weaponSelect;
    } else {
        [_caller] call ACE_weaponSelect_fnc_putWeaponAway;
    };
};


// Player Animation
_callerAnim = if (typeName _animation == "CONFIG") then {
    [getText (_animation >> "animationCaller"), getText (_animation >> "animationCallerProne")] select (stance _caller == "PRONE")
} else {
    _animation;
};
_caller setVariable ["orp_selectedWeaponOnAnimation", currentWeapon _caller];

// Cannot use secondairy weapon for animation
if (currentWeapon _caller == secondaryWeapon _caller) then {
    _caller selectWeapon (primaryWeapon _caller);
};

_wpn = ["non", "rfl", "pst"] select (1 + ([primaryWeapon _caller, handgunWeapon _caller] find (currentWeapon _caller)));
_callerAnim = [_callerAnim, "[wpn]", _wpn] call CBA_fnc_replace;
if (vehicle _caller == _caller && {_callerAnim != ""}) then {
    if (primaryWeapon _caller == "") then {
        _caller addWeapon "ACE_FakePrimaryWeapon";
    };
    if (currentWeapon _caller == "") then {
        _caller selectWeapon (primaryWeapon _caller); // unit always has a primary weapon here
    };

    if (stance _caller == "STAND") then {
        _caller setVariable ["orp_prevAnimCaller", "amovpknlmstpsraswrfldnon"];
    } else {
        _caller setVariable ["orp_prevAnimCaller", animationState _caller];
    };
    [_caller, _callerAnim] call ace_common_fnc_doAnimation;
};
