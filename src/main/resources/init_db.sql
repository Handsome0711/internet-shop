CREATE SCHEMA IF NOT EXISTS internet_shop DEFAULT CHARACTER SET utf8 ;

CREATE TABLE internet_shop.products (
  id BIGINT(11) NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(226) NOT NULL,
  price DOUBLE NOT NULL,
  PRIMARY KEY (id));

create table users
(
    id       bigint(11) auto_increment
        primary key,
    name     varchar(225) not null,
    surname  varchar(225) not null,
    login    varchar(225) not null,
    password varchar(225) not null,
    salt     blob         not null,
    constraint login_UNIQUE
        unique (login)
);


  CREATE TABLE `internet_shop`.`roles` (
  `role_id` BIGINT(11) NOT NULL,
  `role_name` VARCHAR(226) NOT NULL,
  PRIMARY KEY (`role_id`));

CREATE TABLE `internet_shop`.`users_roles` (
  `user_id` BIGINT(11) NOT NULL,
  `role_id` BIGINT(11) NOT NULL,
  INDEX `fk_new_table_1_idx` (`user_id` ASC),
  INDEX `fk_new_table_2_idx` (`role_id` ASC),
  CONSTRAINT `fk_new_table_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `internet_shop`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_new_table_2`
    FOREIGN KEY (`role_id`)
    REFERENCES `internet_shop`.`roles` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `internet_shop`.`orders` (
  `order_id` BIGINT(11) NOT NULL,
  `user_id` BIGINT(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_orders_1_idx` (`user_id` ASC),
  CONSTRAINT `fk_orders_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `internet_shop`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

    CREATE TABLE `internet_shop`.`orders_products` (
  `order_id` BIGINT(11) NOT NULL,
  `product_id` BIGINT(11) NOT NULL,
  INDEX `fk_orders_products_1_idx` (`order_id` ASC),
  INDEX `fk_orders_products_2_idx` (`product_id` ASC),
  CONSTRAINT `fk_orders_products_1`
    FOREIGN KEY (`order_id`)
    REFERENCES `internet_shop`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_products_2`
    FOREIGN KEY (`product_id`)
    REFERENCES `internet_shop`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `shopping_carts` (
  `cart_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `fk_shopping_carts_1_idx` (`user_id`),
  CONSTRAINT `fk_shopping_carts_1` FOREIGN KEY (`user_id`)
  REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `internet_shop`.`shopping_carts_products` (
  `cart_id` BIGINT(11) NOT NULL,
  `product_id` BIGINT(11) NOT NULL,
  INDEX `fk_shopping_carts_products_1_idx` (`cart_id` ASC),
  INDEX `fk_shopping_carts_products_2_idx` (`product_id` ASC),
  CONSTRAINT `fk_shopping_carts_products_1`
    FOREIGN KEY (`cart_id`)
    REFERENCES `internet_shop`.`shopping_carts` (`cart_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shopping_carts_products_2`
    FOREIGN KEY (`product_id`)
    REFERENCES `internet_shop`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO `internet_shop`.`roles` (`role_name`) VALUES ('USER');
INSERT INTO `internet_shop`.`roles` (`role_name`) VALUES ('ADMIN');


