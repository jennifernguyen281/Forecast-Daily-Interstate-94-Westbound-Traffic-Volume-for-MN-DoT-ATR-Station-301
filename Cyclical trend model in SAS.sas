DATA NEW;
SET SASUSER.Tsfinal;
* SET SASUSER.METRO;
TIME=_N_;

*REMOVE LAST 150 VALUES OF IRC;
IF TIME>854 THEN sum_value_traffic=.;

* CREATING SINE AND COSINE TERMS AFTER LOOKING AT THE PERIODOGRAM;

COS122=COS(2*3.14159*TIME*122/854);
SIN122=SIN(2*3.14159*TIME*122/854);

COS244=COS(2*3.14159*TIME*244/854);
SIN244=SIN(2*3.14159*TIME*244/854);

COS1=COS(2*3.14159*TIME*1/854);
SIN1=SIN(2*3.14159*TIME*1/854);

COS5=COS(2*3.14159*TIME*5/854);
SIN5=SIN(2*3.14159*TIME*5/854);

COS8=COS(2*3.14159*TIME*8/854);
SIN8=SIN(2*3.14159*TIME*8/854);

COS366=COS(2*3.14159*TIME*366/854);
SIN366=SIN(2*3.14159*TIME*366/854);

PROC REG;
 MODEL sum_traffic_volume=TIME COS122 SIN122 COS244 SIN244 COS1 SIN1 COS5 SIN5 COS8 SIN8 COS366 SIN366;
 OUTPUT OUT=results P=PRED;

PROC GPLOT;
PLOT (sum_traffic_volume PRED)*TIME/OVERLAY;
SYMBOL I=JOIN;
RUN;
