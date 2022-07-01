/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv' AS (letra:chararray, fecha:chararray, numero:int);
order_data = ORDER data BY numero asc;
s = LIMIT order_data 5;
colum_2 = FOREACH s GENERATE numero as num_0;
STORE colum_2 INTO 'output' using PigStorage(',');