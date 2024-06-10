CREATE DATABASE projects;

USE projects;

SELECT * FROM hr;

ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR (20) NULL;
DESCRIBE hr;

SELECT birthdate FROM hr;

SET sql_safe_updates = 0;


UPDATE hr 
SET birthdate = CASE
   WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
   WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
   ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

SELECT birthdate FROM hr;

UPDATE hr 
SET hire_date = CASE
   WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
   WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
   ELSE NULL
END;

UPDATE hr
SET termdate = DATE(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate !=''; 

UPDATE hr 
SET termdate = '0000-00-00'
WHERE IS NULL(termdate, 1);

SELECT termdate FROM hr;

