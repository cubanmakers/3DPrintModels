// Parametric design of DIY Prusa 3D printer alternatives
//
// Copyright (c) 2020 Cuban.Tech

include <anet_a8_144.scad>
include <p35x70.scad>

// 3D printer frame type
frame = "ANET_A8";

module prusa(printvol=[200,200,200], frametype=frame) {
    union() {
        prusa_frame(printvol, frametype);
        prusa_axis_x();
        prusa_axis_y();
        prusa_axis_z();
    }
}

module prusa_frame(printvol, frametype) {
    if (frametype == "ANET_A8") {
        anet_a8_frame(printvol, E2040);
    } else if (frametype == "P35X70") {
        p35x70_frame(printvol);
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
