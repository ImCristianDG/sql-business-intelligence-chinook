/************************************************************
PROYECTO: Auditoría de Negocio Chinook - Fase 1
AUTOR: ImCristianDG
DESCRIPCIÓN: Resolución de pedidos de Marketing, IT y Contabilidad.
************************************************************/

-- MISIÓN 1: El "Target" de Marketing
-- Objetivo: Clientes de Europa o sin soporte con email Gmail.com/Yahoo.com.
SELECT 
    FirstName AS Nombre, 
    LastName AS Apellido, 
    Country AS Pais, 
    Email, 
    SupportRepId AS ID_Soporte
FROM customers
WHERE 
    (Country IN ('Germany', 'France', 'Belgium') OR SupportRepId IS NULL)
    AND 
    (Email LIKE '%gmail.com' OR Email LIKE '%yahoo.com');


-- MISIÓN 2: Limpieza de Inventario (IT)
-- Objetivo: Identificar archivos pesados (>15MB) y caros (>0.99).
-- En proceso...


-- MISIÓN 3: Auditoría de Ventas (Contabilidad)
-- Objetivo: Facturas de USA/Canada entre 2010-2011 mayores a 10 USD.
-- En proceso...