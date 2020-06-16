// Tests for the library of square Al extrusions
//
// Copyright (c) 2020 Cuban.Tech

use <NopSCADlib/utils/layout.scad>
include <lib.scad>
include <tslot_bolts.scad>
include <tslot_nopscadlib.scad>

module test_tslot_nopscadlib() {
    layout([for(e = tslot_nopscadlib_extrusions) upright_width(e)], 10)
    upright(tslot_nopscadlib_extrusions[$i], 20 * $i + 40);
}

module test_tslot_bolts() {
    layout([for(e = tslot_bolts_extrusions) upright_width(e)], 10)
    upright(tslot_bolts_extrusions[$i], 20 * $i + 40);
}

