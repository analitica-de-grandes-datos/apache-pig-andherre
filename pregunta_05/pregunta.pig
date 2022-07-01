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

e_trucks = LOAD 'data.csv' USING PigStorage(',')
    AS (
            driverId:int,
            truckId:int,
            eventTime:chararray,
            eventType:chararray,
            longitude:double,
            latitude:double,
            eventKey:chararray,
            correlationId:long,
            driverName:chararray,
            routeId:long,
            routeName:chararray,
            eventDate:chararray
    );
e_trucks_subset = LIMIT truck_events 10;
prueba = FOREACH e_trucks_subset GENERATE driverId, truckId, eventTime;
ordered_data = ORDER specific_columns BY driverId, truckId, eventTime asc;
