// Extrusions library
//
// Copyright (c) 2020 Cuban.Tech

include <utils.scad>
include <octanorm.scad>

// Library of extrusion uprights and connectors
// Models generated out of vector metadata structured as follows
//
// [0] = extrusion system (e.g. octanorm, vslot, ...)
EXTIDX_SYSTEM = 0;
// [1] = model set (empty for official design files)
EXTIDX_SET = 1;
// [2] = part name
EXTIDX_PART = 2;
// [3] = reference part name for extrusion section, in case of alternate configurations
EXTIDX_REF = 3;
// [4] = path to DXF file for extrusion section, or empty if a module renders the whole extrusion instead
EXTIDX_DXF_PATH = 4;
// [5] = layer name in DXF file for extrusion section, or empty if all layers render the whole extrusion instead
EXTIDX_DXF_LAYER = 5;
// [5] = width of the bounding box of the extrusion section
EXTIDX_WIDTH = 6;
// [6] = height of the bounding box of the extrusion section
EXTIDX_HEIGHT = 7;
// [7] = (default) part length
EXTIDX_LENGTH = 8;
// [8] = system specific metadata
EXTIDX_SYSMETA = 9;

module upright(extrusion_type, length=undef) {
    default_length = extrusion_type[EXTIDX_LENGTH];
    l = (length == undef)? default_length: length;
    if (l > default_length) echo("Requested", extrusion_type[EXTIDX_SYSTEM], "extrusion length overflows part dimensions");
    extrusion_from_file(extrusion_type[EXTIDX_DXF_PATH], l, extrusion_type[EXTIDX_DXF_LAYER]);
}

// [0] = extrusion system (e.g. octanorm, vslot, ...)
EXTIDX_SYSTEM = 0;
// [1] = model set (empty for official design files)
EXTIDX_SET = 1;
// [2] = part name
EXTIDX_PART = 2;
// [3] = reference part name for extrusion section, in case of alternate configurations
EXTIDX_REF = 3;
function extrusion_origin(extrusion)      = [extrusion[EXTIDX_SYSTEM], extrusion[EXTIDX_SET]];
function extrusion_part(extrusion)        = extrusion[EXTIDX_PART];
function extrusion_refpart(extrusion)     = extrusion[EXTIDX_REF];
function extrusion_dxf_data(extrusion)    = [extrusion[EXTIDX_DXF_PATH], extrusion[EXTIDX_DXF_LAYER]];
function extrusion_hasdxf(extrusion)      = extrusion[EXTIDX_DXF_PATH] != undef;
function extrusion_width(extrusion)       = extrusion[EXTIDX_WIDTH];
function extrusion_height(extrusion)      = extrusion[EXTIDX_HEIGHT];
function extrusion_length(extrusion)      = extrusion[EXTIDX_LENGTH];
function extrusion_details(extrusion)     = extrusion[EXTIDX_SYSMETA];

