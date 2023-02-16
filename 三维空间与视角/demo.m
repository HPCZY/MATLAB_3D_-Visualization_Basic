function demo()

%% ����
Fig = figure('Position',[200,100,800,800],'menu','none');
set(Fig,'WindowKeyPressFcn',@KeyDown);
set(Fig,'WindowScrollWheelFcn',@ScrollWheel);

Pnl = uipanel(Fig,'Position',[0,0,1,1]);
Axes = axes(Pnl,'Position',[0.1,0.1,0.8,0.8]);

%% ����
pos = [0,0,0];
range = 20;
angle = [10,20];

dD = .5;
dA = 1;

%% ��ʾ
DrawCube();
axis(Axes,'equal')
grid(Axes,'on')
xlabel('x');
ylabel('y');
zlabel('z');
update()

%% ������
    function KeyDown(~,event)
        switch event.Key
            case 'e'
                pos(3) = pos(3)+dD;
            case 'd'
                pos(3) = pos(3)-dD;
            case 'w'
                pos(2) = pos(2)+dD;
            case 's'
                pos(2) = pos(2)-dD;
            case 'q'
                pos(1) = pos(1)+dD;
            case 'a'
                pos(1) = pos(1)-dD;
            case 'downarrow'
                angle(2) = angle(2)+dA;
            case 'uparrow'
                angle(2) = angle(2)-dA;
            case 'leftarrow'
                angle(1) = angle(1)+dA;
            case 'rightarrow'
                angle(1) = angle(1)-dA;
        end
        update()
    end

%% �����
    function ScrollWheel(~,event)
        value = event.VerticalScrollCount; % �ؼ���
        range = max(1,range+value);
        update()
    end

%% ���»���
    function update(~,~)
        axis(Axes,[-range+pos(1),range+pos(1),-range+pos(2),range+pos(2),-range+pos(3),range+pos(3)])
        view(Axes,angle)
        drawnow
    end

end

% �Լ�д�Ļ�ħ���ĺ������������⣩
function h = DrawCube()

%% �鶨��
% ��˶��㶨�壨ħ��ÿһ��С���ϵ�8�������������꣩
blockVertices = [ 1,-1,-1; 1, 1,-1;-1, 1,-1;-1,-1,-1;...
    1,-1, 1; 1, 1, 1;-1, 1, 1;-1,-1, 1]*0.95; % *0.95
% �����涥�����������ϴεĻ������Ż���һ�£���������ʾ��
blockFace{1} = [1,2,3,4];
blockFace{2} = [1,2,6,5];
blockFace{3} = [2,3,7,6];
blockFace{4} = [3,4,8,7];
blockFace{5} = [4,1,5,8];
blockFace{6} = [5,6,7,8];

%% 26�����Ķ��壨���ð뾶1д�����¶�*2���򵥿�ݣ��Ժ�����ֱ�Ӹģ�
% 6��
axisPosList = [0, 0,-1; 1, 0, 0; 0, 1, 0; -1, 0, 0; 0,-1, 0; 0, 0, 1]*2;
% 8��
cornerPosList = [1,-1,-1; 1, 1,-1; -1, 1,-1; -1,-1,-1;...
    1,-1, 1; 1, 1, 1; -1, 1, 1; -1,-1, 1]*2;
% 12��
edgePosList = [1, 0,-1; 0, 1,-1;-1, 0,-1; 0,-1,-1;...
    1, 1, 0;-1, 1, 0;-1,-1, 0; 1,-1, 0;
    1, 0, 1; 0, 1, 1;-1, 0, 1; 0,-1, 1]*2;

%% ��ɫ�벻͸����  �� �� �� �� �� ��
color = {[1,1,1],[0,0.2,0.8],[0.8,0,0],[0,0.8,0.2],...
    [1,0.4,0],[1,1,0],[0.1,0.1,0.1]};
colorAlpha = [1,1,1,1,1,1,0.3];

%% 26��6����ɫ
% ������Գ�ʼ��
axisBlock = cell(6,1);
for n = 1:6
    axisBlock{n}.position = axisPosList(n,:);
    axisBlock{n}.color = ones(1,6)*7;
    axisBlock{n}.color(n) = n;
end

% �ǿ����Գ�ʼ��
cornerBlock = cell(8,1);
for n = 1:8
    cornerBlock{n}.position = cornerPosList(n,:);
    cornerBlock{n}.color = ones(1,6)*7;
end
cornerBlock{1}.color([1,2,5]) = [1,2,5];
cornerBlock{2}.color([1,2,3]) = [1,2,3];
cornerBlock{3}.color([1,3,4]) = [1,3,4];
cornerBlock{4}.color([1,4,5]) = [1,4,5];
cornerBlock{5}.color([6,2,5]) = [6,2,5];
cornerBlock{6}.color([6,2,3]) = [6,2,3];
cornerBlock{7}.color([6,3,4]) = [6,3,4];
cornerBlock{8}.color([6,4,5]) = [6,4,5];

% ������Գ�ʼ��
edgeBlock = cell(12,1);
for n = 1:12
    edgeBlock{n}.position = edgePosList(n,:);
    edgeBlock{n}.color = ones(1,6)*7;
end
edgeBlock{1}.color([1,2]) = [1,2];
edgeBlock{2}.color([1,3]) = [1,3];
edgeBlock{3}.color([1,4]) = [1,4];
edgeBlock{4}.color([1,5]) = [1,5];
edgeBlock{5}.color([2,3]) = [2,3];
edgeBlock{6}.color([3,4]) = [3,4];
edgeBlock{7}.color([4,5]) = [4,5];
edgeBlock{8}.color([5,2]) = [5,2];
edgeBlock{9}.color([6,2]) = [6,2];
edgeBlock{10}.color([6,3]) = [6,3];
edgeBlock{11}.color([6,4]) = [6,4];
edgeBlock{12}.color([6,5]) = [6,5];

%% ��ʾһ�£�����ѭ��ȫ�����ƣ�

% ���
for n = 1:6
    for f = 1:6
        V = axisBlock{n}.position+blockVertices(blockFace{f},:);
        C = color{axisBlock{n}.color(f)};
        A = colorAlpha(axisBlock{n}.color(f));
        h = patch('Faces',[1 2 3 4],'Vertices',V,'FaceColor',C,...
            'FaceAlpha',A);
    end
end
% ��
for n = 1:12
    for f = 1:6
        V = edgeBlock{n}.position+blockVertices(blockFace{f},:);
        C = color{edgeBlock{n}.color(f)};
        A = colorAlpha(edgeBlock{n}.color(f));
        h = patch('Faces',[1 2 3 4],'Vertices',V,'FaceColor',C,...
            'FaceAlpha',A);
    end
end
% �ǿ�
for n = 1:8
    for f = 1:6
        V = cornerBlock{n}.position+blockVertices(blockFace{f},:);
        C = color{cornerBlock{n}.color(f)};
        A = colorAlpha(cornerBlock{n}.color(f));
        h = patch('Faces',[1 2 3 4],'Vertices',V,'FaceColor',C,...
            'FaceAlpha',A);
    end
end

end