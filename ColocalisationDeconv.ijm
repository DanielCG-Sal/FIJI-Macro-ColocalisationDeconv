run("Set Measurements...", "area display redirect=None decimal=3");

run("Make Composite");
name=getTitle();
selectImage(name);
roiManager("Select", 0);

//-- 
run("Duplicate...", "title=dup duplicate");
selectWindow("dup");
roiManager("Add");
roiManager("Select", 1);
roiManager("Rename", "Total");


selectWindow("dup");
roiManager("Select", 1);
//Select the first channel to be quantified
run("Duplicate...", "title=C1 duplicate channels=1");
run("Clear Outside");
selectImage(name);

selectWindow("dup");
roiManager("Select", 1);
//Select the second channel to be quantified
run("Duplicate...", "title=C2 duplicate channels=2");
run("Clear Outside");

roiManager("Select", 0);
roiManager("Delete");
// --
run("Select None");

run("Iterative Deconvolution", "operation=Deconvolve image=C1 point=C1 number=4 lp=2 monotonic");
selectWindow("Deconvolved4_2.00");
rename("DC1");

selectWindow("C1");
run("Iterative Deconvolution", "operation=Deconvolve image=C2 point=C2 number=4 lp=2 monotonic");
selectWindow("Deconvolved4_2.00");
rename("DC2");


run("Threshold...");

//THRESHOLD VALUES FOR THE FIRST CHANNEL
selectWindow("DC1");
setThreshold(0.000038520, 1000000000000000000000000000000.000000000);
waitForUser("Adjust threhold for channel 1");
run("Create Selection");
roiManager("Add");
roiManager("Select", 1);
roiManager("Rename", "DC1");

//THRESHOLD VALUES FOR THE SECOND CHANNEL
selectWindow("DC2");
setThreshold(0.000038520, 1000000000000000000000000000000.000000000);
waitForUser("Adjust threhold for channel 2");
run("Create Selection");
roiManager("Add");
roiManager("Select", 2);
roiManager("Rename", "DC2");

roiManager("Select", newArray(1,2));
roiManager("AND");
roiManager("Add");
roiManager("Select", 3);
roiManager("Rename", "Colocalisation");
roiManager("Deselect");
roiManager("Measure");