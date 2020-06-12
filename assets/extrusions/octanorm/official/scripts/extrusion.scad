// Octanorm extrusions library based on official CAD files
//
// Copyright (c) 2020 Cuban.Tech

include <NopSCADlib/lib.scad>

// Classic system uprights
//                    F   W   H     L
S100 = ["S100", "S 100", 40, 40, 5000];
S110 = ["S110", "S 110", 40, 40, 2500];
S108 = ["S108", "S 108", 40, 40, 5000];
S118 = ["S118", "S 118", 40, 40, 2500];
S128 = ["S128", "S 128", 40, 40,  175];
S201 = ["S201", "S 201", 40, 28, 5000];
S203 = ["S203", "S 203", 40, 28, 5000];
S206 = ["S206", "S 206", 18, 20, 5000];
S302 = ["S302", "S 302", 35, 28, 5000];
S303 = ["S303", "S 303", 32, 32, 5000];
S308 = ["S308", "S 308", 28, 28, 5000];
S408 = ["S408", "S 408", 80, 40, 5000];
S500 = ["S500", "S 500", 40, 40, 5000];

// Classic system end caps
//                    F   W   H     L  E        
S236 = ["S236", "S 236", 18,  1,   20, ["S206"]];
S330 = ["S330", "S 330", 28,  28,  17, ["S308"]];
S330 = ["S333", "S 330", 28,  28,  17, ["S308"]];

// Classic system foots
//                    F   W   H     L  E        S
S340 = ["S340", "S 340", 8,  20,  80, ["S308"], M4];
S340 = ["S333", "S 333", 8,  20,  80, ["S308"], M4];

octanorm_extrusions = [S100, S110, S108, S118, S128, S201, S203, S206, S302, S303, S308, S408, S500];
