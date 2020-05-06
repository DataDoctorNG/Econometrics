data one;
set Nick.CPS;
dbachelor= bachelor*female;
dage= age*female;
proc sort;
by female;
ods pdf;
proc reg;
model ahe= bachelor age;
by female; 
run;

proc reg;
model ahe= bachelor age;
run;

proc reg;
model ahe= female bachelor dbachelor age dage;
test female=0, dbachelor=0, dage=0;
run;
ods pdf close;
