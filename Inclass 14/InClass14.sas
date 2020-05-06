data one; 
set Nick.Boston;
if s7=3 then deny=1;
else deny=0;
pi_rat=s46/100;
if s13=3 then black=1;
else black=0;
run;
ods pdf;
proc reg;
model deny = pi_rat black;
model deny = pi_rat;
run;

proc sort;
by descending deny;

proc probit order=data;
class deny;
model deny= pi_rat black;
run;

proc logistic desc;
model deny=pi_rat black;
run;
ods pdf close;
