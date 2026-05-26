$fn =100;

bloker_z=0.9;
bloker_x=30;
bloker_y=4.4;

base_z=1;
base_x=1.5;
base_y=20;

front_bloker_x=30;
front_bloker_y=1.5;
front_bloker_z=0.5;

front_stopper_z=4;

translate([0,0,-bloker_z-base_z/2]){
//back blocker
translate([0,0, base_z/2])
{cube([bloker_x, bloker_y, bloker_z+base_z],true);
}

translate([(bloker_x/2), (bloker_y/2), (bloker_z/2)]){
    rotate([0,0,90]){
cube([base_x-0.5, bloker_x, base_z], false);
}}

//3 connecting rods
translate([(bloker_x/2)-base_x, -(bloker_y/2), (bloker_z/2)]){
cube([base_x, base_y, base_z], false);
}

translate([-(bloker_x/2), -(bloker_y/2), (bloker_z/2)]){
cube([base_x, base_y, base_z], false);
}
translate([-base_x/2, -(bloker_y/2), (bloker_z/2)]){
cube([base_x, base_y, base_z], false);
}

//front blocker
translate([-bloker_x/2,base_y-bloker_y/2-front_bloker_y,bloker_z/2-front_bloker_z])
{cube([front_bloker_x, front_bloker_y, front_bloker_z],false);
}
translate([-bloker_x/2,base_y-bloker_y/2-front_bloker_y,bloker_z/2-front_bloker_z])
{cube([front_bloker_x, front_bloker_y, front_stopper_z],false);
}

//rounding of front blocker
translate([-bloker_x/2,base_y-bloker_y/2-front_bloker_y/2,front_stopper_z]){
rotate([0,90,0]){

cylinder(h=bloker_x, r=front_bloker_y/2, center=false) ;
}}
}
translate([0,2,0]){
cylinder(h=2,r=0.5);}
translate([0,7,0]){
cylinder(h=2,r=0.5);}
translate([0,12,0]){
cylinder(h=2,r=0.5);}
   
translate([bloker_x/2-0.75,2,0]){
cylinder(h=2,r=0.5);}
translate([bloker_x/2-0.75,7,0]){
cylinder(h=2,r=0.5);}
translate([bloker_x/2-0.75,12,0]){
cylinder(h=2,r=0.5);}
   

translate([-bloker_x/2+0.75,2,0]){
cylinder(h=2,r=0.5);}
translate([-bloker_x/2+0.75,7,0]){
cylinder(h=2,r=0.5);}
translate([-bloker_x/2+0.75,12,0]){
cylinder(h=2,r=0.5);}
   
tri_points=[
[-15,2.2+1.5,0],//0
[15,2.2+1.5,0],//1
[-15,-2.2,0],//2
[15,-2.2,0],//3
[-15,-2.2,1],//4
[15,-2.2,1]//5
];
tri_faces=[
[1,5,4,0],
[4,5,3,2],
[1,0,2,3],
[1,3,5],
[0,4,2]
];
difference(){
polyhedron(tri_points, tri_faces);

translate([(bloker_x/2), (bloker_y/2)+1, (bloker_z/2)-1]){
    rotate([0,0,90]){
cube([base_x-0.5, bloker_x, base_z], false);
}}
}
