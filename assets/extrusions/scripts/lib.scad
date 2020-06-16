// Extrusions library
//
// Copyright (c) 2020 Cuban.Tech

include <meta.scad>
include <octanorm.scad>
include <square.scad>
include <tslot_bolts.scad>
include <tslot_nopscadlib.scad>
include <utils.scad>

module upright(extrusion_type, length=undef) {
    default_length = extrusion_type[EXTIDX_LENGTH];
    l = (length == undef)? default_length: length;
    if (l > default_length) echo("Requested", extrusion_type[EXTIDX_SYSTEM], "extrusion length overflows part dimensions");
    dxf_data = upright_dxf_data(extrusion_type);
    color("lightgrey")
    if (dxf_data[0] != undef) {
        extrusion_from_file(extrusion_type[EXTIDX_DXF_PATH], l, extrusion_type[EXTIDX_DXF_LAYER]);
    } else if (extrusion_type[EXTIDX_SYSTEM] == "square") {
        render_square(extrusion_type, l);
    } else if (extrusion_type[EXTIDX_SYSTEM] == "tslot" && extrusion_type[EXTIDX_SET] == "nopscadlib") {
        render_tslot_nopscadlib(extrusion_type, l);
    } else if (extrusion_type[EXTIDX_SYSTEM] == "tslot" && extrusion_type[EXTIDX_SET] == "bolts") {
        render_tslot_bolts(extrusion_type, l);
    }
}

function upright_origin(extrusion)      = [extrusion[EXTIDX_SYSTEM], extrusion[EXTIDX_SET]];
function upright_part(extrusion)        = extrusion[EXTIDX_PART];
function upright_refpart(extrusion)     = extrusion[EXTIDX_REF];
function upright_dxf_data(extrusion)    = [extrusion[EXTIDX_DXF_PATH], extrusion[EXTIDX_DXF_LAYER]];
function upright_hasdxf(extrusion)      = extrusion[EXTIDX_DXF_PATH] != undef;
function upright_width(extrusion)       = extrusion[EXTIDX_WIDTH];
function upright_height(extrusion)      = extrusion[EXTIDX_HEIGHT];
function upright_length(extrusion)      = extrusion[EXTIDX_LENGTH];
function upright_details(extrusion)     = extrusion[EXTIDX_SYSMETA];

all_extrusions = concat(octanorm_extrusions, square_extrusions);

