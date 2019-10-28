
global_width = 6000;
global_depth = 3000;

main_timber_w = 150;
main_timber_h = 150;

sec_timber_w = 50;
sec_timber_h = 150;

roof_timber_w = 50;
roof_timber_h = 150; 

wall_height1 = 2200;
wall_height2 = 3000;

balk_step = 590;

log_place_width = 1250;

// floor
translate([0,0,0]) {
    cube([
        global_width, 
        main_timber_w, 
        main_timber_h
    ]);
}

translate([0,global_depth/2 - main_timber_w/2,0]) {
    cube([
        global_width, 
        main_timber_w, 
        main_timber_h
    ]);
}


translate([0,global_depth - main_timber_w,0]) {
    cube([
        global_width, 
        main_timber_w, 
        main_timber_h
    ]);
}


translate([global_width - main_timber_w, main_timber_h,0]) {
    cube([
        main_timber_w, 
        global_depth - 2 * main_timber_w,
        main_timber_h
    ]);
}

translate([global_width - main_timber_w - log_place_width, main_timber_h,0]) {
    cube([
        main_timber_w, 
        global_depth - 2 * main_timber_w,
        main_timber_h
    ]);
}

translate([(global_width - log_place_width - main_timber_w)/2, main_timber_h,0]) {
    cube([
        main_timber_w, 
        global_depth - 2 * main_timber_w,
        main_timber_h
    ]);
}

translate([0, main_timber_h,0]) {
    cube([
        main_timber_w, 
        global_depth - 2 * main_timber_w,
        main_timber_h
    ]);
}

for (i = [1:6]){    
    x = main_timber_w + balk_step * i + sec_timber_w * (i - 1);
    translate([x, sec_timber_w, 0]){
        cube([
            sec_timber_w, 
            global_depth - 2 * sec_timber_w, 
            sec_timber_h
        ]);
    }
   
}

//corner columns
translate([0, 0, main_timber_h]) {
    cube([
        main_timber_w, 
        main_timber_h,
        wall_height1
    ]);
}

translate([global_width - main_timber_w - log_place_width, 0,main_timber_h]) {
    cube([
        main_timber_w, 
        main_timber_h,
        wall_height1
    ]);
}

translate([global_width - main_timber_w, 0,main_timber_h]) {
    cube([
        main_timber_w, 
        main_timber_h,
        wall_height1
    ]);
}

translate([0, global_depth - main_timber_w ,main_timber_h]) {
    cube([
        main_timber_w, 
        main_timber_h,
        wall_height2
    ]);
}

translate([global_width - main_timber_w - log_place_width, global_depth - main_timber_w,main_timber_h]) {
    cube([
        main_timber_w, 
        main_timber_h,
        wall_height2
    ]);
}

translate([global_width - main_timber_w, global_depth - main_timber_w,main_timber_h]) {
    cube([
        main_timber_w, 
        main_timber_h,
        wall_height2
    ]);
}


//tall wall
translate([balk_step + main_timber_w, global_depth - main_timber_w,main_timber_h]) {
    cube([
        main_timber_w, 
        main_timber_h,
        wall_height2
    ]);
}

translate([balk_step + 2*main_timber_w+900, global_depth - main_timber_w,main_timber_h]) {
    cube([
        main_timber_w, 
        main_timber_h,
        wall_height2
    ]);
}
translate([2*balk_step + 3*main_timber_w+900, global_depth - main_timber_w,main_timber_h]) {
    cube([
        main_timber_w, 
        main_timber_h,
        wall_height2
    ]);
}

translate([2*balk_step + 4*main_timber_w+900+1250, global_depth - main_timber_w,main_timber_h]) {
    cube([
        main_timber_w, 
        main_timber_h,
        wall_height2
    ]);
}

/*for (i = [3:6]){
    x = (i*balk_step + (i-1)*sec_timber_w + main_timber_w);
    if (i == 2) {
        x = 900 + balk_step + sec_timber_h;
    }
    translate([x, global_depth - sec_timber_h, main_timber_h]){
        cube([
            sec_timber_w,
            sec_timber_h,
            wall_height2
        ]);
    }
}*/

translate([0,global_depth - sec_timber_h ,wall_height2 + main_timber_h]) {
    cube([
        global_width, 
        sec_timber_h, 
        sec_timber_w
    ]);
}

translate([0, global_depth - sec_timber_h, wall_height2 + main_timber_h + sec_timber_w]) {
    cube([
        global_width,         
        sec_timber_w,
        sec_timber_h
    ]);
}


//short wall
for (i = [1:6]){
    x = (i*balk_step + (i-1)*sec_timber_w + main_timber_w);
    translate([x, 0, sec_timber_h]){
        cube([
            sec_timber_w,
            sec_timber_h, 
            wall_height1
        ]);
    }
}


translate([0, 0, wall_height1 + main_timber_h ]) {
    cube([
        global_width, 
        sec_timber_h, 
        sec_timber_w
    ]);
}

translate([0, 0, wall_height1 + main_timber_h  + sec_timber_w]) {
    cube([
        global_width,         
        sec_timber_w,
        sec_timber_h
    ]);
}

//side wall
for (i = [1:3]){
    y = (i*balk_step + i*sec_timber_h);
    translate([0, y, main_timber_h]) {
            cube([
                sec_timber_h,            
                sec_timber_w,
                wall_height1
            ]);
    }
}

translate([0,0 ,wall_height1 + main_timber_h]) {
    cube([
        sec_timber_h, 
        global_depth,
        sec_timber_w
    ]);
}

//side wall
for (i = [1:3]){
    y = (i*balk_step + i*sec_timber_h  );
    translate([global_width - log_place_width - main_timber_w, y, main_timber_h]) {
            cube([
                sec_timber_h,            
                sec_timber_w,
                wall_height1
            ]);
    }
}

translate([global_width - main_timber_w, 0 ,wall_height1 + main_timber_h]) {
    cube([
        sec_timber_h, 
        global_depth,
        sec_timber_w
    ]);
}

translate([global_width - main_timber_w - log_place_width, 0 ,wall_height1 + main_timber_h]) {
    cube([
        sec_timber_h, 
        global_depth,
        sec_timber_w
    ]);
}

//ukos1
translate([0,0,170]) {
    rotate([0, 42, 0]) {
        cube([150, 25, 3000]);
    }
}

//ukos2
translate([4600,0,70]) {
    rotate([0, -42, 0]) {
        cube([150, 25, 3000]);
    }
}

//roof
for (i = [0:9]){    
    x = balk_step * i + roof_timber_w * i;
    translate([x, -800, 2180]){
        rotate([15.5,0,0]) {
            cube([
                roof_timber_w, 
                5000, 
                roof_timber_h
            ]);
        }
    }   
}

//obreshetka

for (i = [0:9]){    
    x = balk_step * i + roof_timber_w * i;
    translate([x, -800, 2350]){
        rotate([15.5,0,0]) {
            cube([
                70, 
                5000, 
                50
            ]);
        }
    }   
}

rotate([15.5,0,0]) {
    for (i = [0:9]){  
   translate([-500, (i*400 + 120 * i), 2530]){
    cube([7000, 120, 22]);
   } 
   }
}
