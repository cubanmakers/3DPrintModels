
//----------------------------
// Micro switches
//
// Copyright (c) 2020 Cuban.Tech
//----------------------------

include <NopSCADlib/utils/core/core.scad>
include <NopSCADlib/vitamins/microswitches.scad>


module microswitch_ex(type) { //! Draw specified microswitch
    vitamin(str("microswitch_ex(", type[0], "): Microswitch ", type[1]));
    d = microswitch_button_t(type);

    color(microswitch_body_clr(type))
        linear_extrude(microswitch_thickness(type), center = true)
            difference() {    // main body
                rounded_square([microswitch_length(type), microswitch_width(type)], microswitch_radius(type));

                microswitch_hole_positions(type)
                    circle(d = microswitch_hole_d(type));
            }

    color(microswitch_button_clr(type))                          // orange button
        translate(microswitch_button_pos(type) - [0, d / 2])
            linear_extrude(microswitch_button_w(type), center = true)
                hull() {
                    circle(d = d);

                    translate([0, -3])
                        circle(d = d);
                }

    color(microswitch_contact_colour)                            // yellow contacts
        for(pos = microswitch_legs(type))
            translate(pos) {
                leg = microswitch_leg(type);
                vertical = leg.y > leg.x;

                if(vertical)
                    rotate([0, 90, 0])
                        //** begin patch
                        if (leg[3] < 0) {
                            union() {
                                linear_extrude(leg.x, center = true)
                                    square([leg.z, leg.y], center = true);
                                translate(leg[4])
                                    sphere(d = leg[3]);
                            }
                        } else {
                        //** end patch
                            difference() {
                                linear_extrude(leg.x, center = true)
                                    difference() {
                                        square([leg.z, leg.y], center = true);

                                        if(leg[3] && leg.z >= leg.x)
                                            translate(leg[4])
                                                circle(d = leg[3]);
                                    }
                                if (leg.x > leg.z)
                                    translate(leg[4])
                                    rotate([0,90,0])
                                        cylinder(d=leg[3], h=leg.z+0.1, center=true);
                            }
                        //** begin patch
                        }
                        //** end patch
                else
                    rotate([90, 0, 0])
                        linear_extrude(leg.y, center = true)
                            difference() {
                                square([leg.x, leg.z], center = true);

                                if(leg[3])
                                    translate(leg[4])
                                        circle(d = leg[3]);
                            }

                if(!vertical && pos.y < -microswitch_width(type) / 2) {
                    gap = -microswitch_width(type) / 2 - pos.y;
                    translate([-leg.x / 2 + leg.y / 2, gap / 2])
                        cube([leg.y, gap, leg.z], center = true);
                }
            }
}

