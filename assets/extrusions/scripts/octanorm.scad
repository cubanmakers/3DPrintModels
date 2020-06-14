// Octanorm extrusions library based on official CAD files
//
// Copyright (c) 2020 Cuban.Tech

include <NopSCADlib/lib.scad>

// Classic system uprights
S100 = ["octanorm", "", "S100", "",     "../octanorm/official/files/cad/S 100.dxf", "Profil", 40, 40, 5000];
S110 = ["octanorm", "", "S110", "S100", "../octanorm/official/files/cad/S 110.dxf", "Profil", 40, 40, 2500];
S108 = ["octanorm", "", "S108", "",     "../octanorm/official/files/cad/S 108.dxf", "Profil", 40, 40, 5000];
S118 = ["octanorm", "", "S118", "S108", "../octanorm/official/files/cad/S 118.dxf", "Profil", 40, 40, 2500];
S128 = ["octanorm", "", "S128", "S108", "../octanorm/official/files/cad/S 128.dxf", "Profil", 40, 40,  175];
S201 = ["octanorm", "", "S201", "",     "../octanorm/official/files/cad/S 201.dxf", "Profil", 40, 28, 5000];
S203 = ["octanorm", "", "S203", "",     "../octanorm/official/files/cad/S 203.dxf", "Profil", 40, 28, 5000];
S206 = ["octanorm", "", "S206", "",     "../octanorm/official/files/cad/S 206.dxf", "Profil", 18, 20, 5000];
S302 = ["octanorm", "", "S302", "",     "../octanorm/official/files/cad/S 302.dxf", "Profil", 35, 28, 5000];
S303 = ["octanorm", "", "S303", "",     "../octanorm/official/files/cad/S 303.dxf", "Profil", 32, 32, 5000];
S308 = ["octanorm", "", "S308", "",     "../octanorm/official/files/cad/S 308.dxf", "Profil", 28, 28, 5000];
S408 = ["octanorm", "", "S408", "",     "../octanorm/official/files/cad/S 408.dxf", "Profil", 80, 40, 5000];
S500 = ["octanorm", "", "S500", "",     "../octanorm/official/files/cad/S 500.dxf", "Profil", 40, 40, 5000];

// MAXIMA system oval beams
S6105 = ["octanorm", "", "S6105", "",   "../octanorm/official/files/cad/S 6105.dxf", "Profil", 32, 73, 5000];

// Classic system end caps
//                    F   W   H     L  E        
S236 = ["S236", "S 236", 18,  1,   20, ["S206"]];
S330 = ["S330", "S 330", 28,  28,  17, ["S308"]];
S333 = ["S333", "S 330", 28,  28,  17, ["S308"]];

// Classic system foots
//                    F   W   H     L  E        S
// S340 = ["S340", "S 340", 8,  20,  80, ["S308"], M4];
// S340 = ["S333", "S 333", 8,  20,  80, ["S308"], M4];

octanorm_extrusions = [S100, S110, S108, S118, S128, S201, S203, S206, S302, S303, S308, S408, S500, S6105];
