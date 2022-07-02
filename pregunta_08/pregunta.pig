/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv' AS (letra:chararray, corchetes:chararray, lista:chararray);
col = FOREACH data GENERATE FLATTEN(TOKENIZE(corchetes,',')) AS col_2, FLATTEN(TOKENIZE(lista,',')) AS col_3;
null_alfanum = FOREACH col GENERATE REPLACE (col_2,'([^a-zA-Z\\s]+)','') as col_2, REPLACE (col_3,'([^a-zA-Z\\s]+)','') as col_3;
tupla = FOREACH null_alfanum GENERATE TOTUPLE(col_2, col_3) as pareja;
grup = GROUP generar_tupla BY pareja;
grup_2 = FOREACH grup GENERATE group, COUNT(tupla);
STORE grup_2 INTO 'output' using PigStorage(',');