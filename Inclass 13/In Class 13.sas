data one;
set Nick.Inequality;
ods pdf;
proc corr;
 var Gini RGDP Education POPGROW;
 run;

proc reg;
model Gini = RGDP Education POPGROW;
model Gini = RGDP POPGROW;
model Gini = Education POPGROW;
run;

proc reg;
model RGDP = Education POPGROW ;
model Education = POPGROW RGDP;
model POPGROW = Education RGDP;
run;

proc reg; 
model Gini = RGDP Education POPGROW/vif;
run;
ods pdf close;
