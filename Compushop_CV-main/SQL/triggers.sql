
DELIMITER $$
CREATE TRIGGER login_count
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF NEW.last_login != OLD.last_login THEN
        SET NEW.login_count = OLD.login_count + 1;
    END IF;
END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER price_update
BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
    IF NEW.stock < 5 AND NEW.stock != OLD.stock AND NEW.discount_applied = 0 THEN
        SET NEW.price = OLD.price - 20;
        SET NEW.discount_applied = 1;
    END IF;
END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER adjust_price
BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
    IF NEW.stock >= 5 AND NEW.stock != OLD.stock AND NEW.adjusted_price = 0 THEN
        SET NEW.price = OLD.price + 20;
        SET NEW.adjusted_price = 1;
    END IF;
END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER update_product_stock
AFTER INSERT ON carts_products
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock = stock - NEW.product_amount
    WHERE id = NEW.product_id;
END $$
DELIMITER ;

-- Voor dit uit om de trigger te laten werken:
INSERT INTO carts_products (cart_id, product_id, product_amount)
VALUES
  (1, 2, 3);