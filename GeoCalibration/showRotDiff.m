function showRotDiff(R1,R2)
%R1 and R2 are two camera rotation matrices, i.e., they rotates the world frame into
%the camera frame.  Here we show the inverse of these, i.e., the image of the
%two world frames.  R1 is displayed dotted, R2 solid.
%Our right-handed camera frame is:
%X increases to the right
%Y increases down
%Z increases out of the camera into the world

R1 = R1';
R2 = R2';

figure;
line([0 R1(1,1)],[0 R1(2,1)], [0 R1(3,1)],'Color','r','Linewidth',3,'LineStyle',':');
line([0 R1(1,2)],[0 R1(2,2)], [0 R1(3,2)],'Color','g','Linewidth',3,'LineStyle',':');
line([0 R1(1,3)],[0 R1(2,3)], [0 R1(3,3)],'Color','b','Linewidth',3,'LineStyle',':');

line([0 R2(1,1)],[0 R2(2,1)], [0 R2(3,1)],'Color','r','Linewidth',3);
line([0 R2(1,2)],[0 R2(2,2)], [0 R2(3,2)],'Color','g','Linewidth',3);
line([0 R2(1,3)],[0 R2(2,3)], [0 R2(3,3)],'Color','b','Linewidth',3);

del = 0.05;
R = R1 + del;
text(R(1,1),R(2,1),R(3,1),'Camera X','FontSize',18);
text(R(1,2),R(2,2),R(3,2),'Camera Y','FontSize',18);
text(R(1,3),R(2,3),R(3,3),'Camera Z','FontSize',18);

axis([-1 1 -1 1 -1 1]);
xlabel('World X');
ylabel('World Y');
zlabel('World Z');
set(gca,'FontSize',18);

