
//----------------------------
// Render MINEBEA stepper motors
//
// Copyright (c) 2020 Cuban.Tech
//----------------------------

include <3DPrintModels/assets/motors/scripts/eminebea.scad>

$fn = 80;

module main() {
    eminebea_stepper(MINEBEA_PM42L_048, fp="FPH", shaft_length=7.5);
}

main();

