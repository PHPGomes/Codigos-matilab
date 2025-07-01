
function dh=denavit(teta,d,a,alfa)
dh=[cosd(teta) -cosd(alfa)*sind(teta) sind(alfa)*sind(teta) a*cosd(teta);
    sind(teta) cosd(alfa)*cosd(teta) -sind(alfa)*cosd(teta) a*sind(teta);
    0 sind(alfa) cosd(alfa) d;
    0 0 0 1]
end