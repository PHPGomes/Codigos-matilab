function rx = Rx(teta,x,y,z,w)

rx = [1 0 0 x;0 cosd(teta) -sind(teta) y;0 sind(teta) cosd(teta) z; 0 0 0 w];

end
