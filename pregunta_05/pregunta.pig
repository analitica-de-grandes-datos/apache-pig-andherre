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
cor_colum = FOREACH data GENERATE corchetes;
flatten_corchetes = FOREACH cor_colum GENERATE FLATTEN(TOKENIZE(corchetes)) AS letras;
nule_cor_1 = FILTER flatten_corchetes BY NOT (letras MATCHES '{');
nule_cor_2 = FILTER nule_cor_1 BY NOT (letras MATCHES '}');
g_letras = GROUP nule_cor_2 BY letras;
g_letras_count = FOREACH g_letras GENERATE group, COUNT(nule_cor_2);
STORE g_letras_count INTO 'output' using PigStorage(',');
