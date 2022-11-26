-- EJERCICIOS DE PAIR PROGRAMMING 25 NOVIEMBRE
-- CTE´S

USE northwind;


/* EJERCICIO 1:
Extraer en una CTE todos los nombres de las compañias 
y los id de los clientes.
Para empezar nos han mandado hacer una CTE muy sencilla el 
id del cliente y el nombre de la compañia de la tabla Customers*/


WITH idenfiticacion
AS (
	SELECT customer_id AS CustID, company_name AS NombreCompañia
	FROM customers
	ORDER BY customer_id ASC)
SELECT customer_id, company_name
FROM customers; 


/* EJERCICIO 2:
Selecciona solo los de que vengan de "Germany"
Ampliemos un poco la query anterior. En este caso, 
queremos un resultado similar al anterior, pero solo 
queremos los que pertezcan a "Germany".*/

WITH idenfiticacion
AS (
	SELECT customer_id AS CustID, company_name AS NombreCompañia
	FROM customers
	ORDER BY customer_id ASC)
SELECT customer_id, company_name
FROM customers
WHERE country = 'Germany';



/* EJERCICIO 3:
Extraed el id de las facturas y su fecha de cada cliente.
En este caso queremos extraer todas las facturas que se 
han emitido a un cliente, su fecha la compañia a la que pertenece.
📌 NOTA En este caso tendremos columnas con elementos 
repetidos(CustomerID, y Company Name).*/

WITH idenfiticacion
AS (
	SELECT customer_id AS CustID, company_name AS NombreCompañia
	FROM customers
	ORDER BY customer_id ASC)
SELECT c.customer_id, c.company_name, o.order_id, o.order_date
FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id;


/*EJERCICIO 4:
Contad el número de facturas por cliente
Mejoremos la query anterior. En este caso queremos 
saber el número de facturas emitidas por cada cliente.*/



WITH facturaTotal AS (
		SELECT c.customer_id, c.company_name, o.order_id
		FROM customers AS c
		INNER JOIN orders AS o
		ON o.customer_id = c.customer_id ) 
SELECT customer_id, company_name, COUNT(order_id) AS NumFacturas
FROM facturaTotal
GROUP BY customer_id;



/* EJERCICIO 5:
Cuál la cantidad media pedida de todos los productos ProductID.
Necesitaréis extraer la suma de las cantidades por cada producto 
y calcular la media.*/

WITH media
AS (

	SELECT product_id, SUM(quantity), COUNT(order_id),  
			SUM(quantity) / COUNT(order_id) AS Media
	FROM order_details)
SELECT product_id, SUM(quantity), COUNT(order_id),  
			SUM(quantity) / COUNT(order_id) AS Media
FROM order_details
GROUP BY product_id;










