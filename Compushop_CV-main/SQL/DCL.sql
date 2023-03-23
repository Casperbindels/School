CREATE USER Administrator IDENTIFIED BY 'Welkom123!';

GRANT SELECT ON compushop_cv.* TO 'Administrator'@'localhost';
FLUSH PRIVILEGES;

CREATE USER Medewerker IDENTIFIED BY 'Welkom123!';
FLUSH PRIVILEGES;

CREATE USER Medewerker IDENTIFIED BY 'Welkom123!';
FLUSH PRIVILEGES;

GRANT SELECT ON compushop_cv.* TO 'Administrator'@'localhost';
FLUSH PRIVILEGES;

GRANT INSERT, UPDATE ON compushop_cv.products TO 'medewerker'@'localhost';
FLUSH PRIVILEGES;

GRANT INSERT, UPDATE ON compushop_cv.carts TO 'medewerker'@'localhost';
FLUSH PRIVILEGES;

GRANT INSERT, UPDATE ON compushop_cv.carts_products TO 'medewerker'@'localhost';
FLUSH PRIVILEGES;

GRANT INSERT, UPDATE ON compushop_cv.addresses TO 'medewerker'@'localhost';
FLUSH PRIVILEGES;

GRANT INSERT, UPDATE ON compushop_cv.orders TO 'medewerker'@'localhost';
FLUSH PRIVILEGES;

GRANT INSERT, UPDATE ON compushop_cv.payments TO 'medewerker'@'localhost';
FLUSH PRIVILEGES;

GRANT INSERT, UPDATE ON compushop_cv.shipments TO 'medewerker'@'localhost';
FLUSH PRIVILEGES;

CREATE USER Klant IDENTIFIED BY 'Welkom123!';
FLUSH PRIVILEGES;

GRANT SELECT ON compushop_cv.products TO 'Klant'@'localhost';

GRANT SELECT ON compushop_cv.carts TO 'Klant'@'localhost';

GRANT SELECT ON compushop_cv.orders TO 'Klant'@'localhost';

GRANT SELECT ON compushop_cv.payments TO 'Klant'@'localhost';

GRANT SELECT ON compushop_cv.shipments TO 'Klant'@'localhost';

GRANT SELECT ON compushop_cv.product_name TO 'Klant'@'localhost';

GRANT TRIGGER ON compushop_cv.* TO Administrator;
GRANT TRIGGER ON compushop.products TO user_or_role;

GRANT EXECUTE ON PROCEDURE get_product_info TO Administrator;
FLUSH PRIVILEGES;

GRANT EXECUTE ON PROCEDURE get_fullname TO Administrator;
FLUSH PRIVILEGES;

GRANT EXECUTE ON PROCEDURE add_product TO Administrator;
FLUSH PRIVILEGES;

GRANT EXECUTE ON PROCEDURE product_added TO Administrator;
FLUSH PRIVILEGES;

GRANT EXECUTE ON PROCEDURE get_product_info TO medewerker;
FLUSH PRIVILEGES;

GRANT EXECUTE ON PROCEDURE get_fullname TO medewerker;
FLUSH PRIVILEGES;

GRANT EXECUTE ON PROCEDURE add_product TO medewerker;
FLUSH PRIVILEGES;

GRANT EXECUTE ON PROCEDURE product_added TO medewerker;
FLUSH PRIVILEGES;



