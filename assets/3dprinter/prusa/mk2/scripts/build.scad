// Parametric design of DIY Prusa 3D printer alternatives
//
// Copyright (c) 2020 Cuban.Tech

include <anet_a8_144.scad>

module prusa(printvol=[200,200,200], frametype="ANET_A8") {
    union() {
        prusa_frame(printvol, frametype);
        prusa_axis_x();
        prusa_axis_y();
        prusa_axis_z();
    }
}

module prusa_frame(printvol, frametype) {
    if (frametype == "ANET_A8") {
        // TODO: Correlation between printvol and printer size
        anet_a8_frame(printvol, E2040);
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
    //corner_bracket_for_extrusion(E2040);
}
