-- Create the database
CREATE DATABASE IF NOT EXISTS `home_decor_db`
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_0900_ai_ci;

USE `home_decor_db`;

-- Drop existing tables if they exist (order matters due to foreign keys)
DROP TABLE IF EXISTS `cart_tbl`;
DROP TABLE IF EXISTS `customer_tbl`;
DROP TABLE IF EXISTS `product_tbl`;
DROP TABLE IF EXISTS `user_tbl`;

-- Create customer table
CREATE TABLE `customer_tbl` (
  `customerId` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(200),
  `lastName` VARCHAR(200),
  `username` VARCHAR(200),
  `password` VARCHAR(200),
  `city` VARCHAR(200),
  `phone` VARCHAR(200),
  `email` VARCHAR(200),
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Create product table
CREATE TABLE `product_tbl` (
  `productId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100),
  `price` INT,
  `company` VARCHAR(200),
  `category` VARCHAR(200),
  `imageName` VARCHAR(200),
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Create cart table
CREATE TABLE `cart_tbl` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `custId` INT,
  `prodId` INT,
  `quantity` INT,
  `purchaseDate` DATE,
  `purchaseTime` TIME,
  `price` DOUBLE,
  `paid` TINYINT(1),
  PRIMARY KEY (`id`),
  KEY `cidFK` (`custId`),
  KEY `pidFk` (`prodId`),
  CONSTRAINT `cidFK` FOREIGN KEY (`custId`) REFERENCES `customer_tbl` (`customerId`) ON DELETE SET NULL,
  CONSTRAINT `pidFk` FOREIGN KEY (`prodId`) REFERENCES `product_tbl` (`productId`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Create user table
CREATE TABLE `user_tbl` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100),
  `password` VARCHAR(100),
  `fname` VARCHAR(100),
  `lname` VARCHAR(100),
  `role` VARCHAR(100),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
