data one;
set Nick.College1;
run;
ods pdf;
proc reg;
model yrsed=Dist Female Black Hispanic Incomehi Ownhome DadColl Cue80 Stwmfg80;
run;


class yrsed;
var female stwmfg80;
run;
ods pdf close;
