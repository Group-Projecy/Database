DROP DATABASE IF EXISTS `ez_home`;
CREATE DATABASE IF NOT EXISTS `ez_home`;
USE `ez_home`;

DROP TABLE IF EXISTS `user_house`, `oil_reading`, `room_reading`, `oil_tank`, `room`, `users`, `house`;

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
  `room_reading_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL,
  `temperature` double(3,1) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`room_reading_id`),
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
);

INSERT INTO `house`(`address`, `postcode`) VALUES ('58 Sandygrove Blackrock Co. Louth','XJ8H+6X');

INSERT INTO `room`(`house_id`, `room_name`) VALUES (1,'Bedroom 1');
INSERT INTO `room`(`house_id`, `room_name`) VALUES (1,'Kitchen');

INSERT INTO `room_reading`(`room_id`, `temperature`, `date_time`) VALUES (1,21.0,'2021-11-12 19:23:18');
INSERT INTO `room_reading`(`room_id`, `temperature`, `date_time`) VALUES (1,21.0,'2021-11-12 19:53:36');
INSERT INTO `room_reading`(`room_id`, `temperature`, `date_time`) VALUES (1,20.0,'2021-11-12 20:23:53');
INSERT INTO `room_reading`(`room_id`, `temperature`, `date_time`) VALUES (1,21.0,'2021-11-12 20:54:10');
INSERT INTO `room_reading`(`room_id`, `temperature`, `date_time`) VALUES (1,21.0,'2021-11-12 21:24:28');
INSERT INTO `room_reading`(`room_id`, `temperature`, `date_time`) VALUES (1,20.0,'2021-11-12 21:54:45');
INSERT INTO `room_reading`(`room_id`, `temperature`, `date_time`) VALUES (1,20.0,'2021-11-12 22:25:03');
INSERT INTO `room_reading`(`room_id`, `temperature`, `date_time`) VALUES (1,20.0,'2021-11-12 22:55:20');
INSERT INTO `room_reading`(`room_id`, `temperature`, `date_time`) VALUES (2,20.0,'2021-11-13 09:38:27');
INSERT INTO `room_reading`(`room_id`, `temperature`, `date_time`) VALUES (2,20.0,'2021-11-13 09:58:39');
INSERT INTO `room_reading`(`room_id`, `temperature`, `date_time`) VALUES (2,20.0,'2021-11-13 10:19:51');
INSERT INTO `room_reading`(`room_id`, `temperature`, `date_time`) VALUES (2,21.0,'2021-11-13 10:41:03');
INSERT INTO `room_reading`(`room_id`, `temperature`, `date_time`) VALUES (2,21.0,'2021-11-13 11:01:15');
INSERT INTO `room_reading`(`room_id`, `temperature`, `date_time`) VALUES (2,21.0,'2021-11-13 11:21:27');
INSERT INTO `room_reading`(`room_id`, `temperature`, `date_time`) VALUES (2,21.0,'2021-11-13 11:42:39');
INSERT INTO `room_reading`(`room_id`, `temperature`, `date_time`) VALUES (2,21.0,'2021-11-13 12:02:50');
 
INSERT INTO `users`(`name`, `email`, `password`) VALUES ('Patrick Garfield','pgarfield@gmail.com','password');

INSERT INTO `user_house`(`user_id`, `house_id`) VALUES (1,1);

--INSERT INTO `oil_reading`(`oil_tank_id`, `date_time`, `oil_level`) VALUES (1,[value-3],[value-4]);

--INSERT INTO `oil_tank`(`house_id`, `no_volume_resistance`, `max_line_resistance`, `max_volume_calibration`) VALUES ([value-2],[value-3],[value-4],[value-5]);

