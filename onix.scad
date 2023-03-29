
screen_width = 91.5;
screen_height = 77.5;
screen_depth = 3.8;
module screen() {
  color([0.9, 0.9, 0.9]) cube([screen_width,screen_height,screen_depth]);
}

rpi_width = 87;
rpi_height = 58;
rpi_depth = 21.5;
module rpi() {
  color([0.5, 0.9, 0.5]) translate([4.0,screen_height-rpi_height-5.36,-rpi_depth]) cube([rpi_width, rpi_height, rpi_depth]);
}

module body() {
  translate([-1,-1, -rpi_depth-2.2]){ color([0.5, 0.5, 0.9]) cube([screen_width+2, screen_height+2 ,screen_depth + rpi_depth + 2]);}
}

ethernet_width = 16;

module port_hole() {
  translate([rpi_width, screen_height-rpi_height-4.5, -rpi_depth]) cube([40, 54, 21.25]);
}

module power_hole() {
  translate([6, -8, -rpi_depth]) cube([40, 54, 21.5]);
}

module sd_space() {
  translate([0, 23, -rpi_depth]) cube([40, 40, 21.5]);
}

difference() {
  body();
  port_hole();
  power_hole();
  screen();
  rpi();
  sd_space();
}