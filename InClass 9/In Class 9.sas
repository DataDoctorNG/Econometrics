data one;
set Nick.Test45;
ods pdf;
proc reg;
model testscr= avginc;
plot testscr*avginc;
run;

data two;
set Nick.Test45;
lnavginc= log(avginc);
lntestscr= log(testscr);

proc reg;
model testscr= lnavginc;
plot testscr*lnavginc;
run;

proc reg;
model lntestscr= avginc;
plot lntestscr*avginc;
run;

proc reg;
model lntestscr= lnavginc;
plot lntestscr*lnavginc;
run;
 
ods pdf close;
