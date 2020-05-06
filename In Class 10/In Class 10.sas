data One;
set Nick.Test45;
avginc2= avginc**2;
avginc3= avginc**3;
lnavginc= log(avginc);
ods pdf;
proc reg;
model testscr= avginc;
run;

proc reg;
model testscr= avginc avginc2;
run;

proc reg;
model testscr= avginc avginc2 avginc3;
run;

proc reg;
model testscr= lnavginc;
run;
ods pdf close;
