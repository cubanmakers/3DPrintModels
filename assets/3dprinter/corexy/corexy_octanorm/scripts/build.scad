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

module clone_at(positions) {
    for (pos = positions) translate(pos) children();
}

// Connects two (vertical) octanorm profiles via a sidebar given reference to profile symmetry axis
module octanorm_connect(v1, v2) {
    dir = v2 - v1;
    translate(v1)
    rotate_axis([0, 1, 0], v2 - v1)
    translate([0, radius(), 0])
    children();
}

function octanorm_sidebar_height() = inch_to_mm(2.5);
function octanorm_sidebar_width() = inch_to_mm(1.6);

module octanorm_connect_sidebar(v1, v2) {
    dir = v2 - v1;
    length = norm(dir) - 2 * radius();
    octanorm_connect(v1 - [0, 0, octanorm_sidebar_height() / 2], v2 - [0, 0, octanorm_sidebar_height() / 2])
    octanorm_sidebar(length);
}

module octanorm_connect_profile(v1, v2) {
    dir = v2 - v1;
    length = norm(dir) - 2 * radius();
    octanorm_connect(v1 - [0, 0, radius()], v2 - [0, 0, radius()])
    rotate(-90, [1, 0, 0])
    octanorm_profile(length);
}

module corexy_octanorm_frame(size, profile_positions, use_sidebar=true) {
    union() {
        clone_at(profile_positions)
        octanorm_profile(size[2]);
        clone_at([[0, 0, octanorm_sidebar_height()], [0, 0, size[2]]])
        if (use_sidebar) {
            octanorm_connect_sidebar(profile_positions[0], profile_positions[1]);
            octanorm_connect_sidebar(profile_positions[1], profile_positions[3]);
            octanorm_connect_sidebar(profile_positions[2], profile_positions[3]);
            octanorm_connect_sidebar(profile_positions[2], profile_positions[0]);
        } else {
            octanorm_connect_profile(profile_positions[0], profile_positions[1]);
            octanorm_connect_profile(profile_positions[1], profile_positions[3]);
            octanorm_connect_profile(profile_positions[2], profile_positions[3]);
            octanorm_connect_profile(profile_positions[2], profile_positions[0]);
        }
    }
}

SQRT_2 = 1.4142135623730951;

module motor_with_pulley(motor_type, pulley_type) {
    union() {
        NEMA(motor_type);
        translate([0, 0, NEMA_shaft_length(NEMA17S) - pulley_hub_length(GT2x12_pulley)])
        pulley_assembly(pulley_type);
    }
}

module corexy_octanorm_belt_system(size, profile_positions) {
    // TODO: Parameterize or compute based on geometry
    motor_pos_offset = inch_to_mm(4);
    motor_frame_spacing = 10;
    motor_type = NEMA17S;
    pulley_type = GT2x12_pulley;

    offset_x = octanorm_sidebar_width() / 2 + motor_frame_spacing + pulley_extent(GT2x12_pulley);
    offset_z = size[2];
    motor_positions = [profile_positions[0] + [offset_x, radius() + motor_pos_offset, offset_z], profile_positions[1] + [offset_x, - radius() - motor_pos_offset, offset_z]];
//    idler_positions = [[pulley_positions[0][0], ] ]
    union() {
        clone_at(motor_positions)
        rotate(180, [0, 1, 0])
        motor_with_pulley(motor_type, pulley_type);
    }
}

module corexy_octanorm(printvol, use_sidebar=true, motor_pos_offset=10) {
    size = printer_size(printvol);
    profile_positions = [
        [radius(), radius(), 0],
        [radius(), size[1] - radius(), 0],
        [size[0] - radius(), radius(), 0],
        [size[0] - radius(), size[1] - radius(), 0]
    ];
    corexy_octanorm_frame(size, profile_positions, use_sidebar);
    corexy_octanorm_belt_system(size, profile_positions);
}

module corexy_octanorm_main() {
    printvol = [printvol_x, printvol_y, printvol_z];
    size = printer_size(printvol, frame);
    if (part == "printer") { corexy_octanorm(printvol, use_sidebar); }
    else if (part == "extrusion_x") { corexy_octanorm_frame_extrusion_x(size, frame); }
    else if (part == "extrusion_y") { corexy_octanorm_frame_extrusion_y(size, frame); }
    else if (part == "extrusion_z") { corexy_octanorm_frame_extrusion_z(size, frame); }
    else if (part == "arc") { corexy_octanorm_frame_arc(size, frame); }
    else if (part == "base") { corexy_octanorm_frame_base(size, frame); }
    else if (part == "frame") { corexy_octanorm_frame(size, frame); }
}

if ($preview) {
    corexy_octanorm_main();
}
