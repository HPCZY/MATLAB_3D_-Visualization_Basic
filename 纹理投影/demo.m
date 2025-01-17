clear; close all; clc


%% ����1
img = imread('test.jpeg');
[rows,cols,dims] = size(img);

[y,z] = meshgrid(1:cols,rows:-1:1);

dx = sin(16*pi*(1:cols)/cols);
dy = cos(16*pi*(1:rows)/rows);
[x,~] = meshgrid(50*dx,50*dy);

H = view3d([0,0,0],500,1);
hold on
h = surf(H.Axes,x,y,z,'EdgeAlpha',0);
set(h,'CData',img,'FaceColor','texturemap')


%% ����2
[imgup,map] = imread('grass_up.png');
imgup = ind2rgb(imgup,map);
[imgdown,map] = imread('grass_down.png');
imgdown = ind2rgb(imgdown,map);
[imgside,map] = imread('grass_side.png');
imgside = ind2rgb(imgside,map);


R = 15;
[x1,y1,z1] = meshgrid(0:R,0:R,0);
[x2,y2,z2] = meshgrid(0:R,0:R,R);
[y3,z3,x3] = meshgrid(0:R,R:-1:0,0);
[y4,z4,x4] = meshgrid(0:R,R:-1:0,R);
[x5,z5,y5] = meshgrid(0:R,R:-1:0,0);
[x6,z6,y6] = meshgrid(0:R,R:-1:0,R);

H = view3d([8,8,8],20,1);
hold on
h1 = surf(H.Axes,x1,y1,z1,'EdgeAlpha',0);
set(h1,'CData',imgdown,'FaceColor','texturemap');
h2 = surf(H.Axes,x2,y2,z2,'EdgeAlpha',0);
set(h2,'CData',imgup,'FaceColor','texturemap');
h3 = surf(H.Axes,x3,y3,z3,'EdgeAlpha',0);
set(h3,'CData',imgside,'FaceColor','texturemap');
h4 = surf(H.Axes,x4,y4,z4,'EdgeAlpha',0);
set(h4,'CData',imgside,'FaceColor','texturemap');
h5 = surf(H.Axes,x5,y5,z5,'EdgeAlpha',0);
set(h5,'CData',imgside,'FaceColor','texturemap');
h6 = surf(H.Axes,x6,y6,z6,'EdgeAlpha',0);
set(h6,'CData',imgside,'FaceColor','texturemap');

%% ����3

[imgup,map] = imread('grass_up.png');
imgup = ind2rgb(imgup,map);
[imgdown,map] = imread('grass_down.png');
imgdown = ind2rgb(imgdown,map);
[imgside,map] = imread('grass_side.png');
imgside = ind2rgb(imgside,map);

H = view3d([0,0,0],3,1);
hold on
creatblock(0,0,0,imgup,imgdown,imgside)
creatblock(1,0,0,imgup,imgdown,imgside)
creatblock(1,1,0,imgup,imgdown,imgside)
creatblock(0,1,0,imgup,imgdown,imgside)
creatblock(1,1,1,imgup,imgdown,imgside)

function creatblock(cx,cy,cz,imgup,imgdown,imgside)
R = 15;
[x1,y1,z1] = meshgrid(0:R,0:R,0);
[x2,y2,z2] = meshgrid(0:R,0:R,R);
[y3,z3,x3] = meshgrid(0:R,R:-1:0,0);
[y4,z4,x4] = meshgrid(0:R,R:-1:0,R);
[x5,z5,y5] = meshgrid(0:R,R:-1:0,0);
[x6,z6,y6] = meshgrid(0:R,R:-1:0,R);
x = cat(1,x2,x6,x3,x4,x5,x1)/R-0.5+cx;
y = cat(1,y2,y6,y3,y4,y5,y1)/R-0.5+cy;
z = cat(1,z2,z6,z3,z4,z5,z1)/R-0.5+cz;
img = cat(1,imgup,imgside,imgside,imgside,imgside,imgdown);

h = surf(x,y,z,'EdgeAlpha',0);
set(h,'CData',img,'FaceColor','texturemap');
end



