function ry = Ry(teta,x,y,z,w)

ry = [cosd(teta) 0 sind(teta) x;0 1 0 y;-sind(teta) 0 cosd(teta) z; 0 0 0 w];

end


