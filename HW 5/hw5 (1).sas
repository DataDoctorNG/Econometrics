data one;
set Work.CIGARETTES;
lnSales1 = log(Sales1);
lnPrice = log(Price);
lnIncome = log(Income);
label Sales = 'Fiscal Year 2015 Cigarette Pack Sales'
lnSales1 = 'Fiscal Year 2015 Normalized Cigarette Pack Sales'
lnIncome = '2015 State Per Capita Personal Income (in dollars)'
Population = '2015 State Population'
lnPrice = 'Retail Price Per Pack of Cigarettes With All Taxes';

ods pdf;
proc reg;
model lnSales1 = lnPrice lnIncome;
run;

ods pdf close;


 

