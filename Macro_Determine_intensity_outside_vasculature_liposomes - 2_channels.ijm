//Input is a .tif confocal image stack with 2 channels: (1) BMEC vasculature network labelled with GFP/other marker, (2) fluorescence signal to quantify
//User is first prompted to select folder containing multiple .tif image stacks for analysis 
dir = getDirectory("Choose a Directory");
list = getFileList(dir);  
for (j=0; j<list.length; j++) { 
if (endsWith(list[j],"tif")) { 
path = dir+list[j]; 
open(path); 
print(getTitle());
run("Split Channels"); 
selectWindow("C1-" + list[j]); 
rename("Vasculature"); 
selectWindow("C2-" + list[j]); 
rename("signal");  

//Process vasculature channel, slice by slice 
selectWindow("Vasculature");
for (i=0; i<nSlices; i++) { 
run("8-bit"); 
run("Enhance Contrast", "saturated=5"); 
for(k=0; k<10; k++) run("Despeckle", "slice"); 
run("Gaussian Blur...", "sigma=6.0 slice"); 
//Threshold and Binarise 
run("Auto Threshold", "method=Percentile");
run("Auto Threshold", "method=Percentile dark");
getThreshold(lower, upper ); 
setThreshold(lower, upper ); 
run("Convert to Mask", "only"); 
run("Next Slice [>]");} 
 
//Process signal channel, slice by slice 
selectWindow("signal");
for (i=0; i<nSlices; i++) { 
run("8-bit"); 
run("Next Slice [>]");}
 
//Measure signal intensity within vessel outlines 
close("Results");
selectWindow("Vasculature");
run("Invert", "stack");
imageCalculator("AND create stack", "Vasculature","signal");
selectWindow("Result of Vasculature"); 
saveAs("Tiff", dir + File.separator + replace(list[j], ".tif", "_merged_outside.tif"));

run("Set Measurements...", "area mean integrated median redirect=None decimal=3");
for (i=0; i<nSlices; i++) { 
run("Measure");
run("Next Slice [>]");}

//waitForUser("copy results for signal, name the output with most recent output, then hit OK to proceed with next stack in folder");   
//close("Results");
saveAs("Results", dir + File.separator + replace(list[j], ".tif", "_signal_outside.csv"));
while (nImages>0) {selectImage(nImages);
close();} 
}}

