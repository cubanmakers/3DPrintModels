// Tests for the library of square Al extrusions
//
// Copyright (c) 2020 Cuban.Tech

use <NopSCADlib/utils/layout.scad>
include <build.scad>
include <tslot.scad>

module test_tslot_nopscadlib() {
    layout([for(e = tslot_extrusions) extrusion_width(e)], 10)
    upright(tslot_extrusions[$i], 20 * $i + 40);
}

