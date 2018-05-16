function plot_t_mod(NTC)
%��ͼ
global figure_num;
global legend_rect_up;
figure_num = figure_num + 1;
figure('name',num2str(figure_num));
load checkdata_num.mat time xData%lineNum splitNum timeNum time
color = {'-.k','-g','-b','-c'};%,'-m','-y','-k','--r','--k'};
NTC_aver(1:4) = mean(NTC(:,1:4));
NTC_std(1:4) = std(NTC(:,1:4));
min_value(1:4) = min(NTC(:,1:4));
max_value(1:4) = max(NTC(:,1:4));
NTC_pp(1:4) = max_value(1:4) - min_value(1:4);
dat = [NTC_aver;NTC_std;NTC_pp];
save('checkdata_ntc.mat', 'dat');
% min_value = min(min_value(:));
% max_value = max(max_value(:));
timeNum = datenum(time);%�Ѻ�����ת��Ϊ��������ֵ
for i = 1:4
    %h = plot(time , NTC(:,i) ,color{i},'LineWidth',3);
    h = plot(timeNum,NTC(:,i) ,color{i},'LineWidth',3);
    hold on;
    uistack(h,'top');
end
ax = gca;
global dateStr;
ax.XTick = datenum(xData);
datetick(ax,'x','mm/DD HH:MM','keepticks');
set(gca,'FontSize',14);
hold on;
xlabel('����ʱ�䣨��/�� ʱ:�֣�');
ylabel('�¶�/\circC');
title(['Kֱ����ջ��ڲ����µ��¶ȣ��������ڣ�',dateStr,'��'],'FontSize',14);
% legend('ͭ����µ�','LNAģ���ڲ����µ�','�з��ڲ����µ�','LNA���������µ�',...
%         'Location',legend_rect_up);
legend('���µ�','���µ�1','���µ�2','���µ�3',...
         'Location',legend_rect_up);
set(gca,'layer','top');
set (gcf,'Position',[100,100,1080,800], 'color','w');
hold off;
%save2word([dateStr,'tecReport.doc'],['-f',num2str(figure_num)]);
end