
%% Create list of matlab files to process, input characteristics of movie
 

filename_list = [


"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_02_avsv_00002.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_02_avsv_00003.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_02_avsv_00006.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_02_avsv_00008.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_02_avsv_00010.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_02_avsv_00012.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_02_avsv_00013.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_02_avsv_0013b.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_02_avsv_00016.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_02_avsv_0016b.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_02_avsv_00017.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_02_avsv_00019.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_02_avsv_00023.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_02_avsv_00025.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_02_avsv_00026.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_07_avsv_00003.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_07_avsv_00006.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_07_avsv_00007.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_07_avsv_00009.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_07_avsv_00010.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_07_avsv_00012.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_07_avsv_00014.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_07_avsv_00015.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_07_avsv_00018.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_07_avsv_00020.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_07_avsv_00022.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_07_avsv_00023.xls";
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/avsv/22_03_07_avsv_00025.xls";

];






strain_name = "MCM_avsv_R0Fmax"; %summary analysis (average, etc) will be saved with this name
purplergb = [0.6039 0.1961 0.8039]; %colors in rgb code /255
grayrgb = [0.7020 0.7020 0.7020];



% % % ylimits for MCM
ploty1  = -3; %lower y axis limit for single traces plots
ploty2  = +3; %upper y axis limit for single traces plots
ploty1avg  = -1; %lower y axis limit for avg traces plots
ploty2avg  = +1; %upper y axis limit for avg traces plots
hmy1    = -0.75; %lower y axis limit for heatmaps nb this sets limit within which scale colors
hmy2    = +1; %upper y axis limit for heatmaps nb this sets limit within which scale colors





% % baseline and time for 220smovie, 10fps, 10sec baseline, 30sON-30sOFF
bstart = 792;%first frame of baseline
bend = 891; %last frame of baseline
mend = 2079; %last frame of movie
timesecs = [80 90 120 150 180 210]; %vector containing timepoints in seconds (time since record start)
timeframes  = [792 892 1188 1485 1782 2079]; %vector containing timepoints in frames (time since record start)
timelabels=({'0' '10' '40' '70' '100' '130'});  %cell array containing timepoints in seconds (time since baseline start)
ycoords = [-10 -10 -10 -10 -10 ; +10 +10 +10 +10 +10; +10 +10 +10 +10 +10; -10 -10 -10 -10 -10 ]; %for patch
colors = [grayrgb; purplergb; grayrgb; purplergb; grayrgb]; 


%to exclude the artifact moments of the valve input those frames here
%create matrix of secs to plot [start1 end1; start2 end2; etc]
secstoinc   = [timesecs(1) 90; 95 120; 122.5 150; 155 180; 182.5 timesecs(end)];
framestoinc = round(secstoinc*9.9);


%create matrix of secs to remove [start1 end1; start2 end2; etc]
secstodel = [90 95; 120 122.5; 150 155; 180 182.5];
% secstodel = [90 92.5; 120 121.25; 150 152.5; 180 181.25]; permsv
framestodel = round(secstodel*9.9);


%% create variables to hold accross-worm data
all_adjratios     = [];
all_adjratios = [];
all_adjratiosdeltaF = [];
all_b             = [];
col_names         = {}; %cell array of strings to hold column names to use for output xlsx of all_adjratios


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



%% Calculations adjusted ratiios

% for uncorrected ratios BLUE
%calculate R0
R0 = mean(ratios(bstart:bend),'omitnan'); %enter baseline frames
%calculate baseline-adjusted ratios (R-R0 /R0)
adjratios = ((ratios - R0)/R0);
%this filters the data to remove artifacts 5 frames
adjratios = smoothdata(adjratios, 1, 'movmedian', 5); 



%on uncorrected ratios calculate AF/F in PURPLE
%first remove artifact frames
for j = 1:4
    pstart = framestodel(j,1);
    pend   = framestodel(j,2);
    ratios(pstart:pend) = NaN;
    clear pstart pend
end
clear j

%calculate min and max
sortedratios = sort(ratios(bstart:mend)); %sort only the portion of movie for which we have data ie after frame 792
[vmax, max_index] = max(sortedratios);
sortedratios = sortedratios(1:max_index);
p5=round(length(sortedratios)*0.05);
minratios = mean(sortedratios(1:p5),'omitnan');
maxratios = mean(sortedratios((end-p5):end),'omitnan');

%calculate deltaF/Fmax-fmin
adjratiosdeltaF = (ratios - minratios)/ (maxratios-minratios);
% % adjratiosdeltaF = (ratios - minratios)/ (maxratios);


%smooth
adjratiosdeltaF = smoothdata(adjratiosdeltaF, 1, 'movmedian', 5); 

% % %now move it so last frame of baseline is at 0
% % adjratiosdeltaF = adjratiosdeltaF - adjratiosdeltaF(bend);



%% Plot adjusted ratios baseline vs fmax
figure
hold on
plot(seconds, adjratios,'Color',[0 0.4470 0.7410], 'LineWidth', 1.5) %blue is R-R0
plot(seconds(:), adjratiosdeltaF,'Color' ,[0.4940 0.1840 0.5560], 'LineWidth', 1.5) %Purple is deltaF/fmax-fmin


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
saveas(gcf,singleplotname,'png');





%% add current matrices and fig_name to output
%first need to make dimensions match
%this fills shorter of two matrices with nans to match length of longer
if i > 1
    maxl = max(length(all_adjratios), length(adjratios)) ; %maxl is length of longer matrix
    %adjratios is R-R0/R0 
    adjratios(end+1 : maxl) = NaN; %fills with nan from end of adjratios to maxl (if = doesnt change)
    all_adjratios(end+1 : maxl, :) = NaN; %fills with nan from end of all_adjratios to maxl, along ALL columns (if = doesnt change)

    
    %do the same for deltaF/fmax ratios without background substr
    adjratiosdeltaF(end+1 : maxl)  = NaN;
    all_adjratiosdeltaF(end+1 : maxl, :) = NaN;


end        



all_adjratios =[all_adjratios adjratios]; %concatenate current adjratios to matrix of all_adjratios
all_adjratiosdeltaF = [all_adjratiosdeltaF adjratiosdeltaF];
col_names{i} = fig_name; %add current figname to cell array storing names of all datasets





end

%% plot average of all traces with SEM

all_secs = (1/9.9)*(0:(maxl-1)); %1/9.9 is how many seconds each frame lasts for
all_secs = all_secs'; %converts result of previous (row vector) to column vector 


% %calculate average excluding NaN
avg_all_adjratios     = mean(all_adjratios,2,'omitnan');
avg_all_adjratiosdeltaF = mean(all_adjratiosdeltaF,2,'omitnan');


figure
ylim ([ploty1avg,ploty2avg]);
xlim ([timesecs(1), timesecs(end)]);
title(strcat('Average all traces+SEM ', strain_name))
%add shading for stim ON/OFF
patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 )
hold on

%Add SEMs

        %calculate SEM of all_adjratios
        SEM = std(all_adjratios,0,2, 'omitnan')/sqrt(n);
        %set bounds for SEM (adjratios +- SEM)
        meanPlusSEM = avg_all_adjratios + SEM;
        meanMinusSEM = avg_all_adjratios - SEM;
        %This generates the +/- SEM shading
        patch([all_secs(timeframes(1): end)' flip(all_secs(timeframes(1): end))'], [meanPlusSEM(timeframes(1): end)' flip(meanMinusSEM(timeframes(1): end))'],[0 0.4470 0.7410], 'EdgeColor', 'none', 'FaceAlpha', 0.4); 
        clear SEM meanPlusSEM meanMinusSEM


        %calculate SEM of all_adjratiospCDF
        SEM = std(all_adjratiosdeltaF,0,2, 'omitnan')/sqrt(n);
        %set bounds for SEM (adjratios +- SEM)
        meanPlusSEM = avg_all_adjratiosdeltaF + SEM;
        meanMinusSEM = avg_all_adjratiosdeltaF - SEM;
        %This generates the +/- SEM shading
           
        for j = 1:5
          patch([all_secs(framestoinc(j,1): framestoinc(j,2))' flip(all_secs(framestoinc(j,1): framestoinc(j,2)))'], [meanPlusSEM(framestoinc(j,1): framestoinc(j,2))' flip(meanMinusSEM(framestoinc(j,1): framestoinc(j,2)))'],[0.4940 0.1840 0.5560], 'EdgeColor', 'none', 'FaceAlpha', 0.2);            
        end
        clear j

        clear SEM meanPlusSEM meanMinusSEM


%plot mean 
plot(all_secs, avg_all_adjratios,'Linewidth', 1,'Color',[0 0.4470 0.7410] )% R-R0/R0 in BLUE
plot(all_secs, avg_all_adjratiosdeltaF,'Linewidth', 1, 'Color', [0.4940 0.1840 0.5560]) %deltaF in purple
xticks(timesecs) %s since baseline begins
xticklabels(timelabels) %time in secs since baseline begins
xlabel('Time (s)')
ylabel('(R - R0)/R0 & deltaF')

%save plot
SEMplotname = strcat(strain_name, 'SEMplot');
saveas(gcf,SEMplotname,'png');





% % saves background-corrected excels
% %convert all_adjratios to table, change header of each column and write to excel
% Tall_adjratios = array2table(all_adjratios); %convert adjratios to table
% col_names = string(col_names); %convert cell array of strings to string array
% col_names = matlab.lang.makeValidName(col_names, 'Prefix', 'm');% convert col_names to valid variable names (must start with letter)
% Tall_adjratios.Properties.VariableNames(:) = col_names; 
% avgratiostimeSEM = [avg_all_adjratios all_secs SEM];
% 
% 
% allratiosname = strcat(strain_name, 'all_corrected');
% avgratiosname = strcat(strain_name, 'avg_corrected');
% writetable(Tall_adjratios, allratiosname,'Filetype', 'spreadsheet'); %write all adj ratios to excel 
% writematrix(avgratiostimeSEM,avgratiosname,'Filetype', 'spreadsheet'); %write avg to excel
% 





%% Plot all traces +average AR/R0

figure
plot(all_secs, all_adjratios,'LineWidth', 0.6)

hold on
plot(all_secs, avg_all_adjratios, 'k', 'LineWidth', 1.5)



ylim ([ploty1avg,ploty2avg]);
xlim ([timesecs(1), timesecs(end)]);
title(strcat('Single Traces + AVG R0', strain_name))
%add shading for stim ON/OFF
patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 )
hold on


xticks(timesecs) %s since baseline begins
xticklabels(timelabels) %time in secs since baseline begins
xlabel('Time (s)')
ylabel('(R - R0)/R0')

alltraceavgname = strcat(strain_name, 'alltavgplot_R0');
saveas(gcf,alltraceavgname,'png');

%% Plot all traces +average deltaF

figure
plot(all_secs, all_adjratiosdeltaF,'LineWidth', 0.6)

hold on
plot(all_secs, avg_all_adjratiosdeltaF, 'k', 'LineWidth', 1.5)



ylim ([-0.5,1.5]);
xlim ([timesecs(1), timesecs(end)]);
title(strcat('Single Traces + AVG deltaF ', strain_name))
%add shading for stim ON/OFF
patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 )
hold on


xticks(timesecs) %s since baseline begins
xticklabels(timelabels) %time in secs since baseline begins
xlabel('Time (s)')
ylabel('(F-FMax/Fmax-Fmin')

alltraceavgname = strcat(strain_name, 'alltavgplot_Fmax');
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
odour(timeframes(4):timeframes(5)) = hmy2; %odour on 2
odour(timeframes(5):timeframes(6)) = hmy1; %odour off 2

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

heatmapname = strcat(strain_name, 'heatmapcorected');
saveas(gcf,heatmapname,'png');


%% 



% % % %% Save stuff
% % % 
% % % % saves background-corrected 
% % % 
% % % 
% % % %convert all_adjratios to table, change header of each column and write to excel
% % % Tall_adjratios = array2table(all_adjratios); %convert adjratios to table
% % % col_names = matlab.lang.makeValidName(col_names, 'Prefix', 'm');% convert col_names to valid variable names (must start with letter)
% % % Tall_adjratios.Properties.VariableNames(:) = col_names; 
% % % avgratiostimeSEM = [avg_all_adjratios all_secs SEM];
% % % 
% % % 
% % % allratiosname = strcat(strain_name, 'all_corrected');
% % % avgratiosname = strcat(strain_name, 'avg_corrected');
% % % writetable(Tall_adjratios, allratiosname,'Filetype', 'spreadsheet'); %write all adj ratios to excel 
% % % writematrix(avgratiostimeSEM,avgratiosname,'Filetype', 'spreadsheet'); %write avg to excel
% % % 
% % % 
% % % 
% % % % saves NON background-corrected 
% % % %convert all_adjratios to table, change header of each column and write to excel
% % % Tall_adjratios = array2table(all_adjratios); %convert adjratios to table
% % % col_names = matlab.lang.makeValidName(col_names, 'Prefix', 'm');% convert col_names to valid variable names (must start with letter)
% % % Tall_adjratios.Properties.VariableNames(:) = col_names; 
% % % avgratiostimeSEM = [avg_all_adjratios all_secs SEM];
% % % 
% % % 
% % % allratiosname = strcat(strain_name, 'all_noncorrected');
% % % avgratiosname = strcat(strain_name, 'avg_noncorrected');
% % % writetable(Tall_adjratios, allratiosname,'Filetype', 'spreadsheet'); %write all adj ratios to excel 
% % % writematrix(avgratiostimeSEM,avgratiosname,'Filetype', 'spreadsheet'); %write avg to excel
% % % 



% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/mock/22_02_28_mock_00014.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/mock/22_02_28_mock_00001.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/mock/22_02_28_mock_00002.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/mock/22_02_28_mock_00003.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/mock/22_02_28_mock_00006.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/mock/22_02_28_mock_00009.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/mock/22_02_28_mock_0009b.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/mock/22_02_28_mock_00010.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/mock/22_02_28_mock_00011.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/mock/22_03_07_mock_00001.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/mock/22_03_07_mock_00002.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/mock/22_03_07_mock_00003.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/mock/22_03_07_mock_00005.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/mock/22_03_07_mock_00007.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/mock/22_03_07_mock_00008.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/mock/22_03_07_mock_00010.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/mock/22_03_07_mock_00012.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/mock/22_03_07_mock_00014.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/mock/22_03_07_mock_00015.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/mock/22_03_07_mock_00017.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/mock/22_03_07_mock_00021.xls";





% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_22_sexc_00001.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_22_sexc_00005.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_22_sexc_00008.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_22_sexc_00010.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_22_sexc_00012.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_22_sexc_0012b.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_22_sexc_00013.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_22_sexc_00015.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_22_sexc_00016.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_22_sexc_00019.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_22_sexc_00022.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_22_sexc_00024.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_22_sexc_00025.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_22_sexc_00027.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_22_sexc_00028.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_25_sexc_00002.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_25_sexc_00003.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_25_sexc_00006.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_25_sexc_00008.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_25_sexc_00012.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_25_sexc_00014.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_25_sexc_00015.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_25_sexc_00021.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_25_sexc_00024.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_02_25_sexc_00026.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00001.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00002.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00004.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00005.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00008.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00009.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00013.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00014.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00015.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00017.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00018.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00021.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00024.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00027.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00028.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00032.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00033.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00035.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00036.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00038.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00039.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00041.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00044.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00045.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_01_sexc_00046.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_02_sexc_00002.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_02_sexc_00004.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_02_sexc_00008.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_02_sexc_00009.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_02_sexc_00010.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_02_sexc_00012.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_02_sexc_00015.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_02_sexc_00016.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_02_sexc_00018.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_02_sexc_00020.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_02_sexc_00021.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_02_sexc_00023.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_02_sexc_00025.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_02_sexc_00028.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_08_sexc_00001.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_08_sexc_00003.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_08_sexc_00006.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_08_sexc_00008.xls";
% "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR249MCM/sexc/22_03_08_sexc_00010.xls";
% 



