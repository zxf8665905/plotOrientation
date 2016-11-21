function plotOrientation(quaternion)
global fps;
global x_size y_size z_size x y z p;
x_size=30;
y_size=50;
z_size=10;
x=[0;x_size; x_size;     0; 0;  0 ; 0 ; 0 ;0; 0 ; 0 ; x_size;x_size; x_size; x_size;x_size;x_size; x_size; x_size;0];
y=[0;    0 ;     0 ;     0; 0; 0 ; y_size; y_size; 0; y_size; y_size; y_size; y_size; 0 ; 0 ; y_size ;y_size; y_size ;y_size;y_size];
z=[0;    0 ; z_size;z_size; 0; z_size; z_size; 0 ; 0; 0 ; z_size; z_size; 0 ; 0 ; z_size; z_size ;0 ; 0  ;0;0];
p=[x-x_size/2,y-y_size/2,z-z_size/2];
Qp=[zeros(size(x,1),1) p];
Qp=quaternProd(quaternion,quaternProd(Qp,quaternConj(quaternion)));

%p=[Qp(:,2)-x_size/2,Qp(:,3)-y_size/2,Qp(:,4)-z_size/2]
p=[Qp(:,2),Qp(:,3),Qp(:,4)];
plot3(p(:,1),p(:,2),p(:,3),'r');
hold on;
fill3(p(1:4,1),p(1:4,2),p(1:4,3),[1 1 0]);
fill3(p(5:9,1),p(5:9,2),p(5:9,3),[0.5 0.8 0.2]);
fill3(p(10:13,1),p(10:13,2),p(10:13,3),[1 0.6 0.4]);
fill3(p(14:18,1),p(14:18,2),p(14:18,3),[0.5 0.4 0.6]);
fill3(...
    [p(3,1),p(4,1),p(11,1),p(12,1)],...
    [p(3,2),p(4,2),p(11,2),p(12,2)],...
    [p(3,3),p(4,3),p(11,3),p(12,3)],...
    [1 0.2 0.8]);
fill3(...
    [p(1,1),p(2,1),p(13,1),p(8,1)],...
    [p(1,2),p(2,2),p(13,2),p(8,2)],...
    [p(1,3),p(2,3),p(13,3),p(8,3)],...
    [0.5 0 1]);
axis([  -100 100 -100 100 -20 100]);
title(sprintf('fps:%.0f',fps));
drawnow;
hold off;
end