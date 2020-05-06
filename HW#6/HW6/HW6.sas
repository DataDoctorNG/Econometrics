*Part 1*;
data one;
set Work.Stockton;
lprice= log(price/10000);
sqft1= sqft/100;
sqft2= sqft1**2;
ods pdf;
proc reg;
model lprice = sqft1 sqft2 beds baths Age stories;
run;

 proc sort;
 by vacant;
 run;

proc reg;
model lprice = sqft1 sqft2 beds baths Age stories;
by vacant;
run;

data two;
set Work.Stockton;
lprice= log(price/10000);
sqft1= sqft/100;
sqft2= sqft1**2;
dbeds= beds*vacant;
dbaths= baths*vacant;
dage= age*vacant;
dsqft1= sqft1*vacant;
dsqft2= sqft2*vacant;
dage= age*vacant;
dstories= stories*vacant;
run;

proc reg;
model lprice = sqft1 sqft2 beds baths Age stories dbeds dage dsqft1 dsqft2 dstories dbaths vacant;
test dbaths= 0, dbeds = 0, dage =0, dsqft1 =0, dsqft2 =0, dstories =0, vacant =0;
run;

*Part 2*;
data three;
set Work.Books;
run;

proc reg; 
model VOL = STU FAC SAT/vif;
run;

data four;
set Work.Books;
TOT = 10*FAC + STU;
run;

proc reg; 
model VOL = SAT TOT/vif;
run;

proc reg; 
model VOL = SAT TOT/white;
plot r.*TOT;
plot r.*SAT;
run;

proc reg; 
model VOL = SAT TOT/spec white;
run;
ods pdf close;
