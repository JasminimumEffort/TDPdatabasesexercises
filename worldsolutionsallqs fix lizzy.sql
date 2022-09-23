#ANSWERS TO WORLD
USE World;

SHOW tables;
DESCRIBE city;
DESCRIBE country;

#Q1
SELECT code FROM country WHERE name = "United States";
SELECT COUNT(name) FROM city WHERE CountryCode="USA";  #274

#Q2
SELECT population, LifeExpectancy FROM country WHERE name = "Argentina"; #37032000 pop, LE= 75.1
SELECT * FROM COUNTRY;

#Q3
SELECT Name, lifeexpectancy FROM country WHERE lifeexpectancy IS NOT NULL, ORDER BY lifeexpectancy DESC LIMIT 1; #ANDORRA 83.5

#Q4
#SELECT country.capital, 
SELECT country.capital, country.name AS countryname, city.ID, city.name FROM country JOIN city ON country.capital = city.ID WHERE country.name = "Spain";
#madrid

#Q5
SELECT countrylanguage.language, country.region FROM country JOIN countrylanguage ON Countrylanguage.CountryCode = Country.code WHERE country.region= "Southeast Asia";
#Total of a lot 

#Q6
SELECT name FROM city WHERE name LIKE "F%" LIMIT 25;
#Fagatogo, Florenico Varela, Formosa, Francistown. . . 

#Q7
SELECT COUNT(ID) 
FROM city JOIN country ON country.code = city.countrycode 
WHERE country.name = "China"; #363

#Q8
SELECT population, name 
FROM country 
WHERE Population IS NOT NULL 
ORDER BY population
LIMIT 1; #Antartica is sad and lonely

#Q9 
SELECT COUNT(DISTINCT code) FROM country;#239

#Q10
SELECT name FROM country
ORDER BY SurfaceArea
DESC LIMIT 10; #Russian Fed, Antartica, Canada, China, US, Brazil . . . 

#Q11
SELECT city.name 
FROM city JOIN country
ON country.code = city.countrycode
WHERE country.name = "Japan"
ORDER BY city.population
DESC LIMIT 5; #Tokyo, Jokohama, Osaka, Nagoya, Sapporo

#Q12
UPDATE country SET HeadOfState="Elizabeth II" WHERE HeadOfState = "Elisabeth II";
SELECT name, code
FROM country
WHERE HeadOfState = "Elizabeth II";

#Q13
SELECT * FROM
(SELECT population, surfacearea, name, (population/surfacearea) AS p2aratio
FROM country
WHERE population!=0 AND population IS NOT NULL)
AS Ratiochart ORDER BY p2aratio
LIMIT 10;

#Q14
SELECT DISTINCT language FROM countrylanguage; 

#Q15
SELECT GNP, name 
FROM country
ORDER BY GNP
DESC LIMIT 10;

SELECT name, code, language FROM country JOIN countrylanguage
ON country.code = countrylanguage.countrycode;
SELECT COUNT(DISTINCT LANGUAGE) FROM countrylanguage WHERE countrycode = "ABW";

#Q16
SELECT name, COUNT(Language) AS languagecount 
FROM country JOIN countrylanguage
ON country.code = countrylanguage.countrycode
GROUP BY countrycode
ORDER BY languagecount
DESC LIMIT 10;


#Q17
SELECT name
FROM CountryLanguage JOIN Country ON country.code = CountryLanguage.CountryCode
WHERE CountryLanguage.Percentage > 50
AND CountryLanguage.language="German"; #Austria, Switzerland, Germany and Liechenstein

#Q18
SELECT name
FROM country 
WHERE LifeExpectancy =
(SELECT MIN(LifeExpectancy) FROM country WHERE LifeExpectancy IS NOT NULL AND LifeExpectancy !=0);#zambia

#Q19
SELECT GovernmentForm FROM COUNTRY
GROUP BY GovernmentForm
ORDER BY COUNT(GovernmentForm) DESC LIMIT 3; #republic, constiutional monarchy, federal republic

#Q20
SELECT COUNT(indepYear)
FROM country
WHERE indepyear IS NOT NULL; #192


