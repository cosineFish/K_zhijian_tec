clear;clc;
format_data = '%s %s';%前面两部分是时间
for i = 1:1:4%后面4个是恒温数据
    format_data = strcat(format_data,' %f');
end
%%%%%%%%%打开文件%%%%%%%%%
[filename,filepath]=uigetfile('*.txt','打开文件');
complete_file = strcat(filepath,filename);
fidin = fopen(complete_file,'r+');
%%%%%%%%%读取数据%%%%%%%%%
sourceData = textscan(fidin,format_data,...
    'CommentStyle','#');%Delimiter,分隔符,'Delimiter',' '
%%%%%%%%%关闭文件%%%%%%%%%
fclose(fidin);
%%%%%%%%%处理数据%%%%%%%%%
dateStrings = strcat(sourceData{1},sourceData{2});%sourceData{1}为第一列数据
time = datetime(dateStrings,'InputFormat','uuuu-MM-ddHH:mm:ss');
for i = 1:4
    NTC(:,i) = sourceData{2+i};%电压
end
startDate = sourceData{1}{1};%第一列数据的第一个
endDate = sourceData{1}{end};%第一列数据的最后一个
xData = linspace(time(1),time(end),5);
save('checkdata_num.mat','time','xData');%,'lineNum'
global dateStr;global xlsFilePath;
if startDate == endDate
    dateStr = startDate;
    xlsFilePath = ['data',startDate,'.xls'];
else
    dateStr = [startDate,'~',endDate];
    xlsFilePath = ['data',startDate,'_',endDate,'.xls'];
end
global rnames;
rnames = {'均值/℃','标准差/℃','峰峰值/℃'};
global figure_num;
figure_num = 0;
global legend_rect_up;
global lengend_rect_down;
legend_rect_up = 'SouthEast';%[0.8 0.7 0.1 0.05];
lengend_rect_down = 'NorthEast';%[0.75 0.5 0.1 0.05];
global positionRowNum;
positionRowNum = 0;
%画测温点温度曲线
plot_t_mod(NTC);
%把测温点温度保存到数据表格
global sheetNum;sheetNum = 1;
saveTableData();
system('taskkill /F /IM EXCEL.EXE');
%清除产生的mat文件
delete_mat();
close all;%关闭所有图像窗口