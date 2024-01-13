-- 05_crear_funcion_limpieza_enteros

CREATE OR REPLACE FUNCTION keepcoding.fnc_clean_int(p_int INTEGER) RETURNS INTEGER AS
(( SELECT CASE WHEN p_int IS NULL THEN -99999 ELSE p_int END ))