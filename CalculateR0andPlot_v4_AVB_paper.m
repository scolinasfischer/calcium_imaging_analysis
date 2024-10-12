% Final edit April 2023 Susana Colinas Fischer 


% This scrip is meant to analyse the green/red fluorescence ratio of the
% AVB neurons. It accepts as input a list of .xls files produced by the
% "ExtractRatiosToExcel script".The steps in analysis are:
%   - Calculate the baseline-adjusted ratio for each worm
%   - Calculate the average baseline-adjusted ratio across all worms
% This script must be run separately on the filelist of all 3 conditions. 



%INPUT
% .xls files 


%OUTPUT
% .avg and .all files
% single worm plots
% average within condition


%% Create list of matlab files to process, input characteristics of movie
 

filename_list = [

"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_07_avsv_00001.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_07_avsv_00003.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_07_avsv_00005.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_07_avsv_00008.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_07_avsv_00012.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_07_avsv_00014.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_07_avsv_00016.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_07_avsv_00018.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_07_avsv_00020.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_07_avsv_00026.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_07_avsv_00028.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_11_avsv_00002.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_11_avsv_00004.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_11_avsv_00013.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_11_avsv_00015.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_11_avsv_00018.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_11_avsv_00021.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_11_avsv_00023.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_11_avsv_00026.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_11_avsv_00029.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_18_avsv_00011.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_18_avsv_00013.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_18_avsv_00015.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_18_avsv_00018.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_18_avsv_00022.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_18_avsv_0024a.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_18_avsv_0024b.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_18_avsv_00026.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249 AVB/avsv/22_10_18_avsv_00028.xls";

];




strain_name = "AVB_avsv"; %summary analysis (average, etc) will be saved with this name

%set parent directory to save output plots
pdir = "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/analysis output figs smoothed/indv neurons/AVB/avsv" ; 


purplergb = [0.6039 0.1961 0.8039]; %colors in rgb code /255
grayrgb = [0.7020 0.7020 0.7020];


% % ylimits for AVB
ploty1  = -0.5; %lower y axis limit for single traces plots
ploty2  = +0.5; %upper y axis limit for single traces plots
ploty1avg  = -0.5; %lower y axis limit for avg traces plots
ploty2avg  = +0.5; %upper y axis limit for avg traces plots
hmy1    = -0.75; %lower y axis limit for heatmaps nb this sets limit within which scale colors
hmy2    = +0.75; %upper y axis limit for heatmaps nb this sets limit within which scale colors



% % baseline and time for 220smovie, 10fps, 10sec baseline, 30sON-30sOFF-30sON-30sOFF
bstart = 792;%first frame of baseline
bend = 891; %last frame of baseline
mend = 2079; %last frame of movie
timesecs = [80 90 120 150 180 210]; %vector containing timepoints in seconds (time since record start)
timeframes  = [792 892 1188 1485 1782 2079]; %vector containing timepoints in frames (time since record start)
timelabels=({'0' '10' '40' '70' '100' '130'});  %cell array containing timepoints in seconds (time since baseline start)
ycoords = [-10 -10 -10 -10 -10 ; +10 +10 +10 +10 +10; +10 +10 +10 +10 +10; -10 -10 -10 -10 -10 ]; %for patch
colors = [grayrgb; purplergb; grayrgb; purplergb; grayrgb]; 
% 





%% create variables to hold accross-worm data
all_adjratios = [];
col_names = {}; %cell array of strings to hold column names to use for output xlsx of all_adjratios


%% Cycle through each filename in list, name variables
[n, m] = size(filename_list);
for i = 1:n
    
filename = filename_list(i,:); %set filename to one of filenames in list
data = readmatrix(filename); %read saved excel, import entire matrix
%data columns are-> ratios  frames  seconds
ratios = data(:,1);
frames = data(:,2);
seconds = data(:,3);


%set name for plot output files
fig_name = erase(filename,".xls");
s= strfind(fig_name,'/');
fig_name = extractAfter(fig_name,max(s));
clear s



%% Calculations adjusted ratios

%R-R0/R0
%calculate R0
R0 = mean(ratios(bstart:bend),'omitnan'); %enter baseline frames

%calculate baseline-adjusted ratios (R-R0 /R0)
adjratios = ((ratios - R0)/R0);

%this filters the data to remove artifacts 5 frames
adjratios = smoothdata(adjratios, 1, 'movmedian', 5); 








%% Plot
figure
plot(seconds, adjratios,'Color',[0 0.4470 0.7410], 'LineWidth', 1.5)
ylim ([ploty1,ploty2]);
xlim ([timesecs(1), timesecs(end)]);

title(fig_name)

% add shading for stim ON/OFF
xcoords = [timesecs(1:end-1); timesecs(1:end-1); timesecs(2:end); timesecs(2:end)];



colors3d = colors( :,1);
colors3d(:,:,2) = colors(:,2);
colors3d(:,:,3) = colors(:,3);

patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 )

xticks(timesecs) %s since baseline begins
xticklabels(timelabels) %time in secs since baseline begins
xlabel('Time (s)')
ylabel('(R - R0)/R0')
 
% Save plot  .png
singleplotname = strcat(strain_name, fig_name);
singleplotname = fullfile(pdir,singleplotname);
saveas(gcf,singleplotname,'png');





%% add current adjratios and fig_name to output
%first need to make dimensions match
%this fills shorter of two matrices with nans to match length of longer
if i > 1
    maxl = max(length(all_adjratios), length(adjratios)) ; %maxl is length of longer matrix
    adjratios(end+1 : maxl) = NaN; %fills with nan from end of adjratios to maxl (if = doesnt change)
    all_adjratios(end+1 : maxl, :) = NaN; %fills with nan from end of all_adjratios to maxl, along ALL columns (if = doesnt change)
end        



all_adjratios =[all_adjratios adjratios]; %concatenate current adjratios to matrix of all_adjratios
col_names{i} = fig_name; %add current figname to cell array storing names of all datasets


end

%% plot average of all traces with SEM
% 
% % note number of columns with data for each time point
% npertimepoint = sum(~isnan(all_adjratios),2); %sum accross each row all the numbers that are not NaN
%make seconds vector to match length of all_adjratios to plot avg
all_secs = (1/9.9)*(0:(maxl-1)); %1/9.9 is how many seconds each frame lasts for
all_secs = all_secs'; %converts result of previous (row vector) to column vector 




% %calculate average excluding NaN
avg_all_adjratios = mean(all_adjratios,2,'omitnan');


figure
ylim ([ploty1avg,ploty2avg]);
xlim ([timesecs(1), timesecs(end)]);
title(strcat('Average all traces+SEM ', strain_name))
%add shading for stim ON/OFF
patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 )
hold on

%Add SEM
%calculate SEM of all_adjratios
SEM = std(all_adjratios,0,2, 'omitnan')/sqrt(n);
%set bounds for SEM (adjratios +- SEM)
meanPlusSEM = avg_all_adjratios + SEM;
meanMinusSEM = avg_all_adjratios - SEM;


%This generates the +/- SEM shading
patch([all_secs(timeframes(1): end)' flip(all_secs(timeframes(1): end))'], ...
    [meanPlusSEM(timeframes(1): end)' flip(meanMinusSEM(timeframes(1): end))'], ...
    [0 0.4470 0.7410], 'EdgeColor', 'none', 'FaceAlpha', 0.4); 

%plot mean 
plot(all_secs, avg_all_adjratios,'Linewidth', 1)



xticks(timesecs) %s since baseline begins
xticklabels(timelabels) %time in secs since baseline begins
xlabel('Time (s)')
ylabel('(R - R0)/R0')

%save plot
SEMplotname = strcat(strain_name, 'SEMplot');
SEMplotname = fullfile(pdir,SEMplotname);
saveas(gcf,SEMplotname,'png');





%% Plot all traces +average 

figure
plot(all_secs, all_adjratios,'LineWidth', 0.6)
% plot(all_secs, all_adjratios,'Color', [0.7529 0.7529 0.7529])

hold on
plot(all_secs, avg_all_adjratios, 'k', 'LineWidth', 1.5)

ylim ([ploty1,ploty2]);
xlim ([timesecs(1), timesecs(end)]);
title(strcat('Single Traces + AVG ', strain_name))
%add shading for stim ON/OFF
patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 )
hold on


xticks(timesecs) %s since baseline begins
xticklabels(timelabels) %time in secs since baseline begins
xlabel('Time (s)')
ylabel('(R - R0)/R0')

alltraceavgname = strcat(strain_name, 'alltavgplot');
alltraceavgname = fullfile(pdir,alltraceavgname);
saveas(gcf,alltraceavgname,'png');


%% Plot heatmap
figure

all_adjratiosT = all_adjratios'; %save transpose of all_adjratios
avg_all_adjratiosT = avg_all_adjratios';%save transpose of avg_all_adjratios

%create vector to indicate odour on and off periods
odour = zeros(1,length(all_adjratiosT)); 
odour(timeframes(1):timeframes(2)) = hmy1; %odour off (baseline)
odour(timeframes(2):timeframes(3)) = hmy2; %odour on 1
odour(timeframes(3):timeframes(4)) = hmy1; %odour off 1


%append average to all_adjratiosT matrix (top row)
%append odour vector to all_adjratiosT matrix (bottom row)
all_adjratiosT = [avg_all_adjratiosT; all_adjratiosT; odour];


%want to make nans transparent (0 = transparent, 1 = opaque) in plot (will be white)
%create matrix with 0 if alladjratios = nan and 1 if all adjratios = value
nanmatrix = ones(size(all_adjratiosT));
nanmatrix(isnan(all_adjratiosT)) = 0;


imagesc(all_adjratiosT, 'AlphaData' , nanmatrix) %from baseline start to end of recording

colormap parula;
colorbar
%caxis ( [min(all_adjratios, [], 'all') max(all_adjratios, [], 'all')])
caxis ([hmy1 hmy2])
xlim([bstart mend])

xticks(timeframes) %frames since the recording begins
xticklabels(timelabels) %time in secs since baseline begins
xlabel('Time (s)')
yticks(1:length(all_adjratios))
yticklabels([{'AVERAGE'} col_names {'ODOUR'}])
ylabel('Neuron')




%Save heatmap

heatmapname = strcat(strain_name, 'heatmap');
heatmapname = fullfile(pdir,heatmapname);
saveas(gcf,heatmapname,'png');



%% Save stuff




%convert all_adjratios to table, change header of each column and write to excel
Tall_adjratios = array2table(all_adjratios); %convert adjratios to table
col_names = string(col_names);
col_names = matlab.lang.makeValidName(col_names, 'Prefix', 'm');% convert col_names to valid variable names (must start with letter)
Tall_adjratios.Properties.VariableNames(:) = col_names; 
avgratiostimeSEM = [avg_all_adjratios all_secs SEM];

allratiosname = strcat(strain_name, 'all');
allratiosname = fullfile(pdir,allratiosname);

avgratiosname = strcat(strain_name, 'avg');
avgratiosname = fullfile(pdir,avgratiosname);

writetable(Tall_adjratios, allratiosname,'Filetype', 'spreadsheet'); %write all adj ratios to excel 
writematrix(avgratiostimeSEM,avgratiosname,'Filetype', 'spreadsheet'); %write avg to excel

