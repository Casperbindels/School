-- Statement om functie aan te maken
DELIMITER $$
CREATE FUNCTION get_user_count()
RETURNS INT
BEGIN
    DECLARE user_count INT;
    SELECT COUNT(*) INTO user_count FROM users;
    RETURN user_count;
END $$
DELIMITER ;

-- Query die je gebruikt bij de functie get_user_count om deze functie aan te roepen.
SELECT get_user_count(); 

-- Statement om functie aan te maken
DELIMITER $$
CREATE FUNCTION change_user_email(user_id INT, new_email VARCHAR(255))
RETURNS VARCHAR(255)
BEGIN
    DECLARE user_update_email VARCHAR(255);
    UPDATE users
    SET email = new_email
    WHERE id = user_id;
    SELECT email INTO user_update_email FROM users WHERE id = user_id;
    RETURN CONCAT('Email for user ', user_id, ' has been updated to ', user_update_email);
END $$
DELIMITER ;

-- Query die je gebruikt bij de functie change_user_email om deze functie aan te roepen.
SELECT change_user_email(2, 'casperbindels@gmail.com'); 

-- Statement om functie aan te maken
DELIMITER $$
CREATE FUNCTION get_product_count(products VARCHAR(255))
RETURNS INT
BEGIN
    DECLARE product_count INT;
    SET product_count = (SELECT COUNT(*) FROM products);
    RETURN product_count;
END $$
DELIMITER ;

-- Query die je gebruikt bij de functie get_product_count om deze functie aan te roepen.
SELECT get_product_count('products'); 
