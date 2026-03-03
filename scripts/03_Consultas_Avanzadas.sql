
-- MISIÓN 7: Identificación de Clientes VIP (Subconsultas)
-- Objetivo: Listar clientes que gastan por encima del promedio global.
SELECT 
    i.InvoiceId AS Factura_ID,
    c.FirstName AS Nombre,
    c.LastName AS Apellido,
    i.Total AS Monto_Factura
FROM invoices AS i
INNER JOIN customers AS c ON i.CustomerId = c.CustomerId
WHERE i.Total > (
    -- Esta subquery calcula el promedio dinámico
    SELECT AVG(Total) FROM invoices
)
ORDER BY i.Total DESC;