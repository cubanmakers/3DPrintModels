// Tests for the library of octanorm Al extrusions
//
// Based on https://grabcad.com/library/
//
// Copyright (c) 2020 Cuban.Tech

include <NopSCADlib/lib.scad>
include <build.scad>
include <octanorm.scad>

module test_octanorm() {
    // TODO: Group by extrusion width
    layout([for (e = octanorm_extrusions) extrusion_height(e)], 40)
    upright(octanorm_extrusions[$i], 80);
}

