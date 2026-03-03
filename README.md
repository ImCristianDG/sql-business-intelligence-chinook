# Proyecto: SQL Business Intelligence - DB Chinook

Este repositorio contiene una serie de auditorías de datos realizadas sobre la base de datos Chinook. El objetivo es resolver problemas de negocio simulando pedidos de diferentes departamentos.

## Fase 1: Filtrado y Logica de Negocio (Completada)

En esta etapa el foco esta en la extraccion de datos usando logica booleana y filtros.

### Mision 1: Segmentacion de Marketing - (Completada)
Problema: El equipo de marketing necesita identificar clientes en Alemania, Francia y Belgica, o aquellos que no tienen un representante de soporte asignado. Ademas, solo se buscan correos con dominio Gmail o Yahoo.

- Solucion Tecnica: 
    - Uso de IN para simplificar el filtrado de paises.
    - Operador LIKE con comodines para capturar dominios de email de manera precisa.
    - Aplicacion de parentesis para asegurar que la condicion del email se cumpla en ambos grupos de clientes.

### Mision 2: Limpieza de Inventario (IT) - (Completada)
Problema: El equipo de IT necesita identificar canciones pesadas que consumen mucho almacenamiento para optimizar los servidores. Se buscan archivos de más de 15 MB con un precio superior a 0.99 USD.

- Solución Técnica: 
    - Realización de cálculos aritméticos en el `SELECT` para convertir Bytes a Megabytes.
    - Uso de **Alias** (`AS`) para presentar los datos de forma clara y legible.
    - Aplicación de `ORDER BY ... DESC` para priorizar los archivos de mayor tamaño en el reporte.

### Mision 3: Auditoria de Ventas (Contabilidad) - (Completada)
Problema: El área contable requiere auditar facturas de USA y Canadá emitidas entre 2010 y 2011 que superen los 10 USD.

- Solución Técnica: 
    - Implementación del operador `BETWEEN` para filtrado de rangos de fechas precisos.
    - Uso de `IN` para segmentación geográfica múltiple.
    - Aplicación de filtros numéricos para identificar transacciones de alto valor.

---

## Fase 2: Relaciones y Agregaciones (Completada)

En esta etapa, el foco cambia al cruce de datos entre diferentes departamentos para generar una visión 360° del negocio.

### Misión 4: Identificación de Clientes VIP (Ventas) - (Completada)
Problema: El equipo de ventas posee los montos de facturación, pero no puede identificar a los clientes por nombre. Se requiere "humanizar" los datos de las compras superiores a 20 USD para campañas de fidelización.

- Solución Técnica: 
    - Implementación de `INNER JOIN` para vincular la tabla `customers` con `invoices`.
    - Uso de **claves foráneas** (`CustomerId`) como puente para cruzar identidad con comportamiento de compra.
    - Segmentación de clientes de alto valor mediante operadores de comparación (`>`).

- Recomendación de Negocio: 
"Dado que estos clientes representan el ticket promedio más alto, se sugiere al equipo de Marketing realizar una encuesta de satisfacción exclusiva o enviar un código de descuento para asegurar su retención".

### Misión 5: Traducción de Catálogo para Marketing - (Completada)
Problema: El equipo de contenidos no puede segmentar campañas de "Rock" porque la base de datos de canciones solo utiliza códigos numéricos (IDs) para los géneros.

- Solución Técnica:
    - Implementación de `INNER JOIN` entre `tracks` y `genres`.
    - Uso de **Alias de tabla** (`t`, `g`) para optimizar la legibilidad del código.
    - Filtrado semántico por nombre de género en lugar de ID técnico.

- Recomendación de Negocio:
"Al haber validado un inventario de 1,297 canciones de Rock, el equipo de Marketing puede lanzar con seguridad la campaña deseada, sabiendo exactamente qué canciones y compositores integran el catálogo."

### Misión 6: Reporte de Ingresos por Territorio (Finanzas) - (Completada)
Problema: La gerencia financiera necesitaba una visión global de las ventas para decidir dónde invertir presupuesto publicitario, ya que las facturas individuales no permitían ver el panorama completo.

- Solución Técnica:
    - Uso de funciones de agregación (`SUM`) para calcular el total de dinero.
    - Implementación de `GROUP BY` para colapsar las 412 facturas en 24 grupos (uno por país).
    - Ordenamiento descendente (`DESC`) para visualizar el podio de ingresos.

- Recomendación de Negocio:
"Dado que USA representa casi el doble de ingresos que Canada, se recomienda **reforzar la inversión publicitaria** en este país para fidelizar a los clientes de mayor volumen. A su vez, debido a la escala demográfica de Brasil, el potencial de adquisición de nuevos clientes es significativamente mayor. Una campaña de marketing local en Brasil tiene más probabilidades de generar un retorno de inversión (ROI) masivo que en el mercado francés, que es geográficamente más limitado."

---

## Fase 3: Consultas Avanzadas y Automatización - (Completada)
En esta etapa, el análisis deja de ser estático para volverse dinámico. El objetivo es resolver problemas complejos mediante lógica anidada (Subqueries) y preparar la base de datos para usuarios finales mediante Vistas (Views).

### Misión 7: Identificación de Clientes VIP (Ventas) - (Completada)
Problema: El departamento de Fidelización necesitaba identificar a los clientes con tickets de compra superiores a la media. Como el promedio de ventas de la tienda varía cada vez que entra una factura nueva, no se podía usar un número estático; se requería una solución que "piense" sola.

- Solución Técnica:
    - Implementación de una **Subconsulta (Subquery)** dentro de la cláusula `WHERE` para calcular el promedio dinámico de la tabla `invoices`.
    - Uso de `INNER JOIN` para cruzar los IDs de las facturas con la tabla `customers`, permitiendo "humanizar" el dato con nombres y apellidos.
    - Ordenamiento descendente (`DESC`) para priorizar a los clientes con mayor volumen de compra en el reporte.

- Recomendación de Negocio:
"Se identificó un grupo selecto de clientes cuyos gastos duplican o triplican el promedio general (aprox. $5.65). Se recomienda asignar a estos clientes un **estatus VIP** con beneficios exclusivos, como acceso anticipado a nuevos álbumes o descuentos por lealtad. Mantener a este pequeño grupo satisfecho es más rentable que adquirir 10 clientes nuevos de bajo ticket, siguiendo la ley de Pareto (80/20)."

### Misión 8: Automatización y Vistas (Arquitectura) - (Completada)
**Problema:** El equipo de ventas necesita consultar el ranking de VIPs sin manipular código SQL complejo.

- Solución Técnica: 
- Creación de una **VIEW** llamada `Lista_Clientes_VIP`. Se utilizó **concatenación** (`||`) para unificar nombres y apellidos, encapsulando la lógica anterior.

- **Nota:** Ahora, cualquier usuario puede obtener el listado actualizado ejecutando: `SELECT * FROM Lista_Clientes_VIP;`.

---

## Herramientas
* Motor: SQLite
* Gestion de DB: DB Browser for SQLite / VS Code
* Lenguaje: SQL
* Control de Versiones: Git y GitHub

---

Autor: ImCristianDG
Estado: Fase 3 - Finalizada.