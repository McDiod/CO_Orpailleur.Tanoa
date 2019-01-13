class Extended_Init_EventHandlers  {
    class ModuleCurator_F {
        class grad_template_curatorInit {
            init = "_this call grad_events_fnc_addCuratorEHs";
        };
    };

    class C_Offroad_02_unarmed_F {
        class orp_setTexture {
            init = "if (local (_this select 0)) then {(_this select 0) setObjectTextureGlobal [0, ""USER\data\offroad_02_ext_security_co_v1.paa""];}";
        };
    };
    class C_Van_02_vehicle_F {
        class orp_setTexture {
            init = "if (local (_this select 0)) then {(_this select 0) setObjectTextureGlobal [0, ""USER\data\van_body_security_CO_v3.paa""];}";
        };
    };
    class C_Van_02_transport_F {
        class orp_setTexture {
            init = "if (local (_this select 0)) then {(_this select 0) setObjectTextureGlobal [0, ""USER\data\van_body_security_CO_v3.paa""];}";
        };
    };
};

class Extended_Local_EventHandlers {
    class CAManBase {
        class grad_template_unitLocality {
            local = "_this call grad_events_fnc_onUnitLocalityChanged";
        };
    };
};
