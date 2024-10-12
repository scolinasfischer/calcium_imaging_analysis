

% calculate bLOW as well as onLOW
% get output of bLOW for histo and prop plots

% using full movie (ie including 30s baseline) for Fmax calculation and R0
%to make it use 10s, edit bstart value in inputs to be 990




%% list of matlab files to process, input characteristics of movie
 
%% RIM

strain = "RIM_R010on_newandold"; %summary analysis (average, etc) will be saved with this name


mock_filenames = [
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_09_mock_p0002.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_09_mock_p0003.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_09_mock_p0008.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_09_mock_p0011.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_09_mock_p0012.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_09_mock_p0014.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_16_mock_p0001.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_16_mock_p0003.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_16_mock_p0004.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_21_mock_p0001.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_21_mock_p0002.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_21_mock_p0003.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_21_mock_p0006.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_23_mock_p0002.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_23_mock_p0004.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_23_mock_p0005.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_23_mock_p0006.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_23_mock_p0012.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_23_mock_p0013.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_23_mock_p0015.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_23_mock_p0017.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_23_mock_p0018.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_23_mock_p0020.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_23_mock_p0022.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_03_23_mock_p0024.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_04_29_mock_p0001.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_04_29_mock_p0002.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_04_29_mock_p0004.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_04_29_mock_p0005.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_04_29_mock_p0007.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_04_29_mock_p0008.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_04_29_mock_p0010.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_04_29_mock_p0011.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_04_29_mock_p0013.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_04_29_mock_p0014.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_04_29_mock_p0016.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_04_29_mock_p0017.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_04_29_mock_p0018.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_05_04_mock_p0002.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_05_04_mock_p0003.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_05_04_mock_p0006.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_05_04_mock_p0008.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_05_04_mock_p0009.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_05_04_mock_p0011.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_05_04_mock_p0012.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_05_04_mock_p0016.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_05_11_mock_p0002.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_05_11_mock_p0004.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_05_11_mock_p0005.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_05_11_mock_p0006.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_05_11_mock_p0008.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_05_11_mock_p0009.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_05_11_mock_p0010.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_05_11_mock_p0012.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_05_11_mock_p0014.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_05_11_mock_p0017.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_05_11_mock_p0019.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/mock/22_05_11_mock_p0020.xls"

];

avsv_filenames = [
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_09_avsv_p0001.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_09_avsv_p0003.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_09_avsv_p0004.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_09_avsv_p0005.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_09_avsv_p0006.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_09_avsv_p0009.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_09_avsv_p0011.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_09_avsv_p0013.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_09_avsv_p0017.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_21_avsv_p0002.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_21_avsv_p0003.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_21_avsv_p0005.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_21_avsv_p0006.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_23_avsv_p0001.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_23_avsv_p0006.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_23_avsv_p0009.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_23_avsv_p0011.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_23_avsv_p0013.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_23_avsv_p0014.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_23_avsv_p0015.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_23_avsv_p0016.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_23_avsv_p0018.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_23_avsv_p0019.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_23_avsv_p0021.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_23_avsv_p0023.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_03_23_avsv_p0024.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_05_04_avsv_p0001.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_05_04_avsv_p0002.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_05_04_avsv_p0004.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_05_04_avsv_p0005.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_05_04_avsv_p0007.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_05_04_avsv_p0008.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_05_04_avsv_p0011.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_05_04_avsv_p0012.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_05_04_avsv_p0013.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_05_04_avsv_p0015.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_05_04_avsv_p0016.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_05_04_avsv_p0017.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_05_11_avsv_p0001.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_05_11_avsv_p0002.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_05_11_avsv_p0003.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_05_11_avsv_p0005.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_05_11_avsv_p0006.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_05_11_avsv_p0007.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_05_11_avsv_p0009.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_05_11_avsv_p0010.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_05_11_avsv_p0012.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_05_11_avsv_p0013.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_05_11_avsv_p0015.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/avsv/22_05_11_avsv_p0016.xls"

];


sexc_filenames = [
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_16_sexc_p0001.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_16_sexc_p0002.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_16_sexc_p0008.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_16_sexc_p0009.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_16_sexc_p0012.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_16_sexc_p0014.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_16_sexc_p0016.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_16_sexc_p0018.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_21_sexc_p0001.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_21_sexc_p0002.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_21_sexc_p0004.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_21_sexc_p0005.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_21_sexc_p0007.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_21_sexc_p0008.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_21_sexc_p0010.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_21_sexc_p0011.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_21_sexc_p0012.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_21_sexc_p0014.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_21_sexc_p0015.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_21_sexc_p0016.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_21_sexc_p0018.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_21_sexc_p0019.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_21_sexc_p0020.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_21_sexc_p0022.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_21_sexc_p0024.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_21_sexc_p0026.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_21_sexc_p0027.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_21_sexc_p0028.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_21_sexc_p0031.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_21_sexc_p0032.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_21_sexc_p0033.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_21_sexc_p0035.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_22_sexc_p0037.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_22_sexc_p0039.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_22_sexc_p0040.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_22_sexc_p0042.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_22_sexc_p0044.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_03_22_sexc_p0046.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_04_01_sexc_p0001.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_04_01_sexc_p0004.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_04_01_sexc_p0005.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_04_01_sexc_p0007.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_04_01_sexc_p0008.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_04_01_sexc_p0009.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_04_01_sexc_p0011.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_04_01_sexc_p0012.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_04_01_sexc_p0013.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_04_01_sexc_p0015.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_04_01_sexc_p0016.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_04_01_sexc_p0018.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_04_01_sexc_p0019.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_04_01_sexc_p0020.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_04_01_sexc_p0022.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_04_01_sexc_p0023.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_04_01_sexc_p0024.xls"
"/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/xls files/BAR253RIM/proj/sexc/22_04_01_sexc_p0026.xls"

];





%all colours
purplergb = [0.6039 0.1961 0.8039]; %colors in rgb code /255
mockgray    = [161 159 161]/255;
avsvgreen   = [40 243 40]/255;
sexcondpink = [249 138 122]/255;
bluergb     = [179 204 255]/255;
grayrgb     = [0.7020 0.7020 0.7020];

%% here summary matrices holding submatrices
%Input parent directories where R0 and Plot output data will go
pdmock = "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/analysis output figs smoothed/indv neurons/RIM/projection/separated by lohi states/24_06_03_get xls indvneuron/mock";
pdavsv = "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/analysis output figs smoothed/indv neurons/RIM/projection/separated by lohi states/24_06_03_get xls indvneuron/avsv";
pdsexc = "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/analysis output figs smoothed/indv neurons/RIM/projection/separated by lohi states/24_06_03_get xls indvneuron/sexc";



%Input parent directories where 3condplots output data will go
pdir3c = "/Volumes/groupfolders/DBIO_Barrios_Lab/IMAGING/analysis output figs smoothed/3conditions/RIM/24_06_03_get xls indvneuron";





%cell array that holds cell arrays with all the input data filenames
allfilenames = {
    mock_filenames avsv_filenames sexc_filenames  
};

clear  mock_filenames avsv_filenames sexc_filenames


%cell array where parent directories for R0plots output data will go
%must have same shape and correspondance as input matrix
pdirs_R0 = {
    pdmock pdavsv pdsexc;
    };

clear pdmock pdavsv pdsexc

%string array with the codes for each condition/zone
codes = [
    "_mock_" "_avsv_" "_sexc_"
    ];




%%

% ylimits for AIB FMAX
ploty1  = 0; %lower y axis limit for single traces plots FM
ploty2  = +1; %upper y axis limit for single traces plots FM
plotry1 = -1;  %lower y axis limit for single traces plots R0
plotry2 = 6.5; %upper y axis limit for single traces plots R0
ploty1avg  = 0; %lower y axis limit for avg traces plots
ploty2avg  = 1; %upper y axis limit for avg traces plots
hmy1    = -0; %lower y axis limit for heatmaps nb this sets limit within which scale colors
hmy2    = 1; %lower y axis limit for heatmaps nb this sets limit within which scale colors






%% RIM
% % % % this version for 30s baseline!!!!!
% baseline and time for 220smovie, 10fps, 10sec baseline, 30sON-30sOFF 
% only using 1 ON 1 OFF for plots, but use the full  movie (220s) to calculate Fmax and F0 
prebstart = 792; %first frame of movie, not using baseline in this script but may need this timepoint for sth else
bstart = 792;%first frame of baseline
bend = 891; %last frame of baseline
last10ON = 1089; %10s before end of odour on - to use this window fro R0 
ONend = 1188; %last frame of odor ON
OFFend = 1485; % last frame of odour OFF
mend = 2079;%last frame of movie 
timesecs = [80 90 120 150]; %vector containing timepoints in seconds (time since record start)
timeframes  = [792 891 1188 1485]; %vector containing timepoints in frames (time since record start)
timelabels=({'0' '10' '40' '70'});  %cell array containing timepoints in seconds (time since baseline start)






ycoords = [-10 -10 -10  ; +10 +10 +10 ; +10 +10 +10 ; -10 -10 -10 ]; %for patch
xcoords = [timesecs(1:end-1); timesecs(1:end-1); timesecs(2:end); timesecs(2:end)];




flsize = size(allfilenames);
for r = 1:flsize(1)
    for c = 1:flsize(2)
        colors = [grayrgb; purplergb; grayrgb]; 
        colors3d = colors( :,1);
        colors3d(:,:,2) = colors(:,2);
        colors3d(:,:,3) = colors(:,3);
    
        files_to_analyse = allfilenames{r,c};
        %set all parent directories
        pdirR0 = pdirs_R0{r,c};
        cond = codes(r,c);
        strain_name = strcat(strain, cond); 
    
        %% create variables to hold accross-worm within-cond data in plotting script
    
        all_adjratios = [];
        all_adjratios_D = [];
        all_adjratios_d = [];
        col_names = {}; %cell array of strings to hold column names to use for output xlsx of all_adjratios
    
    
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
        
            
            
            
            
            
            
            
            %% Calculations adjusted ratios
            
            
            
            %original deltaR/R0
            %R-R0/R0
            %calculate R0
            % R0 = mean(ratios(bstart:bend),'omitnan'); %enter baseline frames
            % R0 = mean(ratios(halfon:ONend),'omitnan'); %for checking if R0 should be end of odour on period 
            R0 = mean(ratios(last10ON:ONend),'omitnan'); %for checking if R0 should be end of odour on period only10s
            
            
            %calculate baseline-adjusted ratios (R-R0 /R0)
            adjratios = ((ratios - R0)/R0);
            
            
            
            %%%new versions need to calculate a few things
            
            %F0   = mean F of lowest 5% of frames
            %Fmax = mean F of highest 5% of frames
            
            %sort all values in ratios from baseline start to end of movie in ascending order
            sortedratios = sort(ratios(prebstart:mend));
            [vmax, max_index] = max(sortedratios);
            sortedratios = sortedratios(1:max_index); %remove rows that are nan (so beyond the max index)
            
            
            
            
            %calculate how many frames is 5% of frames, rounded to nearest integer
            p5=round(length(sortedratios)*0.05);
            
            %calculate F0 and Fmax
            F0 = mean(sortedratios(1:p5),'omitnan');
            Fmax = mean(sortedratios((end-p5):end),'omitnan');
            
            
            %adjratios_D
            %%%%DeltaF/Fmax (gordus)-------> (F-F0)/Fmax
            %Calculate F-F0/Fmax
            adjratios_D = (ratios - F0)/(Fmax);
            
            
            %adjratios_d
            % %%%%dF/Fmax(jin 2016)-------> F/(F0*Fmax)
            % %Calculate F/(F0*Fmax)
            % adjratios_d = ratios / (F0*Fmax);
            
            
                    
            
            
            
% % %             %% Plot deltaF/Fmax
% % %             figure
% % %             hold on
% % %             plot(secs, adjratios_D,'Color',[125 50 168]/255, 'LineWidth', 1.5) %purple for F-F0/Fmax
% % %             ylim ([ploty1,ploty2]);
% % %             xlim ([timesecs(1), timesecs(end)]);
% % %             title(short_fname)
% % %             patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 ) % add shading for stim ON/OFF
% % %             xticks(timesecs) %s since baseline begins
% % %             xticklabels(timelabels) %time in secs since baseline begins
% % %             xlabel('Time (s)')
% % %             ylabel('(F - Fmin)/Fmax')
% % %              
% % %             % Save plot  .png
% % %             singleplotname = strcat(strain_name, short_fname);
% % %             singleplotname = fullfile(pdirR0, singleplotname);
% % %             saveas(gcf,singleplotname,'png');
% % %             
% % %             close
% % %             
            
            %% add current adjratios and short_fname to output
            %first need to make dimensions match
            %this fills shorter of two matrices with nans to match length of longer
            if e > 1
                maxl = max(length(all_adjratios), length(adjratios)) ; %maxl is length of longer matrix
                adjratios(end+1 : maxl) = NaN; %fills with nan from end of adjratios to maxl (if = doesnt change)    
                all_adjratios(end+1 : maxl, :) = NaN; %fills with nan from end of all_adjratios to maxl, along ALL columns (if = doesnt change)
                %same for the other  adjratios
                adjratios_D(end+1 : maxl) = NaN; 
                all_adjratios_D(end+1 : maxl, :) = NaN;  
            end        
             
            
            all_adjratios =[all_adjratios adjratios]; %concatenate current adjratios to matrix of all_adjratios
            %same for the other two
            all_adjratios_D =[all_adjratios_D adjratios_D]; 
            % all_adjratios_d =[all_adjratios_d adjratios_d]; 
            
            col_names{e} = short_fname; %add current figname to cell array storing names of all datasets
    
        end


        %make seconds vector to match length of all_adjratios to plot avg
        all_secs = (1/9.9)*(0:(maxl-1)); %1/9.9 is how many seconds each frame lasts for
        all_secs = all_secs'; %converts result of previous (row vector) to column vector 
               
%% ALl worms of same condition plots
        
        %% first separate by categories (bLOW, offHIGH, onLOW)
        
        
        %Separation at 1st change (od off-on) offHIGH
        %pull out and plot only the neurons that are in HIGH state at end of baseline
        %to be safe, include also those that =0.5
        
        %separation at 2nd change (od on-off) onLOW
        %pull out and plot only the neurons that are in LOW state at end of od on
        %to be safe, include also those that =0.5
        
        
        %one more separation as control: at start of movie (frame 792) what neurons%are ON - bLOW
        %pull out and plot only the neurons that are in LOW state at start of baseline
        %to be safe, include also those that =0.5
        
        
        % offHIGH
        %create matrices to hold this data
        offHIGHD = [];
        offHIGHog = []; %original R-R0/R0 data but only that which deltaF/Fmax is HIGH at end of off
        cols_offHIGH = {};
        %for loop to cycle through and pull out column of data and name
        for s = 1:e
            if all_adjratios_D(bend+1,s)>= 0.5 %check if value of F at baseline end frame over 0.5 (use agv of window of 1 second ie 10frames)
                offHIGHD = [offHIGHD all_adjratios_D(:,s)];  %if it is, add adjratioD (deltaF/Fmax to adequate  matrix)
                offHIGHog = [offHIGHog all_adjratios(:,s)];  %if it is, add adjratio (R-R0/R0 to adequate  matrix)
                cols_offHIGH = [cols_offHIGH col_names(s)]; %if it is, add neuron to OFF HIGH list
            end
        end
        clear s
        
        
        
        % onLOW
        onLOWD = [];
        onLOWog = []; %original R-R0/R0 data but only that which deltaF/Fmax is LOW at end of on
        cols_onLOW = {};
        for s = 1:e
             if all_adjratios_D(ONend+1,s)<= 0.5 %check if value of F at odor on last frame is under 0.5 (use agv of window of 1 second ie 10frames)
                onLOWD = [onLOWD all_adjratios_D(:,s)]; %if it is, add adjratioD (deltaF/Fmax to adequate  matrix)
                onLOWog = [onLOWog all_adjratios(:,s)];  %if it is, add adjratio (R-R0/R0 to adequate  matrix)
                cols_onLOW = [cols_onLOW col_names(s)];%if it is, add neuron to ON LOW  list
            end
        end
        
        clear s
        
        %bLOW
        bLOWD = [];
        bLOWog = []; %original R-R0/R0 data but only that which deltaF/Fmax is LOW at end of on
        cols_bLOW = {};
        for s = 1:e
            if all_adjratios_D(bstart+1,s)<= 0.5 %check if value of F at odor on last frame is under 0.5 (use agv of window of 1 second ie 10frames)
                bLOWD = [bLOWD all_adjratios_D(:,s)]; %if it is, add adjratioD (deltaF/Fmax to adequate  matrix)
                bLOWog = [bLOWog all_adjratios(:,s)];  %if it is, add adjratio (R-R0/R0 to adequate  matrix)
                cols_bLOW = [cols_bLOW col_names(s)];%if it is, add neuron to ON LOW  list
            end
        end
        
        clear s
        
        
        %% plot all onLOW neurons R-R0/R0 (onLOWog)

        for o = 1:length(cols_onLOW)
 
            figure
            hold on
            plot(all_secs, onLOWog(:,o), 'LineWidth', 1.5) %blut for R-R0/R0
            ylim ([plotry1,plotry2]);
            xlim ([timesecs(1), timesecs(end)]);
            title(string(cols_onLOW(o)))
            patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 ) % add shading for stim ON/OFF
            xticks(timesecs) %s since baseline begins
            xticklabels(timelabels) %time in secs since baseline begins
            xlabel('Time (s)')
            ylabel('(R - R0)/R0')
             
            % Save plot  .png
            singleplotname = strcat(strain_name, string(cols_onLOW(o)),'R0');
            singleplotname = fullfile(pdirR0, singleplotname);
            saveas(gcf,singleplotname,'png');
            
        close


        end

        clear o








        
        
        
        %% Calculate proportions of 
        %1- ofneurons that are off in baseline, proportion that are on in each moment
        %of odour on
        %2 - of neurons that are on at end ofo odour on , proportion that are on in
        %each moment of odour off
        %3 - of neurons that are on at end start of movie , proportion that are on in
        %each moment of baseline
        
        
        %1 calculate proportion of offHIGH neurons tha are ON in each frame from end of baseline to end of odour on 
        pofall = nan(mend,1);
        pofall_indvN = nan((mend),length(cols_offHIGH)); %matrix with all neurons as columns, each row is timepoint (will be 0/1 for whether neuron is off/on)
        for f = bend:ONend
            pf = find(offHIGHD(f,:)>=0.5);
            pofall_indvN(f,:) = 0;
            pofall_indvN(f,pf) = 1;
            pofall(f) = length(pf)/length(cols_offHIGH);
        end
        clear pf f
        onoffsecs = (1/9.9)*(0:((length(pofall))-1));
        figure
        hold on 
        ylim ([0,1]);
        xlim ([110, 170]);
        xticks([110 170]) %s since odour on begins begins
        xticklabels({'0' '60' }) %time in secs since odour on begins
        xlabel('Time (s)')
        ylabel('proportion offHIGHneurons ON')
        title(strain_name)
        patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 )
        plot(onoffsecs, pofall)
        propplotname = strcat(strain_name, 'propON_odouron');
        propplotname = fullfile(pdirR0,propplotname);
        saveas(gcf,propplotname,'png');
        propplotname = strcat(propplotname,'.eps');
        exportgraphics(gcf,propplotname,'ContentType','vector');
        close
        
        
        
        
        %2 calculate proportion of onLOW neurons tha are ON in each frame from end of odour ON to movie end
        ponall = nan(mend,1);
        ponall_indvN = nan((mend),length(cols_onLOW)); %matrix with all neurons as columns, each row is timepoint (will be 0/1 for whether neuron is off/on)
        for f = ONend:mend
            pf = find(onLOWD(f,:)>=0.5);
            ponall_indvN(f,:) = 0;
            ponall_indvN(f,pf) = 1;
            ponall(f) = length(pf)/length(cols_onLOW);
        end
        clear f pf
        onoffsecs = (1/9.9)*(0:((length(ponall))-1));
        figure
        hold on 
        ylim ([0,0.5]);
        xlim ([170, 230]);
        xticks([170 230]) %s since odour off begins
        xticklabels({'0' '60' }) %time in secs since odour off begins
        xlabel('Time (s)')
        title(strain_name)
        ylabel('proportion onLOWneurons ON')
        patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 )
        plot(onoffsecs, ponall)
        propplotname = strcat(strain_name, 'propON_odouroff');
        propplotname = fullfile(pdirR0,propplotname);       
        saveas(gcf,propplotname,'png');
        propplotname = strcat(propplotname,'.eps');
        exportgraphics(gcf,propplotname,'ContentType','vector');
        close

        
        %3 calculate proportion of bLOW neurons that are ON in each frame from start of movie to start of odour on
        pbonall = nan(mend,1);
        pbonall_indvN = nan((mend),length(cols_bLOW)); %matrix with all neurons as columns, each row is timepoint (will be 0/1 for whether neuron is off/on)
        for f = prebstart:bend
            pf = find(bLOWD(f,:)>=0.5);
            pbonall_indvN(f,:) = 0;
            pbonall_indvN(f,pf) = 1;
            pbonall(f) = length(pf)/length(cols_bLOW);
        end
        clear f pf
        onoffsecs = (1/9.9)*(0:((length(ponall))-1));
        figure
        hold on 
        ylim ([0,0.5]);
        xlim ([80, 110]);
        xticks([80 110]) %s since  start of movie
        xticklabels({'0' '30' }) %time in secs since baseline  begins
        xlabel('Time (s)')
        title(strain_name)
        ylabel('proportion bLOWneurons ON')
        patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 )
        plot(onoffsecs, pbonall)
        propplotname = strcat(strain_name, 'propON_baseline');
        propplotname = fullfile(pdirR0,propplotname);        
        saveas(gcf,propplotname,'png');
        propplotname = strcat(propplotname,'.eps');
        exportgraphics(gcf,propplotname,'ContentType','vector');
        close
        
        
        
        
        
        %Save to excel
        proportionsON = [pofall ponall pbonall onoffsecs'];
        proportionsONname = strcat(strain_name,'propON');
        proportionsONname = fullfile(pdirR0,proportionsONname);
        writematrix(proportionsON,proportionsONname,'Filetype', 'spreadsheet'); %write avg to excel
        
        writematrix(pofall_indvN,strcat(pdirR0,'/',strain_name,'indv_propON_odON'),'Filetype', 'spreadsheet')
        writematrix(ponall_indvN,strcat(pdirR0,'/',strain_name,'indv_propON_odOFF'),'Filetype', 'spreadsheet')
        writematrix(pbonall_indvN,strcat(pdirR0,'/',strain_name,'indv_propON_baseline'),'Filetype', 'spreadsheet')
        
        
        %% Here calculations for time-to-max & cumulative proportion plots (baseline, offHIGH, onLOW)

        %bLOW
        %create transpose of onLOWD
        bLOWDT =  bLOWD';
        
        %create matrix to hold cumulative ON proportion 
        bLOW_survival = NaN (length(cols_bLOW),(bend-bstart));
        
        %create matrix to hold amount of time each neuron spends on
        timeon_bLOW = [];

        for i = 1:length(cols_bLOW)
            thisworm = bLOWDT(i,bstart+1:bend);
             index = find(thisworm >= 0.5,1);
             if index >=1
                 bLOW_ttON(i,1) = index;
                 bLOW_survival(i,1:index)=0;
                 bLOW_survival(i,index:end)=1; %this makes so that from index to end = 1 (index included)

                 %calculate time spent on
                 indexoff  = find(thisworm(index+20:end)< 0.5,1); %find first index < than 0.5 after first index above 0.5 (must be 2secs later at least otherwise sometimes think neuron turns off after 0.3 secs or something like that)
                 indexoff = indexoff+20; %to get true number of frames since neuron went on
                 
                 if indexoff > 0
                    timeon_bLOW(i) = indexoff;

                 else %If it doesnt turn , off, timeon = total time valve is off
                    timeon_bLOW(i) = bend-(bstart+1);
                 end


             else 
                 bLOW_ttON(i,1) = NaN;
                 %if that neuron never activates leave corresponding row in
                 %survival matrix to NaNs, and set index to also be nan

                 %if that neuron never activates leave timeon value to NaN
                 timeon_bLOW(i) = NaN;
             end
            clear thisworm
        
        end
        clear i index indexoff

        %convert timeon into secs
        timeon_bLOW = timeon_bLOW /9.9;
        
        bLOW_survivalV = sum(bLOW_survival,'omitnan');
        bLOW_survivalVP = bLOW_survivalV/length(cols_bLOW);
        
        
        %Plot
        figure
        hold on 
        ylim ([0,1]);
        xlim ([all_secs(bstart) all_secs(bend)]);
        xticks([all_secs(bstart) all_secs(bend)]) %s since odour off begins
        xticklabels({'0' '30' }) %time in secs since odour off begins
        xlabel('Time (s)')
        title(strcat(strain_name, 'bLOWcum'))
        ylabel('proportion of neurons on - cumulative')
        patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 )
        plot(all_secs(bstart+1:bend),bLOW_survivalVP)
        propplotname = strcat(strain_name, 'cumpropON_bLOW');
        propplotname = fullfile(pdirR0,propplotname);
        saveas(gcf,propplotname,'png');
        close
        
        
        
        
       % onLOW
        %create transpose of onLOWD
        onLOWDT =  onLOWD';
        
        %create matrix to hold cumulative ON proportion 
        onLOW_survival = NaN (length(cols_onLOW),(mend-ONend));

        %create matrix to hold amount of time each neuron spends on
        timeon_onLOW = [];
        
        for i = 1:length(cols_onLOW)
            thisworm = onLOWDT(i,ONend+1:mend);
            index = find(thisworm >= 0.5,1);

             if index >=1
                 onLOW_ttON(i,1) = index;
                 onLOW_survival(i,1:index)=0;
                 onLOW_survival(i,index:end)=1; %this makes so that from index to end = 1 (index included)

                 %calculate time spent on
                 indexoff  = find(thisworm(index+20:end)< 0.5,1); %find first index < than 0.5 after first index above 0.5 (must be 2secs later at least otherwise sometimes think neuron turns off after 0.3 secs or something like that)
                 indexoff = indexoff+20; %to get true number of frames since neuron went on
                 if indexoff > 0
                    timeon_onLOW(i) = indexoff;

                 else %If it doesnt turn off, timeon = total time valve is off
                    timeon_onLOW(i) = mend-(ONend+1);
                 end
        
             else 
                 %if that neuron never activates leave corresponding row in survival matrix to NaNs                 
                 onLOW_ttON(i,1) = NaN;
                 
                 %if that neuron never activates leave timeon value to NaN
                 timeon_onLOW(i) = NaN;
             end
            clear thisworm
        
        end
        %
        clear i index indexoff

        %convert timeon into secs
        timeon_onLOW = timeon_onLOW /9.9;
        
        onLOW_survivalV = sum(onLOW_survival,'omitnan');
        onLOW_survivalVP = onLOW_survivalV/length(cols_onLOW);
        
        
        %plot
        figure
        hold on 
        ylim ([0,1]);
        xlim ([all_secs(ONend) all_secs(mend)]);
        xticks([all_secs(ONend) all_secs(mend)]) %s since odour off begins
        xticklabels({'0' '60' }) %time in secs since odour off begins
        xlabel('Time (s)')
        title(strcat(strain_name, 'onLOWcum'))
        ylabel('proportion of neurons on - cumulative')
        patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 )
        plot(all_secs(ONend+1:mend),onLOW_survivalVP)
        propplotname = strcat(strain_name, 'cumpropON_onLOW');
        propplotname = fullfile(pdirR0,propplotname);        
        saveas(gcf,propplotname,'png');
        close
        
        
        
        
        
        
        
        
        %offHIGH - here calculate how quickly they turn OFF
        %create transpose of offHIGHD
        offHIGHDT =  offHIGHD';
        
        %create matrix to hold cumulative ON proportion 
        offHIGH_survival = NaN (length(cols_offHIGH),(ONend-bend));
        
        for i = 1:length(cols_offHIGH)
            thisworm = offHIGHDT(i,bend+1:ONend);
             index = find(thisworm <= 0.5,1);
             if index >=1
                 offHIGH_ttOFF(i,1) = index;
                 offHIGH_survival(i,1:index)=1;
                 offHIGH_survival(i,index:end)=0; %this makes so that from index to end = 1 (index included)
        
             else 
        %if that neuron never turns off leave corresponding row in survival matrix to all 1s, 
        % and set index to also be nan
                 offHIGH_survival(i,:)=1;             
                 offHIGH_ttOFF(i,1) = NaN;
        
             end
            clear thisworm
        
        end
        clear i index
        
        offHIGH_survivalV = sum(offHIGH_survival,'omitnan');
        offHIGH_survivalVP = offHIGH_survivalV/length(cols_offHIGH);
        
        %Plot
        figure
        hold on 
        ylim ([0,1]);
        xlim ([all_secs(bend) all_secs(ONend)]);
        xticks([all_secs(bend) all_secs(ONend)]) %s since odour off begins
        xticklabels({'0' '60' }) %time in secs since odour off begins
        xlabel('Time (s)')
        title(strcat(strain_name, 'offHIGHcum'))
        ylabel('proportion of neurons on - cumulative')
        patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 )
        plot(all_secs(bend+1:ONend),offHIGH_survivalVP)
        propplotname = strcat(strain_name, 'cumpropON_offHIGH');
        propplotname = fullfile(pdirR0,propplotname);
        saveas(gcf,propplotname,'png');
        close
        
        %% Plot histogram of timetoON during odour OFF and during baseline, timetoOFF during odour ON
           
                figure
                binedges = (0:40:600);
                histogram(onLOW_ttON,binedges, 'normalization','probability')
                title(strcat('histogram ttONonLOW', strain_name))
                xlabel('timetoON (frames)')
                ylim([0 0.5])
                histoname = strcat(strain_name, 'histTTON_onLOW');
                histoname = fullfile(pdirR0, histoname);
                saveas(gcf,histoname,'png');
                close
            
                
                figure
                binedges = (0:40:300);
                histogram(bLOW_ttON,binedges, 'normalization','probability')
                title(strcat('histogram ttONbLOW', strain_name))
                xlabel('timetoON (frames)')
                ylim([0 0.5])
                histoname = strcat(strain_name, 'histTTON_bLOW');
                histoname = fullfile(pdirR0, histoname);                
                saveas(gcf,histoname,'png');
                close
            
                figure
                binedges = (0:40:600);
                histogram(offHIGH_ttOFF,binedges, 'normalization','probability')
                title(strcat('histogram ttOFF_offHIGH', strain_name))
                xlabel('timetoOFF (frames)')
                ylim([0 0.5])
                histoname = strcat(strain_name, 'histttOFF_offHIGH');
                histoname = fullfile(pdirR0, histoname);                
                saveas(gcf,histoname,'png');
                close
            
        
        
        
        
        
            %% Save to excel
            cumproportionsON = NaN(length(onoffsecs),4);
            
            %poff pon pbaseline time (order to match non-cum prop plots)
            cumproportionsON(bstart+1:bend,3) = bLOW_survivalVP;
            cumproportionsON(bend+1:ONend,1) = offHIGH_survivalVP;
            cumproportionsON(ONend+1:mend,2) = onLOW_survivalVP;
            cumproportionsON(:,4) = onoffsecs;
            
            
            %save cumprop excels
            cumproportionsONname = strcat(strain_name,'cumpropON');
            cumproportionsONname = fullfile(pdirR0,cumproportionsONname);

            writematrix(cumproportionsON,cumproportionsONname,'Filetype', 'spreadsheet'); %write avg to excel
            clear cumproportionsONname
        

            %save time to on/off excels
            ttonblowname = strcat(strain_name, 'bLOW_ttON');
            ttonblowname = fullfile (pdirR0,ttonblowname);

            ttononlowname = strcat(strain_name, 'onLOW_ttON');
            ttononlowname = fullfile (pdirR0,ttononlowname);


            ttoffoffhighname = strcat(strain_name, 'offHIGH_ttOFF');
            ttoffoffhighname = fullfile (pdirR0,ttoffoffhighname);

            
            writematrix(bLOW_ttON,ttonblowname, 'Filetype', 'Spreadsheet');
            writematrix(onLOW_ttON,ttononlowname, 'Filetype', 'Spreadsheet');
            writematrix(offHIGH_ttOFF,ttoffoffhighname, 'Filetype', 'Spreadsheet');
        
            clear ttonblowname ttononlowname ttoffoffhighname


            %save timeon excels
            %NB currently theres a bit of an artifact created  by the 2sec
            %threshold of needs to turn off after 2 secs

            timeonname = strcat(strain_name,'timeononLOW');
            timeonname = fullfile(pdirR0,timeonname);
            writematrix(timeon_onLOW',timeonname,'Filetype','spreadsheet');


            timeonname = strcat(strain_name,'timeonbLOW');
            timeonname = fullfile(pdirR0,timeonname);
            writematrix(timeon_bLOW', timeonname,'Filetype','spreadsheet');

            %% R-R0/R0 plots
                %% plot average of all traces with SEM R-R0/R0 AND separated 
                % % note number of columns with data for each time point
                % npertimepoint = sum(~isnan(all_adjratios),2); %sum accross each row all the numbers that are not NaN

                
                % %calculate average excluding NaN
                avg_all_adjratios = mean(all_adjratios,2,'omitnan');
                avg_offHIGHog= mean(offHIGHog,2,'omitnan');
                avg_onLOWog = mean(onLOWog,2,'omitnan');
                
                
                figure
                ylim ([-1,1]);
                xlim ([timesecs(1), timesecs(end)]);
                title(strcat('Average all traces+SEM', strain_name))
                xticks(timesecs) %s since baseline begins
                xticklabels(timelabels) %time in secs since baseline begins
                xlabel('Time (s)')
                ylabel('(R - R0)/R0')
                
                %add shading for stim ON/OFF
                patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 )
                hold on
                
                %Add SEM
                %calculate SEM of all_adjratios_D
                SEMog = std(all_adjratios,0,2, 'omitnan')/sqrt(e);
                offHIGHSEMog = std(offHIGHog,0,2, 'omitnan')/sqrt(e);
                onLOWSEMog = std(onLOWog,0,2, 'omitnan')/sqrt(e);
                
                %set bounds for SEM (adjratios_D +- SEM)
                meanPlusSEMog = avg_all_adjratios + SEMog;
                meanMinusSEMog = avg_all_adjratios - SEMog;
                
                himeanPlusSEMog = avg_offHIGHog + offHIGHSEMog;
                himeanMinusSEMog = avg_offHIGHog - offHIGHSEMog;
                
                lomeanPlusSEMog = avg_onLOWog + onLOWSEMog;
                lomeanMinusSEMog = avg_onLOWog - onLOWSEMog;
                
                
                
                %plot altogether patch and mean and save
                patch([all_secs(timeframes(1): timeframes(4))' flip(all_secs(timeframes(1): timeframes(4)))'], [meanPlusSEMog(timeframes(1): timeframes(4))' flip(meanMinusSEMog(timeframes(1): timeframes(4)))'],[0 0 0], 'EdgeColor', 'none', 'FaceAlpha', 0.4); 
                plot(all_secs, avg_all_adjratios,'Color',[0 0 0],'Linewidth', 1) %black for altogether
                SEMplotname = strcat(strain_name, 'SEMplot_only');
                SEMplotname = fullfile(pdirR0,SEMplotname);
                saveas(gcf,SEMplotname,'png');
                
                %add SEM for separated traces
                patch([all_secs(timeframes(1): timeframes(4))' flip(all_secs(timeframes(1): timeframes(4)))'], [himeanPlusSEMog(timeframes(1): timeframes(4))' flip(himeanMinusSEMog(timeframes(1): timeframes(4)))'],[34 139 34]/255, 'EdgeColor', 'none', 'FaceAlpha', 0.4); 
                patch([all_secs(timeframes(1): timeframes(4))' flip(all_secs(timeframes(1): timeframes(4)))'], [lomeanPlusSEMog(timeframes(1): timeframes(4))' flip(lomeanMinusSEMog(timeframes(1): timeframes(4)))'],[255 165 0]/255, 'EdgeColor', 'none', 'FaceAlpha', 0.4); 
                
                
                %plot mean for separated traces
                plot(all_secs, avg_offHIGHog,'Color',[34 139 34]/255,'Linewidth', 1) %green for offHIGHog
                plot(all_secs, avg_onLOWog,'Color',[255 165 0]/255,'Linewidth', 1) %orange for onLOWog
                
                
                
                %save plot
                SEMplotname = strcat(strain_name, 'SEMplot_sep');
                SEMplotname = fullfile(pdirR0,SEMplotname);
                saveas(gcf,SEMplotname,'png');
                close


                %% plot onLOW neurons that are active during odour on (ie AF/Fm >=0.5)
                onLOWog_ON = [];
                cols_onLOW_ON = [];
                for f = 1: width(onLOWog)
                    if max(onLOWD(ONend:mend,f)) >= 0.5 %cycle through each worm , evaluate if max deltaf/fmax during odour off period is above 0.5 or not
                    onLOWog_ON = [onLOWog_ON onLOWog(:,f)];
                    cols_onLOW_ON = [cols_onLOW_ON cols_onLOW(f)];

                    end
                end

                avg_onLOWog_ON = mean(onLOWog_ON,2,'omitnan');
                onLOWSEMog_ON = std(onLOWog_ON,0,2, 'omitnan')/sqrt(e);
                loONmeanPlusSEMog = avg_onLOWog_ON + onLOWSEMog_ON;
                loONmeanMinusSEMog = avg_onLOWog_ON - onLOWSEMog_ON;


                figure
                ylim ([-1,2]);
                xlim ([timesecs(1), timesecs(end)]);
                title(strcat('Average onLOW_ON+SEM', strain_name, string(length(cols_onLOW_ON)),'/',string(length(cols_onLOW)),'(',string(e),')'))
                xticks(timesecs) %s since baseline begins
                xticklabels(timelabels) %time in secs since baseline begins
                xlabel('Time (s)')
                ylabel('(R - R0)/R0')
                
                %add shading for stim ON/OFF
                patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 )
                hold on


                patch([all_secs(timeframes(1): timeframes(4))' flip(all_secs(timeframes(1): timeframes(4)))'], [loONmeanPlusSEMog(timeframes(1): timeframes(4))' flip(loONmeanMinusSEMog(timeframes(1): timeframes(4)))'],[0 0 0], 'EdgeColor', 'none', 'FaceAlpha', 0.4); 
                plot(all_secs, avg_onLOWog_ON,'Color',[0 0 0],'Linewidth', 1) %black for altogether
                SEMplotname = strcat(strain_name, 'SEMplot_onLOWog_ON');
                SEMplotname = fullfile(pdirR0,SEMplotname);                
                saveas(gcf,SEMplotname,'png');
                close



        
                %% Plot histogram of max activation in AR/R0 condition
                %plots histogram where height of bar equals C/N by using 'normalization' set to 'probability'
                %c = number of counts in that bin
                %N = total counts
                %thus, area of all bars together is less than or equal to 1
                
                
                max_onLOW = max(onLOWog(ONend:mend,:));
                max_onLOWname = strcat(strain_name,'maxonLOW');
                max_onLOWname = fullfile(pdirR0,max_onLOWname);
                writematrix(max_onLOW',max_onLOWname, 'Filetype', 'Spreadsheet');
                binedges = (-1:0.5:6);
                
                figure
                histogram(max_onLOW,binedges, 'normalization','probability') 
                title(strcat('histogram max activation during odour off of onLOW neurons', strain_name))
                xlabel('max (R - R0)/R0')
                ylim([0 0.5])
                histoname = strcat(strain_name, 'histomaxR');
                histoname = fullfile(pdirR0,histoname);
                saveas(gcf,histoname,'png');
                close
                
                figure
                histogram(onLOWog(ONend:mend,:),binedges, 'normalization','probability')
                title(strcat('histogram all activaty during odour off of onLOW neurons', strain_name))
                xlabel('(R - R0)/R0')
                ylim([0 0.5])
                histoname = strcat(strain_name, 'histoallR');
                histoname = fullfile(pdirR0,histoname);
                saveas(gcf,histoname,'png');
                close

            %% FFmax plots
                %% Plot histogram of activation (F-Fmin/Fmax) over entire trace 
                
                %so like histoall but with FMax data and over entire trace not just odour OFF
                
            
                %plots histogram where height of bar equals C/N by using 'normalization' set to 'probability'
                %c = number of counts in that bin
                %N = total counts
                %thus, area of all bars together is less than or equal to 1
                
               
        
                figure
                binedges = (0:0.05:1);
                histogram(all_adjratios_D,binedges, 'normalization','probability')
                title(strcat('histogram all activaty entire trace all neurons', strain_name))
                xlabel('(F-Fmin)/Fmax')
                ylim([0 0.2])
          
                histoname = strcat(strain_name, 'FMax_histo');
                histoname = fullfile(pdirR0,histoname);
                saveas(gcf,histoname,'png');
                histoname = strcat(histoname,'.eps');
                exportgraphics(gcf,histoname,'ContentType','vector');
                close
        
        
                
                %% plot average of all traces with SEM D F-F0/Fmax AND separated 
                % % note number of columns with data for each time point
                % npertimepoint = sum(~isnan(all_adjratios),2); %sum accross each row all the numbers that are not NaN
                
                
                % %calculate average excluding NaN
                avg_all_adjratios_D = mean(all_adjratios_D,2,'omitnan');
                avg_offHIGH = mean(offHIGHD,2,'omitnan');
                avg_onLOW = mean(onLOWD,2,'omitnan');
                
                figure
                ylim ([0,1]);
                xlim ([timesecs(1), timesecs(end)]);
                title(strcat('Average all traces+SEM D', strain_name))
                xticks(timesecs) %s since baseline begins
                xticklabels(timelabels) %time in secs since baseline begins
                xlabel('Time (s)')
                ylabel('(R - Rmin)/Rmax')
                
                %add shading for stim ON/OFF
                patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 )
                hold on
                
                %Add SEM
                %calculate SEM of all_adjratios_D
                SEM = std(all_adjratios_D,0,2, 'omitnan')/sqrt(e);
                offHIGHSEM = std(offHIGHD,0,2, 'omitnan')/sqrt(e);
                onLOWSEM = std(onLOWD,0,2, 'omitnan')/sqrt(e);
                %set bounds for SEM (adjratios_D +- SEM)
                meanPlusSEM = avg_all_adjratios_D + SEM;
                meanMinusSEM = avg_all_adjratios_D - SEM;
                
                himeanPlusSEM = avg_offHIGH + offHIGHSEM;
                himeanMinusSEM = avg_offHIGH - offHIGHSEM;
                
                lomeanPlusSEM = avg_onLOW + onLOWSEM;
                lomeanMinusSEM = avg_onLOW - onLOWSEM;
                
        
                patch([all_secs(timeframes(1): timeframes(4))' flip(all_secs(timeframes(1): timeframes(4)))'], [meanPlusSEM(timeframes(1): timeframes(4))' flip(meanMinusSEM(timeframes(1): timeframes(4)))'],[125 50 168]/255, 'EdgeColor', 'none', 'FaceAlpha', 0.4); 
                plot(all_secs, avg_all_adjratios_D,'Color',[125 50 168]/255,'Linewidth', 1) %purple for altogether
                SEMplotname = strcat(strain_name, 'SEMplot_Donly');
                SEMplotname = fullfile(pdirR0,SEMplotname);
                saveas(gcf,SEMplotname,'png');
                
                %add SEM for separated traces
                patch([all_secs(timeframes(1): timeframes(4))' flip(all_secs(timeframes(1): timeframes(4)))'], [himeanPlusSEM(timeframes(1): timeframes(4))' flip(himeanMinusSEM(timeframes(1): timeframes(4)))'],[0 0.4470 0.7410], 'EdgeColor', 'none', 'FaceAlpha', 0.4); 
                patch([all_secs(timeframes(1): timeframes(4))' flip(all_secs(timeframes(1): timeframes(4)))'], [lomeanPlusSEM(timeframes(1): timeframes(4))' flip(lomeanMinusSEM(timeframes(1): timeframes(4)))'],[171 50 66]/255, 'EdgeColor', 'none', 'FaceAlpha', 0.4); 
                
                %plot mean for separated traces
                plot(all_secs, avg_offHIGH,'Color',[0 0.4470 0.7410],'Linewidth', 1) %blue for offHIGH
                plot(all_secs, avg_onLOW,'Color',[171 50 66]/255,'Linewidth', 1) %red for onLOW
                
                
                %save plot
                SEMplotname = strcat(strain_name, 'SEMplot_D_sep');
                SEMplotname = fullfile(pdirR0,SEMplotname);
                saveas(gcf,SEMplotname,'png');
                close
                
                
                
                %% Plot all traces +average D F-F0/Fmax
                
                figure
                plot(all_secs, all_adjratios_D,'LineWidth', 0.6)
                % plot(all_secs, all_adjratios_D,'Color', [0.7529 0.7529 0.7529])
                
                hold on
                plot(all_secs, avg_all_adjratios_D, 'k', 'LineWidth', 1.5)
                
                ylim ([0,1]);
                xlim ([timesecs(1), timesecs(end)]);
                title(strcat('Single Traces + AVG D ', strain_name))
                %add shading for stim ON/OFF
                patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 )
                hold on
                
                
                xticks(timesecs) %s since baseline begins
                xticklabels(timelabels) %time in secs since baseline begins
                xlabel('Time (s)')
                ylabel('(R - Rmin)/Rmax')
                
                alltraceavgname = strcat(strain_name, 'alltavgplot');
                alltraceavgname = fullfile(pdirR0,alltraceavgname);
                saveas(gcf,alltraceavgname,'png');
                close

                %% Plot all traces +average D F-F0/Fmax offHIGH
                
                figure
                plot(all_secs, offHIGHD,'LineWidth', 0.6)
                % plot(all_secs, all_adjratios_D,'Color', [0.7529 0.7529 0.7529])
                
                hold on
                plot(all_secs, avg_offHIGH, 'k', 'LineWidth', 1.5)
                
                ylim ([0,1]);
                xlim ([timesecs(1), timesecs(end)]);
                title(strcat('Single Traces + AVG D offHIGH', strain_name))
                %add shading for stim ON/OFF
                patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 )
                hold on
                
                
                xticks(timesecs) %s since baseline begins
                xticklabels(timelabels) %time in secs since baseline begins
                xlabel('Time (s)')
                ylabel('(R - Rmin)/Rmax')
                
                alltraceavgname = strcat(strain_name, 'alltavgplotD_offHIGH');
                alltraceavgname = fullfile(pdirR0,alltraceavgname);
                saveas(gcf,alltraceavgname,'png');
                close
                
                %% Plot all traces +average D F-F0/Fmax onLOW
                
                figure
                plot(all_secs, onLOWD,'LineWidth', 0.6)
                % plot(all_secs, all_adjratios_D,'Color', [0.7529 0.7529 0.7529])
                
                hold on
                plot(all_secs, avg_onLOW, 'k', 'LineWidth', 1.5)
                
                ylim ([0,1]);
                xlim ([timesecs(1), timesecs(end)]);
                title(strcat('Single Traces + AVG D onLOW', strain_name))
                %add shading for stim ON/OFF
                patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 )
                hold on
                
                
                xticks(timesecs) %s since baseline begins
                xticklabels(timelabels) %time in secs since baseline begins
                xlabel('Time (s)')
                ylabel('(R - Rmin)/Rmax')
                
                alltraceavgname = strcat(strain_name, 'alltavgplotD_onLOW');
                alltraceavgname = fullfile(pdirR0,alltraceavgname);
                saveas(gcf,alltraceavgname,'png');
                close

            %% Plot heatmaps
            % heatmaps D F-F0/Fmax 
                figure
                
                all_adjratios_DT = all_adjratios_D'; %save transpose of all_adjratios_D
                avg_all_adjratios_DT = avg_all_adjratios_D';%save transpose of avg_all_adjratios_D
                
                %create vector to indicate odour on and off periods
                odour = zeros(1,length(all_adjratios_DT)); 
                odour(timeframes(1):timeframes(2)) = hmy1; %odour off (baseline)
                odour(timeframes(2):timeframes(3)) = hmy2; %odour on 1
                odour(timeframes(3):timeframes(4)) = hmy1; %odour off 1
                
                
% % % %                 %append average to all_adjratios_DT matrix (top row) NOT for paper
% % % %                 %append odour vector to all_adjratios_DT matrix (bottom row)
% % % %                 all_adjratios_DT = [avg_all_adjratios_DT; all_adjratios_DT; odour];
                
                
                %want to make nans transparent (0 = transparent, 1 = opaque) in plot (will be white)
                %create matrix with 0 if alladjratios_D = nan and 1 if all adjratios_D = value
                nanmatrix = ones(size(all_adjratios_DT));
                nanmatrix(isnan(all_adjratios_DT)) = 0;
                
                
                imagesc(all_adjratios_DT, 'AlphaData' , nanmatrix) %from baseline start to end of recording
                
                colormap parula;
                colorbar
                %caxis ( [min(all_adjratios, [], 'all') max(all_adjratios, [], 'all')])
                caxis ([hmy1 hmy2])
                xlim([bstart mend])
                
                xticks(timeframes) %frames since the recording begins
                xticklabels(timelabels) %time in secs since baseline begins
                xlabel('Time (s)')
                yticks(1:length(all_adjratios_D))
                yticklabels([{'AVERAGE'} col_names {'ODOUR'}])
                ylabel('Neuron')
                title(strcat('Heatmap (R - Rmin)/Rmax)', strain_name))
                
                
                
                
                %Save heatmap
                
                heatmapname = strcat(strain_name, 'heatmap_D');
                heatmapname = fullfile(pdirR0,heatmapname);
                saveas(gcf,heatmapname,'png');
                close 
        
                %% Plot heatmap D F-F0/Fmax offHIGH
                figure
                
                offHIGHT = offHIGHD'; %make transpose of all_adjratios_D
                avg_offHIGHT = avg_offHIGH';%save transpose of avg_all_adjratios_D
                
                %create vector to indicate odour on and off periods
                odour = zeros(1,length(all_adjratios_DT)); 
                odour(timeframes(1):timeframes(2)) = hmy1; %odour off (baseline)
                odour(timeframes(2):timeframes(3)) = hmy2; %odour on 1
                odour(timeframes(3):timeframes(4)) = hmy1; %odour off 1
                
                
% % % %                 %append average to all_adjratios_DT matrix (top row)
% % % %                 %append odour vector to all_adjratios_DT matrix (bottom row)
% % % %                 offHIGHT = [avg_offHIGHT; offHIGHT; odour];
                
                
                %want to make nans transparent (0 = transparent, 1 = opaque) in plot (will be white)
                %create matrix with 0 if alladjratios_D = nan and 1 if all adjratios_D = value
                nanmatrix = ones(size(offHIGHT));
                nanmatrix(isnan(offHIGHT)) = 0;
                
                
                imagesc(offHIGHT, 'AlphaData' , nanmatrix) %from baseline start to end of recording
                
                colormap parula;
                colorbar
                %caxis ( [min(all_adjratios, [], 'all') max(all_adjratios, [], 'all')])
                caxis ([hmy1 hmy2])
                xlim([bstart mend])
                
                xticks(timeframes) %frames since the recording begins
                xticklabels(timelabels) %time in secs since baseline begins
                xlabel('Time (s)')
                yticks(1:length(all_adjratios_D))
                yticklabels([{'AVERAGE'} cols_offHIGH {'ODOUR'}])
                ylabel('Neuron')
                title(strcat('Heatmap (R - Rmin)/Rmax offHIGH', strain_name))
                
                
                
                
                %Save heatmap
                
                heatmapname = strcat(strain_name, 'heatmap_D_offHIGH');
                heatmapname = fullfile(pdirR0,heatmapname);
                saveas(gcf,heatmapname,'png');
                close 
        
                %% Plot heatmap D F-F0/Fmax onLOW
                figure
                
                onLOWT = onLOWD'; %make transpose of all_adjratios_D
                avg_onLOWT = avg_onLOW';%save transpose of avg_all_adjratios_D
                
                %create vector to indicate odour on and off periods
                odour = zeros(1,length(all_adjratios_DT)); 
                odour(timeframes(1):timeframes(2)) = hmy1; %odour off (baseline)
                odour(timeframes(2):timeframes(3)) = hmy2; %odour on 1
                odour(timeframes(3):timeframes(4)) = hmy1; %odour off 1
                % odour(timeframes(4):timeframes(5)) = hmy2; %odour on 2
                % odour(timeframes(5):timeframes(6)) = hmy1; %odour off 2
                
% % % %                 %append average to all_adjratios_DT matrix (top row)
% % % %                 %append odour vector to all_adjratios_DT matrix (bottom row)
% % % %                 onLOWT = [avg_onLOWT; onLOWT; odour];
% % % %                 
                
                %want to make nans transparent (0 = transparent, 1 = opaque) in plot (will be white)
                %create matrix with 0 if alladjratios_D = nan and 1 if all adjratios_D = value
                nanmatrix = ones(size(onLOWT));
                nanmatrix(isnan(onLOWT)) = 0;
                
                
                imagesc(onLOWT, 'AlphaData' , nanmatrix) %from baseline start to end of recording
                
                colormap parula;
                colorbar
                %caxis ( [min(all_adjratios, [], 'all') max(all_adjratios, [], 'all')])
                caxis ([hmy1 hmy2])
                xlim([bstart mend])
                
                xticks(timeframes) %frames since the recording begins
                xticklabels(timelabels) %time in secs since baseline begins
                xlabel('Time (s)')
                yticks(1:length(all_adjratios_D))
                yticklabels([{'AVERAGE'} cols_onLOW {'ODOUR'}])
                ylabel('Neuron')
                title(strcat('Heatmap (R - Rmin)/Rmax onLOW', strain_name))
                
                
                
                
                %Save heatmap
                
                heatmapname = strcat(strain_name, 'heatmap_D_onLOW');
                heatmapname = fullfile(pdirR0,heatmapname);
                saveas(gcf,heatmapname,'png');
                close

        %% Save stuff
        
        %histo and prop to workspace variables

            if     c == 1
                mockhm  = max_onLOW'; %for histo of max activity
                mockpnc = proportionsON; %non-cumulative proportions
                mockpc  = cumproportionsON; %cumulative proportions
    
            elseif c == 2 
                avsvhm  = max_onLOW';
                avsvpnc = proportionsON; 
                avsvpc  = cumproportionsON; 
    
                
            elseif c == 3 
                sexchm  = max_onLOW';
                sexcpnc = proportionsON; 
                sexcpc  = cumproportionsON; 
    
            end  
        


    
        %%  save data to excels & workspace variables
        %altogether - AR/R0
        Tall_adjratios = array2table(all_adjratios); %convert adjratios to table
        col_names = string(col_names); %convert cell array of strings to string array
        col_names = matlab.lang.makeValidName(col_names, 'Prefix', 'm');% convert col_names to valid variable names (must start with letter)
        Tall_adjratios.Properties.VariableNames(:) = col_names; 
        avgratiostimeSEM = [avg_all_adjratios all_secs SEMog];
        
        allratiosname = strcat(strain_name, 'allog');
        avgratiosname = strcat(strain_name, 'avgog');
        allratiosname = fullfile(pdirR0,allratiosname);        
        avgratiosname = fullfile(pdirR0,avgratiosname);

        writetable(Tall_adjratios, allratiosname,'Filetype', 'spreadsheet'); %write all adj ratios to excel 
        writematrix(avgratiostimeSEM,avgratiosname,'Filetype', 'spreadsheet'); %write avg to excel
        
            if     c == 1
                mock_og = avgratiostimeSEM;
    
            elseif c == 2 
                avsv_og = avgratiostimeSEM;
                
            elseif c == 3 
                sexc_og = avgratiostimeSEM;
            end  
        
        
        
        %altogether - Fmax/
        Tall_adjratios_D = array2table(all_adjratios_D); %convert adjratios to table
        col_names = string(col_names); %convert cell array of strings to string array
        Tall_adjratios.Properties.VariableNames(:) = col_names; 
        avgratiostimeSEM = [avg_all_adjratios_D all_secs SEM];
        
        allratiosname = strcat(strain_name, 'allD');
        avgratiosname = strcat(strain_name, 'avgD');
        allratiosname = fullfile(pdirR0,allratiosname);        
        avgratiosname = fullfile(pdirR0,avgratiosname);        
        writetable(Tall_adjratios_D, allratiosname,'Filetype', 'spreadsheet'); %write all adj ratios to excel 
        writematrix(avgratiostimeSEM,avgratiosname,'Filetype', 'spreadsheet'); %write avg to excel
        


        %separated 

        %for offHIGHD
        ToffHIGH = array2table(offHIGHD); %convert adjratios to table
        cols_offHIGH = string(cols_offHIGH); %convert cell array of strings to string array
        cols_offHIGH = matlab.lang.makeValidName(cols_offHIGH, 'Prefix', 'm');% convert col_names to valid variable names (must start with letter)
        ToffHIGH.Properties.VariableNames(:) = cols_offHIGH; 
        avgratiostimeSEM = [avg_offHIGH all_secs offHIGHSEM];
        
        allratiosname = strcat(strain_name, 'all_offHIGHD');
        avgratiosname = strcat(strain_name, 'avg_offHIGHD');
        allratiosname = fullfile(pdirR0,allratiosname);        
        avgratiosname = fullfile(pdirR0,avgratiosname);        
        writetable(ToffHIGH, allratiosname,'Filetype', 'spreadsheet'); %write all adj ratios to excel 
        writematrix(avgratiostimeSEM,avgratiosname,'Filetype', 'spreadsheet'); %write avg to excel
        
        
        %for offHIGHog
        ToffHIGHog = array2table(offHIGHog); %convert adjratios to table
        ToffHIGHog.Properties.VariableNames(:) = cols_offHIGH; 
        avgratiostimeSEM = [avg_offHIGHog all_secs offHIGHSEMog];
        
        allratiosname = strcat(strain_name, 'all_offHIGHog');
        avgratiosname = strcat(strain_name, 'avg_offHIGHog');
        allratiosname = fullfile(pdirR0,allratiosname);        
        avgratiosname = fullfile(pdirR0,avgratiosname);        
        writetable(ToffHIGHog, allratiosname,'Filetype', 'spreadsheet'); %write all adj ratios to excel 
        writematrix(avgratiostimeSEM,avgratiosname,'Filetype', 'spreadsheet'); %write avg to excel
        
        
        
        %for onLOWD
        TonLOW = array2table(onLOWD); %convert adjratios to table
        cols_onLOW = string(cols_onLOW); %convert cell array of strings to string array
        cols_onLOW = matlab.lang.makeValidName(cols_onLOW, 'Prefix', 'm');% convert col_names to valid variable names (must start with letter)
        TonLOW.Properties.VariableNames(:) = cols_onLOW; 
        avgratiostimeSEM = [avg_onLOW all_secs onLOWSEM];
        
        allratiosname = strcat(strain_name, 'all_onLOWD');
        avgratiosname = strcat(strain_name, 'avg_onLOWD');
        allratiosname = fullfile(pdirR0,allratiosname);        
        avgratiosname = fullfile(pdirR0,avgratiosname);        
        writetable(TonLOW, allratiosname,'Filetype', 'spreadsheet'); %write all adj ratios to excel 
        writematrix(avgratiostimeSEM,avgratiosname,'Filetype', 'spreadsheet'); %write avg to excel
        
        
        %for onLOWog
        TonLOW = array2table(onLOWog); %convert adjratios to table
        TonLOW.Properties.VariableNames(:) = cols_onLOW; 
        avgratiostimeSEM = [avg_onLOWog all_secs onLOWSEMog];
        
        allratiosname = strcat(strain_name, 'all_onLOWog');
        avgratiosname = strcat(strain_name, 'avg_onLOWog');
        allratiosname = fullfile(pdirR0,allratiosname);        
        avgratiosname = fullfile(pdirR0,avgratiosname);        
        writetable(TonLOW, allratiosname,'Filetype', 'spreadsheet'); %write all adj ratios to excel 
        writematrix(avgratiostimeSEM,avgratiosname,'Filetype', 'spreadsheet'); %write avg to excel
        
            if     c == 1
                mock_onLOW_og = avgratiostimeSEM;
    
            elseif c == 2 
                avsv_onLOW_og = avgratiostimeSEM;
                
            elseif c == 3 
                sexc_onLOW_og = avgratiostimeSEM;
            end  
        
        
        %for onLOWog_ON
        TonLOW_ON = array2table(onLOWog_ON); %convert adjratios to table
        cols_onLOW_ON = string(cols_onLOW_ON); %convert cell array of strings to string array
        cols_onLOW_ON = matlab.lang.makeValidName(cols_onLOW_ON, 'Prefix', 'm');% convert col_names to valid variable names (must start with letter)
        TonLOW_ON.Properties.VariableNames(:) = cols_onLOW_ON; 
        avgratiostimeSEM = [avg_onLOWog_ON all_secs onLOWSEMog_ON];
        
        allratiosname = strcat(strain_name, 'all_onLOWog_ON');
        avgratiosname = strcat(strain_name, 'avg_onLOWog_ON');
        allratiosname = fullfile(pdirR0,allratiosname);        
        avgratiosname = fullfile(pdirR0,avgratiosname);        
        writetable(TonLOW_ON, allratiosname,'Filetype', 'spreadsheet'); %write all adj ratios to excel 
        writematrix(avgratiostimeSEM,avgratiosname,'Filetype', 'spreadsheet'); %write avg to excel


    end

    %% Here go 3 condition plots (this version plotting only AR/R0 for altogether and onLOW)
    
    %change strain name to no longer include condition (or else they all say sexcond)
    s = strfind(cond,'_');   
    allcond = extractBefore(cond,s(1));


    strain_name = strcat(strain,allcond);
    clear  s

        %% for altogether 
            %calculate SEM top and bottom lines for each condition
            SEMmockT = mock_og(:,1) + mock_og(:,3);
            SEMmockB = mock_og(:,1) - mock_og(:,3);
            SEMavsvT = avsv_og(:,1) + avsv_og(:,3);
            SEMavsvB = avsv_og(:,1) - avsv_og(:,3);
            SEMsexcT = sexc_og(:,1) + sexc_og(:,3);
            SEMsexcB = sexc_og(:,1) - sexc_og(:,3);
            
            %% Plot time 0-70 (in video time this is 80-150)
            figure
            hold on 
            ylim ([-2,2]);
            xlim ([80, 230]);
            
            
            xticks([80 110 170 230 290 350]) %s since baseline begins
            xticklabels({'0' '30' '90' '150' '210' '270'}) %time in secs since baseline begins
            xlabel('Time (s)')
            ylabel('(R - R0)/R0')
            
            
            %add shading for stim ON/OFF
            xcoords = [80 110 170 ; 80 110 170 ; 110 170 230; 110 170 230 ];
            ycoords = [-5 -5 -5  ; +5 +5 +5 ; +5 +5 +5 ; -5 -5 -5];
            colors = [grayrgb; bluergb; grayrgb]; 
            colors3d = colors( :,1);
            colors3d(:,:,2) = colors(:,2);
            colors3d(:,:,3) = colors(:,3);
            patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 )
            
            %Add shading for each SEM and plot time(x) vs ratios(y)
            
            %mock
            patch([mock_og(792:2277,2)' flip(mock_og(792:2277,2))'], [SEMmockT(792:2277)' flip(SEMmockB(792:2277))'], mockgray, 'EdgeColor', 'none', 'FaceAlpha', 0.2); 
            plot(mock_og(:,2), mock_og(:,1), 'color', mockgray, 'LineWidth', 1.5)
            plotname = strcat(strain_name, '_m');
            title(strcat('Average all conditions', plotname))
            plotname = fullfile(pdir3c,plotname);
            % saveas(gcf,plotname,'png');
            
            %add aversive
            patch([avsv_og(792:2277,2)' flip(avsv_og(792:2277,2))'], [SEMavsvT(792:2277)' flip(SEMavsvB(792:2277))'], avsvgreen, 'EdgeColor', 'none', 'FaceAlpha', 0.2); 
            plot(avsv_og(:,2), avsv_og(:,1), 'color', avsvgreen, 'LineWidth', 1.5)
            plotname = strcat(strain_name, '_ma');
            title(strcat('Average all conditions', plotname))
            plotname = fullfile(pdir3c,plotname);            
            % saveas(gcf,plotname,'png');
            
            %add sex cond
            patch([sexc_og(792:2277,2)' flip(sexc_og(792:2277,2))'], [SEMsexcT(792:2277)' flip(SEMsexcB(792:2277))'], sexcondpink, 'EdgeColor', 'none', 'FaceAlpha', 0.2); 
            plot(sexc_og(:,2), sexc_og(:,1), 'color', sexcondpink, 'LineWidth', 1.5)
            plotname = strcat(strain_name, '_masc');
            title(strcat('Average all conditions', plotname))
            plotname = fullfile(pdir3c,plotname);            
            saveas(gcf,plotname,'png');
            plotname = strcat(plotname,'.eps');
            exportgraphics(gcf,plotname,'ContentType','vector');            
            
            
            
            %add lines and save again
            xline(80)
            xline(85)
            xline(90)
            xline(95)
            xline(100)
            xline(105)
            xline(110)
            xline(115)
            xline(120)
            xline(125)
            xline(130)
            xline(135)
            xline(140)
            xline(145)
            xline(150)
            xline(155)
            xline(160)
            xline(165)
            xline(170)
            xline(175)
            xline(180)
            xline(185)
            xline(190)
            xline(195)
            xline(200)
            xline(205)
            xline(210)
            xline(215)
            xline(220)
            xline(225)
            xline(230)
            xline(235)
            plotname = strcat(strain_name, '_masc_lines');
            title(strcat('Average', plotname))
            plotname = fullfile(pdir3c,plotname);            
            saveas(gcf,plotname,'png');
            
            
            %avsv alone
            figure
            hold on 
            ylim ([-2,2]);
            xlim ([80, 230]);
            xticks([80 110 170 230 290 350]) %s since baseline begins
            xticklabels({'0' '30' '90' '150' '210' '270'}) %time in secs since baseline begins
            xlabel('Time (s)')
            ylabel('(R - R0)/R0')
            patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 )    
            plot(avsv_og(:,2), avsv_og(:,1), 'color', avsvgreen, 'LineWidth', 1.5)
            patch([avsv_og(792:2277,2)' flip(avsv_og(792:2277,2))'], [SEMavsvT(792:2277)' flip(SEMavsvB(792:2277))'], avsvgreen, 'EdgeColor', 'none', 'FaceAlpha', 0.2); 
            plotname = strcat(strain_name, '_a');
            title(strcat('Average', plotname))
            plotname = fullfile(pdir3c,plotname);
            % saveas(gcf,plotname,'png');
            
        
            %sexc alone
            figure
            hold on 
            ylim ([-2,2]);
            xlim ([80, 230]);
            xticks([80 110 170 230 290 350]) %s since baseline begins
            xticklabels({'0' '30' '90' '150' '210' '270'}) %time in secs since baseline begins
            xlabel('Time (s)')
            ylabel('(R - R0)/R0')
            patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 )
            plot(sexc_og(:,2), sexc_og(:,1), 'color', sexcondpink, 'LineWidth', 1.5)
            patch([sexc_og(792:2277,2)' flip(sexc_og(792:2277,2))'], [SEMsexcT(792:2277)' flip(SEMsexcB(792:2277))'], sexcondpink, 'EdgeColor', 'none', 'FaceAlpha', 0.2); 
            plotname = strcat(strain_name, '_sc');
            title(strcat('Average', plotname))
            plotname = fullfile(pdir3c,plotname);
            % saveas(gcf,plotname,'png');


        %% for onLOW only
        %% region of interest only onLOW
        
            SEMmockonLOWT = mock_onLOW_og(:,1) + mock_onLOW_og(:,3);
            SEMmockonLOWB = mock_onLOW_og(:,1) - mock_onLOW_og(:,3);
            SEMavsvonLOWT = avsv_onLOW_og(:,1) + avsv_onLOW_og(:,3);
            SEMavsvonLOWB = avsv_onLOW_og(:,1) - avsv_onLOW_og(:,3);
            SEMsexconLOWT = sexc_onLOW_og(:,1) + sexc_onLOW_og(:,3);
            SEMsexconLOWB = sexc_onLOW_og(:,1) - sexc_onLOW_og(:,3);
        
        
            figure
            hold on 
            ylim ([-2,2]);
            xlim ([160, 230]);
            xticks([160 170 230]) %s since baseline begins
            xticklabels({'0' '10' '70' }) %time in secs 
            xlabel('Time (s)')
            ylabel('(R - R0)/R0')
            patch(xcoords, ycoords, colors3d, 'FaceAlpha', .3,'EdgeAlpha',0 )
            
            
            %Add shading for each SEM and plot time(x) vs ratios(y)
            
            %mock
            patch([mock_onLOW_og(792:2277,2)' flip(mock_onLOW_og(792:2277,2))'], [SEMmockonLOWT(792:2277)' flip(SEMmockonLOWB(792:2277))'], mockgray, 'EdgeColor', 'none', 'FaceAlpha', 0.2); 
            plot(mock_onLOW_og(:,2), mock_onLOW_og(:,1), 'color', mockgray, 'LineWidth', 1.5)
            plotname = strcat(strain_name, '_m_cut');
            title(strcat('Average all conditions', plotname))
            plotname = fullfile(pdir3c,plotname);
            % saveas(gcf,plotname,'png');
            
            %add aversive
            patch([avsv_onLOW_og(792:2277,2)' flip(avsv_onLOW_og(792:2277,2))'], [SEMavsvonLOWT(792:2277)' flip(SEMavsvonLOWB(792:2277))'], avsvgreen, 'EdgeColor', 'none', 'FaceAlpha', 0.2); 
            plot(avsv_onLOW_og(:,2), avsv_onLOW_og(:,1), 'color', avsvgreen, 'LineWidth', 1.5)
            plotname = strcat(strain_name, '_ma_cut');
            title(strcat('Average all conditions', plotname))
            plotname = fullfile(pdir3c,plotname);
            % saveas(gcf,plotname,'png');
            
            %add sex cond
            patch([sexc_onLOW_og(792:2277,2)' flip(sexc_onLOW_og(792:2277,2))'], [SEMsexconLOWT(792:2277)' flip(SEMsexconLOWB(792:2277))'], sexcondpink, 'EdgeColor', 'none', 'FaceAlpha', 0.2); 
            plot(sexc_onLOW_og(:,2), sexc_onLOW_og(:,1), 'color', sexcondpink, 'LineWidth', 1.5)
            plotname = strcat(strain_name, '_masc_cut');
            title(strcat('Average all conditions', plotname))
            plotname = fullfile(pdir3c,plotname);
            saveas(gcf,plotname,'png');
            plotname = strcat(plotname,'.eps');
            exportgraphics(gcf,plotname,'ContentType','vector');



            %% here goes 3 conds histos ( max activity during od on)
                %%for max activation histo        
            binedges = (-1:0.5:6);
             
            figure
            hold on
            title(strcat('histogram max activation during odour off of onLOW neurons', strain_name))
            xlabel('max (R - R0)/R0')
            ylim([0 0.6])
            
            histogram(mockhm,binedges, 'normalization','probability','EdgeColor', mockgray,  'FaceColor', mockgray,'FaceAlpha', 0.4) 
            histogram(avsvhm,binedges, 'normalization','probability','EdgeColor', avsvgreen, 'FaceColor', avsvgreen,'FaceAlpha', 0.2) 
            histogram(sexchm,binedges, 'normalization','probability','EdgeColor', sexcondpink, 'FaceColor', sexcondpink,'FaceAlpha', 0.2) 
            
            
            
            
            histoname = strcat(strain_name, 'histomax');
            histoname = fullfile(pdir3c,histoname);
            saveas(gcf,histoname,'png');
            histoname = strcat(histoname,'.eps');
            exportgraphics(gcf,histoname,'ContentType','vector');
                

            %% here goes 3 conds prop plots (cum & non-cum)


            for i = 1:2
                if i == 1 %first run it on all non-cumulative prop plots
                mockp = mockpnc;
                avsvp = avsvpnc;
                sexcp = sexcpnc;
                prop = 'ncprop';

                elseif i== 2 %second run it on all cumulative prop plots
                mockp = mockpc;
                avsvp = avsvpc;
                sexcp = sexcpc;
                prop = 'cumprop';

                end


                 % plot baseline on prop
                figure
                hold on 
                ylim ([0,1]);
                xlim ([timesecs(1), timesecs(2)]);
                xticks([timesecs(1) timesecs(2)]) %s since odour on begins begins
                xticklabels({'0' '30' }) %time in secs since odour on begins
                xlabel('Time (s)')
                ylabel('proportion bLOWneurons ON')
                title(strcat( strain_name, prop,'baseline'))
                
                
                %column 4 is time, column 1 is ponall, column 2pofall column 3 pbonall 
                plot(mockp(:,4), mockp(:,3),'color', mockgray,'LineWidth', 1.5)
                plot(avsvp(:,4), avsvp(:,3),'color', avsvgreen,'LineWidth', 1.5)
                plot(sexcp(:,4), sexcp(:,3),'color', sexcondpink,'LineWidth', 1.5)
                
                
                propplotname = strcat(strain_name,prop, 'prop_baseline');
                propplotname = fullfile(pdir3c,propplotname);
                saveas(gcf,propplotname,'png');
                propplotname = strcat(propplotname,'.eps');
                exportgraphics(gcf,propplotname,'ContentType','vector');

                % plot odour on on prop
                
                figure
                hold on 
                ylim ([0,1]);
                xlim ([timesecs(2), timesecs(3)]);
                xticks([timesecs(2) timesecs(3)]) %s since odour on begins begins
                xticklabels({'0' '60' }) %time in secs since odour on begins
                xlabel('Time (s)')
                ylabel('proportion offHIGHneurons ON')
                title(strcat( strain_name,prop, 'Odour ON '))
                
                
                %column 4 is time, column 1 is ponall, column 2pofall column 3 pbonall 
                plot(mockp(:,4), mockp(:,1),'color', mockgray,'LineWidth', 1.5)
                plot(avsvp(:,4), avsvp(:,1),'color', avsvgreen,'LineWidth', 1.5)
                plot(sexcp(:,4), sexcp(:,1),'color', sexcondpink,'LineWidth', 1.5)
                
                
                propplotname = strcat(strain_name, prop,'prop_odouron');
                propplotname = fullfile(pdir3c,propplotname);
                saveas(gcf,propplotname,'png');
                propplotname = strcat(propplotname,'.eps');
                exportgraphics(gcf,propplotname,'ContentType','vector');
                
                % plot odour off on prop
                
                figure
                hold on 
                ylim ([0,01]);
                xlim ([timesecs(3), timesecs(4)]);
                xticks([timesecs(3) timesecs(4)]) %s since odour off begins
                xticklabels({'0' '60' }) %time in secs since odour off begins
                xlabel('Time (s)')
                ylabel('proportion onLOWneurons ON')
                title(strcat(strain_name,prop, 'Odour off'))
                
                
                plot(mockp(:,4), mockp(:,2),'color', mockgray,'LineWidth', 1.5)
                plot(avsvp(:,4), avsvp(:,2),'color', avsvgreen,'LineWidth', 1.5)
                plot(sexcp(:,4), sexcp(:,2),'color', sexcondpink,'LineWidth', 1.5)
                
                propplotname = strcat(strain_name,prop, 'prop_odouroff');
                propplotname = fullfile(pdir3c,propplotname);
                saveas(gcf,propplotname,'png');
                propplotname = strcat(propplotname,'.eps');
                exportgraphics(gcf,propplotname,'ContentType','vector');


            end

            clear i
end
