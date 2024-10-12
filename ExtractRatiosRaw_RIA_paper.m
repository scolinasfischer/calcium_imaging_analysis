 
% Final edit April 2023 Susana Colinas Fischer 


% This scrips opens all the .mat files produced by the NEURON script
% (ending in "-analysisdata.mat"), extracts the column containing the
% the  green channel fluorescence,  the red channel
% fluorescence, and the green/red ratio. Then  saves this into an excel file with the same name as
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
% column 2: green fluorescence
% column 3: red fluorescence
% column 4: frame number since start of the movie
% column 5: time (in seconds) since start of the movie

 
    

%% Input list of GOOD .mat'; files as pathnames (ie with directory) to filename_list
filename_list = [


];



[r, c] = size(filename_list);
%Loop through files in list and extract needed variables
for i = 1:r

    %import data from  .mat file
    filename = filename_list(i,:); %set filename to one of filenames in list
    load(filename)                 % open saved workspace with all Neuron output variables 
    filename = erase(filename, '-analysisdata.mat');
    s= strfind(filename,'/');
    short_filename = extractAfter(filename,max(s));
    
    %Extract relevant variables
    xb = leftvalues;  %green fluorescence 
    yc = rightvalues; %red fluorescence
    ratiosxbyc = ratios; %green/red fluorescence ratio
    
    
    
    %Create frames and seconds vectors to save   
    frames = [1:1:length(ratios)]; %frame number
    frames = frames';
    seconds = (1/9.9)*(0:(length(ratios)-1)); %calculates time in s corresponfing to each frame and ratio
    seconds = seconds';
    
    %Create matrix to be saved
    data_to_save = horzcat (ratiosxbyc,xb,yc,frames ,seconds);    
    writematrix(data_to_save,short_filename,'Filetype', 'spreadsheet'); %write ratios variable to excel


end


