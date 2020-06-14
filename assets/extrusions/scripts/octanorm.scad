// Octanorm extrusions library based on official CAD files
//
// Copyright (c) 2020 Cuban.Tech

include <NopSCADlib/lib.scad>

// Classic system uprights
S100 = ["octanorm", "classic40", "S100", "",     "../octanorm/official/files/cad/S 100.dxf", "Profil", 40, 40, 5000];
S110 = ["octanorm", "classic40", "S110", "S100", "../octanorm/official/files/cad/S 110.dxf", "Profil", 40, 40, 2500];
S108 = ["octanorm", "classic40", "S108", "",     "../octanorm/official/files/cad/S 108.dxf", "Profil", 40, 40, 5000];
S118 = ["octanorm", "classic40", "S118", "S108", "../octanorm/official/files/cad/S 118.dxf", "Profil", 40, 40, 2500];
S128 = ["octanorm", "classic40", "S128", "S108", "../octanorm/official/files/cad/S 128.dxf", "Profil", 40, 40,  175];
S201 = ["octanorm", "classic40", "S201", "",     "../octanorm/official/files/cad/S 201.dxf", "Profil", 40, 28, 5000];
S203 = ["octanorm", "classic40", "S203", "",     "../octanorm/official/files/cad/S 203.dxf", "Profil", 40, 28, 5000];
S206 = ["octanorm", "classic20", "S206", "",     "../octanorm/official/files/cad/S 206.dxf", "Profil", 18, 20, 5000];
S302 = ["octanorm", "classic35", "S302", "",     "../octanorm/official/files/cad/S 302.dxf", "Profil", 35, 28, 5000];
S303 = ["octanorm", "classic32", "S303", "",     "../octanorm/official/files/cad/S 303.dxf", "Profil", 32, 32, 5000];
S308 = ["octanorm", "classic28", "S308", "",     "../octanorm/official/files/cad/S 308.dxf", "Profil", 28, 28, 5000];
S408 = ["octanorm", "classic80", "S408", "",     "../octanorm/official/files/cad/S 408.dxf", "Profil", 80, 40, 5000];
S500 = ["octanorm", "classic40", "S500", "",     "../octanorm/official/files/cad/S 500.dxf", "Profil", 40, 40, 5000];

// Classic system beams
Z300 = ["octanorm", "classic25", "Z300", "",     "../octanorm/official/files/cad/Z 300.dxf", "Profil", 16, 25, 5000];
Z303 = ["octanorm", "classic32", "Z303", "",     "../octanorm/official/files/cad/Z 303.dxf", "Profil", 16, 32, 5000];
Z308 = ["octanorm", "classic32", "Z308", "",     "../octanorm/official/files/cad/Z 308.dxf", "Profil", 16, 32, 5000];
Z310 = ["octanorm", "classic37", "Z310", "",     "../octanorm/official/files/cad/Z 310.dxf", "Profil", 16, 37, 5000];
Z402 = ["octanorm", "classic50", "Z402", "",     "../octanorm/official/files/cad/Z 402.dxf", "Profil", 16, 50, 5000];
Z400 = ["octanorm", "classic50", "Z400", "",     "../octanorm/official/files/cad/Z 400.dxf", "Profil", 16, 50, 5000];
Z460 = ["octanorm", "classic50", "Z460", "",     "../octanorm/official/files/cad/Z 460.dxf", "Profil", 16, 50, 5000];
Z110 = ["octanorm", "classic70", "Z110", "",     "../octanorm/official/files/cad/Z 110.dxf", "Profil", 16, 70, 5000];
Z160 = ["octanorm", "classic70", "Z160", "",     "../octanorm/official/files/cad/Z 160.dxf", "Profil", 16, 70, 5000];
Z508 = ["octanorm", "classic175", "Z508", "",     "../octanorm/official/files/cad/Z 508.dxf", "Profil", 16, 175, 5000];
Z560 = ["octanorm", "classic175", "Z560", "",     "../octanorm/official/files/cad/Z 560.dxf", "Profil", 16, 175, 5000];
Z600 = ["octanorm", "classic175", "Z600", "",     "../octanorm/official/files/cad/Z 600.dxf", "Profil", 16, 175, 5000];

// MAXIMA system oval beams
S6105 = ["octanorm", "maxima", "S6105", "",   "../octanorm/official/files/cad/S 6105.dxf", "Profil", 32, 73, 5000];

// MAXIMA system square extrusions
M1000 = ["octanorm", "maxima40", "M1000", "",   "../octanorm/official/files/cad/M 1000.dxf", "Profil", 40, 40, 5000];
M1001 = ["octanorm", "maxima40", "M1001", "M1000",   "../octanorm/official/files/cad/M 1001.dxf", "Profil", 40, 40, 6000];
M1002 = ["octanorm", "maxima40", "M1002", "",   "../octanorm/official/files/cad/M 1002.dxf", "Profil", 40, 40, 5000];
M1003 = ["octanorm", "maxima40", "M1003", "M1002",   "../octanorm/official/files/cad/M 1003.dxf", "Profil", 40, 40, 6000];
M1005 = ["octanorm", "maxima40", "M1005", "",   "../octanorm/official/files/cad/M 1005.dxf", "Profil", 40, 40, 6000];
M1007 = ["octanorm", "maxima40", "M1007", "",   "../octanorm/official/files/cad/M 1007.dxf", "Profil", 40, 40, 6000];
M1009 = ["octanorm", "maxima40", "M1009", "",   "../octanorm/official/files/cad/M 1009.dxf", "Profil", 50, 40, 6000];
S380 = ["octanorm", "maxima40", "S380", "",   "../octanorm/official/files/cad/S 380.dxf", "Profil", 40, 40, 5000];
W908 = ["octanorm", "maxima40", "W908", "",   "../octanorm/official/files/cad/W 908.dxf", "Profil", 40, 20, 5000];
M1010 = ["octanorm", "maxima60", "M1010", "",   "../octanorm/official/files/cad/M 1010.dxf", "Profil", 60, 60, 5000];
M1020 = ["octanorm", "maxima80", "M1020", "",   "../octanorm/official/files/cad/M 1020.dxf", "Profil", 80, 80, 5000];
M1018 = ["octanorm", "maxima80", "M1018", "",   "../octanorm/official/files/cad/M 1018.dxf", "Profil", 80, 80, 5000];
M1019 = ["octanorm", "maxima80","M1019","M1018","../octanorm/official/files/cad/M 1019.dxf", "Profil", 80, 80, 6000];
M1105 = ["octanorm", "maxima80", "M1105", "",   "../octanorm/official/files/cad/M 1105.dxf", "Profil", 40, 30, 5000];
M1063 = ["octanorm", "maxima80", "M1063", "",   "../octanorm/official/files/cad/M 1063.dxf", "Profil", 80, 10, 5000];
M1070 = ["octanorm", "maxima80", "M1070", "",   "../octanorm/official/files/cad/M 1070.dxf", "Profil", 77, 80, 5000];
M225 = ["octanorm", "maxima120", "M225", "",   "../octanorm/official/files/cad/M 225.dxf", "Profil", 120, 120, 5000];
M226 = ["octanorm", "maxima120", "M226", "M225", "../octanorm/official/files/cad/M 225.dxf", "Profil", 120, 120, 6000];
M230 = ["octanorm", "maxima120", "M230", "",   "../octanorm/official/files/cad/M 230.dxf", "Profil", 120, 120, 5000];

// MAXIMA system round extrusions
M1222 = ["octanorm", "maxima80", "M1222", "",   "../octanorm/official/files/cad/M 1222.dxf", "Profil", 80, 80, 5000];

// MAXIMA system flat truss beams extrusions
M770 = ["octanorm", "maxima40", "M770", "",   "../octanorm/official/files/cad/M 770.dxf", "Profil", 200, 40, 7000];

// MAXIMA system rectangular extrusions
Z4400 = ["octanorm", "maxima40", "Z4400", "",   "../octanorm/official/files/cad/Z 4400.dxf", "Profil", 16, 40, 5000];
M1068 = ["octanorm", "maxima40", "M1068", "",   "../octanorm/official/files/cad/M 1068.dxf", "Profil", 40, 28, 5000];
M1082 = ["octanorm", "maxima60", "M1082", "",   "../octanorm/official/files/cad/M 1082.dxf", "Profil", 60, 40, 6000w];
M1320 = ["octanorm", "maxima80", "M1320", "",   "../octanorm/official/files/cad/M 1320.dxf", "Profil", 16, 80, 5000];
M1025 = ["octanorm", "maxima80", "M1025", "",   "../octanorm/official/files/cad/M 1025.dxf", "Profil", 40, 80, 5000];
M1091 = ["octanorm", "maxima80", "M1091", "",   "../octanorm/official/files/cad/M 1091.dxf", "Profil", 40, 80, 5000];
M1340 = ["octanorm", "maxima120", "M1340", "",   "../octanorm/official/files/cad/M 1340.dxf", "Profil", 16, 120, 5000];
M1052 = ["octanorm", "maxima160", "M1052", "",   "../octanorm/official/files/cad/M 1052.dxf", "Profil", 160, 80, 6930];

// Classic system end caps
//                    F   W   H     L  E        
S236 = ["S236", "S 236", 18,  1,   20, ["S206"]];
S330 = ["S330", "S 330", 28,  28,  17, ["S308"]];
S333 = ["S333", "S 330", 28,  28,  17, ["S308"]];

// Classic system foots
//                    F   W   H     L  E        S
// S340 = ["S340", "S 340", 8,  20,  80, ["S308"], M4];
// S340 = ["S333", "S 333", 8,  20,  80, ["S308"], M4];

octanorm_extrusions = [S100, S110, S108, S118, S128, S201, S203, S206, S302, S303, S308, S408, S500, S6105, M1000, M1001, M1002, M1003, M1005, M1007, M1009, S380, W908, M1010, M1020, M1018, M1019, M1105, M1063, M1070, M225, M226, M230, M1222, M770, Z4400, M1068, M1082, M1320, M1025, M1091, M1340, M1052, Z300, Z303, Z308, Z310, Z402, Z400, Z460, Z110, Z160, Z508, Z560, Z600];

