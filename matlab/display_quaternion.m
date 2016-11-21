function display_quaternion(quat)
%vector1=quatrotate(quat,[1,0,0]);
%test
q=quaternProd(quat,quaternProd([0 1 0 0],quaternConj(quat)));
vector1=[q(2),q(3),q(4)];
quiver3(0,0,0,vector1(1)*100,vector1(2)*100,vector1(3)*100);
hold on;

%vector2=quatrotate(quat,[0,1,0]);
q=quaternProd(quat,quaternProd([0 0 1 0],quaternConj(quat)));
vector2=[q(2),q(3),q(4)];
quiver3(0,0,0,vector2(1)*100,vector2(2)*100,vector2(3)*100);
hold on;

%vector3=quatrotate(quat,[0,0,1]);
q=quaternProd(quat,quaternProd([0 0 0 1],quaternConj(quat)));
vector3=[q(2),q(3),q(4)];
quiver3(0,0,0,vector3(1)*100,vector3(2)*100,vector3(3)*100);
axis([  -200 200 -200 200 -20 200]);
xlabel('axis X');
ylabel('axis Y');
zlabel('axis Z');
drawnow;
hold off;
end

