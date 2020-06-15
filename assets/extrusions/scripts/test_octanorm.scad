// Tests for the library of octanorm Al extrusions
//
// Based on https://grabcad.com/library/
//
// Copyright (c) 2020 Cuban.Tech

include <NopSCADlib/lib.scad>
include <lib.scad>
include <octanorm.scad>

module layout_extrusions(extrusions, y) {
    echo("Extrusion parts included in test", [for (e = extrusions) e[EXTIDX_PART]]);
    translate([0, y, 0])
    layout([for (e = extrusions) upright_height(e)], 40)
    upright(extrusions[$i], 20 * $i + 40);
}

module test_octanorm() {
    // TODO: Group by extrusion width
    classic20_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "classic20") e];
    classic25_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "classic25") e];
    classic28_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "classic28") e];
    classic32_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "classic32") e];
    classic35_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "classic35") e];
    classic37_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "classic37") e];
    classic40_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "classic40") e];
    classic50_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "classic50") e];
    classic70_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "classic70") e];
    classic80_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "classic80") e];
    maxima40_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "maxima40") e];
    maxima60_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "maxima60") e];
    maxima80_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "maxima80") e];
    maxima120_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "maxima120") e];
    maxima160_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "maxima160") e];
    classic_hinged_extrusions = [for (e = octanorm_extrusions) if (e[EXTIDX_SET] == "classic_hinged") e];
    union() {
        layout_extrusions(classic20_extrusions, 0);
        layout_extrusions(classic25_extrusions, 90);
        layout_extrusions(classic28_extrusions, 180);
        layout_extrusions(classic32_extrusions, 250);
        layout_extrusions(classic35_extrusions, 320);
        layout_extrusions(classic37_extrusions, 400);
        layout_extrusions(classic40_extrusions, 480);
        layout_extrusions(classic50_extrusions, 560);
        layout_extrusions(classic70_extrusions, 640);
        layout_extrusions(classic80_extrusions, 720);
        layout_extrusions(maxima40_extrusions, 800);
        layout_extrusions(maxima60_extrusions, 880);
        layout_extrusions(maxima80_extrusions, 960);
        layout_extrusions(maxima120_extrusions, 1060);
        layout_extrusions(maxima160_extrusions, 1180);
        layout_extrusions(classic_hinged_extrusions, 1280);
    }
}

