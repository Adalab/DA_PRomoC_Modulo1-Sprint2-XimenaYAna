-- PAIR PROGRAMMING 17 NOVIEMBRE, CONSULTAS EN MULTIPLES TABLAS1

USE nortwind;

-- 1 Desde las oficinas en UK nos han pedido con urgencia 
-- que realicemos una consulta a la base de datos con la que 
-- podamos conocer cuántos pedidos ha realizado cada empresa cliente de UK. 
-- Nos piden el ID del cliente y el nombre de la empresa y el 
-- número de pedidos.

SELECT customers.company_name AS NombreEmpresa, customers.customer_id AS Identificador, COUNT(order_id) AS NumeroPedidos
FROM customers
INNER JOIN orders
WHERE country = "UK"
GROUP BY customers.customer_id;

-- 2 La primera de ellas consiste en una query que nos sirva 
-- para conocer cuántos objetos ha pedido cada empresa cliente 
-- de UK durante cada año. Nos piden concretamente conocer el nombre 
-- de la empresa, el año, y la cantidad de objetos que han pedido

SELECT customers.company_name AS NombreEmpresa, YEAR(orders.order_date) AS Año, COUNT(quantity) AS NumObjetos
FROM customers
INNER JOIN orders
INNER JOIN order_details
WHERE country = "UK"
GROUP BY customers.company_name, Año; 


