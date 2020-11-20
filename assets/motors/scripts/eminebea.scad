
//----------------------------
// MINEBEA stepper motors
//
// Copyright (c) 2020 Cuban.Tech
//----------------------------

include <3DPrintModels/assets/motors/scripts/eminebea.models.scad>
include <BOSL2/std.scad>

PCB_HOLE = 1.3;
CLAMPS_CLEARANCE = 1.1;

// FIXME: Move elsewhere
module zrot_clone(angle) {
    union() {
        children();
        rotate([0,0,angle])
            children();
    }
}


module eminebea_stepper(motor_def, fp, shaft_length, pcb_angle=30) {
    D = motor_def[0];
    L = motor_def[1];
    d1 = motor_def[2];
    d2 = motor_def[3];
    a = motor_def[4];
    C1 = motor_def[5];
    C2 = motor_def[6];
    C3 = motor_def[7];
    W1 = motor_def[8];
    t = motor_def[9];
    W = motor_def[10];
    l1 = shaft_length;
    l2 = motor_def[11];
    P = (motor_def[0] == 20 && (pcb_angle == 30 || pcb_angle == 90 || pcb_angle == 150))? 28: (fp == "FPT" || fp == "FPH")? motor_def[12]: (fp == "FPL")? motor_def[13]: (motor_def[0] == 15)? motor_def[14]: 0;
    H = motor_def[15];
    R = motor_def[16];
    B = motor_def[17];
    alpha = motor_def[18];
    A = motor_def[19];
    Q = motor_def[20];
    T = motor_def[21];
    assert(fp == "PM15S" || fp == "FPT" || fp == "FPH" || fp == "FPL", "Unknown front type");

    echo("MINEBEA stepper motor", motor_def);
    echo(str("Rendering D=", D, " P=", P, " R=", R, " H=", H));

    cp_radius = 0.5*D - CLAMPS_CLEARANCE - 0.5*H;
    clamps_positions = zrot(-pcb_angle, p=regular_ngon(r=cp_radius, n=6));

    module motor_body() {
        h = L-2*t;
        color("white")
        union() {
            difference() {
                cylinder(r=0.5 * D - t, h=h);
                motor_shaft();
            }
            translate([0,0,h]) {
                cylinder(r=cp_radius - 0.5 * H - t, h=t + 0.3*l2);
                cylinder(r=0.5*d2, h=t + 0.5*l2);
                move_copies(clamps_positions)
                    cylinder(r=0.5 * H, h=t + 0.3 * l2);
            }
        }
        color("grey") {
            linear_extrude(0.5 * h - t)
            difference() {
                circle(r=0.5 * D);
                circle(r=0.5 * D - t);
            }
            translate([0,0,0.5*L-t])
            difference() {
                cylinder(r=0.5 * D, h=0.5 * L);
                translate([0,0,-0.1])
                    cylinder(r=0.5 * D - t, h=0.5 * L - t + 0.1);
                move_copies(clamps_positions)
                    cylinder(r=0.5*H, h=0.5*L+0.1);
            }
        }
    }

    function is_fp_pm15s() = motor_def[0] == 15;
    function is_fp_s() = Q != 0;

    holes = [[-0.5*P,0,0], [0.5*P,0,0]];

    module motor_front() {
        color("yellow")
        linear_extrude(t)
        // TODO: FPL
        difference() {
            if (is_fp_pm15s() || is_fp_s() || motor_def[0] == 51) {
                difference() {
                    hull() {
                        motor_front_center();
                        move_copies(holes)
                            circle(r=R);
                    }
                    move_copies(holes)
                        circle(r=0.5*H);
                    if (is_fp_pm15s())
                        zrot_clone(180)
                            translate([0.5*P,-0.5*H])
                                square([H,H]);
                }
            } else if (fp == "FPT" || fp == "FPH") {
                difference() {
                    union() {
                        motor_front_center();
                        if (B != 0) {
                            hull() {
                                square([P,B], center=true);
                                move_copies(holes)
                                    circle(r=R);
                            }
                        } else {
                            union() {
                                hull() {
                                    difference() {
                                        circle(r=0.5*D);
                                        translate([-0.5*D,-0.3*D])
                                            square([D,D]);
                                    }
                                    translate(holes[0])
                                        circle(r=R);
                                }
                                hull() {
                                    difference() {
                                        circle(r=0.5*D);
                                        translate([-0.5*D,-0.3*D])
                                            square([D,D]);
                                    }
                                    translate(holes[1])
                                        circle(r=R);
                                }
                            }
                        }
                    }
                    move_copies(holes)
                        circle(r=0.5*H);
                }
            } else if (fp == "FPL") {
                corner_points_left = [0.5*[P*cos(0.5*alpha), P*sin(0.5*alpha)], 0.5*[P*cos(0.5*alpha), -P*sin(0.5*alpha)]];
                difference() {
                    union() {
                        motor_front_center();
                        hull() {
                            zrot_clone(180) {
                                move_copies(corner_points_left)
                                    circle(r=0.5*(A-P));
                                arc(r=0.5*A, angle=[-0.5*alpha,0.5*alpha]);
                            }
                            difference() {
                                circle(r=0.5*D);
                                translate([-0.5*D,0])
                                    square([D,D]);
                            }
                        }
                    }
                    zrot_clone(180) {
                        move_copies(corner_points_left)
                            circle(r=0.5*H);
                        difference() {
                            arc(r=0.5*(P+H), angle=[-0.5*alpha,0.5*alpha], wedge=true);
                            arc(r=0.5*(P-H), angle=[-0.5*alpha,0.5*alpha], wedge=true);
                        }
                    }
                }
            } else {
                motor_front_center();
            }
            move_copies(clamps_positions)
                circle(r=0.5*H);
        }
        translate([0,0,t])
        color("white")
        difference() {
            cylinder(r=0.5*d2, h=a);
            translate([0,0,-0.1])
                cylinder(r=0.5*d1, h=a+0.2);
        }
    }

    module motor_front_center() {
        difference() {
            circle(r=0.5 * D);
        }
    }

    module motor_shaft() {
        color("darkgrey")
            cylinder(r=0.5*d1, l2 + L + l1);
    }

    module pcb_connector() {
        // TODO: PCB board atop connector
        // TODO: PCB board for SMF/SMW/ST models
        color("white")
        difference(){
                cube([2*C3, C2, C1], center=true);
                translate([0,0,0.5*(C1 - PCB_HOLE)])
                    cube([2*C3+0.1, C2 - PCB_HOLE, PCB_HOLE + 0.1], center=true);
                translate([0,0,0.5 * (PCB_HOLE - C1)])
                    cube([2*C3+0.1, C2 - PCB_HOLE, PCB_HOLE + 0.1], center=true);
        }
    }

    translate([0,0,t]) {
        motor_body();
        mirror([0,0,1])
            motor_front();
    }
    translate([0,0,-l1])
        motor_shaft();
    rotate([0,0,-pcb_angle])
    if (!is_fp_pm15s())
        translate([-0.5*D,0,0.5*L])
            pcb_connector();
}

