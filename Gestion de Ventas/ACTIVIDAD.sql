#1.3.3 Consultas spbre una tabla
#º1
select * from pedido
order by fecha desc ;
#º2
select * from pedido 
order by total desc limit 2 ;
#º3
select id from pedido
order by id ;
#º4
select * from pedido 
where year(fecha)=2017 and total>500 ;
#º5
select * from comercial 
where comisión between 0.05 and 0.11 ;
#º6
select comisión from comercial 
order by comisión desc limit 1 ;
#º7
select id, nombre, apellido1 from cliente
where apellido2 IS NOT NULL
ORDER BY APELLIDO1, NOMBRE ;
#º8
SELECT NOMBRE FROM CLIENTE 
WHERE NOMBRE LIKE 'A%N' OR NOMBRE LIKE 'P%' ;
#º9
SELECT NOMBRE FROM CLIENTE
WHERE NOMBRE NOT LIKE 'A%'
ORDER BY NOMBRE ;
#º10
SELECT distinct NOMBRE FROM COMERCIAL 
WHERE NOMBRE LIKE '%EL' OR NOMBRE LIKE '%O' ;

#1.3.4 CONSULTAS MULTITABLA 
#º1
SELECT A.ID, NOMBRE, APELLIDO1, APELLIDO2 FROM CLIENTE A INNER JOIN PEDIDO B 
WHERE A.ID=B.ID_CLIENTE ;
#º2
SELECT * FROM CLIENTE A INNER JOIN PEDIDO B 
WHERE A.ID=B.ID_CLIENTE
ORDER BY APELLIDO1, NOMBRE ;
#º3
SELECT * FROM COMERCIAL A INNER JOIN PEDIDO B
WHERE A.ID=B.ID_COMERCIAL 
ORDER BY APELLIDO1, NOMBRE;
#º4
SELECT * FROM CLIENTE A INNER JOIN PEDIDO B INNER JOIN COMERCIAL C
ON A.ID=B.ID_CLIENTE AND C.ID=B.ID_COMERCIAL ;
#º5
SELECT * FROM 
cliente A INNER JOIN pedido B ON A.id=B.id_cliente
WHERE TOTAL between 300 AND 1000 ;
#º6
SELECT C.NOMBRE, C.APELLIDO1, C.APELLIDO2
FROM CLIENTE A INNER JOIN PEDIDO B INNER JOIN COMERCIAL C
ON A.ID=B.ID_CLIENTE AND C.ID=B.ID_COMERCIAL
WHERE A.NOMBRE LIKE 'MARIA' AND A.APELLIDO1 LIKE 'SANTANA' AND A.APELLIDO2 LIKE 'MORENO' ;
#º7
SELECT distinct A.NOMBRE
FROM CLIENTE A INNER JOIN PEDIDO B INNER JOIN COMERCIAL C
ON A.ID=B.ID_CLIENTE AND C.ID=B.ID_COMERCIAL
WHERE C.NOMBRE LIKE 'DANIEL' AND C.APELLIDO1 LIKE 'SÁEZ' AND C.APELLIDO2 LIKE 'VEGA' ;

#1.3.5 CONSULTAS MULTITABLA
#1
select * FROM 
CLIENTE A LEFT JOIN PEDIDO B 
ON A.ID=B.ID_CLIENTE
ORDER BY A.APELLIDO1, A.APELLIDO2, A.NOMBRE ;
#2
SELECT * FROM 
COMERCIAL C LEFT JOIN PEDIDO B
ON C.ID=B.ID_COMERCIAL
ORDER BY C.APELLIDO1, C.APELLIDO2, C.NOMBRE ;
#3
SELECT * FROM 
CLIENTE A LEFT JOIN PEDIDO B 
ON A.ID=B.ID_CLIENTE
WHERE B.ID IS NULL ;
#4
SELECT * FROM 
COMERCIAL C LEFT JOIN PEDIDO B
ON C.ID=B.ID_COMERCIAL
WHERE B.ID IS NULL ;
#5

SELECT 'CLIENTE', A.ID, A.NOMBRE, A.APELLIDO1, A.APELLIDO2
 FROM 
CLIENTE A LEFT JOIN PEDIDO B 
ON A.ID=B.ID_CLIENTE
WHERE B.ID IS NULL
UNION
SELECT 'COMERCIAL', C.ID, C.NOMBRE, C.APELLIDO1, C.APELLIDO2
FROM 
COMERCIAL C LEFT JOIN PEDIDO B
ON C.ID=B.ID_COMERCIAL
WHERE B.ID IS NULL ;

#6
#no porque se necesitan unir las columnas que sean iguales y las tablas tienen columnas distintas

#1.3.6 Consultas resumen 
#1 
select sum(total) total_total from pedido ;
#2
select round(avg(total),2) media from pedido ;
#3
select count(distinct id_comercial) from pedido ;
#4
select count(id) from cliente ;
#5
select max(total) maximo from pedido ;
#6
select min(total) minimo from pedido ;
#7
select distinct ciudad, max(categoría) maximo
from cliente
group by ciudad ;

#or
select b.*
from (select ciudad, max(categoría) maximo from cliente group by ciudad) a,
cliente b
where a.ciudad=b.ciudad and a.maximo=b.categoría ;

#8


select a.id, a.nombre, a.apellido1, fecha, maximo 
from
(select fecha ,max(total) maximo from 
      (SELECT * 
       FROM CLIENTE A INNER JOIN PEDIDO B ON A.ID=B.ID_CLIENTE
       group by b.id_cliente) 
group by fecha) z ;

SELECT fecha, MAX(total) AS maximo
FROM PEDIDO
GROUP BY fecha;






