data one;
set Work.Tobacco;
p1= p/(CPI1/100);
DPI1= DPI/(CPI1/100);
pbor1= pbor/(CPI1/100);
taxrt1= taxrt/(CPI1/100);
ftaxrt1= ftaxrt/(CPI1/100);
if yr<2003 then delete;
label p1 = 'Price Per Pack of Cigarrettes' 
q = 'Cigarrette Consumption'
DPI1 = 'Real Disposable Income (Per Capita)'
pbor1 = 'Real Minimum Retail Price for Geographically Close State'
taxrt1 = 'Real State Tax Rate on Cigarrettes'
ftaxrt1 = 'Real Federal Tax Rate on Cigarrettes'
mexico = 'State Border with Mexico'
producer = 'Tobacco Producing State'; 
run;

ods pdf;
proc reg;
model q= p1 DPI1 pbor1 taxrt1 ftaxrt1 canada mexico producer;
run;

proc reg;
model q=  p1 DPI1 pbor1 taxrt1 ftaxrt1 canada mexico;
run;

proc reg;
model q=  p1 DPI1 pbor1 taxrt1 ftaxrt1 producer;
run;

proc reg;
model q=  p1 DPI1 pbor1 taxrt1 ftaxrt1;
run;

proc reg;
model q=  p1 DPI1 pbor1 taxrt1;
run;

proc reg;
model q=  p1 DPI1 pbor1;
run;

proc reg;
model q=  p1 DPI1;
run;

proc reg;
model q=  p1 DPI1 pbor1 ftaxrt1 producer;
run;

proc reg;
model q=  p1 DPI1 pbor1 taxrt1 producer canada mexico;
run;

proc reg;
model q= pbor1 taxrt1 producer canada mexico;
run;

proc reg;
model q= p1 DPI1 pbor1 taxrt1 ftaxrt1 canada mexico producer cpi1;
run;

proc reg;
model q= p1 DPI1 pbor1 mexico producer;
title 'Homework #4 The Most Optimal Model';
run;

data three; 
set Work.Tobacco;
if yr < 2008 then delete;
run;
proc ttest;
class producer;
var taxrt;
run;
ods pdf close;
