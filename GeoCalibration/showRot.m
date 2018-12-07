function showRot(R)
%R is the camera rotation matrix, i.e., it rotates the world frame into
%the camera frame.  Here we show the inverse of this rotation by rotating
%the camera frame into the world frame.
%Our right-handed camera frame is:
%X increases to the right
%Y increases down
%Z increases out of the camera into the world

%Convert to axis-angle representation
r = rotm2axang(R');
theta = r(4);
r = r(1:3);
theta = (180/pi)*theta;

n = 100;
dtheta = theta/n;

figure;
h(1) = line([0 1],[0 0], [0 0],'Color','r','Linewidth',3);
h(2) = line([0 0],[0 1], [0 0],'Color','g','Linewidth',3);
h(3) = line([0 0],[0 0], [0 1],'Color','b','Linewidth',3);

del = 0.05;
h(4) = text(1,del,del,'Camera X','FontSize',18);
h(5) = text(del,1,del,'Camera Y','FontSize',18);
h(6) = text(del,del,1,'Camera Z','FontSize',18);

axis([-1 1 -1 1 -1 1]);
xlabel('World X');
ylabel('World Y');
zlabel('World Z');
set(gca,'FontSize',18);

pause;
for i = 1:n
    rotate(h,r,dtheta);
    pause(2/n);
end
