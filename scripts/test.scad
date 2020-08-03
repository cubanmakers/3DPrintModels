// Tests for the library of square Al extrusions
//
// Copyright (c) 2020 Cuban.Tech

// Library test suite

include <NopSCADlib/lib.scad>

// Extrusion library tests

include <../assets/extrusions/scripts/test_octanorm.scad>
include <../assets/extrusions/scripts/test_square.scad>
include <../assets/extrusions/scripts/test_tslot.scad>

test_p40x70();
translate([0, 100, 0])
test_octanorm();
translate([0, 1480, 0])
test_tslot_nopscadlib();
translate([0, 1580, 0])
test_tslot_bolts();

// Linear bearing library tests

include <../assets/linear_bearing/scripts/test_lib.scad>

translate([0, 1700, 0])
test_3dp_linear_bearing("nopscadlib", linear_bearings);
translate([0, 1740, 0])
test_3dp_linear_bearing("nopscadlib", long_linear_bearings);

