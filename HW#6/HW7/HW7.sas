data one;
set work.boston;
if s7=3 then deny=1;else deny=0;pi_rat=s46/100;if s13=3 then black=1;else black=0;if s15=1 then male=1;else male=0;loan_value=s6/s50;consumer_credit=s43;self_emp=s27a;
run;

ods pdf;
title "Linear Probability Model";
proc reg;
model deny= black male loan_value consumer_credit self_emp pi_rat;
run;

title "Logistic Model";
proc logistic desc;
model deny= black male loan_value consumer_credit self_emp pi_rat;
run;

proc means;
var consumer_credit pi_rat loan_value;
run;

ods pdf close;
