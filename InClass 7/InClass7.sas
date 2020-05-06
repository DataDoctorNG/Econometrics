data one;
set Nick.Dummy;
female_educ=female*educ;
run;
ods pdf;
proc reg;
model Wage= educ;
run;

proc reg;
model Wage= female educ female_educ;
run;

proc reg;
model Wage= female educ;
run;

proc reg;
model Wage= female female_educ;
run;

proc reg;
model Wage= educ female_educ;
run;
ods pdf close;
