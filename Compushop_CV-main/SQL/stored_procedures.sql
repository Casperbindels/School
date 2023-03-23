-- Statement om procedure aan te maken
DELIMITER $$
CREATE PROCEDURE get_product_info (IN p_product_name VARCHAR(255))
BEGIN
    SELECT price, stock, product_description, product_type
    FROM products
    WHERE product_name = p_product_name;
END $$
DELIMITER ;

-- Query die je gebruikt bij de procedure get_product_info om deze procedure aan te roepen.
CALL get_product_info('The Beast'); 

-- Statement om procedure aan te maken
DELIMITER $$
CREATE PROCEDURE get_fullname(IN user_id INT)
BEGIN
    SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM users WHERE id = user_id;
END $$
DELIMITER ;

-- Query die je gebruikt bij de procedure get_fullname om deze procedure aan te roepen.
CALL get_fullname(1);

-- Statement om procedure aan te maken
DELIMITER $$
CREATE PROCEDURE add_product (
    IN product_name VARCHAR(50),
    IN product_type VARCHAR(50),
    IN product_description VARCHAR(255),
    IN price DECIMAL(10,2),
    IN stock INT
)
BEGIN
    DECLARE product_added INT DEFAULT 0;
    INSERT INTO products (product_name, product_type, product_description, price, stock)
    VALUES (product_name, product_type, product_description, price, stock);
    SET product_added = ROW_COUNT();
    IF product_added > 0 THEN
        SELECT CONCAT('Product "', product_name, '" is succesvol toegevoegd!') AS message;
    ELSE
        SELECT CONCAT('Er is iets misgegaan bij het toevoegen van product "', product_name, '".') AS message;
    END IF;
END $$
DELIMITER ;

-- Query die je gebruikt bij de procedure add_product om deze procedure aan te roepen.
CALL add_product('Geforce 3070 TI', 'Videokaart', 'goei kaartje', 500, 50);