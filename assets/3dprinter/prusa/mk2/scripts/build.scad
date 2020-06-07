// Parametric design of DIY Prusa 3D printer alternatives
//
// Copyright (c) 2020 Cuban.Tech

include <NopSCADlib/lib.scad>
include <anet_a8_144.scad>
include <p35x70.scad>

// Part to render. One of printer, extrusion_x, extrusion_y, extrusion_z, base, arc, frame)
part = "printer";
// 3D printer frame type. One of ANET_A8, P35X70
frame = "ANET_A8";
// Dimension of print volume along X axis (in mm)
printvol_x = 200;
// Dimension of print volume along Y axis (in mm)
printvol_y = 200;
// Dimension of print volume along Z axis (in mm)
printvol_z = 200;
// Profile type, in case mulitiple options available for frame
profile_type = "E2040";

// TODO: Compute size and vframe position out of printvol
// Return fixed values for ANET A8 200x200x200 printing volume
function printer_size(printvol, frametype) = (frametype == "ANET_A8")? [393, 440, 360]:
                                             (frametype == "P35X70")?  [400, 520, 400]:
                                             [200, 200, 200];

module prusa(printvol=[200,200,200], frametype=frame, profile_name="") {
    size = printer_size(printvol, frametype);
    union() {
        prusa_frame(size, frametype, profile_name);
        prusa_axis_x();
        prusa_axis_y();
        prusa_axis_z();
    }
}

module prusa_frame(printvol, frametype, profile_name="") {
    if (frametype == "ANET_A8") {
        anet_a8_frame(printvol, extrusion_by_name(profile_name));
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

function extrusion_by_name(profile_name) = [for (e = extrusions) if (e[0] == profile_name) e][0];

module prusa_extrusion_x(printer_size) {
    if (frame == "ANET_A8") {
        extrusion_type = extrusion_by_name(profile_type);
        profile_length = anet_a8_profile_lengths(printer_size, extrusion_type);
        echo("Size", size, "profile length", profile_length);
        anet_a8_profile_x(profile_length[0], extrusion_type);
    }
    else if (frame == "P35X70") { p35x70_profile_x(printer_size[0]); }
}

module prusa_extrusion_y(printer_size) {
    if (frame == "ANET_A8") {
        extrusion_type = extrusion_by_name(profile_type);
        profile_length = anet_a8_profile_lengths(printer_size, extrusion_type);
        anet_a8_profile_y(profile_length[1], extrusion_type);
    }
    else if (frame == "P35X70") { p35x70_profile_y(printer_size[1]); }
}

module prusa_extrusion_z(printer_size, frame_type) {
    if (frame == "ANET_A8") {
        extrusion_type = extrusion_by_name(profile_type);
        profile_length = anet_a8_profile_lengths(printer_size, extrusion_type);
        anet_a8_profile_z(profile_length[2], extrusion_type);
    }
    else if (frame == "P35X70") { p35x70_profile_z(printer_size[2]); }
}

module prusa_extrusion_z(printer_size, frame_type) {
    if (frame == "ANET_A8") {
        extrusion_type = extrusion_by_name(profile_type);
        anet_a8_arc(size, extrusion_type);
    }
    else if (frame == "P35X70") { p35x70_arc(printer_size); }
}

module prusa_arc(size, frame_type) {
    if (frame_type == "ANET_A8") { anet_a8_arc(size, extrusion_by_name(profile_type)); }
    else if (frame == "P35X70") { p35x70_arc(size); }
}

module prusa_main() {
    printvol = [printvol_x, printvol_y, printvol_z];
    size = printer_size(printvol, frame);
    if (part == "printer") { prusa(size, frame, profile_type); }
    else if (part == "extrusion_x") { prusa_extrusion_x(size, frame); }
    else if (part == "extrusion_y") { prusa_extrusion_y(size, frame); }
    else if (part == "extrusion_z") { prusa_extrusion_z(size, frame); }
    else if (part == "arc") { prusa_arc(size, extrusion_by_name(profile_type)); }
}

if ($preview) {
    prusa_main();
}
