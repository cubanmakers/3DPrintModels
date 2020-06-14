// Library of octanorm Al extrusions
//
// Based on https://grabcad.com/library/modular-aluminium-octogonal-profile-system-1
//
// Copyright (c) 2020 Cuban.Tech

module import_octanorm_stl(name) {
    path = str("../files/stl/", name);
    echo("Importing ", path);
    import(path);
}

// TODO: Move to a separate units system library
module imperial_to_metric(ratio=1) {
  scale(inch_to_mm(ratio)) children();
}

function inch_to_mm(l) = 25.4 * l;

function octanorm_extrusion_width() = inch_to_mm(1);
