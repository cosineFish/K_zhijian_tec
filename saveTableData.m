function saveTableData()
    global xlsFilePath;
    global dateStr;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %������µ����ݱ��
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    load checkdata_ntc.mat dat
    title = ['Kֱ����ջ��ڲ����µ��¶�(��������:',dateStr,')'];
    %cnames = {'ͭ��','LNAģ���ڲ�','�з��ڲ�','LNA�������'};
    cnames = {'���µ�','���µ�1','���µ�2','���µ�3'};
    %write2xls(filePath , title , values , sheetName , length)
    write2xls(xlsFilePath,title,cnames,dat,length(cnames));
end