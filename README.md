# Konig_Fluo_Signal_Quant_BBB_Microvascular_networks
This repository provides scripts written in the ImageJ macro language for quantitative analysis of fluorescence intensity within microvascular networks. The macros enable location-dependent measurements, allowing users to compare fluorescence signals in vascular versus non-vascular regions. 

The input is a .tif confocal image stack with 2 channels: (1) BMEC vasculature network labelled with GFP/other marker, (2) fluorescence signal to quantify. The use should select a folder with all the stacks to analyse. The macro automatically saves csv files with the intensity values and a stack tif file of the signal within the defined microvasculature outline.

## Files
- https://github.com/S-Konig/Konig_Fluo_Signal_Quant_BBB_Microvascular_networks/blob/main/Macro_Determine_intensity_inside_vasculature_liposomes%20-%202_channels.ijm Run this script in FIJI/imageJ to analyse fluorescence signal inside the the vasculature.
- https://github.com/S-Konig/Konig_Fluo_Signal_Quant_BBB_Microvascular_networks/blob/main/Macro_Determine_intensity_outside_vasculature_liposomes%20-%202_channels.ijm Run this script in FIJI/imageJ to analyse fluorescence signal outside the the vasculature. 
