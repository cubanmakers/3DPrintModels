// T-slot extrusions powered by NopSCADlib
//
// Copyright (c) 2020 Cuban.Tech

include <meta.scad>
include <NopSCADlib/lib.scad>

function nopscadlib_extrusion(e, cornerHole=false) = ["tslot", "nopscadlib", e[0], "", undef, undef, e[1], e[2], 1000, concat(e, [cornerHole])];
function extidx_corner_hole() = len(E1515);
function extrusion_has_corner_hole(e) = e[EXTIDX_SYSMETA][extidx_corner_hole()];

module render_tslot_nopscadlib(e, length) {
    extrusion(e[EXTIDX_SYSMETA], length, cornerHole=extrusion_has_corner_hole(e));
} 

// NopSCADlib extrusion names
T1515  = nopscadlib_extrusion(E1515);
T2020  = nopscadlib_extrusion(E2020);
T2040  = nopscadlib_extrusion(E2040);
T2060  = nopscadlib_extrusion(E2060);
T2080  = nopscadlib_extrusion(E2080);
T3030  = nopscadlib_extrusion(E3030);
T3060  = nopscadlib_extrusion(E3060);
T4040  = nopscadlib_extrusion(E4040);
T4080  = nopscadlib_extrusion(E4080);
TH3030  = nopscadlib_extrusion(E3030, true);
TH3060  = nopscadlib_extrusion(E3060, true);
TH4040  = nopscadlib_extrusion(E4040, true);
TH4080  = nopscadlib_extrusion(E4080, true);

tslot_nopscadlib_extrusions = concat(
    [for(e = extrusions) nopscadlib_extrusion(e)],
    [for(e = extrusions) if (extrusion_width(e) > 20) nopscadlib_extrusion(e, true)]
    );

