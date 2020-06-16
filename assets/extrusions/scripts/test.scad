// Tests for the library of square Al extrusions
//
// Copyright (c) 2020 Cuban.Tech

include <test_octanorm.scad>
include <test_square.scad>
include <test_tslot.scad>

test_p40x70();
translate([0, 100, 0])
test_octanorm();
translate([0, 1480, 0])
test_tslot_nopscadlib();
translate([0, 1580, 0])
test_tslot_bolts();
