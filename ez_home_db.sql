DROP DATABASE IF EXISTS `ez_home`;
CREATE DATABASE IF NOT EXISTS `ez_home`;
USE `ez_home`;

--DROP TABLE IF EXISTS `oil_tank`;

CREATE TABLE `house` (
  `house_id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(50) DEFAULT NULL,
  `postcode` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`house_id`)
);

CREATE TABLE `oil_tank` (
  `oil_tank_id` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` int(11) NOT NULL,
  `no_volume_resistance` int(11) DEFAULT NULL,
  `max_line_resistance` double(11,2) DEFAULT NULL,
  `max_volume_calibration` double(11,2) DEFAULT NULL,
  PRIMARY KEY (`oil_tank_id`),
  FOREIGN KEY (`house_id`) REFERENCES `house`(`house_id`)
);

CREATE TABLE `oil_reading` (
  `oil_reading_id` int(11) NOT NULL AUTO_INCREMENT,
  `oil_tank_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `oil_level` int(11) DEFAULT NULL,
  PRIMARY KEY (`oil_reading_id`),
  FOREIGN KEY (`oil_tank_id`) REFERENCES `oil_tank`(`oil_tank_id`)
);

CREATE TABLE `room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` int(11) NOT NULL,
  `room_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  FOREIGN KEY (`house_id`) REFERENCES `house`(`house_id`)
);

CREATE TABLE `room_reading` (
  `reading_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL,
  `temperature` double(3,1) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`reading_id`),
  FOREIGN KEY (`room_id`) REFERENCES `room`(`room_id`)
);

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  PRIMARY KEY(`user_id`)
);

CREATE TABLE `user_house` (
  `user_id` int(11) NOT NULL,
  `house_id` int(11) NOT NULL,
  PRIMARY KEY(`user_id`, `house_id`),
  FOREIGN KEY (`house_id`) REFERENCES `house`(`house_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`)
)



