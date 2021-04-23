
//----------------------------
// Micro switch profiles
//
// Copyright (c) 2020 Cuban.Tech
//----------------------------

include <NopSCADlib/vitamins/microswitches.scad>

// OMRON D2F microswitch legs

d2f_t_pcb  = [0.9,  3.5, 0.4, 0];
d2f_t_t    = [0.9,  3.4, 0.4, -1.25, [0, 0.1]];
d2f_t_d3   = [1.2,  3.5, 0.4, 1.2, [0,-2.6]];
d2f_t_d    = [1.6,  0.9, 0.4, 0.8, [0,0.45]];

// OMRON D2F microswitches

// TODO: Implement all models in OMRON D2F series
//                      h     w     l   corner  shd  holes                           bw   bh           bp   op   fp  legs                   legtype    boc      btnc
D2F    =    ["", "",  5.8,  6.5, 12.8,     0.0, 2.0, [[3.25,-1.75],[-3.25,-1.75]], 2.9, 1.2, [-2.25,3.75], 5.5, 5.5, [[0,-5.00], [-5.082,-5.00], [5.08,-5.00]], d2f_t_pcb, [0,0,0,0.2], "red"];
D2F_T  =    ["", "",  5.8,  6.5, 12.8,     0.0, 2.0, [[3.25,-1.75],[-3.25,-1.75]], 2.9, 1.2, [-2.25,3.75], 5.5, 5.5, [[0,-5.00], [-5.082,-5.00], [5.08,-5.00]],   d2f_t_t, "white", "red"];
D2F_A  =    ["", "",  5.8,  6.5, 12.8,     0.0, 2.0, [[3.25,-1.75],[-3.25,-1.75]], 2.9, 1.2, [-2.25,3.75], 5.5, 5.5, [[0,-5.00], [-5.082,-5.00], [5.08,-5.00]], d2f_t_pcb, "white", "red"];
D2F_A1 =    ["", "",  5.8,  6.5, 12.8,     0.0, 2.0, [[3.25,-1.75],[-3.25,-1.75]], 2.9, 1.2, [-2.25,3.75], 5.5, 5.5, [[0,-5.00], [-5.082,-5.00], [5.08,-5.00]], d2f_t_pcb, "white", "red"];
D2F_D3 =    ["", "",  5.8,  6.5, 12.8,     0.0, 2.0, [[3.25,-1.75],[-3.25,-1.75]], 2.9, 1.2, [-2.25,3.75], 5.5, 5.5, [[0,-5.00], [-5.082,-5.00], [5.08,-5.00]],  d2f_t_d3, "white", "red"];
D2F_D  =    ["", "",  5.8,  6.5, 12.8,     0.0, 2.0, [[3.25,-1.75],[-3.25,-1.75]], 2.9, 1.2, [-2.25,3.75], 5.5, 5.5, [[0,-5.00], [-5.082,-5.00], [5.08,-5.00]],   d2f_t_d, "white", "red"];

// Aliases
D2F_L    = D2F;
D2F_L_T  = D2F_T;
D2F_L_A  = D2F_A;
D2F_L_A1 = D2F_A1;
D2F_L_D3 = D2F_D3;
D2F_L_D  = D2F_D;
D2F_L2    = D2F;
D2F_L2_T  = D2F_T;
D2F_L2_A  = D2F_A;
D2F_L2_A1 = D2F_A1;
D2F_L2_D3 = D2F_D3;
D2F_L2_D  = D2F_D;
D2F_L3    = D2F;
D2F_L3_T  = D2F_T;
D2F_L3_A  = D2F_A;
D2F_L3_A1 = D2F_A1;
D2F_L3_D3 = D2F_D3;
D2F_L3_D  = D2F_D;
D2F_F    = D2F;
D2F_F_T  = D2F_T;
D2F_F_A  = D2F_A;
D2F_F_A1 = D2F_A1;
D2F_F_D3 = D2F_D3;
D2F_F_D  = D2F_D;
D2F_FL    = D2F;
D2F_FL_T  = D2F_T;
D2F_FL_A  = D2F_A;
D2F_FL_A1 = D2F_A1;
D2F_FL_D3 = D2F_D3;
D2F_FL_D  = D2F_D;
D2F_FL2    = D2F;
D2F_FL2_T  = D2F_T;
D2F_FL2_A  = D2F_A;
D2F_FL2_A1 = D2F_A1;
D2F_FL2_D3 = D2F_D3;
D2F_FL2_D  = D2F_D;
D2F_FL3    = D2F;
D2F_FL3_T  = D2F_T;
D2F_FL3_A  = D2F_A;
D2F_FL3_A1 = D2F_A1;
D2F_FL3_D3 = D2F_D3;
D2F_FL3_D  = D2F_D;
D2F_01    = D2F;
D2F_01_T  = D2F_T;
D2F_01_A  = D2F_A;
D2F_01_A1 = D2F_A1;
D2F_01_D3 = D2F_D3;
D2F_01_D  = D2F_D;
D2F_01L    = D2F;
D2F_01L_T  = D2F_T;
D2F_01L_A  = D2F_A;
D2F_01L_A1 = D2F_A1;
D2F_01L_D3 = D2F_D3;
D2F_01L_D  = D2F_D;
D2F_01L2    = D2F;
D2F_01L2_T  = D2F_T;
D2F_01L2_A  = D2F_A;
D2F_01L2_A1 = D2F_A1;
D2F_01L2_D3 = D2F_D3;
D2F_01L2_D  = D2F_D;
D2F_01L3    = D2F;
D2F_01L3_T  = D2F_T;
D2F_01L3_A  = D2F_A;
D2F_01L3_A1 = D2F_A1;
D2F_01L3_D3 = D2F_D3;
D2F_01L3_D  = D2F_D;
D2F_01F    = D2F;
D2F_01F_T  = D2F_T;
D2F_01F_A  = D2F_A;
D2F_01F_A1 = D2F_A1;
D2F_01F_D3 = D2F_D3;
D2F_01F_D  = D2F_D;
D2F_01FL    = D2F;
D2F_01FL_T  = D2F_T;
D2F_01FL_A  = D2F_A;
D2F_01FL_A1 = D2F_A1;
D2F_01FL_D3 = D2F_D3;
D2F_01FL_D  = D2F_D;
D2F_01FL2    = D2F;
D2F_01FL2_T  = D2F_T;
D2F_01FL2_A  = D2F_A;
D2F_01FL2_A1 = D2F_A1;
D2F_01FL2_D3 = D2F_D3;
D2F_01FL2_D  = D2F_D;
D2F_01FL3    = D2F;
D2F_01FL3_T  = D2F_T;
D2F_01FL3_A  = D2F_A;
D2F_01FL3_A1 = D2F_A1;
D2F_01FL3_D3 = D2F_D3;
D2F_01FL3_D  = D2F_D;

