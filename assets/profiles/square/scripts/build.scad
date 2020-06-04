module perfil_h(dimx, dimy, length, width) {
    difference() {
        cube([dimx, dimy, length], center=false);
        translate([width, width, 0])
        cube([dimx - 2 * width, dimy - 2 * width, length], center = width, width);
        }
};
perfil_h(40, 70, 520, 3);