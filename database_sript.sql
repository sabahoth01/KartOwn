-- 1. Users: Stores information about the registered users of the website.
CREATE TABLE USERS (
   user_id      INTEGER SERIAL DEFAULT VALUE PRIMARY KEY,
   username     VARCHAR(50) NOT NULL,
   userSurname  VARCHAR(50) NOT NULL,
   password     VARCHAR(50) NOT NULL,
   phone        VARCHAR(50) NOT NULL
                   );

-- 2. Products: Stores information about the available Shop.
CREATE TABLE PRODUCTS (
   product_id       INTEGER SERIAL DEFAULT VALUE PRIMARY KEY,
   name             VARCHAR(50) NOT NULL,
   description      VARCHAR(300) NOT NULL,
   price            FLOAT NOT NULL,
   category_id      INTEGER NOT NULL ,
   FOREIGN KEY(category_id) REFERENCES CATEGORIES(category_id) ON DELETE RESTRICT
                   );


-- 3. Categories: Stores information about the categories of Shop.
   CREATE TABLE CATEGORIES (
   category_id      INTEGER SERIAL DEFAULT VALUE PRIMARY KEY,
   name             VARCHAR(50) NOT NULL
                           );

-- 4. Orders: Stores information about the orders placed by users.
CREATE TABLE ORDERS (
   order_id       INTEGER SERIAL DEFAULT VALUE PRIMARY KEY,
   user_id        INTEGER NOT NULL,
   order_date     DATE,
   total_amount   FLOAT NOT NULL,
   FOREIGN KEY(user_id) REFERENCES USERS(user_id) ON DELETE  CASCADE
                   );


-- 5. Order_Items: Stores information about the items in each order.
CREATE TABLE ORDERS_ITEMS (
   order_id       INTEGER NOT NULL ,
   product_id     INTEGER NOT NULL,
   quantity       INTEGER NOT NULL,
   price          FLOAT NOT NULL,
   PRIMARY KEY(order_id,product_id),
   FOREIGN KEY(order_id) REFERENCES ORDERS(order_id) ON DELETE CASCADE ,
   FOREIGN KEY(product_id) REFERENCES PRODUCTS(product_id)
                   );


-- 6. Cart:
CREATE TABLE CART (
   cart_id       INTEGER SERIAL DEFAULT VALUE PRIMARY KEY,
   user_id        INTEGER NOT NULL,
   FOREIGN KEY(user_id) REFERENCES USERS(user_id)
                   );

-- 7. Cart_Product (Pivot table for the many-to-many relationship between Cart and Product):
CREATE TABLE CART_PRODUCTS (
   cart_id       INTEGER NOT NULL ,
   product_id     INTEGER NOT NULL,
   quantity       INTEGER NOT NULL,
   PRIMARY KEY(cart_id,product_id),
   FOREIGN KEY(cart_id) REFERENCES CART(cart_id) ON DELETE CASCADE ,
   FOREIGN KEY(product_id) REFERENCES PRODUCTS(product_id)
                   );

-- 8. Review:
CREATE TABLE REVIEW (
   review_id     INTEGER SERIAL DEFAULT VALUE PRIMARY KEY ,
   user_id       INTEGER NOT NULL,
   product_id    INTEGER NOT NULL,
   rating        FLOAT NOT NULL,
   comment      TEXT NOT NULL ,
   createdAt    DATE,
   FOREIGN KEY(user_id) REFERENCES USERS(user_id),
   FOREIGN KEY(product_id) REFERENCES PRODUCTS(product_id)
                   );

-- 9. Admin:
CREATE TABLE ADMIN (
   admin_id       INTEGER SERIAL DEFAULT VALUE PRIMARY KEY,
   user_id        INTEGER NOT NULL,
   FOREIGN KEY(user_id) REFERENCES USERS(user_id) ON DELETE RESTRICT
                   );

-- 10. Post for blog
CREATE TABLE POST (
   post_id     INTEGER SERIAL DEFAULT VALUE PRIMARY KEY ,
   admin_id     INTEGER NOT NULL ,
   title        TEXT NOT NULL,
   content      TEXT NOT NULL,
   createdAt     DATE,
   FOREIGN KEY(admin_id) REFERENCES ADMIN(admin_id)
                   );

-- 11. Comment for blog
CREATE TABLE COMMENTS (
    comment_id   INTEGER SERIAL DEFAULT VALUE PRIMARY KEY,
    admin_id  INTEGER NOT NULL ,
    post_id  INTEGER NOT NULL ,
    content   TEXT NOT NULL,
    createdAt DATE,
    FOREIGN KEY (admin_id) REFERENCES ADMIN (admin_id),
    FOREIGN KEY (post_id) REFERENCES POST (post_id)
                  );

-- 12. Role

