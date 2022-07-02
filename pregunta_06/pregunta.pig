/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv' AS (letra:chararray, corchetes:chararray, lista:chararray);
col_3 = FOREACH data GENERATE lista;
nule_col3 = FOREACH col_3 GENERATE FLATTEN(TOKENIZE(lista)) AS mapas;
replace_col3_1 = FOREACH nule_col3 GENERATE REPLACE(mapas,'([^a-zA-Z\\s]+)','') AS mapas;
letras = GROUP replace_col3_1 BY mapas;
letras_count = FOREACH letras GENERATE group, COUNT(replace_col3_1);
STORE letras_count INTO 'output' using PigStorage(',');
