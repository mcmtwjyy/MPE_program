function [Long Lat Alt] = XYZ_TO_LLA(X,Y,Z)
%xyz转到经纬高   

SemiMajorAxis=6378137.0;   %椭球体长半径
EccentrSquared=0.00669437999;   %e的平方
OneMinusEccentrSquared=0.993305620010000;

Long = atan2( Y, X );
  P = sqrt( (X * X) + (Y * Y) );
  Q = Z / P;
  Alt = 0.0;
  Lat = atan2( Q, OneMinusEccentrSquared );

 for n=1:1000,
    SinL = sin(Lat);
    SinL2 = SinL * SinL;
    R = SemiMajorAxis / sqrt(1.0 - (EccentrSquared * SinL2));
    D = Alt;
    Alt = (P / cos(Lat)) - R;
    Lat = atan2(Q * (R + Alt), (OneMinusEccentrSquared * R) + Alt);
    
    if (abs(Alt - D) < 0.2)
        break;
    end;
 end;  
Long = Long * 180.0 / pi;
Lat = Lat  * 180.0 / pi;
Alt = Alt;


end







