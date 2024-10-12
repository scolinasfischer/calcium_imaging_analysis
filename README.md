# calcium_imaging_analysis
Code used for analysis of calcium imaging data

For each neuron, two steps are required:
1. Extract raw fluorescence ratios from neuron output .mat file (containing raw neuron ratios extracted from video file)
3. analyse these ratios, differently for each neuron according to our research questions.

For MCM, AVB, AIY, RIM and AIB, Step 1 requires the file "ExtractRatiosToExcel_paper.m".
For RIA, Step 1 requires the file "ExtractRatiosRaw_RIA_paper.m"
For Step 2, each neuron has its own file (remaining files in folder, each named accordng to the neuron used). 
