function saveTableData()
    global xlsFilePath;
    global dateStr;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %保存测温点数据表格
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    load checkdata_ntc.mat dat
    title = ['K直检接收机内部测温点温度(测量日期:',dateStr,')'];
    %cnames = {'铜板','LNA模块内部','中放内部','LNA盒体表面'};
    cnames = {'控温点','测温点1','测温点2','测温点3'};
    %write2xls(filePath , title , values , sheetName , length)
    write2xls(xlsFilePath,title,cnames,dat,length(cnames));
end