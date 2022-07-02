/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código en Pig para manipulación de fechas que genere la siguiente 
salida.

   1971-07-08,jul,07,7
   1974-05-23,may,05,5
   1973-04-22,abr,04,4
   1975-01-29,ene,01,1
   1974-07-03,jul,07,7
   1974-10-18,oct,10,10
   1970-10-05,oct,10,10
   1969-02-24,feb,02,2
   1974-10-17,oct,10,10
   1975-02-28,feb,02,2
   1969-12-07,dic,12,12
   1973-12-24,dic,12,12
   1970-08-27,ago,08,8
   1972-12-12,dic,12,12
   1970-07-01,jul,07,7
   1974-02-11,feb,02,2
   1973-04-01,abr,04,4
   1973-04-29,abr,04,4

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.csv' USING PigStorage(',') AS (fid:int, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, num:int);
table_date = FOREACH data GENERATE fecha AS col_1, LOWER(ToString(ToDate(fecha,'yyyy-MM-dd'), 'MMM')) AS col_2, ToString(ToDate(fecha,'yyyy-MM-dd'), 'MM') AS col_3, GetMonth(ToDate(fecha,'yyyy-MM-dd')) AS col_4;
table_date_1 = FOREACH table_date GENERATE col_1, (col_2 == 'jan'? 'ene':(col_2 == 'apr'? 'abr':(col_2 == 'aug'? 'ago':(col_2 == 'dec'? 'dic':col_2)))) AS col_2, col_3, col_4;
STORE table_date_1 INTO 'output' using PigStorage(',');