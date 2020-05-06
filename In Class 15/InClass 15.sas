Data one;
Set Nick.TBone;
if year=1995;

lpackpc=log(packpc);
ravgprs=avgprs/cpi;
lravgprs=log(ravgprs);
incomepc=income/pop;
lincomepc=log(incomepc);

rtax=tax/cpi;
rtaxs=taxs/cpi;
rtaxso=rtaxs-rtax;
*Estimating the predicted value of the log of the price variable (lravgprshat);
ods pdf;
proc reg;
model lpackpc=lravgprs lincomepc;
run;

proc reg;
model lravgprs=rtaxso lincomepc;
output out=two
         p=lravgprshat; 
run;
Proc Syslin 2sls;
      Endogenous  lpackpc lravgprs;
	Instruments rtaxso lincomepc;
       Model lpackpc=lravgprs lincomepc;
run;
ods pdf close;
