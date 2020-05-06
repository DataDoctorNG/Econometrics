data two;
set one;
if Shadow1<20 then Underground='Small';
else if Shadow1<40 then Underground='Medium';
else Underground='Large';
run;

proc freq;
tables Underground*Advanced;
run;
