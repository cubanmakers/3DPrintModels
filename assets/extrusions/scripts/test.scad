// Tests for the library of octanorm Al extrusions
//
// Based on https://grabcad.com/library/
//
// Copyright (c) 2020 Cuban.Tech

include <test_square.scad>
include <test_octanorm.scad>

test_p40x70();
translate([0, 100, 0])
test_octanorm();
