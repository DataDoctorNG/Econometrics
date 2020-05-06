data one;
set Test426.Test;
label str='Student Teacher Ratio'
el_pct='Percent English Learners'
meal_pct='Percent Eligible for Subsidized Lunch'
calw_pct='Percent on Public Assistance';
avginc1=avginc*1000;
run;
Proc Corr;
proc reg;
model testscr=str;
model testscr = str el_pct;
model testscr = avginc avginc1;
model testscr = str calw_pct; 
model testscr = str calw_pct el_pct meal_pct;
model testscr = str calw_pct el_pct; 
title 'Econ 426, In-Class Excercise #2';
proc means; 
var calw_pct;
var el_pct;
data two;
set Test426.Test;
if str<20 then Small_Class = 1;
else Small_Class=0;
proc reg;
model testscr=Small_Class el_pct meal_pct calw_pct; 
run;
