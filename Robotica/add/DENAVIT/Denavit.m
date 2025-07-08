function dh = Denavit(teta,d,a,alpha)

dh = [
    cosd(teta) -cosd(alpha)*sind(teta) sind(alpha)*sind(teta) a*cosd(teta);
    sind(teta) cosd(alpha)*cosd(teta) -sind(alpha)*cosd(teta) a*sind(teta);
    0 sind(alpha) cosd(alpha) d;
    0 0 0 1
];

end
