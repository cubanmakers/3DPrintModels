
// Open SCAD model of linear Bearing LM-8-UU & KB-12-WW

//     LM-8-UU        KB-12-WW
//	D_Int =  8.0	D_Int = 12.0
//	D_Ext = 15.0	D_Ext = 22.0
//	D_1   = 14.3	D_1   = 21.0
//	L     = 24.0	L     = 32.0
//	W     =  1.1	W     =  1.3
//	B     = 17.5	B     = 22.9

model = "LM-8-UU"; // Bearing model
depth = 1.6;       // Groove depth
width = 1.2;       // Groove width
count = 12;        // Groove count
dint =  8.0;      // Internal diameter
dext = 15.0;      // External diameter
d1   = 14.3;      // D1
l     = 24.0;      // L
w     =  1.1;      // W
b     = 17.5;      // B


module groove(d1, d2, w) {
	difference() {
		cylinder(r=d1/2+1, h=w, center=true);
		cylinder(r=d2/2  , h=w, center=true);
	}
}

module lb(D_Int=8, D_Ext=15, D_1=14.3, L=24, W=1.1, B=17.5) {
chamf = D_Ext - D_1;
	difference() {
		hull() {
			cylinder(r=D_Ext/2, h=L-chamf, center=true);
			cylinder(r=D_1  /2, h=L      , center=true);
		}
		cylinder(r=D_Int/2, h=L+2    , center=true);
        %cylinder(r = D_Int/ 2, h=L+20, $fn=256, center=true);
		translate([0, 0, B/2-W/2]) groove(D_Ext, D_1, W);
		translate([0, 0,-B/2+W/2]) groove(D_Ext, D_1, W);
		translate([0, 0,     L/2]) groove(D_Ext-(D_Ext-D_Int)/2, 1, W);
		translate([0, 0,    -L/2]) groove(D_Ext-(D_Ext-D_Int)/2, 1, W);
        
        for (i = [0:count]) assign( grooveAngle=(i+1)*360/count) {
            rotate(90-grooveAngle) translate([0,-(width/2),-(L/2)])
            cube(size=[(D_Int/2)+depth, width, L], center=false);
        }

    
	}
    
}


module linear_bearing(linear_bearing_type) {
	if(linear_bearing_type == "LM-8-UU") {   //LM-8-UU
		lb(D_Int=8, D_Ext=15, D_1=14.3, L=24, W=1.1, B=17.5);
	}
	else {
		if(linear_bearing_type == "KB-12-WW") {   //KB-12-WW
			lb(D_Int=12, D_Ext=22, D_1=21, L=32, W=1.3, B=22.9);
		}
        else {
            lb(D_Int=dint, D_Ext=dext, D_1=d1, L=l, W=w, B=b);
        }
	}
}

linear_bearing(model);
//    lb(D_Int=6, D_Ext=15, D_1=14.3, L=30, W=1.1, B=17.5);