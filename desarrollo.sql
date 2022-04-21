--requerientos
-- 1.- cargar base de datos unidad2.sql
-- se cargo la base de datos en una nueva denominada : nueva_billjobs
-- con el comando : pg_dump -U daniela nueva_billjobs < unidad2.sql

\c daniela
SELECT * FROM compra LIMIT 10;
\c nueva_billjobs
--SELECT * FROM cliente_id_seq;
--SELECT * FROM producto;
SELECT * FROM cliente WHERE cliente.nombre = 'usuario01';
-- 2.- el cliente usuario1 ha realizado la siguiente compra 
-- producto : producto9
-- cantidad : 5
-- fecha : fecha del sistema 
BEGIN;
INSERT INTO compra(cliente_id , fecha)
VALUES (1,now());
INSERT INTO detalle_compra(producto_id,compra_id,cantidad)
VALUES (9,32,5);
UPDATE producto SET stock = stock -5 WHERE id = 9;
COMMIT;
--realizar consulta tabla producto para validar descuento stock
SELECT * FROM producto; 
-- 3 el cliente usuario02 ha realizado la siguiente compra:
-- producto : producto 1 , producto 2 , producto 8 
-- cantidad   3 de cada producto
-- fecha   fecha
BEGIN;
INSERT INTO compra(cliente_id , fecha)
VALUES (2,now());
INSERT INTO detalle_compra(producto_id,compra_id,cantidad)
VALUES (1,33,3);
UPDATE producto SET stock = stock -3 WHERE id = 1;
INSERT INTO compra(cliente_id , fecha)
VALUES (2,now());
INSERT INTO detalle_compra(producto_id,compra_id,cantidad)
VALUES (2,34,3);
UPDATE producto SET stock = stock -3 WHERE id = 2;
INSERT INTO compra(cliente_id , fecha)
VALUES (2,now());
INSERT INTO detalle_compra(producto_id,compra_id,cantidad)
VALUES (8,35,3);
UPDATE producto SET stock = stock -3 WHERE id = 8;
COMMIT;
--realizar consulta tabla producto para validar descuento stock
SELECT * FROM producto; 
--Desahabilitar el AUTOCOMMIT
\set AUTOCOMMIT off
--insertar un nuevo cliente
BEGIN;
INSERT INTO cliente(id, nombre, email)
VALUES ( 11,'usuario11','usuario11@hotmail.com');
COMMIT;
--corroborar con consulta el nuevo cliente llamando a la tabla
SELECT * FROM cliente WHERE cliente.id=11;


