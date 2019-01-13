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

class orp_rebels {
	class AllUnits {
		uniform[] = {
			"U_BG_Guerilla2_3",
		//	"U_BG_Guerilla3_1",
			"U_BG_Guerilla2_2",
			"U_BG_Guerilla2_1",
			"U_BG_Guerrilla_6_1"
		//	"U_BG_Guerilla1_1"	
		};
		vest[] = {
			"V_BandollierB_blk",
			"V_BandollierB_rgr",
			"V_BandollierB_cbr",
			"V_BandollierB_khk",
			"V_BandollierB_oli"
		};
		backpack = "";
		headgear[] = {
			"H_Cap_tan",
			"H_Cap_oli",
			"H_Cap_grn",
			"H_Cap_blk",
			"V_BandollierB_oli",
			"H_Booniehat_khk",
			"H_Booniehat_tan",
			"H_Booniehat_oli"
		};
		goggles[] = {
			"G_Bandanna_beast",
			"G_Bandanna_blk",
			"G_Bandanna_khk",
			"G_Bandanna_oli"
		};
		
		primaryWeapon = "";	
        primaryWeaponMagazine = "";
		primaryWeaponOptics = "";
		primaryWeaponPointer = LLITEM;
		primaryWeaponMuzzle = SUPPRESSORITEM;
        primaryWeaponUnderbarrel = "";
		primaryWeaponUnderbarrelMagazine = "";
        secondaryWeapon = "rhs_weap_type94_new";
        secondaryWeaponMagazine = "rhs_mag_6x8mm_mhp";
		handgunWeapon = "";
        handgunWeaponMagazine = "";
		binoculars = "Binocular";
		map = "ItemMap";
		compass = "ItemCompass";
		watch = "ItemWatch";
		gps = "ItemGPS";
		radio = "tf_anprc152";
		nvgoggles = NVITEM;
    };
    class Type {
        //Rifleman
        class Soldier_F {
			primaryWeapon = "rhs_weap_kar98k";	
			primaryWeaponMagazine = "rhsgref_5Rnd_792x57_kar98k";
            addItemsToUniform[] = {
                LIST_4("ACE_packingBandage"),
                LIST_4("ACE_elasticBandage"),
                LIST_4("ACE_quikclot"),
                LIST_4("ACE_tourniquet"),
                LIST_2("ACE_morphine"),
                LIST_2("ACE_epinephrine")
            };
            addItemsToVest[] = {
                LIST_3("rhsusf_mag_17Rnd_9x19_JHP"),
                LIST_4("rhsgref_5Rnd_792x57_kar98k")
            };
        };

        //Asst. Autorifleman
        class soldier_AAR_F: Soldier_F {
            primaryWeapon = "rhs_weap_Izh18";
			primaryWeaponMagazine = "rhsgref_1Rnd_00Buck";
                addItemsToVest[] = {
				LIST_3("rhs_mag_6x8mm_mhp"),
                LIST_40("rhsgref_1Rnd_00Buck")
            };
        };

        //Autorifleman
        class soldier_AR_F: Soldier_F {
            primaryWeapon = "rhs_weap_scorpion";
            primaryWeaponMagazine = "rhsgref_10rnd_765x17_vz61";
			
            addItemsToVest[] = {
				LIST_3("rhs_mag_6x8mm_mhp"),
                LIST_4("rhsgref_10rnd_765x17_vz61")
            };
        };

        //Combat Life Saver
        class medic_F: Soldier_F {
			
			uniform[] = {
			"U_BG_Guerilla2_3",
			"U_BG_Guerilla2_2"
			};
            headgear = "H_Bandanna_camo";
            backpack = "ga_dlc_low_messenger_olive_medic";
            handgunWeapon = "rhsusf_weap_m1911a1";
			handgunWeaponMagazine = "rhsusf_mag_7x45acp_MHP";
            primaryWeapon = "";	
			primaryWeaponMagazine = "";
			addItemsToVest[] = {
                LIST_6("rhsusf_mag_7x45acp_MHP")
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

        //Team Leader
        class Soldier_TL_F: Soldier_F {
			headgear = "H_Beret_blk";
			uniform = "U_BG_Guerrilla_6_1";
			
			primaryWeapon = "rhs_weap_m3a1";	
			primaryWeaponMagazine = "rhsgref_30rnd_1143x23_M1911B_SMG";
			addItemsToVest[] = {
                LIST_1("rhsusf_mag_17Rnd_9x19_JHP"),
                LIST_2("rhsgref_30rnd_1143x23_M1911B_SMG")
			};
			

        };

        //Squad Leader
        class Soldier_SL_F: Soldier_TL_F {
			uniform = "U_BG_leader";
			vest = "V_Rangemaster_belt";
			handgunWeapon = "rhsusf_weap_m1911a1";
			handgunWeaponMagazine = "rhsusf_mag_7x45acp_MHP";
            primaryWeapon = "";	
			primaryWeaponMagazine = "";
			addItemsToVest[] = {
                LIST_6("rhsusf_mag_7x45acp_MHP")
			};
			

        };
    };
};
