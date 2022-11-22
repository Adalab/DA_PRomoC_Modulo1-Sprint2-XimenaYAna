-- PAIR PROGRAMMING 17 NOVIEMBRE, CONSULTAS EN MULTIPLES TABLAS1

USE nortwind;

-- 1 Desde las oficinas en UK nos han pedido con urgencia 
-- que realicemos una consulta a la base de datos con la que 
-- podamos conocer cuántos pedidos ha realizado cada empresa cliente de UK. 
-- Nos piden el ID del cliente y el nombre de la empresa y el 
-- número de pedidos.

SELECT customers.company_name AS NombreEmpresa, customers.customer_id AS Identificador, COUNT(DISTINCT order_id) AS NumeroPedidos
FROM customers
INNER JOIN orders
ON orders.customer_id = customers.customer_id
WHERE country = "UK"
GROUP BY customers.customer_id
ORDER BY customers.company_name;

-- 2 La primera de ellas consiste en una query que nos sirva 
-- para conocer cuántos objetos ha pedido cada empresa cliente 
-- de UK durante cada año. Nos piden concretamente conocer el nombre 
-- de la empresa, el año, y la cantidad de objetos que han pedido

SELECT customers.company_name AS NombreEmpresa, YEAR(orders.order_date) AS Año, SUM(order_details.quantity) AS NumObjetos
FROM customers 
INNER JOIN orders 
ON orders.customer_id = customers.customer_id
INNER JOIN order_details 
ON orders.order_id = order_details.order_id
WHERE country = "UK"
GROUP BY customers.company_name, Año;  


/* 3. Mejorad la query anterior:
Lo siguiente que nos han pedido es la misma consulta anterior pero con la adición de la cantidad de dinero que 
han pedido por esa cantidad de objetos, teniendo en cuenta los descuentos, etc. Ojo que los descuentos en nuestra 
tabla nos salen en porcentajes, 15% nos sale como 0.15.
La tabla resultante será:*/


SELECT customers.company_name AS NombreEmpresa, YEAR(orders.order_date) AS Año, SUM(order_details.quantity) AS NumObjetos, SUM((order_details.unit_price * order_details.quantity) - ((order_details.unit_price * order_details.quantity) * (order_details.discount))) AS DineroTotal
FROM customers 
INNER JOIN orders 
ON orders.customer_id = customers.customer_id
INNER JOIN order_details 
ON orders.order_id = order_details.order_id
WHERE country = "UK"
GROUP BY NombreEmpresa, Año;





