data one;
set Test426.Test;
avginc1=avginc*1000;
run;

proc reg;
model testscr=str;
model testscr = str el_pct;
proc means;
var el_pct;
proc reg;
model testscr= str calw_pct;
title 'Econ 426, In-Class Excercise #2';
run;
