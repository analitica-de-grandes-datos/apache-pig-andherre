/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.csv' USING PigStorage(',') AS (fid:int, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, num:int);
table_date = FOREACH data GENERATE GetYear(ToDate(fecha,'yyyy-MM-dd')) AS columna_1;
cluster = GROUP table_date BY columna_1;
contador = FOREACH cluster GENERATE group, COUNT(tabla_fecha);
STORE contador INTO 'output' using PigStorage(',');