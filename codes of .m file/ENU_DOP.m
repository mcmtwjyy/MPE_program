function [  H_ENU  ] = ENU_DOP( H, userx, usery, userz )


%ENU_DOP Summary of this function goes here
%   Detailed explanation goes here
  % H: H ��ecef��ֱ�������ʾ
  % H_ENU: �Ƕ������ʾ��Ȩϵ������

    [long lat alt] =XYZ_TO_LLA(userx,usery,userz);
     lamda = long*pi/180;    %long
     fai = lat*pi/180;       %lat
     
     
     S = [ -sin(lamda), cos(lamda), 0, 0
      -sin(fai)*cos(lamda), -sin(fai)*sin(lamda), cos(fai),0
      cos(fai)*cos(lamda), cos(fai)*sin(lamda), sin(fai),0
      0,0,0,1];
    
%      H_ENU = [S 0; 0 1]* H * [S' 0; 0 1];
  H_ENU = S * H * S';
  
end

