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

-- MISION 5: Traducción de Catálogo (Contenido/Marketing)
-- Objetivo: Vincular nombres de canciones con sus géneros para facilitar campañas de nicho.
SELECT 
    t.Name AS Cancion, 
    t.Composer AS Compositor,
    g.Name AS Genero
FROM tracks AS t
INNER JOIN genres AS g ON t.GenreId = g.GenreId
WHERE g.Name = 'Rock';

-- MISIÓN 6: Reporte de Ingresos por Territorio (Finanzas)
-- Objetivo: Identificar los mercados más rentables para la toma de decisiones estratégicas.
SELECT 
    BillingCountry AS Pais, 
    SUM(Total) AS Ventas_Totales,
    COUNT(InvoiceId) AS Cantidad_Facturas
FROM invoices
GROUP BY BillingCountry
ORDER BY Ventas_Totales DESC;