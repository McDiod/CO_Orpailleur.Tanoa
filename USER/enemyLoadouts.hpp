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

        class Survivor_F {
            addItemsToUniform[] = {
                LIST_4("ACE_packingBandage"),
                LIST_4("ACE_elasticBandage"),
                LIST_4("ACE_quikclot"),
                LIST_4("ACE_tourniquet"),
                LIST_2("ACE_morphine"),
                LIST_2("ACE_epinephrine")
            };
        };

		//POLIZEI ANFANG
		class Soldier_F: Survivor_F {
			primaryWeapon = "arifle_AKS_F";
			primaryWeaponMagazine = "30Rnd_545x39_Mag_F";
			uniform = "U_B_GEN_Commander_F";
			vest = "V_TacVest_gen_F";
			backpack = "";
			headgear = "";
			goggles = "";
			handgunWeapon = "hgun_Rook40_F";
			handgunWeaponMagazine = "16Rnd_9x21_Mag";
			addItemsToVest[] = {
                LIST_4("16Rnd_9x21_Mag")
            };
		};

        class Soldier_TL_F: Soldier_F {
            primaryWeapon = "";
			primaryWeaponMagazine = "";
			headgear = "H_MilCap_gen_F";
        };

		class Soldier_SL_F: Soldier_F {
			primaryWeapon = "rhs_weap_ak105_zenitco01";
			primaryWeaponOptics = "rhs_acc_ekp8_02";
			primaryWeaponMagazine = "rhs_30Rnd_545x39_7N10_AK";
			uniform = "U_B_GEN_Soldier_F";
			vest = "V_PlateCarrier2_blk";
			goggles = "G_Balaclava_TI_G_blk_F";
			headgear = "rhssaf_helmet_m97_black_nocamo";
			addItemsToVest[] = {
                LIST_6("rhs_30Rnd_545x39_7N10_AK")
            };
        };
		// POLIZEI ENDE

		//SECURITE ANFANG

		class Soldier_unarmed_F: Survivor_F {
			addItemsToVest[] = {
                LIST_4("6Rnd_45ACP_Cylinder")
            };
		};

		class Soldier_lite_F: Soldier_unarmed_F {
			primaryWeapon = "rhs_weap_vhsd2";
			primaryWeaponOptics = "rhsusf_acc_T1_high";
			primaryWeaponMagazine = "rhsgref_30rnd_556x45_vhs2";
			addItemsToVest[] = {
                LIST_6("rhsgref_30rnd_556x45_vhs2")
            };
		};

		//SECURITE ENDE

		// MILITÄR ANFANG


		class HeavyGunner_F: Survivor_F {
			primaryWeapon = "rhs_weap_ak105_zenitco01_b33";
			primaryWeaponMagazine = "rhs_30Rnd_545x39_7N10_AK";
			primaryWeaponOptics = "hlc_optic_HensoldtZO_Lo";
			uniform = "U_B_T_Soldier_AR_F";
			vest = "V_PlateCarrierIAGL_oli";
			backpack = "";
			headgear = "rhs_altyn_visordown";
			goggles = "G_Balaclava_oli";
			handgunWeapon = "hgun_Rook40_F";
			handgunWeaponMagazine = "16Rnd_9x21_Mag";
			addItemsToVest[] = {
                LIST_2("16Rnd_9x21_Mag"),
				LIST_6("rhs_30Rnd_545x39_7N10_AK"),
				LIST_2("HandGrenade"),
				LIST_1 ("SmokeShell")
            };
		};
    };
};
