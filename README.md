# Proyecto: SQL Business Intelligence - DB Chinook

Este repositorio contiene una serie de auditorías de datos realizadas sobre la base de datos Chinook. El objetivo es resolver problemas de negocio simulando pedidos de diferentes departamentos.

## Fase 1: Filtrado y Logica de Negocio (Completado)

En esta etapa el foco esta en la extraccion de datos usando logica booleana y filtros.

### Mision 1: Segmentacion de Marketing - (Completado)
Problema: El equipo de marketing necesita identificar clientes en Alemania, Francia y Belgica, o aquellos que no tienen un representante de soporte asignado. Ademas, solo se buscan correos con dominio Gmail o Yahoo.

- Solucion Tecnica: 
    - Uso de IN para simplificar el filtrado de paises.
    - Operador LIKE con comodines para capturar dominios de email de manera precisa.
    - Aplicacion de parentesis para asegurar que la condicion del email se cumpla en ambos grupos de clientes.

### Mision 2: Limpieza de Inventario (IT) - (Completado)
Problema: El equipo de IT necesita identificar canciones pesadas que consumen mucho almacenamiento para optimizar los servidores. Se buscan archivos de más de 15 MB con un precio superior a 0.99 USD.

- Solución Técnica: 
    - Realización de cálculos aritméticos en el `SELECT` para convertir Bytes a Megabytes.
    - Uso de **Alias** (`AS`) para presentar los datos de forma clara y legible.
    - Aplicación de `ORDER BY ... DESC` para priorizar los archivos de mayor tamaño en el reporte.

### Mision 3: Auditoria de Ventas (Contabilidad) - (Completado)
Problema: El área contable requiere auditar facturas de USA y Canadá emitidas entre 2010 y 2011 que superen los 10 USD.

- Solución Técnica: 
    - Implementación del operador `BETWEEN` para filtrado de rangos de fechas precisos.
    - Uso de `IN` para segmentación geográfica múltiple.
    - Aplicación de filtros numéricos para identificar transacciones de alto valor.

---

## Fase 2: Relaciones y Agregaciones (En Progreso)

En esta etapa, el foco cambia al cruce de datos entre diferentes departamentos para generar una visión 360° del negocio.

### Misión 4: Identificación de Clientes VIP (Ventas)
Problema: El equipo de ventas posee los montos de facturación, pero no puede identificar a los clientes por nombre. Se requiere "humanizar" los datos de las compras superiores a 20 USD para campañas de fidelización.

- Solución Técnica: 
    - Implementación de `INNER JOIN` para vincular la tabla `customers` con `invoices`.
    - Uso de **claves foráneas** (`CustomerId`) como puente para cruzar identidad con comportamiento de compra.
    - Segmentación de clientes de alto valor mediante operadores de comparación (`>`).

- Recomendación de Negocio: 
"Dado que estos clientes representan el ticket promedio más alto, se sugiere al equipo de Marketing realizar una encuesta de satisfacción exclusiva o enviar un código de descuento para asegurar su retención".

### Misión 5: Traducción de Catálogo para Marketing
Problema: El equipo de contenidos no puede segmentar campañas de "Rock" porque la base de datos de canciones solo utiliza códigos numéricos (IDs) para los géneros.

- Solución Técnica:
    - Implementación de `INNER JOIN` entre `tracks` y `genres`.
    - Uso de **Alias de tabla** (`t`, `g`) para optimizar la legibilidad del código.
    - Filtrado semántico por nombre de género en lugar de ID técnico.

- Recomendación de Negocio:
"Al haber validado un inventario de 1,297 canciones de Rock, el equipo de Marketing puede lanzar con seguridad la campaña deseada, sabiendo exactamente qué canciones y compositores integran el catálogo."

---

## Herramientas
* Motor: SQLite
* Gestion de DB: DB Browser for SQLite / VS Code
* Lenguaje: SQL
* Control de Versiones: Git y GitHub

---

Autor: ImCristianDG
Estado: Fase 2 - Mision 6 en progreso.