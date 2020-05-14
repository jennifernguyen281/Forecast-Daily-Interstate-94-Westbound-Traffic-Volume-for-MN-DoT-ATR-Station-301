DATA NEW; 
SET SASUSER.Project_off_2; 
PROC ARIMA; 
identify var = sum_traffic_volume(7) noprint;
RUN;

proc arima;
identify var = average_temp(1);
estimate p = (1) q = (1,2) noint method = ml;
identify var = sum_traffic_volume(7) crosscor = average_temp(1);

* b = 6, s = 1, r = 2 with noise model ARIMA(1,0,0)(0,0,1);
ESTIMATE INPUT=(6$(1)/(1,2)average_temp) p=(1) Q = (7) noint METHOD=ML plot ; 
run;

proc arima;
identify var = average_clouds_all(1);
estimate q = (1,2) noint method = ml;
identify var = sum_traffic_volume(7) crosscor = average_clouds_all(1);

*b = 0, s = 6, r = 0 with noise model = ARIMA(1,0,0)(0,0,1);

ESTIMATE INPUT=(0$(1,2,3,4,5,6)/average_clouds_all) p =(1) Q = (7) noint METHOD=ml plot; 

run;

proc arima;
identify var = average_temp(1);
estimate p = (1) q = (1,2) noint method = ml;

identify var = average_clouds_all(1);
estimate q = (1,2) noint method = ml;

identify var = sum_traffic_volume(7) crosscor = average_temp(1);

I VAR=sum_traffic_volume(7) CROSSCOR=(average_temp(1) average_clouds_all(1)) NOPRINT; 

*the noise model for the multiple output has not been completed yet;
ESTIMATE INPUT=(6$(1)/(1,2)average_temp 0$(1,2,3,4,5,6)/average_clouds_all) Q = (7) noint METHOD=ML plot ; 

RUN; 


