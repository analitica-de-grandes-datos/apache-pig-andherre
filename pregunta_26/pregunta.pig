/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname 
   FROM 
       u 
   WHERE 
       SUBSTRING(firstname, 0, 1) >= 'm';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' USING PigStorage(',') AS (fid:int, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, num:int);
table_name = FOREACH data GENERATE nombre AS col_1;
result = FILTER table_name BY SUBSTRING(col_1, 0, 1) MATCHES 'M' OR SUBSTRING(col_1, 0, 1) MATCHES 'N' OR SUBSTRING(col_1, 0, 1) MATCHES 'O' OR SUBSTRING(col_1, 0, 1) MATCHES 'P' OR SUBSTRING(col_1, 0, 1) MATCHES 'Q' OR SUBSTRING(col_1, 0, 1) MATCHES 'R' OR SUBSTRING(col_1, 0, 1) MATCHES 'S' OR SUBSTRING(col_1, 0, 1) MATCHES 'T' OR SUBSTRING(col_1, 0, 1) MATCHES 'U' OR SUBSTRING(col_1, 0, 1) MATCHES 'V' OR SUBSTRING(col_1, 0, 1) MATCHES 'W' OR SUBSTRING(col_1, 0, 1) MATCHES 'X' OR SUBSTRING(col_1, 0, 1) MATCHES 'Y' OR SUBSTRING(col_1, 0, 1) MATCHES 'Z';
STORE result INTO 'output' using PigStorage(',');
