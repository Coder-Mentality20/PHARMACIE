CREATE DATABASE 'pharmacie';
USE pharmacie;

CREATE TABLE `article` (
     `article_id` int(11) NOT NULL AUTO_INCREMENT,
     `name` varchar(128) NOT NULL,
     `roles` varchar(45)NOT NULL,
     `price` float  NULL,
     PRIMARY KEY (`article_id`),
     UNIQUE KEY `article_id_UNIQUE` (`article_id`),
     UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1

