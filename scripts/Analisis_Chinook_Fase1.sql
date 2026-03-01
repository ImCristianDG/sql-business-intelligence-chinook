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


-- MISIÓN 2:  Limpieza de Inventario (IT)
-- Objetivo: Identificar canciones pesadas y caras para optimizar espacio.
SELECT 
    TrackId as IdCancion,
    Name as Nombre_cancion,
    (Bytes / 1000000.0) as Megabytes,
    UnitPrice as Precio_unitario
FROM tracks
WHERE Bytes > 15000000 AND UnitPrice > 0.99
ORDER BY Bytes DESC;


-- MISIÓN 3: Auditoría de Ventas (Contabilidad)
-- Objetivo: Facturas de USA/Canada entre 2010-2011 mayores a 10 USD.
SELECT
	InvoiceId,
	BillingCountry,
	InvoiceDate,
	Total
FROM invoices
WHERE BillingCountry IN ('USA', 'Canada')
	AND InvoiceDate BETWEEN '2010-01-01' AND '2011-12-31'
	AND Total > 10;

/************************************************************
PROYECTO: Auditoría de Negocio Chinook - Fase 2
AUTOR: ImCristianDG
DESCRIPCIÓN: Resolución de problemas de integración y análisis de rentabilidad por departamentos.
************************************************************/

-- MISIÓN 4: Identificación de Clientes VIP (Ventas)
-- Objetivo: Humanizar los datos de facturación para el equipo de Marketing. Cruzar nombres de clientes con facturas superiores a 20 USD.
SELECT 
    c.FirstName AS Nombre, 
    c.LastName AS Apellido, 
    c.Country AS Pais,
    i.Total AS Monto_Compra
FROM customers AS c
INNER JOIN invoices AS i ON c.CustomerId = i.CustomerId
WHERE i.Total > 20
ORDER BY i.Total DESC;