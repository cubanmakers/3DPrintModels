//include <build.scad>
use <../../../../../assets/extrusions/square/scripts/build.scad>

/* translate = position on plane */
/* perfil_h = size of profiles */

module p35x70_profile_x(length) {
    rotate(90, [0, 1, 0]) perfil_h(40, 70, length, 3);// X axis frame
}

module p35x70_profile_y(length) {
    rotate(-90, [1,0,0]) perfil_h(40, 70, length, 3) ;// Y axis frame
}

module p35x70_profile_z(length) {
    perfil_h(70, 40, length, 3);// Z axis frame
}

module p35x70_arc(size) {
    // Complete the X - Z, frame securing horizontal X axis and vertical Z axis movents
    translate([0, 0, 400]) rotate(90, [0,1,0]) perfil_h(70, 40, 400, 3);// X axis frame top

    translate([-3, 0, 0]) perfil_h(70, 40, 400, 3);// Z axis frame
    translate([333, 0, 0]) perfil_h(70, 40, 400, 3);// Z axis frame
}

module p35x70_base(size) {
    // TODO: Parameterize size according to print volume
    translate([0,0,70]) rotate(-90, [1,0,0]) perfil_h(40, 70, 520, 3) ;// Y axis frame
    translate([360,0,70]) rotate(-90, [1,0,0]) perfil_h(40, 70, 520, 3); // Y axis frame

    translate([3,450,40]) rotate(90, [0, 1, 0]) perfil_h(40, 70, 394, 3);// X axis frame
    translate([3,0,40]) rotate(90, [0, 1, 0]) perfil_h(40, 70, 394, 3);// X axis frame
}

module p35x70_frame(size) {
    vframe_y = 297;

    p35x70_base(size);
    translate([0, vframe_y, 0]) p35x70_arc(size);
}

