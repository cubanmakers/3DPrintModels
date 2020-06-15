// T-slot extrusions powered by NopSCADlib
//
// Copyright (c) 2020 Cuban.Tech

include <meta.scad>
include <NopSCADlib/lib.scad>

function extrusion_metd_from_nopscadlib(e) = ["tslot", "nopscadlib", e[0], "", undef, undef, e[1], e[2], 1000, e];

module render_tslot_nopscad(e, length) {
    extrusion(e[EXTIDX_SYSMETA], length);
} 

