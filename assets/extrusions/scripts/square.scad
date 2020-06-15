// Library of square Al extrusions
//
// Copyright (c) 2020 Cuban.Tech

include <meta.scad>

module perfil_h(dimx, dimy, length, width) {
    color("gray")
    difference() {
        cube([dimx, dimy, length], center=false);
        translate([width, width, -1])
        cube([dimx - 2 * width, dimy - 2 * width, length+2], center = false, width);
        }
};

module render_square(extrusion, length) {
    perfil_h(extrusion[EXTIDX_WIDTH], extrusion[EXTIDX_HEIGHT], length, extrusion[EXTIDX_SYSMETA][0]);
}

P40X70 = ["square", "", "P40X70", "", undef, undef, 70, 40, 1000, [3]];

square_extrusions = [P40X70];

