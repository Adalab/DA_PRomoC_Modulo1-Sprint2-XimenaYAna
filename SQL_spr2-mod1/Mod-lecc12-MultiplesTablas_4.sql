/* Enunciado
Es el turno de las subqueries. En este ejercicios os planteamos una serie de queries que nos permitirán conocer 
información de la base de datos, que tendréis que solucionar usando subqueries.*/

USE northwind;

/* EJERCICIO 1
Extraed información de los productos "Beverages"
En este caso nuestro jefe nos pide que le devolvamos toda la información necesaria para identificar un tipo de producto. 
En concreto, tienen especial interés por los productos con categoría "Beverages". Devuelve el ID del producto, el nombre
 del producto y su ID de categoría.
La query debería resultar en una tabla como esta:*/

SELECT products.product_id, products.product_name, products.category_id
FROM products
INNER JOIN categories
ON products.category_id = categories.category_id
WHERE categories.category_name = "Beverages";


/* EJERCICIO 2
Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país
Suponemos que si se trata de ofrecer un mejor tiempo de entrega a los clientes, entonces podría dirigirse a estos países para buscar proveedores adicionales.
Los resultados de esta query son:*/

SELECT customers.country
FROM customers
GROUP BY country
HAVING country NOT IN (
				SELECT country
				FROM suppliers
				GROUP BY country);
                
/*EJERCICIO 3
Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread"
Extraed el OrderId y el nombre del cliente que pidieron más de 20 artículos del producto 
"Grandma's Boysenberry Spread" (ProductID 6) en un solo pedido.
Resultado de nuestra query deberíamos tener una tabla como esta:*/


SELECT customer_id, order_id
FROM orders
WHERE order_id IN (
					SELECT order_id
					FROM order_details
					WHERE product_id = 6 AND quantity>20);


/*EJERCICIO 4
Extraed los 10 productos más caros
Nos siguen pidiendo más queries correlacionadas. En este caso queremos saber cuáles son 
los 10 productos más caros.
Los resultados esperados de esta query son:*/

SELECT unit_price AS UnitPrice ,product_name AS TenMostExpensiveProducts
FROM products
WHERE product_name IN (
						SELECT DISTINCT product_name
						FROM products
						ORDER BY unit_price DESC)
ORDER BY unit_price DESC
LIMIT 10;










                
                
                
                
                