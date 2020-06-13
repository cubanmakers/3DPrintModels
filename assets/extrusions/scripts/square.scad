// Library of square Al extrusions
//
// Copyright (c) 2020 Cuban.Tech

module perfil_h(dimx, dimy, length, width) {
    color("gray")
    difference() {
        cube([dimx, dimy, length], center=false);
        translate([width, width, -1])
        cube([dimx - 2 * width, dimy - 2 * width, length+2], center = false, width);
        }
};
