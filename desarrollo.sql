--requerientos
-- 1.- cargar base de datos unidad2.sql
-- se cargo la base de datos en una nueva denominada : nueva_billjobs
-- con el comando : pg_dump -U daniela nueva_billjobs < unidad2.sql
-- 2.- el cliente usuario1 ha realizado la siguiente compra 
-- producto : producto9
-- cantidad : 5
-- fecha : fecha del sistema 
\c daniela
SELECT * FROM compra LIMIT 10;
\c nueva_billjobs
--SELECT * FROM cliente_id_seq;
--SELECT * FROM producto;
SELECT * FROM cliente WHERE nombre = 'usuario1';

--BEGIN;

--INSERT INTO compra (id, cliente_id , fecha)
--VALUES (1 , 'usuario1', '2021-03-03');
--INSERT INTO detalle_compra(id, producto_id,compra_id ,cantidad)
--VALUES ( 9 , 'producto9', 1 , 5);
--UPDATE producto SET stock = stock - 1 WHERE id = 'producto9';
--SAVEPOINT checkpoint;
--UPDATE pizzas SET stock = stock - 1 WHERE id = 2;
--SAVEPOINT checkpoint;
--Desahabilitar el AUTOCOMMIT
\set AUTOCOMMIT off
--insertar un nuevo cliente
BEGIN;
INSERT INTO cliente(id, nombre, email)
VALUES ( 11,'usuario11','usuario12@hotmail.com');
COMMIT;
--corroborar con consulta el nuevo cliente llamando a la tabla
SELECT * FROM cliente WHERE cliente.id=11;

--BEGIN;
--SELECT  cliente.nombre , compra.fecha , detalle_compra.producto_id , detalle_compra.cantidad , compra.fecha
--FROM compra
--JOIN detalle_compra
--ON compra.id = detalle_compra.id
--UPDATE SET detalle_compra.cantidad = 5
--WHERE compra.producto_id = 9 ;
--INSERT INTO ventas (cliente, fecha , monto , pizza)
--VALUES ('Dexter Gonzalez', '2020-02-02', 12000, 1);
--UPDATE pizzas SET stock = stock -1 WHERE id = 1;
--COMMIT;



