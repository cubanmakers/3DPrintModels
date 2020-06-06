module perfil_h(dimx, dimy, length, width) {
    difference() {
        cube([dimx, dimy, length], center=false);
        translate([width, width, -1])
        cube([dimx - 2 * width, dimy - 2 * width, length+2], center = false, width);
        }
};

if ($preview) {
  perfil_h(40, 70, 520, 3);
}
