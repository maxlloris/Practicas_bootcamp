-- 03_crea_tabla_ivr_detail

CREATE OR REPLACE TABLE keepcoding.ivr_detail AS

SELECT calls.ivr_id AS calls_ivr_id
      ,phone_number AS calls_phone_number
      ,ivr_result AS calls_ivr_result
      ,vdn_label AS calls_vdn_label
      ,start_date AS calls_start_date
      ,FORMAT_DATE('%Y%m%d', start_date) AS calls_start_date_id -- Formateo de fecha
      ,end_date AS calls_end_date
      ,FORMAT_DATE('%Y%m%d', end_date) AS calls_end_date_id
      ,total_duration AS calls_total_duration
      ,customer_segment AS calls_customer_segment
      ,ivr_language AS calls_ivr_language
      ,steps_module AS calls_steps_module
      ,module_aggregation AS calls_module_aggregation
      ,IFNULL(module.module_sequece, -99999999) AS module_sequece -- Controlo los null para valores INT o FLOAT
      ,IFNULL(module_name, 'UNKNOWN') AS module_name -- Control de null para valores STRING
      ,IFNULL(module_duration, -999999999) AS module_duration
      ,IFNULL(module_result, 'UNKNOWN') AS module_result
      ,IFNULL(step_name, 'UNKNOW') AS step_name
      ,IFNULL(step_result, 'UNKNOW') AS step_result
      ,IFNULL(step_description_error, 'UNKNOW') AS step_description_error
      ,IFNULL(document_type, 'UNKNOW') AS document_type   
      ,IFNULL(document_identification, 'UNKNOW') AS document_identification
      ,IFNULL(customer_phone, 'UNKNOW') AS customer_phone 
      ,IFNULL(billing_account_id, 'UNKNOW') AS billing_account_id

FROM keepcoding.ivr_calls AS calls
LEFT
JOIN keepcoding.ivr_module AS module
ON   calls.ivr_id = module.ivr_id
LEFT
JOIN keepcoding.ivr_steps AS steps
ON   calls.ivr_id = steps.ivr_id AND module.module_sequece = steps.module_sequece

ORDER BY calls_ivr_id DESC