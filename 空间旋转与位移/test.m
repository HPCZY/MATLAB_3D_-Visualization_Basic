function H = test(pos,range,flag,h)

%% ����
H.Fig = figure('Position',[200,100,800,800],'menu','none');
set(H.Fig,'WindowKeyPressFcn',@KeyDown);
set(H.Fig,'WindowScrollWheelFcn',@ScrollWheel);

H.Pnl = uipanel(H.Fig,'Position',[0,0,1,1]);
H.Axes = axes(H.Pnl,'Position',[0.1,0.1,0.8,0.8]);
H.Obj = h;
H.Obj.Parent = H.Axes;
%% ����
mode = true;
angle = [10,20];
zoom = 1;
dD = -range/50;
dA = 2;

%% ��ʾ
if flag
    axis equal
    grid on
    xlabel('x')
    ylabel('y')
    zlabel('z')
end
update()

%% ������
    function KeyDown(~,event)
        switch event.Key
            case 'c'
                mode = ~mode;
            case 'e'
                if mode
                    pos(3) = pos(3)+dD;
                else
                    [h.XData,h.YData,h.ZData] = updatamesh(h.XData,h.YData,h.ZData,[0,0,1],[0,0],1);
                end
            case 'd'
                if mode
                    pos(3) = pos(3)-dD;
                else
                    [h.XData,h.YData,h.ZData] = updatamesh(h.XData,h.YData,h.ZData,[0,0,-1],[0,0],1);
                end
            case 'w'
                if mode
                    pos(2) = pos(2)+dD;
                else
                    [h.XData,h.YData,h.ZData] = updatamesh(h.XData,h.YData,h.ZData,[0,1,0],[0,0],1);
                end
            case 's'
                if mode
                    pos(2) = pos(2)-dD;
                else
                    [h.XData,h.YData,h.ZData] = updatamesh(h.XData,h.YData,h.ZData,[0,-1,0],[0,0],1);
                end
            case 'q'
                if mode
                    pos(1) = pos(1)+dD;
                else
                    [h.XData,h.YData,h.ZData] = updatamesh(h.XData,h.YData,h.ZData,[1,0,0],[0,0],1);
                end
            case 'a'
                if mode
                    pos(1) = pos(1)-dD;
                else
                    [h.XData,h.YData,h.ZData] = updatamesh(h.XData,h.YData,h.ZData,[-1,0,0],[0,0],1);
                end
            case 'downarrow'
                if mode
                    angle(2) = angle(2)+dA;
                else
                    [h.XData,h.YData,h.ZData] = updatamesh(h.XData,h.YData,h.ZData,[0,0,0],[pi/180,0],1);
                end
            case 'uparrow'
                if mode
                    angle(2) = angle(2)-dA;
                else
                    [h.XData,h.YData,h.ZData] = updatamesh(h.XData,h.YData,h.ZData,[0,0,0],[-pi/180,0],1);
                end
            case 'leftarrow'
                if mode
                    angle(1) = angle(1)+dA;
                else
                    [h.XData,h.YData,h.ZData] = updatamesh(h.XData,h.YData,h.ZData,[0,0,0],[0,pi/180],1);
                end
            case 'rightarrow'
                if mode
                    angle(1) = angle(1)-dA;
                else
                    [h.XData,h.YData,h.ZData] = updatamesh(h.XData,h.YData,h.ZData,[0,0,0],[0,-pi/180],1);
                end
        end
        update()
    end

%% �����
    function ScrollWheel(~,event)
        value = event.VerticalScrollCount; % �ؼ���        
        if mode
            update()
            zoom = zoom*(1+value/10);
        else
            [h.XData,h.YData,h.ZData] = updatamesh(h.XData,h.YData,h.ZData,[0,0,0],[0,0],1+value/10);
        end
    end

%% ���»���
    function update(~,~)
        p = [-1,1,-1,1,-1,1]*(range*zoom)+[pos(1),pos(1),pos(2),pos(2),pos(3),pos(3)];
        axis(H.Axes,p)
        view(H.Axes,angle)
        drawnow
    end

end
