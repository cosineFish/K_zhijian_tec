function delete_mat
    fileNamesStr = {'checkdata_num.mat','checkdata_xtick.mat',...
        'envir_temp.mat','checkdata_ntc.mat','checkdata_tec.mat',...
        'checkdata_spaceAndBB.mat','checkdata_Vol.mat','checkdata_tem.mat'};
    for i = 1:length(fileNamesStr)
        file = fullfile(cd,fileNamesStr{i});
        if(exist(file,'file')~=0)
            delete(file);
        end
    end
end

%file = fullfile(cd,'checkdata_num.mat');if(exist(file)~=0)