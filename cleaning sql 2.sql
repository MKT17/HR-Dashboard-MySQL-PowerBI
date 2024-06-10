USE projects;

SELECT * FROM hr;

ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR (20) NULL;

DESCRIBE hr;

SET sql_safe_updates = 0;

UPDATE hr 
SET birthdate = CASE
   WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
   WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
   ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

UPDATE hr 
SET hire_date = CASE
   WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
   WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
   ELSE NULL
END;

UPDATE hr
SET termdate = DATE(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL OR termdate != '';

SELECT * FROM hr;

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

DELETE FROM hr
ORDER BY '00-0037846'
LIMIT 1;

UPDATE hr
SET termdate = NULL
WHERE termdate = '0000-00-00';

SELECT termdate from hr;

DESCRIBE hr;

SELECT termdate FROM hr;

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

ALTER TABLE hr ADD COLUMN age INT;

SELECT * FROM hr;

UPDATE hr
SET age = timestampdiff(YEAR, birthdate, CURDATE());

SELECT birthdate, age FROM hr;

SELECT 
   min(age) AS youngest,
   max(age) AS  oldest
FROM hr; 

SELECT COUNT(*) FROM hr
WHERE age <= 18;

SELECT * FROM hr;  