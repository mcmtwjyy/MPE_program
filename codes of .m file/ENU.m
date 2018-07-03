
function [theta_angle] = ENU(sat_x,sat_y,sat_z,user_x,user_y,user_z)
% user = [-2144855.42274015 4397605.31287634 4078049.85085452];

% fai = 40*pi/180;    lamda =  116*pi/180;

[lamda fai Alt] = XYZ_TO_LLA(user_x,user_y,user_z);

fai = fai*pi/180;    lamda =  lamda*pi/180;

PL_N =31;
for k = 1:PL_N
   deltax(k) = sat_x(k) - user_x;
   deltay(k) = sat_y(k) - user_y;
   deltaz(k) = sat_z(k) - user_z;
end

S = [ -sin(lamda), cos(lamda), 0
      -sin(fai)*cos(lamda), -sin(fai)*sin(lamda), cos(fai)
      cos(fai)*cos(lamda), cos(fai)*sin(lamda), sin(fai)];

for i=1:PL_N
   dot_xyz = S*[deltax(i), deltay(i), deltaz(i)]';
   delta_e(i) = dot_xyz(1) ;
   delta_n(i) = dot_xyz(2) ;
   delta_u(i) = dot_xyz(3) ;
    
end

for i = 1:PL_N
   theta(i) = asin(delta_u(i)/(sqrt((delta_e(i))^2+(delta_n(i))^2+(delta_u(i))^2))); 
    
end
theta_angle = theta*180/pi;