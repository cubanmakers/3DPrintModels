// Octanorm extrusions library based on official CAD files
//
// Copyright (c) 2020 Cuban.Tech

include <NopSCADlib/lib.scad>
include <extrusion.scad>

module octanorm_extrusion(extrusion, length=undef) {
    l = (length == undef)? extrusion[4]: length;
    if (l > length) echo("Requested octanorm extrusion length overflows part dimensions");
    color("grey")
    linear_extrude(l)
    import(str("../files/cad/", extrusion[1], ".dxf"), layer = "Profil");
}

function octanorm_extrusion_width(extrusion) = extrusion[2];
function octanorm_extrusion_height(extrusion) = extrusion[3];
function octanorm_extrusion_length(extrusion) = extrusion[4];

if ($preview) {
    layout([for (e = octanorm_extrusions) octanorm_extrusion_height(e)], 10)
        octanorm_extrusion(octanorm_extrusions[$i], 80);
}
