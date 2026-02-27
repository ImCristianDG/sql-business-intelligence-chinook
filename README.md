# Proyecto: SQL Business Intelligence - DB Chinook

Este repositorio contiene una serie de auditorías de datos realizadas sobre la base de datos Chinook. El objetivo es resolver problemas de negocio simulando pedidos de diferentes departamentos.

## Fase 1: Filtrado y Logica de Negocio (En desarrollo)

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

### Mision 3: Auditoria de Ventas (Contabilidad) - [En proceso]
- Objetivo: Revision de facturas de USA y Canada de los años 2010 y 2011 con montos mayores a 10 dolares.
- Tecnicas a usar: Filtrado por rangos de fechas (BETWEEN) y seleccion multivariable.

---

## Herramientas
* Motor: SQLite
* Gestion de DB: DB Browser for SQLite / VS Code
* Lenguaje: SQL
* Control de Versiones: Git y GitHub

---

Autor: ImCristianDG
Estado: Fase 1 - Mision 1 y 2 completada.