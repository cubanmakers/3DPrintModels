//include <build.scad>
use <../../../../../assets/extrusions/square/scripts/build.scad>

/* translate = position on plane */
/* perfil_h = size of profiles */

module p35x70_frame(printvol) {
    // TODO: Parameterize size according to print volume
    rotate ([0,0,0]) translate ([0,0,0]) perfil_h(40, 70, 520, 3) ;// Y axis frame
    rotate ([0,0,0]) translate ([360,0,0]) perfil_h(40, 70, 520, 3); // Y axis frame

    rotate ([-90,0,-90]) translate ([-43,-520,3]) perfil_h(40, 70, 394, 3);// X axis frame
    rotate ([-90,0,-90]) translate ([-43,-70,3]) perfil_h(40, 70, 394, 3);// X axis frame

    // Complete the X - Z, frame securing horizontal X axis and vertical Z axis movents
    rotate ([90,90,90]) translate ([-300,333,0]) perfil_h(40, 70, 400, 3);// X axis frame top

    rotate ([0,90,90]) translate ([-297,-403,3]) perfil_h(40, 70, 400, 3);// Z axis frame
    rotate ([0,90,90]) translate ([-297,-67,3]) perfil_h(40, 70, 400, 3);// Z axis frame
}

