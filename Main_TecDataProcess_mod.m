clear;clc;
format_data = '%s %s';%ǰ����������ʱ��
for i = 1:1:4%����4���Ǻ�������
    format_data = strcat(format_data,' %f');
end
%%%%%%%%%���ļ�%%%%%%%%%
[filename,filepath]=uigetfile('E:\�����\2018��7��\Kֱ�����/*.txt','�򿪺����ļ�');
complete_file = strcat(filepath,filename);
fidin = fopen(complete_file,'r+');
%%%%%%%%%��ȡ����%%%%%%%%%
sourceData = textscan(fidin,format_data,...
    'CommentStyle','#');%Delimiter,�ָ���,'Delimiter',' '
%%%%%%%%%�ر��ļ�%%%%%%%%%
fclose(fidin);
%%%%%%%%%��������%%%%%%%%%
dateStrings = strcat(sourceData{1},sourceData{2});%sourceData{1}Ϊ��һ������
time = datetime(dateStrings,'InputFormat','uuuu-MM-ddHH:mm:ss');
NTC = zeros(length(sourceData{1}),4);
for i = 1:4
    NTC(:,i) = sourceData{2+i};%��ѹ
end
startDate = sourceData{1}{1};%��һ�����ݵĵ�һ��
endDate = sourceData{1}{end};%��һ�����ݵ����һ��
xData = linspace(time(1),time(end),5);
save('checkdata_num.mat','time','xData');%,'lineNum'
global dateStr;global xlsFilePath;
if startDate == endDate
    dateStr = startDate;
    xlsFilePath = ['data',startDate,'.xls'];
else
    dateStr = [startDate,'-',endDate];
    xlsFilePath = ['data',startDate,'_',endDate,'.xls'];
end
global rnames;
rnames = {'��ֵ/��','��׼��/��','���ֵ/��'};
global figure_num;
figure_num = 0;
global legend_rect_up;
global lengend_rect_down;
legend_rect_up = 'SouthEast';%[0.8 0.7 0.1 0.05];
lengend_rect_down = 'NorthEast';%[0.75 0.5 0.1 0.05];
global positionRowNum;
positionRowNum = 0;
%�����µ��¶�����
plot_t_mod(NTC);
%�Ѳ��µ��¶ȱ��浽���ݱ��
global sheetNum;sheetNum = 1;
saveTableData();
system('taskkill /F /IM EXCEL.EXE');
%���������mat�ļ�
delete_mat();
close all;%�ر�����ͼ�񴰿�