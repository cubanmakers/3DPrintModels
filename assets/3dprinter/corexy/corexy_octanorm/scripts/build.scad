// Parametric design of DIY CoreXY printer using octanorm Al extrusions
//
// Original idea of Alejandro Rodriguez
//
// Copyright (c) 2020 Cuban.Tech

include <NopSCADlib/lib.scad>

// Part to render. One of printer, extrusion_x, extrusion_y, extrusion_z, base, arc, frame)
part = "printer";
// Dimension of print volume along X axis (in mm)
printvol_x = 200;
// Dimension of print volume along Y axis (in mm)
printvol_y = 200;
// Dimension of print volume along Z axis (in mm)
printvol_z = 230;
// Profile type, in case mulitiple options available for frame
profile_type = "E2020";
// Use sidebar
use_sidebar = true;

function inch_to_mm(l) = 25.4 * l;
function radius() = inch_to_mm(1);

function printer_size(printvol) = [450 + inch_to_mm(4), 450 + inch_to_mm(4), 500];

module imperial_to_metric(ratio=1) {
  scale(inch_to_mm(ratio)) children();
}

module import_octanorm_stl(name) {
    path = str("../../../../../assets/extrusions/octanorm/files/stl/", name);
    echo("Importing ", path);
    import(path);
}

module octanorm_profile(length) {
    color("grey")
    resize([0, 0, length])
    rotate(90, [1, 0, 0])
    imperial_to_metric(0.5)
    import_octanorm_stl("Octagonal profile.stl");
}

module octanorm_sidebar_extrusion() {
    union() {
        import_octanorm_stl("Side bar profile.stl");
        rotate(180, [0, 1, 0])
        import_octanorm_stl("Side bar profile.stl");
    }
}

module octanorm_sidebar_hole() {
    translate([7, 0, 0])
    resize([10, 0, 0])
    translate([-8.5, 0, 0])
    difference() {
        translate([9, 52, 0])
        cube([1, 100, 20], center=true);
        imperial_to_metric(0.5)
        import_octanorm_stl("Side bar profile.stl");
    }
}

module octanorm_sidebar_profile(length) {
        difference() {
            resize([0, length, 0], 0)
            imperial_to_metric(0.5)
            import_octanorm_stl("Side bar extrusion.stl");
            octanorm_sidebar_hole();
            translate([0, length, 0])
            rotate(180, [1, 0, 0])
            octanorm_sidebar_hole();
            }
}

module octanorm_sidebar_connector() {
    imperial_to_metric(0.5)
    translate([-0.545, 2.85, 0])
    rotate(-90, [0,0,1])
    import_octanorm_stl("Side bar connector.stl");
}

module octanorm_sidebar(length) {
    color("grey")
    union() {
        octanorm_sidebar_profile(length);
        octanorm_sidebar_connector();
        translate([0, length, 0])
        rotate(180, [1, 0, 0])
        octanorm_sidebar_connector();
    }
}

module rotate_axis(reference, destination) {
    axis = cross(reference, destination);
    angle = atan2(norm(axis), reference * destination);
    echo("Rotation angle", angle);
    rotate(angle, axis) children();
}

// Connects two (vertical) octanorm profiles via a sidebar given reference to profile symmetry axis
module octanorm_connect(v1, v2) {
    dir = v2 - v1;
    translate(v1)
    rotate_axis([0, 1, 0], v2 - v1)
    translate([0, radius(), 0])
    children();
}

module octanorm_connect_sidebar(v1, v2) {
    dir = v2 - v1;
    length = norm(dir) - 2 * radius();
    octanorm_connect(v1 - [0, 0, 40], v2 - [0, 0, 40])
    octanorm_sidebar(length);
}

module octanorm_connect_profile(v1, v2) {
    dir = v2 - v1;
    length = norm(dir) - 2 * radius();
    octanorm_connect(v1 - [0, 0, 40], v2 - [0, 0, 40])
    rotate(-90, [1, 0, 0])
    octanorm_profile(length);
}

module corexy_octanorm_frame(size, use_sidebar=true) {
    profile_l1 = [radius(), radius(), size[2]];
    profile_l2 = [radius(), size[1] - radius(), size[2]];
    profile_r1 = [size[0] - radius(), radius(), size[2]];
    profile_r2 = [size[0] - radius(), size[1] - radius(), size[2]];
    union() {
        translate([radius(), radius(), 0])
        octanorm_profile(size[2]);
        translate([size[0] - radius(), radius(), 0])
        octanorm_profile(size[2]);
        translate([radius(), size[1] - radius(), 0])
        octanorm_profile(size[2]);
        translate([size[0] - radius(), size[1] - radius(), 0])
        octanorm_profile(size[2]);
        if (use_sidebar) {
            octanorm_connect_sidebar(profile_l1, profile_l2);
            octanorm_connect_sidebar(profile_r2, profile_l2);
            octanorm_connect_sidebar(profile_r1, profile_r2);
            octanorm_connect_sidebar(profile_r1, profile_l1);
        } else {
            octanorm_connect_profile(profile_l1, profile_l2);
            octanorm_connect_profile(profile_r2, profile_l2);
            octanorm_connect_profile(profile_r1, profile_r2);
            octanorm_connect_profile(profile_r1, profile_l1);
        }
    }
}

module corexy_octanorm(printvol, use_sidebar=true) {
    size = printer_size(printvol);
    corexy_octanorm_frame(size, use_sidebar);
}

module corexy_octanorm_main() {
    printvol = [printvol_x, printvol_y, printvol_z];
    size = printer_size(printvol, frame);
    if (part == "printer") { corexy_octanorm(size, use_sidebar); }
    else if (part == "extrusion_x") { corexy_octanorm_frame_extrusion_x(size, frame); }
    else if (part == "extrusion_y") { corexy_octanorm_frame_extrusion_y(size, frame); }
    else if (part == "extrusion_z") { corexy_octanorm_frame_extrusion_z(size, frame); }
    else if (part == "arc") { corexy_octanorm_frame_arc(size, frame); }
    else if (part == "base") { corexy_octanorm_frame_base(size, frame); }
    else if (part == "frame") { corexy_octanorm_frame_frame(size, frame); }
}

if ($preview) {
    corexy_octanorm_main();
}
corexy_octanorm_main();
