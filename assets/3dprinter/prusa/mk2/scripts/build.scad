// Parametric design of Prusa printers and alternatives
//
// Copyright (c) 2020 Cuban.Tech

include <NopSCADlib/lib.scad>

module prusa() {
    union() {
        prusa_frame();
        prusa_axis_x();
        prusa_axis_y();
        prusa_axis_z();
    }
}

// Reusable modules

module prusa_frame_x() {
    rotate(90, [0, 1, 0])
    translate([0,0,156.5])
    extrusion(E2040, 313, cornerHole=true);
}

module prusa_frame_y() {
    rotate(90, [0, 1, 0])
    rotate(90, [-1, 0, 0])
    translate([0,0,220])
    extrusion(E2040, 440, cornerHole=true);
}

module prusa_frame_z() {
    rotate(90, [0,0,1])
    translate([0,0,170])
    extrusion(E2040, 340, cornerHole=true);
}

// Modules for printer parts

module prusa_base() {
    translate([20, 0, 10])
    union() {
        prusa_frame_y();
        translate([350, 0, 0])
        prusa_frame_y();
        translate([20, 20, 0])
        prusa_frame_x();
        translate([20, 420, 0])
        prusa_frame_x();
        translate([20, 40, 0])
        extrusion_corner_bracket(E20_corner_bracket);
        translate([330, 40, 0])
        rotate(90, [0,0,1])
        extrusion_corner_bracket(E20_corner_bracket);
        translate([20, 400, 0])
        rotate(-90, [0,0,1])
        extrusion_corner_bracket(E20_corner_bracket);
        translate([330, 400, 0])
        rotate(180, [0,0,1])
        extrusion_corner_bracket(E20_corner_bracket);
    }
}

module prusa_vert() {
    translate([20, 10, 0])
    union() {
        prusa_frame_z();
        translate([350, 0, 0])
        prusa_frame_z(); 
        translate([20, 0, 320])
        rotate(90, [1, 0, 0])
        prusa_frame_x();
        translate([20, 0, 300])
        rotate(-90, [1,0,0])
        extrusion_corner_bracket(E20_corner_bracket);
        translate([330, 0, 300])
        rotate(90, [0,1,0])
        rotate(-90, [1,0,0])
        extrusion_corner_bracket(E20_corner_bracket);
    }
}

module prusa_frame() {
    union() {
        prusa_base();
        translate([0, 260, 20])
        prusa_vert();
    }
}

module prusa_axis_x() {
    
}

module prusa_axis_y() {
    
}

module prusa_axis_z() {
    
}

if ($preview) {
    prusa();
}
