% Final edit April 2023 Susana Colinas Fischer 


% This scrips opens all the .mat files produced by the NEURON script
% (ending in "-analysisdata.mat"), extracts the column containing the
% green/red ratio, and saves this into an excel file with the same name as
% the original .mat file, without the "analysisdata" suffix. It also
% creates a column containing the time (in seconds) and frame number
% corresponding to each row of data

%INPUT
% .mat files, directory must be pasted into "filename_list" variable in
% single commas


%OUTPUT
% Excel files with the same name as the .mat file containing only the
% green/red ratio. These will be saved in the current folder. 
% column 1: green/red ratios
% column 2: frame number since start of the movie
% column 3: time (in seconds) since start of the movie








%% Input list of .mat files as pathnames (ie with directory) to filename_list
filename_list = [


'/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/matfiles/AIB/JANUARY 2023 BAR184/mock/23_01_27_mock_00002-analysisdata.mat';
'/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/matfiles/AIB/JANUARY 2023 BAR184/mock/23_01_27_mock_00004-analysisdata.mat';
'/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/matfiles/AIB/JANUARY 2023 BAR184/mock/23_01_27_mock_00007-analysisdata.mat';
'/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/matfiles/AIB/JANUARY 2023 BAR184/mock/23_01_27_mock_00009-analysisdata.mat';
'/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/matfiles/AIB/JANUARY 2023 BAR184/mock/23_01_27_mock_00011-analysisdata.mat';
'/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/matfiles/AIB/JANUARY 2023 BAR184/mock/23_01_27_mock_00013-analysisdata.mat';
'/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/matfiles/AIB/JANUARY 2023 BAR184/mock/23_01_27_mock_00015-analysisdata.mat';
'/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/matfiles/AIB/JANUARY 2023 BAR184/mock/23_01_27_mock_00017-analysisdata.mat';
'/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/matfiles/AIB/JANUARY 2023 BAR184/mock/23_01_27_mock_00019-analysisdata.mat';
'/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/matfiles/AIB/JANUARY 2023 BAR184/mock/23_01_27_mock_00021-analysisdata.mat';
'/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/matfiles/AIB/JANUARY 2023 BAR184/mock/23_01_27_mock_00023-analysisdata.mat';
'/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/matfiles/AIB/JANUARY 2023 BAR184/mock/23_01_27_mock_00025-analysisdata.mat';

];


%% Open .mat files, save column with green/red ratio, and save excel with according filename

[r, c] = size(filename_list);
for i = 1:r
    
filename = filename_list(i,:); %set filename to one of filenames in list
load(filename)                 % open saved workspace with all Neuron output variables 
short_filename = extractAfter(filename, 85);  
short_filename = erase(short_filename,'-analysisdata.mat'); %set short filename with only date, condition & worm number
frames = [1:1:length(ratios)]; %frame number
frames = frames';
seconds = (1/9.9)*(0:(length(ratios)-1)); %calculates time in s corresponfing to each frame and ratio
seconds = seconds';

data_to_save = horzcat (ratios, frames ,seconds);

writematrix(data_to_save,short_filename,'Filetype', 'spreadsheet'); %write ratios variable to excel


end


