data one;
set Nick.Batt;

proc reg;
model lsalary= years gamesyr bavg hrunsyr rbisyr;
run;

proc reg;
model lsalary= years gamesyr;
run;

proc reg;
model lsalary= 

