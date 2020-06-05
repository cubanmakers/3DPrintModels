// Parametric design of DIY Prusa 3D printer alternatives
//
// Copyright (c) 2020 Cuban.Tech

include <NopSCADlib/lib.scad>

// Reusable modules

module anet_a8_profile_x(length, profiletype) {
    rotate(90, [0, 1, 0])
    translate([0,0,length / 2])
    extrusion(profiletype, length, cornerHole=false);
}

module anet_a8_profile_y(length, profiletype) {
    rotate(90, [0, 1, 0])
    rotate(90, [-1, 0, 0])
    translate([0,0,length / 2])
    extrusion(profiletype, length, cornerHole=false);
}

module anet_a8_profile_z(length, profiletype) {
    rotate(90, [0,0,1])
    translate([0,0,length / 2])
    extrusion(profiletype, length, cornerHole=false);
}

// Modules for printer parts

function profile_lengths(size, profiletype) = [size[0] - 2 * extrusion_height(profiletype), size[1], size[2] - extrusion_width(profiletype)];

module anet_a8_base(size, profiletype) {
    profile_length = profile_lengths(size, profiletype);
    ext_h = extrusion_height(profiletype);
    ext_w = extrusion_width(profiletype);
    echo("Profile lengths", profile_length[0], profile_length[1], profile_length[2]);
    translate([ext_h / 2, 0, ext_w / 2])
    union() {
        anet_a8_profile_y(profile_length[1], profiletype);
        translate([profile_length[0] + ext_h, 0, 0])
        anet_a8_profile_y(profile_length[1], profiletype);
        translate([ext_h / 2, 20, 0])
        anet_a8_profile_x(profile_length[0], profiletype);
        translate([ext_h / 2, profile_length[1] - ext_h / 2, 0])
        anet_a8_profile_x(profile_length[0], profiletype);
        translate([ext_h / 2, ext_h, 0])
        corner_bracket_for_extrusion(profiletype);
        translate([profile_length[0] + ext_h / 2, ext_h, 0])
        rotate(90, [0,0,1])
        corner_bracket_for_extrusion(profiletype);
        translate([ext_h / 2, profile_length[1] - ext_h, 0])
        rotate(-90, [0,0,1])
        corner_bracket_for_extrusion(profiletype);
        translate([profile_length[0] + ext_h / 2, profile_length[1] - ext_h, 0])
        rotate(180, [0,0,1])
        corner_bracket_for_extrusion(profiletype);
    }
}

module anet_a8_vframe(size, profiletype) {
    profile_length = profile_lengths(size, profiletype);
    ext_h = extrusion_height(profiletype);
    ext_w = extrusion_width(profiletype);
    hprofile_z = ext_w + profile_length[2] - ext_h;
    cb_z = hprofile_z - ext_h / 2;
    translate([ext_h / 2, ext_w / 2, 0])
    union() {
        anet_a8_profile_z(profile_length[2], profiletype);
        translate([profile_length[0] + ext_h, 0, 0])
        anet_a8_profile_z(profile_length[2], profiletype); 
        translate([ext_h / 2, 0, hprofile_z])
        rotate(90, [1, 0, 0])
        anet_a8_profile_x(profile_length[0], profiletype);
        translate([ext_h / 2, 0, cb_z])
        rotate(-90, [1,0,0])
        corner_bracket_for_extrusion(profiletype);
        translate([ext_h + profile_length[0] - ext_h / 2, 0, cb_z])
        rotate(90, [0,1,0])
        rotate(-90, [1,0,0])
        corner_bracket_for_extrusion(profiletype);
    }
}

EB_UNKNOWN = [ "UNKNOWN", [0, 0, 0] ];

function corner_bracket_for(profiletype) = (extrusion_width(profiletype) == 20)? E20_corner_bracket: EB_UNKNOWN;

module corner_bracket_for_extrusion(profiletype) {
    extrusion_corner_bracket(corner_bracket_for(profiletype));
}

module anet_vframe_clamps(profiletype) {
    ext_h = extrusion_height(profiletype);
    ext_w = extrusion_width(profiletype);
    for (pos = [ext_w / 2: ext_w: ext_h]) {
        translate([pos, 0, 0])
        rotate(-90, [0,0,1])
        rotate(90, [1,0,0])
        corner_bracket_for_extrusion(profiletype);
    }
}

module anet_a8_frame(printvol, profiletype=E2040) {
    // TODO: Compute size and vframe position out of printvol
    size = [393 , 440, 360];
    vframe_y = 260;
    profile_length = profile_lengths(size, profiletype);
    ext_h = extrusion_height(profiletype);
    ext_w = extrusion_width(profiletype);
    union() {
        anet_a8_base(size, profiletype);
        translate([0, vframe_y, ext_w])
        anet_a8_vframe(size, profiletype);
        translate([0, vframe_y, ext_w])
        anet_vframe_clamps(profiletype);
        translate([ext_h + profile_length[0], vframe_y, ext_w])
        anet_vframe_clamps(profiletype);
    }
}


