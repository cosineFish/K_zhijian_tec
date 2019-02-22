function plot_t(NTC)
%��ͼ
global figure_num;
global legend_rect_up;
figure_num = figure_num + 1;
% figure('name',num2str(figure_num));
figure('name',num2str(figure_num));
load checkdata_num.mat lineNum splitNum timeNum
color = {'-.k','-g','-b','-c'};%,'-m','-y','-k','--r','--k'};
for i = 1 : 4
    NTC_aver(i) = mean(NTC(:,i));
    NTC_std(i) = std(NTC(:,i));
    min_value(i) = min(NTC(:,i));
    max_value(i) = max(NTC(:,i));
    NTC_pp(i) = max_value(i) - min_value(i);
end
dat = [NTC_aver;NTC_std;NTC_pp];
save('checkdata_ntc.mat', 'dat');
min_value = min(min_value(:));
max_value = max(max_value(:));
for i = 1:4
    h = plot(1:1:lineNum , NTC(:,i) ,color{i},'LineWidth',3);
    hold on;
    uistack(h,'top');
end
global dateStr;
load checkdata_xtick.mat xticklabel
set(gca,'xtick',1:splitNum:timeNum*splitNum +1);
set(gca,'xticklabel',xticklabel);
%ylim([60,67]);
%set(gca,'ytick',60:0.5:67);
% ylim([57,64]);
% set(gca,'ytick',57:0.5:64);
% dateFormat = 31;
% datetick('x',dateFormat);
set(gca,'FontSize',14);
hold on;
xlabel('����ʱ�䣨ʱ:�֣�');
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