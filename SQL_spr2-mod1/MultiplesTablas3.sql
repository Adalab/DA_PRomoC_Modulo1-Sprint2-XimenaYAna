/*EJERCICIOS DE PAIR PROGRAMMING DIA 21 NOVIEMBRE. 
CONSULTAS EN MULTIPLES TABLAS 3 */

USE northwind;

/*Creamos una tabla temporal */

SELECT  'Hola!'  AS tipo_nombre
FROM customers;

/*Ejercicio 1: Nuestros jefes nos han pedido que creemos una query 
que nos devuelva todos los clientes y proveedores que tenemos en la BBDD. 
Mostrad la ciudad a la que pertenecen, el nombre de la empresa y el nombre 
del contacto, además de la relación (Proveedor o Cliente). Pero importante!
 No debe haber duplicados en nuestra respuesta. La columna Relationship no 
 existe y debe ser creada como columna temporal. Para ello añade el valor 
 que le quieras dar al campo y utilizada como alias Relationship.
Nota: Deberás crear esta columna temporal en cada instrucción SELECT.*/


SELECT city AS ciudad, company_name AS NombreDeEmpresa, contact_name AS NombreContacto, "Customers" AS Relationship
FROM customers
UNION
SELECT city AS ciudad, company_name AS NombreDeEmpresa, contact_name AS NombreContacto, "Suppliers" AS Relationship
FROM suppliers
ORDER BY ciudad;

/*Ejercicio 2: Extraer todos los pedidos gestinados por "Nancy Davolio"
En este caso, nuestro jefe quiere saber cuantos pedidos ha gestionado 
"Nancy Davolio", una de nuestras empleadas. Nos pide todos los detalles 
tramitados por ella.*/

SELECT *
FROM orders
WHERE employee_id = 1 IN(
	SELECT employee_id
    FROM employees);



/*Ejercicio 3: Extraed todas las empresas que no han comprado en el año 1997
En este caso, nuestro jefe quiere saber cuántas empresas 
no han comprado en el año 1997.
💡 Pista 💡 Para extraer el año de una fecha, 
podemos usar el estamento year. Más documentación sobre este método aquí*/


SELECT company_name AS NombreCompañia, country AS Pais
FROM customers
WHERE customer_id NOT IN (
	SELECT customer_id
	FROM orders
    WHERE YEAR(order_date) = 1997);




/*Ejercicio 4: Extraed toda la información de los pedidos donde 
tengamos "Konbu"
Estamos muy interesados en saber como ha sido la evolución de 
la venta de Konbu a lo largo del tiempo. Nuestro jefe nos pide 
que nos muestre todos los pedidos que contengan "Konbu".
💡 Pista 💡 En esta query tendremos que combinar conocimientos 
adquiridos en las lecciones anteriores como por ejemplo el INNER JOIN*/


SELECT *
FROM orders
WHERE product_id = 13  IN(
	SELECT products.product_id
    FROM products
    INNER JOIN products.product_id
    ON products);

SELECT * 
FROM
   orders
   INNER JOIN  ON orders.order_id=b.id
WHERE product_id = 13 ;

SELECT *
FROM orders
WHERE product_id IN (
	SELECT product_id
    FROM orders
    INNER JOIN 
    WHERE product_id = 13);

    
    