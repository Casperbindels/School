
ALTER TABLE users 
ADD CONSTRAINT unique_email UNIQUE (email);


ALTER TABLE products 
ADD CONSTRAINT check_stock CHECK (stock >= 0);


ALTER TABLE products 
ADD CONSTRAINT check_product_quantity CHECK (STOCK > 0);


ALTER TABLE products 
ADD CONSTRAINT check_price CHECK (price > 0);


ALTER TABLE carts_products 
ADD CONSTRAINT cart_id FOREIGN KEY (cart_id) REFERENCES carts(id);


ALTER TABLE carts_products
ADD CONSTRAINT check_product_amount CHECK (product_amount > 0);


