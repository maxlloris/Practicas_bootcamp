-- 04_crea_tabla_ivr_summary

CREATE OR REPLACE TABLE keepcoding.ivr_summary AS

WITH inf_doc -- En esta funcion, ranguemos por el modulo y el paso dentro del mismo para quedarnos con el ultimo paso del ultimo modulo que no contenga 'UNKNOWN' o 'DESCONOCIDO'. Este criterio de que fuera el ultimo muy probablemente lo deduciriamos en cosultas con nuestro cliente
      AS (SELECT ivr_id
            ,document_type
            ,document_identification
            ,module_sequece
            ,step_sequence
            FROM `keepcoding.ivr_steps` 
            WHERE document_type <> 'DESCONOCIDO' AND document_type <> 'UNKNOWN' AND document_identification<>'UNKNOWN'
            QUALIFY ROW_NUMBER() OVER(PARTITION BY CAST(ivr_id AS STRING) ORDER BY module_sequece DESC, step_sequence DESC) = 1
            ORDER BY ivr_id)

      , custo_phone  -- Rangueo como anteriores para obtener el customer_phone
            AS (SELECT ivr_id
            ,customer_phone
            FROM `keepcoding.ivr_steps`
            WHERE customer_phone <> 'UNKNOWN'
            QUALIFY ROW_NUMBER() OVER(PARTITION BY CAST(ivr_id AS STRING) ORDER BY module_sequece DESC, step_sequence DESC) = 1
            ORDER BY ivr_id)
      
      , billing_account_id_tabla -- Rangueo como anteriores para obtener el billing_account_id
            AS (SELECT ivr_id
            ,billing_account_id
            FROM `keepcoding.ivr_steps`
            WHERE billing_account_id <> 'UNKNOWN'
            QUALIFY ROW_NUMBER() OVER(PARTITION BY CAST(ivr_id AS STRING) ORDER BY module_sequece DESC, step_sequence DESC) = 1
            ORDER BY ivr_id)

      , customer_identification -- Esta CTE nos indica la forma en la que hemos identificado al cliente en primera instancia
            AS(SELECT ivr_id
                  , MAX(IF (step_name = 'CUSTOMERINFOBYDNI.TX' AND step_description_error = 'UNKNOWN', 1,0)) AS info_by_phone_lg -- Utilizo MAX para que unicamente me devuelva los info_by... con valor 1 si es que los hay
                  , MAX(IF (step_name = 'CUSTOMERINFOBYDNI.TX' AND step_description_error = 'UNKNOWN', 1,0)) AS info_by_dni_lg
                  FROM `keepcoding.ivr_steps`
                  GROUP BY ivr_id)

      , previous_last_calls -- Esta CTE busca facilitarnos un flag para llamadas anteriores y posteriores a nuestro registro en un plazo de 24h.
            AS (SELECT ivr_id
                        , phone_number
                        , start_date
                        ,LEAD(start_date) OVER( PARTITION BY phone_number ORDER BY phone_number, start_date) AS next_call -- Obtengo el timestamp del registro siguiente para el mismo numero de telefono y ordenado por numero de telefono y su timestamp
                        ,TIMESTAMP_DIFF(LEAD(start_date) OVER( PARTITION BY phone_number ORDER BY phone_number, start_date), start_date, HOUR) AS previous_hour_diff -- resto ambos timestamp para obtener la direfencia en horas y asi poder asegurarme mayor preciosion que por dias.
                        ,IF(TIMESTAMP_DIFF(LEAD(start_date) OVER( PARTITION BY phone_number ORDER BY phone_number, start_date), start_date, HOUR) < 24, 1, 0) AS flag_24h_previous -- Establezco mi flag para llamadas en menos de 24 h
                        ,LAG(start_date) OVER( PARTITION BY phone_number ORDER BY phone_number, start_date) AS previous_call
                        ,TIMESTAMP_DIFF(start_date, LAG(start_date) OVER( PARTITION BY phone_number ORDER BY phone_number, start_date), HOUR) AS previous_hour_diff
                        ,IF(TIMESTAMP_DIFF(start_date, LAG(start_date) OVER( PARTITION BY phone_number ORDER BY phone_number, start_date), HOUR) < 24, 1, 0) AS flag_24h_later
                  FROM `keepcoding.ivr_calls`)
      

SELECT DISTINCT detail.calls_ivr_id AS ivr_id
      ,calls_phone_number AS phone_number
      ,calls_ivr_result AS ivr_result
      ,CASE WHEN STARTS_WITH(calls_vdn_label, 'ATC') THEN 'FRONT'
            WHEN STARTS_WITH(calls_vdn_label, 'TECH') THEN 'TECH'
            WHEN calls_vdn_label = 'ABSORPTION' THEN 'ABSORPTION'
            ELSE 'RESTO'
       END AS vdn_aggregation
      ,calls_start_date AS start_date
      ,calls_end_date AS end_date
      ,calls_total_duration AS total_duration
      ,calls_customer_segment AS customer_segment
      ,calls_ivr_language AS ivr_language
      ,calls_steps_module AS steps_module
      ,calls_module_aggregation AS module_aggregation
      ,IFNULL(inf_doc.document_type, 'DESCONOCIDO') AS document_type -- Utilizo el IFNULL para evitar los nulos.
      ,IFNULL(inf_doc.document_identification, 'DESCONOCIDO') AS document_identification
      ,IFNULL(custo_phone.customer_phone, 'DESCONOCIDO') AS customer_phone
      ,IFNULL(billing_account_id_tabla.billing_account_id, 'DESCONOCIDO') AS billing_account_id
      ,MAX(IF(module_name = 'AVERIA_MASIVA', 1, 0)) AS masiva_lg
      ,customer_identification.info_by_phone_lg AS info_by_phone_lg 
      ,customer_identification.info_by_dni_lg AS info_by_dni_lg
      ,previous_last_calls.flag_24h_previous AS repeated_phone_24H
      ,previous_last_calls.flag_24h_later AS cause_recall_phone_24H

FROM keepcoding.ivr_detail AS detail
LEFT
JOIN customer_identification
ON customer_identification.ivr_id = detail.calls_ivr_id
LEFT
JOIN inf_doc
ON inf_doc.ivr_id = detail.calls_ivr_id
LEFT
JOIN custo_phone
ON custo_phone.ivr_id = detail.calls_ivr_id
LEFT
JOIN billing_account_id_tabla
ON billing_account_id_tabla.ivr_id = detail.calls_ivr_id
LEFT
JOIN previous_last_calls
ON previous_last_calls.ivr_id = detail.calls_ivr_id
GROUP BY ivr_id
       , phone_number
       , ivr_result
       , vdn_aggregation
       , start_date
       , end_date
       , total_duration
       , customer_segment
       , ivr_language
       , steps_module
       , module_aggregation
       , document_type
       , document_identification
       , customer_phone
       , billing_account_id
       , info_by_phone_lg
       , info_by_dni_lg
       , flag_24h_previous
       , flag_24h_later
 
ORDER  BY ivr_id DESC