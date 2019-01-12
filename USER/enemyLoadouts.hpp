/*
*   Hier können eigene factions für grad-loadout eingetragen werden.
*   Anleitung im Wiki.
*/

#ifdef NIGHTVISION
  #define NVITEM ""
#else
  #define NVITEM ""
#endif

#ifdef LASERS
  #define LLITEM ""
#else
  #define LLITEM ""
#endif

#ifdef GUNLIGHTS
  #define LLITEM ""
#endif

#ifdef SUPPRESSORS
  #define SUPPRESSORITEM ""
#else
  #define SUPPRESSORITEM ""
#endif

class securite {
	class AllUnits {
		uniform = "U_C_IDAP_Man_cargo_F";
		vest = "V_DeckCrew_red_F";
		backpack = "B_LegStrapBag_black_F";
		headgear = "H_Cap_red";
		goggles = "G_WirelessEarpiece_F";
		primaryWeapon = "";
        primaryWeaponMagazine = "";
		primaryWeaponOptics = "";
		primaryWeaponPointer = LLITEM;
		primaryWeaponMuzzle = SUPPRESSORITEM;
        primaryWeaponUnderbarrel = "";
		primaryWeaponUnderbarrelMagazine = "";
        secondaryWeapon = "";
        secondaryWeaponMagazine = "";
		handgunWeapon = "hgun_Pistol_heavy_02_F";
        handgunWeaponMagazine = "6Rnd_45ACP_Cylinder";
		binoculars = "";
		map = "";
		compass = "";
		watch = "ItemWatch";
		gps = "";
		radio = "";
		nvgoggles = NVITEM;
    };
    class Type {
        //Rifleman
        class Soldier_F {
            addItemsToUniform[] = {
                LIST_4("ACE_packingBandage"),
                LIST_4("ACE_elasticBandage"),
                LIST_4("ACE_quikclot"),
                LIST_4("ACE_tourniquet"),
                LIST_2("ACE_morphine"),
                LIST_2("ACE_epinephrine")
            };
            addItemsToVest[] = {
                LIST_7("6Rnd_45ACP_Cylinder")
            };
        };

        //Asst. Autorifleman
        class soldier_AAR_F: Soldier_F {
            backpack = "ARC_GER_Kitbag_compact_Flecktarn";
            addItemsToBackpack[] = {
                LIST_2("rhs_200rnd_556x45_M_SAW"),
                "rhs_200rnd_556x45_T_SAW"
            };
        };

        //Autorifleman
        class soldier_AR_F: Soldier_F {
            primaryWeapon = "rhs_weap_m249_pip_S";
            primaryWeaponMagazine = "rhs_200rnd_556x45_T_SAW";
            handgunWeapon = "";
            handgunWeaponMagazine = "";
            backpack = "ARC_GER_Kitbag_compact_Flecktarn";
            addItemsToBackpack[] = {
                LIST_2("rhs_200rnd_556x45_M_SAW"),
                "rhsusf_100Rnd_556x45_soft_pouch",
            };
            addItemsToVest[] = {
                LIST_2("HandGrenade"),
                LIST_2("SmokeShell")
            };
        };

        //Combat Life Saver
        class medic_F: Soldier_F {
            headgear = "ARC_GER_Flecktarn_Helmet_simple_Medic";
            backpack = "ARC_GER_Backpack_Flecktarn_Med";
            addItemsToUniform[] = {
                "ACE_MapTools",
                "ACE_DefusalKit",
                LIST_2("ACE_CableTie"),
                "ACE_Flashlight_MX991"
            };
            addItemsToVest[] = {
                LIST_2("HandGrenade"),
                LIST_2("SmokeShellPurple"),
                LIST_8("SmokeShell"),
                LIST_2("rhsusf_mag_17Rnd_9x19_JHP"),
                LIST_8("rhs_mag_30Rnd_556x45_Mk318_Stanag")
            };
            class Rank {
                class PRIVATE {
                    GRAD_FACTIONS_MEDICITEMS_CFR
                };
                class CORPORAL {
                    GRAD_FACTIONS_MEDICITEMS_SQ
                };
                class SERGEANT {
                    GRAD_FACTIONS_MEDICITEMS_PT
                };
                class LIEUTENANT: SERGEANT {};
                class CAPTAIN: SERGEANT {};
                class MAJOR: SERGEANT {};
                class COLONEL: SERGEANT {};
            };
        };

        //Explosive Specialist
        class soldier_exp_F: Soldier_F {
            headgear = "ARC_GER_Flecktarn_Helmet_EOD";
            backpack = "ARC_GER_Kitbag_compact_Flecktarn";
            addItemsToBackpack[] = {
                "ACE_Clacker",
                "ACE_M26_Clacker",
                "SatchelCharge_Remote_Mag",
                LIST_5("DemoCharge_Remote_Mag")
            };
        };

        //Grenadier
        class Soldier_GL_F: Soldier_F {
            primaryWeapon = "rhs_weap_hk416d10_m320";
            addItemsToVest[] = {
                LIST_2("HandGrenade"),
                LIST_2("SmokeShell"),
                LIST_2("rhsusf_mag_17Rnd_9x19_JHP"),
                LIST_8("rhs_mag_30Rnd_556x45_Mk318_Stanag"),
                LIST_8("1Rnd_HE_Grenade_shell"),
                LIST_3("1Rnd_SmokeRed_Grenade_shell")
            };
        };

        //Rifleman (AT)
        class soldier_LAT_F: Soldier_F {
            secondaryWeapon = "rhs_weap_M136";
        };

        //Squad Leader
        class Soldier_SL_F: Soldier_F {
            backpack = "tf_rt1523g_big_bwmod";
            addItemsToBackpack[] = {
                LIST_2("SmokeShellBlue"),
                LIST_2("SmokeShellGreen"),
                LIST_2("SmokeShellOrange"),
                LIST_2("SmokeShellPurple"),
                LIST_2("SmokeShellRed"),
                LIST_2("SmokeShellYellow"),
                LIST_2("SmokeShell")
            };
        };

        //Team Leader
        class Soldier_TL_F: Soldier_F {
            primaryWeapon = "rhs_weap_hk416d10_m320";
            addItemsToVest[] = {
                LIST_2("HandGrenade"),
                LIST_2("SmokeShell"),
                LIST_2("rhsusf_mag_17Rnd_9x19_JHP"),
                LIST_8("rhs_mag_30Rnd_556x45_Mk318_Stanag"),
                LIST_2("1Rnd_SmokeRed_Grenade_shell"),
                LIST_2("1Rnd_SmokeGreen_Grenade_shell"),
                LIST_2("1Rnd_SmokeBlue_Grenade_shell"),
                LIST_2("1Rnd_HE_Grenade_shell")
            };
        };
    };
};
