
//----------------------------
// Micro switch profiles
//
// Copyright (c) 2020 Cuban.Tech
//----------------------------

include <NopSCADlib/vitamins/microswitches.scad>

// OMRON D2F microswitch legs

d2f_pcb  = [0.9,  3.5, 0.4, 0];

// OMRON D2F microswitches

// TODO: Implement all models in OMRON D2F series
//                   h     w     l   corner  shd  holes                           bw   bh           bp  legs                   legtype    boc      btnc
D2F =    ["", "",  5.8,  6.5, 12.8,     0.0, 2.0, [[3.25,-1.75],[-3.25,-1.75]], 2.9, 1.2, [-2.25,3.75], [[0,-3.25], [-5.082,-3.25], [5.08,-3.25]], d2f_pcb, "white", "red"];
//D2F_T =  ["", "", 00.0, 00.0, 00.0, 0.0, 0.0, [], 0.0, 0.0, [], [], small_leg, "black", "red"];
//D2F_D =  ["", "", 00.0, 00.0, 00.0, 0.0, 0.0, [], 0.0, 0.0, [], [], small_leg, "black", "red"];
//D2F_D3 = ["", "", 00.0, 00.0, 00.0, 0.0, 0.0, [], 0.0, 0.0, [], [], small_leg, "black", "red"];
//D2F_A  = ["", "", 00.0, 00.0, 00.0, 0.0, 0.0, [], 0.0, 0.0, [], [], small_leg, "black", "red"];
//D2F_A1 = ["", "", 00.0, 00.0, 00.0, 0.0, 0.0, [], 0.0, 0.0, [], [], small_leg, "black", "red"];

// Limit switches
//                    PCB    PCBC   CONN  CNXD
CHENBO_MAKERBOT = [[39.0,15.0, 1.0], "red", "jst", JST, ];

