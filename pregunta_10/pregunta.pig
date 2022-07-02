/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' USING PigStorage(',') AS (id:CHARARRAY, name:CHARARRAY, last_name:CHARARRAY, date:CHARARRAY, color:CHARARRAY, value:int);
colum = FOREACH data GENERATE name, last_name;
colum_len = FOREACH colum GENERATE last_name, SIZE(last_name) AS length;
colum_order = ORDER colum_len BY length DESC, last_name ASC;
colum_limit = LIMIT colum_order 5;
STORE colum_limit INTO 'output' USING PigStorage(',');
