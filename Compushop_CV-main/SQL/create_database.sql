
-- Maakt database aan
DROP DATABASE IF EXISTS compushop_cv;
CREATE DATABASE compushop_cv;

-- Tabel voor Users. Deze tabel bevat informatie over gebruikers van onze website.
DROP TABLE IF EXISTS users; -- Deze SQL-query verwijdert de tabel "users" als deze al bestaat, om ruimte te maken voor een nieuwe tabel met dezelfde naam.
CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT, -- De 'id' kolom is de primaire sleutel, die automatisch wordt gegenereerd.
  first_name VARCHAR(50) NOT NULL, -- Voornaam van de gebruiker.
  middle_name VARCHAR(20), -- Tussenvoegsel van de gebruiker. Dit kolom is niet verplicht.
  last_name VARCHAR(50) NOT NULL, -- Achternaam van de gebruiker.
  email VARCHAR(100) NOT NULL, -- Email adres bevat het email adres van de gebruiker.
  encrypted_password VARCHAR(100) NOT NULL, -- De 'encrypted_password' kolom bevat de versleutelde wachtwoorden van de gebruikers.
  phone VARCHAR(20) NOT NULL, -- De 'phone' kolom bevat het telefoonnummer van de gebruiker.
  login_count INT DEFAULT 0, -- Geeft met een cijfer aan hoevaak de user is ingelogd. Verhoogd iedere keer met +1.
  last_login DATETIME NULL  -- Hier wordt de datum en tijdstip aangegeven wanneer de user voor het laatst ingelogd is geweest.
);

-- Table for Products. Deze tabel bevat informatie over producten die we verkopen.
DROP TABLE IF EXISTS products; -- Deze SQL-query verwijdert de tabel "products" als deze al bestaat, om ruimte te maken voor een nieuwe tabel met dezelfde naam.
CREATE TABLE products (
  id INT PRIMARY KEY AUTO_INCREMENT, -- De 'id' kolom is de primaire sleutel, die automatisch wordt gegenereerd.
  product_name VARCHAR(50) NOT NULL, -- De 'product_name' kolom bevat de naam van het product.
  product_type VARCHAR(50) NOT NULL, -- 'product_type' kolom bevat de type van het product.
  product_description VARCHAR(255) NOT NULL, -- De 'product_description' kolom bevat een beschrijving van het product.
  price DECIMAL(10,2) NOT NULL, -- De 'price' kolom bevat de prijs van het product.
  stock INT NOT NULL, -- De 'stock' kolom bevat het aantal exemplaren van het product dat beschikbaar is in onze voorraad.
  discount_applied INT NOT NULL DEFAULT 0, -- Iedere keer wanneer een product een voorraad heeft van minder dan 5, dan komt er 20 euro korting op dat product en gaat de count weer met +1 omhoog, waardoor de korting niet nog een keer toegepast wordt.
  adjusted_price INT NOT NULL DEFAULT 0 -- Iedere keer wanneer een product een voorraad heeft van groter of gelijk aan 5, dan komt er 20 euro bij het product bij. De count gaat met +1 omhoog, waardoor het niet weer toegepast kan worden.
);

-- Table for Carts. Deze tabel bevat informatie over de winkelwagens van de gebruikers.
DROP TABLE IF EXISTS carts; -- Deze SQL-query verwijdert de tabel "carts" als deze al bestaat, om ruimte te maken voor een nieuwe tabel met dezelfde naam.
CREATE TABLE carts (
  id INT PRIMARY KEY AUTO_INCREMENT, -- De 'id' kolom is de primaire sleutel, die automatisch wordt gegenereerd.
  user_id INT, -- De 'user_id' kolom bevat het ID van de gebruiker. Foreign Key
  total_price DECIMAL(10,2) NOT NULL, -- De 'total_price' kolom bevat de totale prijs van alle producten in het winkelwagentje.
  completed BOOLEAN NOT NULL DEFAULT FALSE, -- De 'completed' kolom geeft aan of het winkelwagentje is voltooid of niet.
  FOREIGN KEY (user_id) REFERENCES users(id) -- De 'user_id' kolom heeft een foreign key verwijzing naar de 'id' kolom in de 'users' tabel.
);

-- Table for Carts_Products. Deze koppeltabel bevat de relatie tussen winkelwagentjes en producten.
DROP TABLE IF EXISTS carts_products; -- Deze SQL-query verwijdert de tabel "carts_products" als deze al bestaat, om ruimte te maken voor een nieuwe tabel met dezelfde naam.
CREATE TABLE carts_products (
  cart_id INT, -- De 'cart_id' kolom bevat de ID van het winkelwagentje waaraan een product is toegevoegd.
  product_id INT, -- De 'product_id' kolom bevat de ID van het product dat aan het winkelwagentje is toegevoegd.
  product_amount INT NOT NULL, -- De 'product_amount' kolom bevat het aantal exemplaren van het product dat aan het winkelwagentje is toegevoegd.
  PRIMARY KEY (cart_id, product_id), -- De primaire sleutels van de tabel bestaat uit de combinatie van 'cart_id' en 'product_id', omdat één product meerdere keren aan hetzelfde winkelwagentje kan worden toegevoegd.
  FOREIGN KEY (cart_id) REFERENCES carts(id), -- De 'cart_id' kolom heeft een foreign key verwijzing naar de 'id' kolom in de 'carts' tabel.
  FOREIGN KEY (product_id) REFERENCES products(id) -- De 'product_id' kolom heeft een foreign key verwijzing naar de 'id' kolom in de 'products' tabel.
);

-- Table for Addresses. Deze tabel bevat informatie over adressen van gebruikers/klanten.
DROP TABLE IF EXISTS addresses; -- Deze SQL-query verwijdert de tabel "addresses" als deze al bestaat, om ruimte te maken voor een nieuwe tabel met dezelfde naam.
CREATE TABLE addresses (
  id INT PRIMARY KEY AUTO_INCREMENT, -- De 'id' kolom bevat het unieke ID van het adres.
  street VARCHAR(100) NOT NULL,  -- De 'street' kolom bevat de straatnaam.
  housenumber VARCHAR(20) NOT NULL, -- De 'housenumber' kolom bevat het huisnummer van het adres.
  city VARCHAR(50) NOT NULL, -- De 'city' kolom bevat de plaats waar het adres zich bevindt.
  postal_code VARCHAR(20) NOT NULL, -- De 'postal_code' kolom bevat de postcode van het adres.
  country VARCHAR(50) NOT NULL -- De 'country' kolom bevat het land waar het adres zich bevindt.
);

-- Table for Orders. Deze tabel bevat informatie over bestellingen van gebruikers/klanten.
DROP TABLE IF EXISTS orders; -- Deze SQL-query verwijdert de tabel "orders" als deze al bestaat, om ruimte te maken voor een nieuwe tabel met dezelfde naam.
CREATE TABLE orders (
  id INT PRIMARY KEY AUTO_INCREMENT, -- De 'id' kolom bevat de unieke ID van de bestelling.
  cart_id INT, -- De 'cart_id' kolom bevat de ID van de winkelwagen waaruit de bestelling is geplaatst.
  address_id INT, -- De 'address_id' kolom bevat de ID van het afleveradres van de bestelling.
  order_date DATETIME NOT NULL, -- De 'order_date' kolom bevat de datum waarop de bestelling is geplaatst.
  order_status VARCHAR(20), -- De 'order_status' kolom bevat de status van de bestelling, zoals "in afwachting van betaling", "verwerkt", enzovoort.
  FOREIGN KEY (cart_id) REFERENCES carts(id), -- De 'cart_id' kolom is een foreign key die verwijst naar de 'id' kolom van de 'carts' tabel.
  FOREIGN KEY (address_id) REFERENCES addresses(id) -- De 'address_id' kolom is een foreign key die verwijst naar de 'id' kolom van de 'addresses' tabel.
);

-- Table for Payments. Deze tabel bevat informatie over betalingen voor bestellingen.
DROP TABLE IF EXISTS payments; -- Deze SQL-query verwijdert de tabel "payments" als deze al bestaat, om ruimte te maken voor een nieuwe tabel met dezelfde naam.
CREATE TABLE payments (
  id INT PRIMARY KEY AUTO_INCREMENT, -- De 'id' kolom bevat de unieke ID van de betaling.
  order_id INT, -- De 'order_id' kolom bevat de ID van de bestelling waarvoor de betaling is gedaan.
  payment_date DATETIME NOT NULL, -- De 'payment_date' kolom bevat de datum waarop de betaling is gedaan.
  payment_method VARCHAR(20) NOT NULL, -- De 'payment_method' kolom bevat de betaalmethode die is gebruikt voor de betaling.
  amount DECIMAL(10,2) NOT NULL, -- De 'amount' kolom bevat het bedrag dat is betaald.
  completed BOOLEAN NOT NULL DEFAULT FALSE, -- De 'completed' kolom geeft aan of de betaling is voltooid of niet.
  FOREIGN KEY (order_id) REFERENCES orders(id) -- De 'order_id' kolom is een foreign key die verwijst naar de 'id' kolom van de 'orders' tabel.
);

-- Table for Shipments. Deze tabel bevat informatie over verzendingen van bestellingen.
DROP TABLE IF EXISTS shipments; -- Deze SQL-query verwijdert de tabel "shipments" als deze al bestaat, om ruimte te maken voor een nieuwe tabel met dezelfde naam.
CREATE TABLE shipments (
  id INT PRIMARY KEY AUTO_INCREMENT, -- De 'id' kolom bevat de unieke ID van de verzending.
  payment_id INT, -- De 'payment_id' kolom bevat de ID van de betaling die is gekoppeld aan de verzending.
  tracking_number INT NOT NULL, -- De 'tracking_number' kolom bevat het trackingnummer van de verzending.
  shipping_method VARCHAR(50) NOT NULL, -- De 'shipping_method' kolom bevat de verzendmethode die is gebruikt voor de verzending.
  shipment_date DATETIME NOT NULL, -- De 'shipment_date' kolom bevat de datum waarop de verzending is verzonden.
  delivery_date DATETIME NOT NULL, -- De 'delivery_date' kolom bevat de datum waarop de verzending is afgeleverd.
  shipping_cost DECIMAL(10,2) NOT NULL, -- De 'shipping_cost' kolom bevat de kosten van de verzending.
  FOREIGN KEY (payment_id) REFERENCES payments(id) -- De 'payment_id' kolom is een foreign key die verwijst naar de 'id' kolom van de 'payments' tabel.
);