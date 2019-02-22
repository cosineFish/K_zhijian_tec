function plot_t_mod(NTC)
%画图
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
timeNum = datenum(time);%把横坐标转换为日期序列值
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
xlabel('测量时间（月/日 时:分）');
ylabel('温度/\circC');
title(['K直检接收机内部测温点温度（测量日期：',dateStr,'）'],'FontSize',14);
% legend('铜板测温点','LNA模块内部测温点','中放内部测温点','LNA盒体表面测温点',...
%         'Location',legend_rect_up);
legend('控温点','测温点1','测温点2','测温点3',...
         'Location',legend_rect_up);
set(gca,'layer','top');
set (gcf,'Position',[100,100,1080,800], 'color','w');
hold off;
%  save2word([dateStr,'tecReport.doc'],['-f',num2str(figure_num)]);
saveas(gcf,[dateStr,'tec-f',num2str(figure_num)],'png');    
end