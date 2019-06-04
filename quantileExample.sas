DATA quant;
	cVal = QUANTILE('T',1-.01/2,45);
RUN;	

PROC PRINT DATA=quant;
	VAR cVal;
RUN;

DATA density;
	SET quant;
	DO x = -4 TO 4 BY .001;
    	density = PDF("T", x, 45);
    	lower = 0;
    	IF x <= -cVal OR x >= cVal THEN upper = density;
    	ELSE upper = 0;
    	OUTPUT;
	END;
RUN;

TITLE 't probability density function';
PROC SGPLOT DATA=density NOAUTOLEGEND NOBORDER;
  YAXIS DISPLAY=none;
  BAND X = x LOWER = lower UPPER = upper / FILLATTRS=(COLOR=gray8a);
  SERIES X = x Y = density / LINEATTRS= (COLOR = black);
  SERIES X = x Y = lower / LINEATTRS = (COLOR = black);
RUN;
