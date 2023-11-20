# findmyPG

Welcome to our Online PG Finding Website! This platform helps users find suitable Paying Guest accommodations easily. If you are a student looking for a PG, our website has you covered.

## Table of Contents
- [Features](#features)

[//]: # (- [Demo]&#40;#demo&#41;)

[//]: # (- [Getting Started]&#40;#getting-started&#41;)

[//]: # (    - [Prerequisites]&#40;#prerequisites&#41;)

[//]: # (    - [Installation]&#40;#installation&#41;)

[//]: # (- [Usage]&#40;#usage&#41;)

[//]: # (- [Contributing]&#40;#contributing&#41;)

[//]: # (- [License]&#40;#license&#41;)

## Features

- Search for PG accommodations by location, price, and amenities.
- View detailed listings with photos, descriptions, and contact information.
- User registration and login system.
- User reviews and ratings for PG accommodations.
- Contact PG owners.
- Admin panel for managing listings and users.
- Responsive design for a seamless user experience on all devices.

## Database Script
```sql
CREATE DATABASE findmypg;

USE findmypg;

CREATE TABLE `property` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(50) DEFAULT NULL,
  `pname` varchar(50) DEFAULT NULL,
  `ptype` varchar(50) DEFAULT NULL,
  `details` text,
  `price` double DEFAULT NULL,
  `contact` varchar(10) DEFAULT NULL,
  `cityname` varchar(50) DEFAULT NULL,
  `pincode` varchar(6) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `location` text,
  `college` varchar(100) DEFAULT NULL,
  `imgfilename` varchar(255) DEFAULT NULL,
  `path` varchar(4000) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`pid`)
) 

CREATE TABLE `user_master` (
  `name` varchar(100) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `contact` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `session_id` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `reg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_role` varchar(100) DEFAULT 'normal',
  `login_flag` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`id`)
) 
```

