libname class 'C:\Documents';

title 'Modeling Dengue Deaths';
proc logistic data=class.dengue plots(only)=(oddsratio);
class country(ref='Pakistan') / param=ref;
model died(event='1') = age country weight malaria/ clodds=pl clparm=pl;
run;

data validation;
	length country $8;
	input died age country $ weight malaria;
	datalines;
	1  21 Pakistan 110 0
	0  40 India 120 0
	1  31 Other 130 1
	0  28 Pakistan 140 1
	1  35 India 100 0
	;
run;

proc logistic data=class.dengue plots(only)=(oddsratio);
class country(ref='Pakistan') / param=ref;
model died(event='1') = age country weight malaria/ clodds=pl clparm=pl;
score data=validation out=scores;
run;
