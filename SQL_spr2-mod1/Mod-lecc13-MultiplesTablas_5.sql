-- Pair Programming: Consultas Múltiples 5
USE northwind;

/* Ejercicio 1
Extraed los pedidos con el máximo "order_date" para cada empleado.
Nuestro jefe quiere saber la fecha de los pedidos más recientes que ha gestionado cada empleado. Para eso nos pide que lo hagamos con una query correlacionada.
Los resultados de esta query serán:*/

SELECT order_id, customer_id, employee_id, (order_date), required_date
FROM orders AS t1
WHERE t1.order_date = (
				SELECT MAX(order_date)
				FROM orders AS t2
                WHERE t1.employee_id = t2.employee_id);

/*Ejercicio 2
Extraed el precio unitario máximo (unit_price) de cada producto vendido.
Supongamos que ahora nuestro jefe quiere un informe de los productos vendidos y su precio unitario. De nuevo lo tendréis que hacer con queries correlacionadas.
Los resultados deberán ser:*/

SELECT product_id,unit_price
FROM products AS p1
WHERE p1.unit_price = (
				SELECT MAX(unit_price)
				FROM products AS p2
                WHERE p1.product_id = p2.product_id);

-- Se puede hacer de la siguiente manera, sin hacer subconsulta
SELECT product_id,unit_price
FROM products
ORDER BY product_id ASC;

/* Ejercicio 3
Ciudades que empiezan con "A" o "B".
Por un extraño motivo, nuestro jefe quiere que le devolvamos una tabla con aquelas compañias que están afincadas 
en ciudades que empiezan por "A" o "B". Necesita que le devolvamos la ciudad, el nombre de la compañia y el nombre de contacto.
Los resultados deberán ser:*/

SELECT city,company_name,contact_name FROM customers
WHERE city  LIKE "A%" OR city LIKE "B%";

/* Ejercicio 4
Número de pedidos que han hecho en las ciudades que empiezan con L.
En este caso, nuestro objetivo es devolver los mismos campos que en la query anterior el número de total de pedidos 
que han hecho todas las ciudades que empiezan por "L".
Deberéis tener una tabla como la siguiente:*/

SELECT city,company_name,contact_name, COUNT(order_id) AS NumerodePedidos
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY company_name
HAVING city  LIKE "L%";

/*Ejercicio 5
Todos los clientes cuyo "contact_title" no incluya "Sales".
Nuestro objetivo es extraer los clientes que no tienen el contacto "Sales" en su "contact_title". 
Extraer el nombre de contacto, su posisión (contact_title) y el nombre de la compañia.*/

SELECT contact_name,contact_title,company_name
FROM customers
WHERE contact_title NOT LIKE "S%____";

/*Ejercicio 6
Todos los clientes que no tengan una "A" en segunda posición en su nombre.
Devolved unicamente el nombre de contacto.
Los resultados son:*/

SELECT contact_name
FROM customers
WHERE contact_name NOT LIKE "_a";



