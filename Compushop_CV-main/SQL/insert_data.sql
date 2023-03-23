-- ga naar compushop_cv => SQL en voer deze statements uit

-- Voegt de gegevens van gebruikers toe aan de tabel.
INSERT INTO users (first_name, middle_name, last_name, email, encrypted_password, phone)
VALUES ('Vincent', null, 'Beurskens', 'vincentbeurskens89@gmail.com', '1337', '0610179033');
INSERT INTO users (first_name, middle_name, last_name, email, encrypted_password, phone)
VALUES ('Casper', null, 'Bindels', 'casperbindels@gmail.com', '12345', '0624561233');
INSERT INTO users (first_name, middle_name, last_name, email, encrypted_password, phone)
VALUES ('Isaura', null, 'Cabrera', 'dra.cabrera@gmail.com', '98765', '0612778651');

-- Deze statement voegt nieuwe producten toe aan de 'products' tabel.
INSERT INTO products (product_name, product_type, product_description, price, stock)
VALUES 
('GeForce RTX 4090', 'videokaart', 'Ben je een echte gamer? Dan is dit de videokaart voor jou!', 1949.99, 10), 
('Kingston Fury Beast 16GB', 'RAM geheugen', 'Met 16GB RAM geheugen heb je voldoende werkgeheugen', 64.50, 20), 
('Pure Power 11 600W', 'voeding', 'De Pure Power 11 is een ATX voeding en levert een vermogen van 600 watt met een efficiëntie van 92%.', 89.90, 5), 
('Ol''reliable', 'pre-built computer', 'Een mooie budget-computer voor gamers met een Nvidia RTX-3060 TI videokaart, 500GB Solid State Drive en een i9 9900k Intel Core.', 
900, 15), 
('The Beast', 'pre-built computer', 'Een zeer krachtige computer met een Nvidia RTX-3090 TI videokaart, 10TB Solid State Drive en een i9 12900k Intel Core.', 1500, 25),
('Dell Latitude 14', 'Laptop', '14 inch zakelijke laptop met Intel Core i5 processor', 799.00, 10),
('HP EliteBook 840', 'Laptop', '14 inch zakelijke laptop met Intel Core i7 processor', 1199.00, 5),
('Logitech MX Master 3', 'Muis', 'Draadloze muis met geavanceerde tracking en aangepaste knoppen', 99.99, 25),
('Apple Magic Keyboard', 'Toetsenbord', 'Draadloos toetsenbord met numeriek toetsenblok', 129.00, 15),
('Samsung 32 inch curved monitor', 'Monitor', '32 inch curved monitor met 4K resolutie', 599.00, 7),
('ASUS RT-AC68U router', 'Router', 'Dual-band WiFi-router met snelheden tot 1900 Mbps', 149.99, 12),
('Seagate Expansion Portable 1TB', 'Externe harde schijf', 'Draagbare externe harde schijf met 1TB opslagcapaciteit', 59.99, 20),
('Kingston HyperX Fury 16GB', 'Geheugen', 'DDR4 RAM-geheugen met snelheden tot 3200 MHz', 79.99, 30),
('AMD Ryzen 5 5600X', 'Processor', 'Zeskernige processor met snelheden tot 4.6 GHz', 299.00, 8),
('MSI GeForce RTX 3060 Ti', 'Videokaart', 'Videokaart met 8GB GDDR6 geheugen en ray tracing technologie', 699.00, 3),
('LG UltraGear 27GN950-B', 'Monitor', '27 inch 4K monitor met Nano IPS en G-Sync compatibiliteit', 1099.00, 4),
('Logitech C920 HD Pro', 'Webcam', 'Webcam met 1080p HD-video en stereo audio', 79.99, 18),
('Corsair K70 RGB MK.2', 'Toetsenbord', 'Mechanisch toetsenbord met RGB-verlichting en Cherry MX switches', 149.99, 10),
('Intel Core i9-11900K', 'Processor', 'Achtkernige processor met snelheden tot 5.3 GHz', 599.00, 6),
('NVIDIA GeForce RTX 3080', 'Videokaart', 'Videokaart met 10GB GDDR6X geheugen en ray tracing technologie', 1199.00, 2);

-- Deze statement voegt data toe aan de 'carts' tabel.
INSERT INTO carts (`user_id`, total_price, completed)
VALUES (1, 249.99, TRUE),
       (2, 499.99, FALSE ),
       (3, 799.99, TRUE);

-- Statement voor de tabel carts_products
INSERT INTO carts_products (cart_id, product_id, product_amount) 
VALUES 
  (1, 2, 3),
  (2, 4, 1),
  (3, 1, 2);

-- Voegt adresgegevens toe aan de tabel 'addresses'
INSERT INTO addresses (street, housenumber, city, postal_code, country)
VALUES ('Peperstraat', '44', 'Oisterwijk', '5061XD', 'Nederland'),
       ('De Wetstraat', '12A', 'Breda', '4834BH', 'Nederland'),
       ('Peperstraat', '44', 'Oisterwijk', '5061XD', 'Nederland');

-- Insert statement voor de tabel 'orders'
INSERT INTO orders (cart_id, address_id, order_date, order_status)
VALUES (1, 1, '2023-01-23', 'delivered');
INSERT INTO orders (cart_id, address_id, order_date, order_status)
VALUES (2, 2, '2023-02-01', 'received');
INSERT INTO orders (cart_id, address_id, order_date, order_status)
VALUES (3, 3, '2023-01-29', 'shipped');

-- Insert statement voor het toevoegen van gegevens aan de 'payments' tabel.
INSERT INTO payments (order_id, payment_date, payment_method, amount, completed)
VALUES (1, '2023-01-24', 'Ideal', 199.99, TRUE),
       (2, '2023-01-29', 'Creditcard', 199.99, TRUE),
       (3, '2023-02-03', 'Ideal', 199.99, FALSE);

-- Voegt een nieuwe verzending toe.
INSERT INTO shipments (payment_id, tracking_number, shipping_method, shipment_date, delivery_date, shipping_cost)
VALUES (1, '123BA', 'PostNL', '2023-01-24', '2023-01-25', 3.50),
       (2, '1923B', 'DHL', '2023-01-29', '2023-01-30', 3.50),
       (3, '1337XD', 'UPS', '2023-02-03', '2023-02-04', 3.50);
