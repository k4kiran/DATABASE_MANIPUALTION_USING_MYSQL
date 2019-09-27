/*create category table*/
CREATE TABLE category
  (
     category_id   INT auto_increment,
     category_name VARCHAR(50) NOT NULL,
     description   TEXT,
     PRIMARY KEY(category_id)
  );

/*create payment methods table*/
CREATE TABLE payment_method
  (
     method_id TINYINT auto_increment,
     method    VARCHAR(50) NOT NULL,
     PRIMARY KEY(method_id)
  );

/*create country table*/
CREATE TABLE country
  (
     country_id   INT auto_increment,
     country_name VARCHAR(50) NOT NULL,
     PRIMARY KEY(country_id)
  );

/*create state table*/
CREATE TABLE state
  (
     state_id   INT auto_increment,
     state_name VARCHAR(50) NOT NULL,
     PRIMARY KEY(state_id)
  );

/*create seller table*/
CREATE TABLE seller
  (
     seller_id    INT auto_increment,
     seller_name  VARCHAR(50) NOT NULL,
     email        VARCHAR(20),
     phone_number BIGINT NOT NULL,
     PRIMARY KEY(seller_id)
  );

/*create address table*/
CREATE TABLE address
  (
     address_id    INT auto_increment,
     address_line1 TINYTEXT NOT NULL,
     address_line2 TINYTEXT,
     country_id    INT REFERENCES country(country_id),
     state_id      INT REFERENCES country(state_id),
     street        VARCHAR(50),
     zipcode       VARCHAR(8) NOT NULL,
     PRIMARY KEY(address_id)
  );

/*create customer table*/
CREATE TABLE customer
  (
     customer_id  INT auto_increment,
     address_id   INT REFERENCES address(address_id),
     first_name   VARCHAR(50) NOT NULL,
     last_name    VARCHAR(50),
     phone_number BIGINT NOT NULL,
     email        VARCHAR(20),
     PRIMARY KEY(customer_id),
     UNIQUE(customer_id, phone_number, email)
  );

/*create subcategory table*/
CREATE TABLE subcategory
  (
     subcategory_id   INT auto_increment,
     category_id      INT REFERENCES category(category_id),
     subcategory_name VARCHAR(50) NOT NULL,
     PRIMARY KEY(subcategory_id)
  );

/*create products table*/
CREATE TABLE products
  (
     product_id     INT auto_increment,
     subcategory_id INT REFERENCES subcategory(subcategory_id),
     product_name   VARCHAR(50),
     PRIMARY KEY(product_id)
  );

/*create order1 table*/
CREATE TABLE order1
  (
     order_id            INT auto_increment,
     payment_method_id   INT REFERENCES payment_methods(payment_method_id),
     customer_id         INT REFERENCES customer(customer_id),
     order_date          DATE,
     subtotal            FLOAT(20, 3),
     total_discount      FLOAT(5, 2),
     total_tax           FLOAT(5, 2),
     total_price         FLOAT(20, 3),
     billing_address_id  INT REFERENCES address(address_id),
     shipping_address_id INT REFERENCES address(address_id),
     shipment_date       DATE,
     shipment_status     VARCHAR(20) DEFAULT 'NOT SHIPPED',
     PRIMARY KEY(order_id),
     UNIQUE(order_id, customer_id)
  );

/*create order_item table*/
CREATE TABLE order_item
  (
     item_id    INT auto_increment,
     order_id   INT REFERENCES order1(order_id),
     item_count INT NOT NULL,
     PRIMARY KEY(item_id)
  );

/*create product_seller table*/
CREATE TABLE product_sellar
  (
     id            INT auto_increment,
     item_id       INT REFERENCES order_item(item_id),
     product_id    INT REFERENCES products(product_id),
     seller_id     INT REFERENCES seller(seller_id),
     active_status TINYINT(1),
     quantity      INT NOT NULL,
     price         FLOAT(20, 3),
     discount      TINYINT,
     total_price   FLOAT(20, 3),
     PRIMARY KEY(id),
     UNIQUE(product_id, seller_id)
  );  