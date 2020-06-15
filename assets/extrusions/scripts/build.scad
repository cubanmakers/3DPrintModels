// Extrusions library
//
// Copyright (c) 2020 Cuban.Tech

include <meta.scad>
include <utils.scad>
include <octanorm.scad>
include <square.scad>

module upright(extrusion_type, length=undef) {
    default_length = extrusion_type[EXTIDX_LENGTH];
    l = (length == undef)? default_length: length;
    if (l > default_length) echo("Requested", extrusion_type[EXTIDX_SYSTEM], "extrusion length overflows part dimensions");
    dxf_data = extrusion_dxf_data(extrusion_type);
    color("lightgrey")
    if (dxf_data[0] != undef) {
        extrusion_from_file(extrusion_type[EXTIDX_DXF_PATH], l, extrusion_type[EXTIDX_DXF_LAYER]);
    } else if (extrusion_type[0] == "square") {
        render_square(extrusion_type, l);
    }
}

function extrusion_origin(extrusion)      = [extrusion[EXTIDX_SYSTEM], extrusion[EXTIDX_SET]];
function extrusion_part(extrusion)        = extrusion[EXTIDX_PART];
function extrusion_refpart(extrusion)     = extrusion[EXTIDX_REF];
function extrusion_dxf_data(extrusion)    = [extrusion[EXTIDX_DXF_PATH], extrusion[EXTIDX_DXF_LAYER]];
function extrusion_hasdxf(extrusion)      = extrusion[EXTIDX_DXF_PATH] != undef;
function extrusion_width(extrusion)       = extrusion[EXTIDX_WIDTH];
function extrusion_height(extrusion)      = extrusion[EXTIDX_HEIGHT];
function extrusion_length(extrusion)      = extrusion[EXTIDX_LENGTH];
function extrusion_details(extrusion)     = extrusion[EXTIDX_SYSMETA];

all_extrusions = concat(octanorm_extrusions, square_extrusions);

