--creacion tablas

CREATE TABLE product (
	id SERIAL PRIMARY KEY,
	product VARCHAR(50) NOT NULL,
	stock INT,
	available_for_selling VARCHAR(50) NOT NULL
);

CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
	email VARCHAR(50),
	address VARCHAR(50) NOT NULL
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    product_id INT,
    users_id INT,
    quantity_sold INT,
    CONSTRAINT fk_product FOREIGN KEY(product_id) REFERENCES product (id),
    CONSTRAINT fk_users FOREIGN KEY(users_id) REFERENCES customers (id)
);

--insercion datos en tablas product y users

INSERT INTO product (id, product, stock, available_for_selling)
VALUES (37834, 'lechuga', 123, 'true');

INSERT INTO product (id, product, stock, available_for_selling)
VALUES (93484, 'tomate', 52, 'false');

INSERT INTO customers (id, first_name, last_name, email, address)
VALUES (1, 'JUAN', 'LOPEZ', 'juanlopez@aol.com', 'calle tacuba 88');

INSERT INTO customers (id, first_name, last_name, email, address)
VALUES (5, 'MIGUEL', 'RAMOS', 'marl55@gmail.com', 'calle 20 noviembre sn');

--verificamos tabla product y users

SELECT * FROM product;
SELECT * FROM users;

--hacemos un querry para verificar el stock y que el producto este disponible para venta.
SELECT * FROM product WHERE id = 37834 AND available_for_selling='true' AND stock > 120;

--se confirma la venta por 120 unidades y se actualiza el stock
UPDATE product SET stock = stock - 120 WHERE id = 37834;

--se anota la venta en la tabla orders
INSERT INTO orders (product_id, users_id, quantity_sold)
VALUES (37834, 1, 120);

--se actualiza la disponibilidad del producto para venta
UPDATE product SET available_for_selling='false' WHERE id = 37834 AND stock <= 0;

--si el producto no esta disponible para venta o no alcanza la cantidad, no saldra en la tabla
SELECT * FROM product WHERE id = 'product_id' AND available_for_selling='true' AND stock > 'pedido';

--por si se hace restock de un producto
UPDATE product SET stock = stock + 'numero restock' WHERE id = 'product_id';
UPDATE product SET available_for_selling='true' WHERE id = 'product_id' AND stock > 0;