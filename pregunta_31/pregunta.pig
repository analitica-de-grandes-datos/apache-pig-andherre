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

table_years = FOREACH data GENERATE GetYear(date) as year;
table_years_grouped = GROUP table_years BY year;
table_years_counted = FOREACH table_years_grouped GENERATE group, COUNT(table_years);

STORE table_years_counted INTO 'output' USING PigStorage(',');