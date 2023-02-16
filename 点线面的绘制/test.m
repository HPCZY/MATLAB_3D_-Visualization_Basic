clear; close all; clc

x = -2*pi:0.01:2*pi;
y = sin(x);
z = cos(x);

figure
axis('equal')
grid('on')
hold on 
xlabel('x');
ylabel('y');
zlabel('z');
view([20,30])

% % ��
% plot3(x,y,z,'r.')
% 
% % ��1
% plot3(-x,-y,-z,'b.')
% 
% % ��2
% line([-10,10],[0,0],[0,0],'color',[0,0,0])

% ��
F = [1,2,3,4;5,6,7,8;1,2,6,5;3,4,8,7;1,4,8,5;2,3,7,6]; % ����ͼ�εĶ���˳��
V = [2,-2,2; 2,-2,-2; 2,2,-2; 2,2,2;...
    -2,-2,2; -2,-2,-2; -2,2,-2; -2,2,2];
A = 0.99; % ����ͼ�εĲ�͸���� 
color = {[0,.8,.2],[0,.2,.8],[1,1,1],[1,1,0],[.8,.0,0],[1,.4,0]};
for n = 1:6
    patch('Faces',F(n,:),'Vertices',V,'FaceColor',color{n},'FaceAlpha',A) % ����
end










