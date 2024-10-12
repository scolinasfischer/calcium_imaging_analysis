%Last edit Susana Colinas Fischer April 2023

%% BRIEF SUMMARY 
% This script accepts as input the xls file with the raw green/red ratios of
% the AIY neuron and completes all subsequent analysis & plots. This means
% it takes as input the ratios from all 3 conditions (mock, aversive and
% sexual conditioning) and 2 genotypes (wild-type and pdf-1 mutant. 
% The steps carried out by this script are:
% - Requries input of 
%       - analysis parameters 
%       - input filenames (xls files), grouped by condition & genotype
%       - output directories

% Then, loops through the data within each condition and genotype. 
% 
% - For each single-worm file 
%   - smoothens the ratio using a moving 5-frame median, calculates the
%     normalised  ratio (R-Rmin/Rmax) and plots this. 
%
% - For each condition & genotype (6 groups in total)
%   - Sorts all single-worm traces by "time-to-peak" (time since odour is
%     presented until the neuron reaches its maximum fluorescence, within the
%     odour on period).  
%   - Use "time-to-peak" value for each neuron to categorise each response
%     as type 1 or type 2. The criteria for type 2 response is a time-to-peak
%     value above 15seconds (halfway of the odour period), AND a peak 
%     fluorescence value above 0.4 (a large magnitude response). Neurons
%     that don't meet the criteria for type 2 are automatically type 1. 
%   - Plot heatmap of sorted data, in ascending order.
%   - Plot the average & SEM of all traces, separating type 1 and type 2. 


%% INPUTS 
% - This script requires the .xls files produced by the
%   "ExtractRatiosToExcel" script. The list of filename directories must be
%   grouped by condition and genotype and pasted in the relevant variables
%   at the start of the script in double commas. 
%
% - Input parameters:
%    - "time" sets the length of the video (in seconds) the script will analyse.
%    Should be set to 150.
%    - "T2cutoffinsecs" sets the cutoff time  for type 2 responses.
%    Should be set to 15
%    - "threshold" sets the magnitude threshold for type 2 responses. 
%    Should be set to 0.4. 
%    - "strain" sets the filename all output files will have in common
%    - "pars" sets the script to calculate the normalised ratio (Fm) as
%    opposed to the baseline-adjusted ratio (R0). Should be set to Fm.
%    
% - Directories for output
%   - Need to set one directory per group (condition and genotype, 6 in
%   total)


%% OUTPUTS 
% Excel files
%   - __all.xls file, containing the smooth & normalised ratio of each
%      worm (columns) accross time (rows). To be used for statistics. 
%   - __avg.xls file, containing the average smooth & normalised ratio 
%      of all worms in that condition(column 1), time in seconds(column 2),
%      and SEM (column 3) accross time (rows).
%   - __timetomax_maxvalue.xls file, containing the timetomax value for each
%    worm (column 1) max fluorescence value during odour on (column 2), 
%    where each worm is one row.  
%
% Plots, for within each condition & genotype
%   - Heatmap of baseline adjusted ratio, sorted by time-to-max
%   - Average and SEM, separating type 1 and type 2 responses. 








%% INPUTS

%% Input parameters


%set length of plot for 3conds plots (full/half movie)
   time = 150; % 150 for half, 210 for full

%set time cutoff to separate early and late peaks 
   T2cutoffinsecs = 15; %set cutoff point in seconds since valve opens
   threshold = 0.4; %threshold for counting as type 2 peak


%strain params
    strain = "AIY_T1T2_15sec_ThFm4_getsourcedataT1T2";
    pars = "Fm";


%% Input filenames of .xls files containing raw green/red ratio
%filenames to analyse are excels outputted from ExtractRatiosToExcel.m 

%wt filenames
wt_mock_filenames = [
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/02_07_21_mock_w00005_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/21_05_21_mock_w00018_R.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/25_05_21_mock_w00001_R.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/25_05_21_mock_w00004_R.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/25_05_21_mock_w00006_R.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/21_05_21_mock_w00000_R.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/21_05_21_mock_w00006_R.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/21_05_21_mock_w00009_R.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/21_05_21_mock_w00015_R.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/13_08_21_mock_w00003_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/13_08_21_mock_w00004_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/13_08_21_mock_w00001_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/10_08_21_mock_w00006_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/10_08_21_mock_w00007_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/10_08_21_mock_w00005_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/10_08_21_mock_w00001_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/10_08_21_mock_w00002_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/03_08_21_mock_w00007_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/06_08_21_mock_w00001_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/03_08_21_mock_w00005_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/03_08_21_mock_w00003_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/03_08_21_mock_w00004_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/03_08_21_mock_w00002_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/02_07_21_mock_w00009_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/03_08_21_mock_w00001_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/02_07_21_mock_w00008_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/02_07_21_mock_w00006_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/02_07_21_mock_w00007_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY MOCK XLS/02_07_21_mock_w00001_P.xls";

];

wt_avsv_filenames = [
   "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY AV XLS/06_5_21_AV_00000_R.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY AV XLS/06_5_21_AV_00003_R.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY AV XLS/06_5_21_AV_00005_R.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY AV XLS/08_6_21_AV_00001_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY AV XLS/08_6_21_AV_00007_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY AV XLS/08_6_21_AV_00008_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY AV XLS/08_6_21_AV_00009_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY AV XLS/18_5_21_AV_00001_R.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY AV XLS/20_07_21_AV_00003_.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY AV XLS/20_07_21_AV_00005_.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY AV XLS/20_07_21_AV_00006_.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY AV XLS/20_07_21_AV_00007_.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY AV XLS/20_07_21_AV_00009_.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY AV XLS/20_07_21_AV_00010_.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY AV XLS/20_07_21_AV_00013_.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY AV XLS/20_07_21_AV_00014_.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY AV XLS/20_07_21_AV_00016_.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY AV XLS/23_07_21_AV_00001_.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY AV XLS/23_07_21_AV_00003_.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY AV XLS/23_07_21_AV_00005_.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY AV XLS/23_07_21_AV_00006_.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY AV XLS/23_07_21_AV_00012_.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY AV XLS/25_5_21_AV_00001_R.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY AV XLS/25_5_21_AV_00008_R.xls";


];

wt_sexc_filenames = [
    "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/06_05_21_sexc0013_R.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/06_05_21_sexc0015_R.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/06_05_21_sexc0017_R.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/06_08_21_sexc0001_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/06_08_21_sexc0003_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/06_08_21_sexc0004_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/06_08_21_sexc0005_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/07_05_21_sexc0005_R.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/08_06_21_sexc0002_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/08_06_21_sexc0003_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/08_06_21_sexc0004_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/08_06_21_sexc0005_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/08_06_21_sexc0006_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/08_06_21_sexc0007_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/08_06_21_sexc0008_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/08_06_21_sexc0009_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/10_08_21_sexc0001_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/10_08_21_sexc0002_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/10_08_21_sexc0003_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/10_08_21_sexc0004_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/10_08_21_sexc0005_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/10_08_21_sexc0006_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/10_08_21_sexc0007_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/13_08_21_sexc0001_P.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_04_sexc_00005.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_04_sexc_00008.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_04_sexc_00010.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_04_sexc_00012.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_04_sexc_00014.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_04_sexc_00016.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_04_sexc_00019.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_04_sexc_00022.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_04_sexc_00023.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_04_sexc_00025.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_04_sexc_00027.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_04_sexc_00029.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_04_sexc_00031.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_04_sexc_00036.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_04_sexc_00038.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_04_sexc_00040.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_04_sexc_00042.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_04_sexc_00044.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_08_sexc_00001.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_08_sexc_00004.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_08_sexc_00006.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_08_sexc_00008.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_08_sexc_00009.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_08_sexc_00012.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_08_sexc_00014.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_08_sexc_00015.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_08_sexc_00017.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_08_sexc_00020.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_08_sexc_00021.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_08_sexc_00023.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_08_sexc_00026.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_08_sexc_00029.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_08_sexc_00031.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_08_sexc_00033.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_08_sexc_00037.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_08_sexc_00038.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_08_sexc_00040.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_08_sexc_00042.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_11_sexc_00002.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_11_sexc_00003.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_11_sexc_00005.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_11_sexc_00006.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_11_sexc_00008.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_11_sexc_00010.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_11_sexc_00011.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_11_sexc_00013.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_11_sexc_00015.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_11_sexc_00019.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_11_sexc_00020.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_11_sexc_00022.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR224AIY/AIY SEX COND XLS/22_02_11_sexc_00026.xls";

];


%pdf1 filenames
p1_mock_filenames = [
    "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/22_03_18_mock_00008.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/22_03_18_mock_00002.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/22_03_18_mock_00005.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/22_03_18_mock_00006.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/22_03_18_mock_00009.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/22_03_18_mock_00011.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/22_03_18_mock_00012.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/22_03_18_mock_00014.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/22_03_18_mock_00015.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/22_03_18_mock_00016.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/22_03_30_mock_00005.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/22_03_30_mock_00007.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/22_03_30_mock_00008.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/22_03_30_mock_00010.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/22_03_30_mock_00011.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/22_03_30_mock_00012.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/22_03_30_mock_00016.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/22_03_30_mock_00019.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/22_03_30_mock_00020.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/22_03_30_mock_00022.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/22_03_18_mock_00001.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/22_03_30_mock_00023.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/15_11_21_mock_00010.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/15_11_21_mock_00011.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/26_11_21_mock_00001.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/26_11_21_mock_00002.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/10_12_21_mock_00013.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/10_12_21_mock_00015.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/15_11_21_mock_00001.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/15_11_21_mock_00002.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/15_11_21_mock_00006.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/15_11_21_mock_00009.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/10_12_21_mock_00001.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/10_12_21_mock_00002.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/mock/10_12_21_mock_00004.xls";
 ];

p1_avsv_filenames = [
   "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/22_03_18_avsv_00002.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/22_03_18_avsv_00003.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/22_03_18_avsv_00005.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/22_03_18_avsv_00008.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/22_03_18_avsv_00010.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/22_03_18_avsv_00011.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/22_03_18_avsv_00013.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/22_03_18_avsv_00014.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/22_03_18_avsv_00019.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/22_03_18_avsv_00020.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/22_03_18_avsv_00025.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/22_03_18_avsv_00027.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/22_03_18_avsv_00028.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/22_03_30_avsv_00002.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/22_03_30_avsv_00004.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/22_03_30_avsv_00005.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/22_03_30_avsv_00007.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/22_03_30_avsv_00010.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/22_03_30_avsv_00012.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/22_03_30_avsv_00013.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/22_03_30_avsv_00015.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/22_03_30_avsv_00018.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/22_03_30_avsv_00019.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/15_11_21_avsv_00004.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/15_11_21_avsv_00006.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/15_11_21_avsv_00008.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/15_11_21_avsv_00009.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/15_11_21_avsv_00014.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/26_11_21_avsv_00007.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/10_12_21_avsv_00010.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/10_12_21_avsv_00012.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/10_12_21_avsv_00015.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/10_12_21_avsv_00016.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/10_12_21_avsv_00019.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/10_12_21_avsv_00001.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/avsv/10_12_21_avsv_00008.xls";

];

p1_sexc_filenames = [
   "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/05_11_21_sexc_00002.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/05_11_21_sexc_00006.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/05_11_21_sexc_00007.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/05_11_21_sexc_00010.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/05_11_21_sexc_00011.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/05_11_21_sexc_00012.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/05_11_21_sexc_00013.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/05_11_21_sexc_00019.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/12_11_21_sexc_00004.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/12_11_21_sexc_00007.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/12_11_21_sexc_00012.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/12_11_21_sexc_00013.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/12_11_21_sexc_00014.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/12_11_21_sexc_00016.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/12_11_21_sexc_00017.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/12_11_21_sexc_00018.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/12_11_21_sexc_00020.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/12_11_21_sexc_00021.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/12_11_21_sexc_00025.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/12_11_21_sexc_00026.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/12_11_21_sexc_00027.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/12_11_21_sexc_00029.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/12_11_21_sexc_00030.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/12_11_21_sexc_00031.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/12_11_21_sexc_00032.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/12_11_21_sexc_00033.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/22_03_08_sexc_00016.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/22_03_08_sexc_00018.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/22_03_08_sexc_00021.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/22_03_08_sexc_00022.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/22_03_08_sexc_00023.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/22_03_08_sexc_00025.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/22_03_08_sexc_00026.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/22_03_08_sexc_00028.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/22_03_08_sexc_00030.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/22_03_08_sexc_00031.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/22_03_08_sexc_00033.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/22_03_08_sexc_00034.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/22_03_11_sexc_00022.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/22_03_11_sexc_00025.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/22_03_11_sexc_00034.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/22_03_11_sexc_00036.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/22_03_11_sexc_00004.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/22_03_11_sexc_00006.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/22_03_11_sexc_00007.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/22_03_11_sexc_00015.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/22_03_11_sexc_00016.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/22_03_11_sexc_00020.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/22_03_11_sexc_00001.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR227AIY/sexc/22_03_11_sexc_00003.xls";
];
 

%% Input output directories
    %Input parent directories where Fm andPlot output data will go
    pdwtmock = "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/analysis output figs smoothed/indv neurons/AIY/224 wt/all_newanalysis/test_code forpubli/Fm/mock";
    pdwtavsv = "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/analysis output figs smoothed/indv neurons/AIY/224 wt/all_newanalysis/test_code forpubli/Fm/avsv";
    pdwtsexc = "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/analysis output figs smoothed/indv neurons/AIY/224 wt/all_newanalysis/test_code forpubli/Fm/sexc";
    
    pdp1mock = "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/analysis output figs smoothed/indv neurons/AIY/227 pdf1/all_newanalysis/test_code forpubli/Fm/mock";
    pdp1avsv = "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/analysis output figs smoothed/indv neurons/AIY/227 pdf1/all_newanalysis/test_code forpubli/Fm/avsv";
    pdp1sexc = "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/analysis output figs smoothed/indv neurons/AIY/227 pdf1/all_newanalysis/test_code forpubli/Fm/sexc";





%% Organise inputs into cell arrays

%cell array that holds cell arrays with all the input data filenames
allfilenames = {
    wt_mock_filenames wt_avsv_filenames wt_sexc_filenames;
    p1_mock_filenames p1_avsv_filenames p1_sexc_filenames
};

clear  wt_mock_filenames wt_avsv_filenames wt_sexc_filenames p1_mock_filenames p1_avsv_filenames p1_sexc_filenames 


%cell array where parent directories for R0plots output data will go
%must have same shape and correspondance as input matrix
pdirs_R0 = {
    pdwtmock pdwtavsv pdwtsexc;
    pdp1mock pdp1avsv pdp1sexc
    };

clear pdwtmock pdwtavsv pdwtsexc pdp1mock pdp1avsv pdp1sexc




%string array with the codes for each condition/genotype
codes = [
    "_wt_mock_" "_wt_avsv_" "_wt_sexc_";
    "_p1_mock_" "_p1_avsv_" "_p1_sexc_"
    ];




%% colors and parameters for plotting
purplergb   = [0.6039 0.1961 0.8039]; %colors in rgb code /255
grayrgb     = [0.7020 0.7020 0.7020];

mockgray    = [161 159 161]/255;
avsvgreen   = [40 243 40]/255;
sexcondpink = [249 138 122]/255;
pdf1purple  = [120 0 169]/255;
bluergb     = [179 204 255]/255;



%Set parameters for plotting
ploty1  = -0.1; %lower y axis limit for single traces plots
ploty2  = 1; %upper y axis limit for single traces plots
ploty1avg  = 0; %lower y axis limit for avg traces plots
ploty2avg  = 0.7; %upper y axis limit for avg traces plots
hmy1    = 0; %lower y axis limit for heatmaps nb this sets limit within which scale colors
hmy2    = 0.9; %upper y axis limit for heatmaps nb this sets limit within which scale colors
ylab = "F-Fmin/Fmax"; %y label





%set movie parameters
% movie is 220secs, recorded at 10 frames per second (experimentally is actually 9.9)
% baseline (prior to odour presentation) is 10 seconds
% then 30s odour, 30 seconds buffer, 30 seconds odour, 40 seconds buffer
% for this analysis use only first odour on/off, so first 150 seconds

bstart = 792;%first frame of baseline
fstart = 790; %frame where frames starts (before is nan)
bend = 891; %last frame of baseline
onend = 1188; %last frame of odour on
offend = 1485; %last frame of odour off
mend = 2079; %last frame of movie
timesecs = [80 90 120 150 180 210]; %vector containing timepoints in seconds (time since record start)
timeframes  = [792 892 1188 1485 1782 2079]; %vector containing timepoints in frames (time since record start)
timelabels=({'0' '10' '40' '70' '100' '130'});  %cell array containing timepoints in seconds (time since baseline start)
ycoords = [-10 -10 -10 -10 -10 ; +10 +10 +10 +10 +10; +10 +10 +10 +10 +10; -10 -10 -10 -10 -10 ]; %for patch function (plot background)
xcoords = [timesecs(1:end-1); timesecs(1:end-1); timesecs(2:end); timesecs(2:end)]; % for patch function (plot background)




%% here enter loop to go through each condition and genotype 
flsize = size(allfilenames);
for r = 1:flsize(1)
    for c = 1:flsize(2)
    
    %Set colors for plot background
    colors = [grayrgb; purplergb; grayrgb; purplergb; grayrgb]; 
    colors3d = colors( :,1);
    colors3d(:,:,2) = colors(:,2);
    colors3d(:,:,3) = colors(:,3);

    %Select parameters of files_to_analyse that corresponds to this condition
    %and genotype
    files_to_analyse = allfilenames{r,c}; %input files
    pdirR0 = pdirs_R0{r,c};               % output directories
    cond = codes(r,c);                    %code indicating genotype and condition
    strain_name = strcat(strain, cond, pars); %will be suffix for figures

    % create variables to hold accross-worm within-cond data in plotting script
    all_badjratios = []; %baseline-adjusted ratios (R-R0/R0)
    all_nadjratios = []; %normalised ratios (R-Rmin/Rmax)
    all_adjratios = [];  %if pars = Fm, this will be equal to normalised ratios (if pars = R0, will be equal to baseline-adjusted ratios)  
    col_names = {}; %cell array of strings to hold column names to use for output xlsx of all_adjratios

    
    
    %Here begin to cycle through individual files of this condition and
    %genotype
    for e = 1:length (files_to_analyse)
        fname = files_to_analyse(e);
        short_fname = erase(fname, ".xls");
        s= strfind(fname,'/');
        short_fname = extractAfter(short_fname,max(s));
      
        clear s
    
        %%
        %%import data and  assign to variables
        [data] = readmatrix(fname);
        
        raw_ratio = data(:,1);% raw GFP/RFP ratio
        ratios = smoothdata(raw_ratio,1,'movmedian',5); %smooth ratio with moving window of 5 frames median
        frames = data(:,2);    % frames 
        secs = data(:,3);      % seconds
        
        clear data

        
       

        %% Calculate adjusted ratio and plot

            %% Calculate adjusted ratio
    
    
            %Calculate baseline-adjusted ratio (R-R0 /R0)
            %R0 = avg of values during baseline period (10s prior to odour
            %presentation)
                R0 = mean(ratios(bstart:bend),'omitnan'); 
                badjratios = ((ratios - R0)/R0); %baseline adjusted ratio


            %Calculate fmax/min normalised ratio (f-Fmin/Fmax)
            %Fmin = avg of lowest 5% of values in the trace
            %Fmax = avg of highest 5% of values in the trace
                %sort all values in ratios from baseline start to end of movie in ascending order
                sortedratios = sort(ratios(bstart:offend));
                [vmax, max_index] = max(sortedratios);
                sortedratios = sortedratios(1:max_index); %remove rows that are nan (so beyond the max index)
                clear vmax max_index

                %calculate how many frames is 5% of frames, rounded to nearest integer
                p5=round(length(sortedratios)*0.05);
                
                %calculate F0 and Fmax
                F0 = mean(sortedratios(1:p5),'omitnan');
                Fmax = mean(sortedratios((end-p5):end),'omitnan');
                
                nadjratios = (ratios - F0)/(Fmax); %normalised ratio


                    
         if pars == "Fm"
                    adjratios = nadjratios; %adjratios = fmaxmin normalised ratios

         end


%% This code can be used to plot the individual traces of each worm before averaging
%             %% Plot
%             figure
%             hold on
%             ylim ([ploty1,ploty2]);
%             xlim ([timesecs(1), timesecs(end)]);
%             title(short_fname)
%             
%             % add shading for stim ON/OFF             
%             patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 )
%             plot(secs, adjratios,'Color',[0 0.4470 0.7410], 'LineWidth', 1.5)
%             plot(secs(2:end),sd_badjratios,'cyan','LineWidth', 1.5)
% 
% 
% 
%             xticks(timesecs) %s since baseline begins
%             xticklabels(timelabels) %time in secs since baseline begins
%             xlabel('Time (s)')
%             ylabel(ylab)
%              
%             % Save plot
%             singleplotname = strcat(strain_name, short_fname);
%             singleplotname = fullfile(pdirR0,singleplotname);
%             saveas(gcf,singleplotname,'png');
% %             singleplotname = strcat(singleplotname,'.eps');
% %             exportgraphics(gcf,singleplotname,'ContentType','vector');
%             close


            %% add current adjratios and short_fname to output
            %first need to make dimensions match
            %this fills shorter of two matrices with nans to match length of longer
            %this is necessary because not all videos have exactly the same
            %number of frames
            if e > 1
                maxl = max(length(all_adjratios), length(adjratios)) ; %maxl is length of longer matrix
                adjratios(end+1 : maxl) = NaN; %fills with nan from end of adjratios to maxl (if = doesnt change)
                all_adjratios(end+1 : maxl, :) = NaN; %fills with nan from end of all_adjratios to maxl, along ALL columns (if = doesnt change)

                
                badjratios(end+1 : maxl) = NaN; %fills with nan from end of adjratios to maxl (if = doesnt change)
                all_badjratios(end+1 : maxl, :) = NaN; %fills with nan from end of all_adjratios to maxl, along ALL columns (if = doesnt change)

                nadjratios(end+1 : maxl) = NaN; %fills with nan from end of adjratios to maxl (if = doesnt change)
                all_nadjratios(end+1 : maxl, :) = NaN; %fills with nan from end of all_adjratios to maxl, along ALL columns (if = doesnt change)


            end        
          
            %concatenate current adjratios to matrix of all_adjratios
            all_adjratios =[all_adjratios adjratios]; 

            all_badjratios = [all_badjratios badjratios];
            all_nadjratios = [all_nadjratios nadjratios];
            


            col_names{e} = short_fname; %add current figname to cell array storing names of all datasets
            


        
    end

        %%  Sort data by time to peak
        
        %First create transpose of all_adjratios (matrix with data from all
        %worms within condition and genotype)
        all_adjratiosT = all_adjratios'; %save transpose of all_adjratios (alladjratiosT has one worm per row, each column is one frame)
        avg_all_adjratios = mean(all_adjratios,2,'omitnan'); %take average across worms of adjusted ratio
        avg_all_adjratiosT = avg_all_adjratios';%save transpose of avg_all_adjratios

        %Set times within which will sort (odour ON window)
        allON   =  round(9.9*[90 120]); %corresponds to 10-40 secs (is 90-120 counting 80secbaseline)
        sorted_all_adjratiosT = all_adjratiosT; %create matrix that is same size and shape as alladjratiosT to hold sorted data
        sorted_col_names = col_names; %create matrix that is same size and shape as col_names to hold sorted column names
        
   
        times     = allON;
        window    =  all_adjratiosT(:,times(1):times(2));
        meanvalues = mean(window,2,'omitnan'); %returns, for each row(worm) the average  across all columns ie avg activation in that window
        [maxvalues, maxindex] = max(window,[],2); %returns, for each row(worm) the max  across all columns ie max activation in that window


        %Sort all_adjratiosT matrix by timetopeak
              %maxindex is the frame which contains the highest value during odour on
              %the position of the worm (ie how early its peak occurs
              %relative to the other worms) is contained in variable index
      
            [sorted_window, index] = sort(maxindex);
            for j = 1:length(index)
                i = index(j);
                sorted_all_adjratiosT(j,:) = all_adjratiosT(i,:);
                sorted_col_names{j} = col_names{i};
            
            end

        %% Use sorted data to categorise

        T2cutoff = round(9.9*T2cutoffinsecs); %T2 cutoff is cutoff time in frames since baseline starts
        type2 = [];
        type1 = [];
        cols_T1 = {};
        cols_T2 = {};
        for s = 1:length(files_to_analyse)
            this_maxindex = maxindex(s)+bend;
            if maxindex(s) > T2cutoff && all_nadjratios(this_maxindex,s) >= threshold %if max point of neuron is after T2cutoff point AND normalised ratio max value is above threshold 
                type2 = [type2 all_adjratios( :,s)]; %then categorise as type 2
                cols_T2 = [cols_T2 col_names(s)];
            
            else                        %all other neurons classed as "type1" 
                type1 = [type1 all_adjratios(:,s)];
                cols_T1 = [cols_T1 col_names(s)];
            end


        end
        clear s this_maxindex

        %% save  xls with maxindex(timetomax in s) and maxvalues (magnitude of peak) and type1 type2 excels
        maxindexs = maxindex/9.9; %convert maxindexs (frames) to seconds
        maxindexs_maxvals= [maxindexs maxvalues];
        maxindexsname = strcat(strain_name,'timetomax_maxvalue');
        maxindexsname = fullfile(pdirR0,maxindexsname);
        writematrix(maxindexs_maxvals,maxindexsname,'Filetype', 'spreadsheet'); %write avg to excel
        
        type1name = strcat(strain_name,'T1_single_traces');
        type1name = fullfile(pdirR0,type1name);
        type2name = strcat(strain_name,'T2_single_traces');
        type2name = fullfile(pdirR0,type2name);

        writematrix(type1,type1name,'Filetype', 'spreadsheet'); %write to excel
        writematrix(type2,type2name,'Filetype', 'spreadsheet'); %write to excel



        %% Plot Sorted heatmap
        
          figure
          sorted_all_adjratiosTavgodour = sorted_all_adjratiosT;
          
            %want to make nans transparent (0 = transparent, 1 = opaque) in heatmap  (will be white)
            %create matrix with 0 if alladjratios = nan and 1 if all adjratios = value
            nanmatrix = ones(size(sorted_all_adjratiosTavgodour));
            nanmatrix(isnan(sorted_all_adjratiosTavgodour)) = 0;
            

                imagesc(sorted_all_adjratiosTavgodour, 'AlphaData' , nanmatrix) %from baseline start to end of recording
                
                colormap parula;
                colorbar
                caxis ([hmy1 hmy2])
                xlim([bstart offend])
                xticks(timeframes) %frames since the recording begins
                xticklabels(timelabels) %time in secs since baseline begins
                xlabel('Time (s)')
                yticks(1:length(sorted_all_adjratiosTavgodour))
                yticklabels(sorted_col_names)
                ylabel('Neuron')
                title(strcat('Heatmap ', 'sorted',codes(r,c),"_",pars))
                hold on
                xline(times)
               
                
                %Save heatmap
                heatmapname = strcat(strain_name, 'heatmap', 'sorted');
                heatmapname = fullfile(pdirR0,heatmapname);
                saveas(gcf,heatmapname,'png');
                heatmapname = strcat(heatmapname,'.eps');
                exportgraphics(gcf,heatmapname,'ContentType','vector');
                close


        
        %% Plot average of all traces with SEM - separate Type1type2
     
        % calculate average excluding NaN
        avg_type1 = mean(type1,2,'omitnan');
        avg_type2 = mean(type2,2,'omitnan');
        secs = (1/9.9)*(0:(maxl-1))'; %to make sure secs vector matches all_adjratios

        figure
        ylim ([ploty1avg,ploty2avg]);
        xlim ([timesecs(1), timesecs(end)]);
        title(strcat('Average T1(', string(width(type1)), ') T2(', string(width(type2)), ') + SEM ', strain_name))
        %add shading for stim ON/OFF
        patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 )
        hold on
        
        %Add SEM
        %calculate SEM of all_adjratios

        SEM   = std(all_adjratios,0,2, 'omitnan')/sqrt(width(all_adjratios));%SEM vector for average of all neurons , sqrt(n) length of files to analyse is number of files to analyse
        t1SEM = std(type1,0,2, 'omitnan')/sqrt(width(type1)); %SEM vector for type 1 average
        t2SEM = std(type2,0,2, 'omitnan')/sqrt(width(type2)); %SEM vector for type 2 average

        %set bounds for SEM (adjratios +- SEM)
        meanPlusT1SEM = avg_type1 + t1SEM;
        meanMinusT1SEM = avg_type1 - t1SEM;

        meanPlusT2SEM = avg_type2 + t2SEM;
        meanMinusT2SEM = avg_type2 - t2SEM;
        
    
        %This generates the +/- SEM shading
        patch([secs(timeframes(1): timeframes(end))' flip(secs(timeframes(1): timeframes(end)))'], [meanPlusT1SEM(timeframes(1): timeframes(end))' flip(meanMinusT1SEM(timeframes(1): timeframes(end)))'],[0.3010, 0.7450, 0.9330], 'EdgeColor', 'none', 'FaceAlpha', 0.4); 
        patch([secs(timeframes(1): timeframes(end))' flip(secs(timeframes(1): timeframes(end)))'], [meanPlusT2SEM(timeframes(1): timeframes(end))' flip(meanMinusT2SEM(timeframes(1): timeframes(end)))'], [0 0.4470 0.7410], 'EdgeColor', 'none', 'FaceAlpha', 0.4); 


        %plot mean 
        plot(secs, avg_type1,'Color' ,[0.3010, 0.7450, 0.9330],'Linewidth', 1)
        plot(secs, avg_type2,'Color',[0 0.4470 0.7410] ,'Linewidth', 1)


        xticks(timesecs) %s since baseline begins
        xticklabels(timelabels) %time in secs since baseline begins
        xlabel('Time (s)')
        ylabel(ylab)
        
        %save plot
        SEMplotname = strcat(strain_name, 'SEMplotsep');
        SEMplotname = fullfile(pdirR0,SEMplotname);
        saveas(gcf,SEMplotname,'png');
        SEMplotname = strcat(SEMplotname,'.eps');
        exportgraphics(gcf,SEMplotname,'ContentType','vector');
         
%         close
   
        
        


        %% Save stuff
        %convert all_adjratios to table, change header of each column and write to excel
        Tall_adjratios = array2table(all_adjratios); %convert adjratios to table
        col_names = string(col_names); %convert cell array of strings to string array
        col_names = matlab.lang.makeValidName(col_names, 'Prefix', 'm');% convert col_names to valid variable names (must start with letter)
        Tall_adjratios.Properties.VariableNames(:) = col_names; 
        avgratiostimeSEM = [avg_all_adjratios secs SEM];
        
              
        allratiosname = strcat(strain_name, 'all');
        allratiosname = fullfile(pdirR0,allratiosname);
            
        avgratiosname = strcat(strain_name, 'avg');
        avgratiosname = fullfile(pdirR0,avgratiosname);
       
               
        writetable(Tall_adjratios, allratiosname,'Filetype', 'spreadsheet'); %write all adj ratios to excel 
        writematrix(avgratiostimeSEM,avgratiosname,'Filetype', 'spreadsheet'); %write avg to excel
        
        
       

        
    end

end