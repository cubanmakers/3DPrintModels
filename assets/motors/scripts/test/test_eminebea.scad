
//----------------------------
// Render MINEBEA stepper motors
//
// Copyright (c) 2020 Cuban.Tech
//----------------------------

include <3DPrintModels/assets/motors/scripts/eminebea.scad>

part = "pm42l_048"; // [pm15s_020:PM15S 020,pm20s_020:PM20S 020,pm20l_020:PM20L 020,pm25s_024:PM25S 024,pm25s_048:PM25S 048,pm25l_024:PM25L 024,pm30s_f48:PM30S F48,pm35s_024:PM35S 024,pm35s_024_d1_3:PM35S 024 D1 3,pm35s_048:PM35S 048,pm35s_048_d1_3:PM35S 048 D1 3,pm35s_f48:PM35S F48,pm35l_024:PM35L 024,pm35l_024_d1_3:PM35L 024 D1 3,pm35l_048:PM35L 048,pm35l_048_d1_3:PM35L 048 D1 3,pm42s_048:PM42S 048,pm42s_096:PM42S 096,pm42s_0x1:PM42S 0X1,pm42s_f48:PM42S F48,pm42l_048:PM42L 048,pm42l_f48:PM42L F48,pm51l_f48:PM51L F48,pm55l_048:PM55L 048,pm55l_048_d1_6:PM55L 048 D1 6,pg15s_d20:PG15S D20,pg15s_j20:PG15S J20,pg20s_d20:PG20S D20,pg20l_d20:PG20L D20,pg20l_c20:PG20L C20,pg25s_d48:PG25S D48,pg25l_d24:PG25L D24,pl25l_a24:PL25L A24,pg35s_d48:PG35S D48,pg35l_d48:PG35L D48,pl35l_a24:PL35L A24,smf25_g48:SMF25 G48,smf25_g96:SMF25 G96,st35a_g96:ST35A G96,st35b_g96:ST35B G96,smw35_g48:SMW35 G48,smw35_g48_d1_3:SMW35 G48 D1 3,smw35_g96:SMW35 G96,smw42_g48:SMW42 G48,smw42_g96:SMW42 G96]

$fn = 80;

function motor_def_from_str(part_id) = (part_id == "pm15s_020")? MINEBEA_PM15S_020: (part_id == "pm20s_020")? MINEBEA_PM20S_020: (part_id == "pm20l_020")? MINEBEA_PM20L_020: (part_id == "pm25s_024")? MINEBEA_PM25S_024: (part_id == "pm25s_048")? MINEBEA_PM25S_048: (part_id == "pm25l_024")? MINEBEA_PM25L_024: (part_id == "pm30s_f48")? MINEBEA_PM30S_F48: (part_id == "pm35s_024")? MINEBEA_PM35S_024: (part_id == "pm35s_024_d1_3")? MINEBEA_PM35S_024_D1_3: (part_id == "pm35s_048")? MINEBEA_PM35S_048: (part_id == "pm35s_048_d1_3")? MINEBEA_PM35S_048_D1_3: (part_id == "pm35s_f48")? MINEBEA_PM35S_F48: (part_id == "pm35l_024")? MINEBEA_PM35L_024: (part_id == "pm35l_024_d1_3")? MINEBEA_PM35L_024_D1_3: (part_id == "pm35l_048")? MINEBEA_PM35L_048: (part_id == "pm35l_048_d1_3")? MINEBEA_PM35L_048_D1_3: (part_id == "pm42s_048")? MINEBEA_PM42S_048: (part_id == "pm42s_096")? MINEBEA_PM42S_096: (part_id == "pm42s_0x1")? MINEBEA_PM42S_0X1: (part_id == "pm42s_f48")? MINEBEA_PM42S_F48: (part_id == "pm42l_048")? MINEBEA_PM42L_048: (part_id == "pm42l_f48")? MINEBEA_PM42L_F48: (part_id == "pm51l_f48")? MINEBEA_PM51L_F48: (part_id == "pm55l_048")? MINEBEA_PM55L_048: (part_id == "pm55l_048_d1_6")? MINEBEA_PM55L_048_D1_6: (part_id == "pg15s_d20")? MINEBEA_PG15S_D20: (part_id == "pg15s_j20")? MINEBEA_PG15S_J20: (part_id == "pg20s_d20")? MINEBEA_PG20S_D20: (part_id == "pg20l_d20")? MINEBEA_PG20L_D20: (part_id == "pg20l_c20")? MINEBEA_PG20L_C20: (part_id == "pg25s_d48")? MINEBEA_PG25S_D48: (part_id == "pg25l_d24")? MINEBEA_PG25L_D24: (part_id == "pl25l_a24")? MINEBEA_PL25L_A24: (part_id == "pg35s_d48")? MINEBEA_PG35S_D48: (part_id == "pg35l_d48")? MINEBEA_PG35L_D48: (part_id == "pl35l_a24")? MINEBEA_PL35L_A24: (part_id == "smf25_g48")? MINEBEA_SMF25_G48: (part_id == "smf25_g96")? MINEBEA_SMF25_G96: (part_id == "st35a_g96")? MINEBEA_ST35A_G96: (part_id == "st35b_g96")? MINEBEA_ST35B_G96: (part_id == "smw35_g48")? MINEBEA_SMW35_G48: (part_id == "smw35_g48_d1_3")? MINEBEA_SMW35_G48_D1_3: (part_id == "smw35_g96")? MINEBEA_SMW35_G96: (part_id == "smw42_g48")? MINEBEA_SMW42_G48: (part_id == "smw42_g96")? MINEBEA_SMW42_G96: [];

// Front panel type
fp = "FPH"; // [FPH: Front panel with holes,FPT:Frpont panel with screw thread,FPL:Front panel with L holes]

// Shaft length
l1 = 7.5;

module main() {
    eminebea_stepper(motor_def_from_str(part), fp=fp, shaft_length=l1);
}

main();

