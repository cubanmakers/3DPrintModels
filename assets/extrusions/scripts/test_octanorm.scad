// Tests for the library of octanorm Al extrusions
//
// Based on https://grabcad.com/library/
//
// Copyright (c) 2020 Cuban.Tech

include <NopSCADlib/lib.scad>
include <build.scad>
include <octanorm.scad>

module layout_extrusions(extrusions, y) {
    translate([0, y, 0])
    layout([for (e = extrusions) extrusion_height(e)], 40)
    upright(extrusions[$i], 20 * $i + 40);
}

module test_octanorm() {
    // TODO: Group by extrusion width
    classic20_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "classic20") e];
    classic28_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "classic28") e];
    classic32_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "classic32") e];
    classic35_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "classic35") e];
    classic40_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "classic40") e];
    classic80_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "classic80") e];
    maxima40_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "maxima40") e];
    maxima60_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "maxima60") e];
    maxima80_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "maxima80") e];
    maxima120_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "maxima120") e];
    union() {
    layout_extrusions(classic20_extrusions, 0);
    layout_extrusions(classic28_extrusions, 90);
    layout_extrusions(classic32_extrusions, 160);
    layout_extrusions(classic35_extrusions, 240);
    layout_extrusions(classic40_extrusions, 320);
    layout_extrusions(classic80_extrusions, 400);
    layout_extrusions(maxima40_extrusions, 480);
    layout_extrusions(maxima60_extrusions, 560);
    layout_extrusions(maxima80_extrusions, 640);
    layout_extrusions(maxima120_extrusions, 760);
    }
}

