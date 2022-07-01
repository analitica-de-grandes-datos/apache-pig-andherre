/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv' AS (letra:chararray, corchetes:chararray, lista:int);
corchetes_col = FOREACH data GENERATE corchetes;
flatten_corchetes = FOREACH corchetes_col GENERATE FLATTEN(TOKENIZE(corchetes)) AS letras;
sin_corchetes_1 = FILTER flatten_corchetes BY NOT (letras MATCHES '{')
sin_corchetes_2 = FILTER sin_corchetes_1 BY NOT (letras MATCHES '}')
letras = GROUP sin_corchetes_2 BY letras;
letras_count = FOREACH letras GENERATE group, COUNT(sin_corchetes_2);
STORE grupo_letras_count INTO 'output' using PigStorage(',');