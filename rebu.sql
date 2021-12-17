/*
	INFO 1273: Databases 1
    Professor: Martin Cserhati
    By: Hayley Jolliffe & Jamie Antonucci
    Date: December 17, 2021
*/

CREATE SCHEMA rebu;

USE rebu;

-- DRIVERS --
CREATE TABLE drivers (
	driver_id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (driver_id),
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    address VARCHAR(100) NOT NULL,
    phone_number VARCHAR(10) NOT NULL UNIQUE, -- VARCHAR because used as a string, not a number
    email VARCHAR(45) NOT NULL UNIQUE,
    speed_tickets_last_5_years INT NOT NULL,
    accidents_last_5_years INT NOT NULL
);

-- VEHICLES --
CREATE TABLE vehicles (
	vehicle_id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (vehicle_id),
    vehicle_make VARCHAR(15) NOT NULL,
    vehicle_model VARCHAR(15) NOT NULL,
    vehicle_year YEAR NOT NULL, 
    license_plate VARCHAR(10) NOT NULL UNIQUE,
    insurance_provider VARCHAR(20) NOT NULL,
    insurance_policy_num VARCHAR(20) NOT NULL UNIQUE
);

-- RIDERS --
CREATE TABLE riders (
	rider_id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (rider_id),
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    address VARCHAR(100) NOT NULL
);

-- CREDIT & DEBIT CARDS --
CREATE TABLE payment_cards (
	card_id INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (card_id),
    card_type VARCHAR(6) NOT NULL, -- "debit" or "credit"
    card_number VARCHAR(16) NOT NULL UNIQUE,
    cardholder_name VARCHAR(50) NOT NULL,
    card_expiry DATE -- Some debit cards do not have expiry dates, so not "not null"
);
    
-- RIDES --
CREATE TABLE rides (
	ride_id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (ride_id),
    pickup_address VARCHAR(100) NOT NULL,
    pickup_date_time DATETIME,
    dropoff_address VARCHAR(100) NOT NULL,
    cost_of_ride DECIMAL(6,2) NOT NULL, -- Cost cannot exceed $9999.99
    hst DECIMAL(6,2) AS (cost_of_ride * 0.13), 
		-- Rebu only operates in Ontario, with HST of 13% - will need to be updated upon expansion to other provinces/countries
    total_cost DECIMAL(6,2) AS (cost_of_ride + hst),
    driver_satisfaction INT
);
