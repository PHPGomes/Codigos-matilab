function rz = Rz(teta,x,y,z)

rz = [cosd(teta) -sind(teta) 0 x;sind(teta) cosd(teta) 0 y; 0 0 1 z; 0 0 0 1];

end

