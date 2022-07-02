/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (letra:chararray, corchetes:chararray, lista:chararray);
columnas = FOREACH data GENERATE letra, TOKENIZE(corchetes, ',') AS col_2, TOKENIZE(lista,',') AS col_3;
contar = FOREACH columnas GENERATE letra, COUNT(col_2) AS col_2, COUNT(col_3) AS col_3;
ordenar = ORDER contar BY letra, col_2, col_3 asc;
STORE ordenar INTO 'output' using PigStorage(',');