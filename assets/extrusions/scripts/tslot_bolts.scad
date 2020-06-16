// Extrusions library
//
// Copyright (c) 2020 Cuban.Tech

include <BOLTS.scad>
include <meta.scad>

module render_tslot_bolts(extrusion, length) {
    aluProExtrusion(extrusion[EXTIDX_SYSMETA], length, true);
}

function bolts_tslot_extrusion(bolts_profile_type) = ["tslot", "bolts", name, "", undef, undef, bolts_profile_type[3][0] * bolts_profile_type[5], bolts_profile_type[3][0] *  bolts_profile_type[6], 100, bolts_profile_type];

// width = 20
TBR_20x20 = bolts_tslot_extrusion(BR_20x20);
TBR_20x20_1S = bolts_tslot_extrusion(BR_20x20_1S);
TBR_20x20_2S = bolts_tslot_extrusion(BR_20x20_2S);
TBR_20x20_3S = bolts_tslot_extrusion(BR_20x20_3S);
TBR_20x20_2SA = bolts_tslot_extrusion(BR_20x20_2SA);
TBR_20x40 = bolts_tslot_extrusion(BR_20x40);
TBR_20x60 = bolts_tslot_extrusion(BR_20x60);
TBR_20x80 = bolts_tslot_extrusion(BR_20x80);

tslot_bolts_extrusions = [TBR_20x20, TBR_20x20_1S, TBR_20x20_2S, TBR_20x20_3S, TBR_20x20_2SA, TBR_20x40, TBR_20x60, TBR_20x80];
