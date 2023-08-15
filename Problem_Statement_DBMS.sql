Drop database if Exists `flipkart_db`;
create database `flipkart_db`;
use flipkart_db;
CREATE TABLE IF NOT EXISTS supplier(
	SUPP_ID INT PRIMARY KEY AUTO_INCREMENT,
	SUPP_Name VARCHAR(50) NOT NULL,
	SUPP_CITY VARCHAR(50),
	SUPP_PHONE VARCHAR(10) NOT NULL
	
);
CREATE TABLE if NOT EXISTS customer(
 	CUS_ID INT AUTO_INCREMENT ,
 	CUS_NAME VARCHAR(20) NOT NULL,
 	CUS_PHONE VARCHAR(10) NULL,
 	CUS_CITY VARCHAR(30) NOT NULL,
 	CUS_GENDER CHAR,
 	PRIMARY KEY(CUS_ID) 
 );
 CREATE TABLE if NOT EXISTS category(
	CAT_ID INT AUTO_INCREMENT ,
	CAT_NAME VARCHAR(20) NOT NULL,
	PRIMARY KEY (CAT_ID) 
	);
    CREATE TABLE if NOT EXISTS product(
	PRO_ID INT AUTO_INCREMENT,
	PRO_NAME VARCHAR(20) NOT NULL DEFAULT('Dummy'),
	PRO_DESC VARCHAR(60),
	CAT_ID INT,
	PRIMARY KEY (PRO_ID),
	FOREIGN KEY(CAT_ID) REFERENCES category(CAT_ID)
);
CREATE TABLE if NOT EXISTS supplier_pricing(
	PRICING_ID INT AUTO_INCREMENT,
	PRO_ID INT,
	SUPP_ID INT,
	SUPP_PRICE INT DEFAULT 0,
	PRIMARY KEY(PRICING_ID),
	FOREIGN KEY (PRO_ID) REFERENCES product(PRO_ID),
	FOREIGN KEY (SUPP_ID) REFERENCES supplier(SUPP_ID)
);
CREATE TABLE if NOT EXISTS `order`(
	ORD_ID INT  AUTO_INCREMENT ,
	ORD_AMOUNT INT NOT NULL,
	ORD_DATE DATE NOT NULL ,
	CUS_ID INT  ,
	PRICING_ID INT  ,
	PRIMARY KEY(ORD_ID),
	FOREIGN KEY(CUS_ID) REFERENCES customer(CUS_ID),
	FOREIGN KEY(PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);
CREATE TABLE if NOT EXISTS rating(
	RAT_ID INT NOT NULL AUTO_INCREMENT ,
	ORD_ID INT NOT NULL,	 
	RAT_RATSTARS INT NOT NULL , 
	PRIMARY KEY(RAT_ID),
	FOREIGN KEY(ORD_ID) REFERENCES `order` (ORD_ID)
 );
 INSERT INTO supplier(SUPP_NAME,SUPP_CITY,SUPP_PHONE)
VALUES
	("Rajesh Retails","Delhi",'1234567890'),
	("Appario Ltd.","Mumbai",'2589631470'),
	("Knome products","Banglore",'9785462315'),
	("Bansal Retails","Kochi",'8975463285'),
	("Mittal Ltd.","Lucknow",'7898456532');
    INSERT INTO customer(CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) VALUES
("AAKASH",'9999999999',"DELHI",'M'),
("AMAN",'9785463215',"NOIDA",'M'),
("NEHA",'9999999999',"MUMBAI",'F'),
("MEGHA",'9994562399',"KOLKATA",'F'),
("PULKIT",'7895999999',"LUCKNOW",'M');
INSERT INTO category(CAT_NAME) VALUES("BOOKS");
INSERT INTO category(CAT_NAME) VALUES("GAMES");
INSERT INTO category(CAT_NAME) VALUES("GROCERIES");
INSERT INTO category(CAT_NAME) VALUES ("ELECTRONICS");
INSERT INTO category(CAT_NAME) VALUES("CLOTHES");
INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);
INSERT INTO supplier_pricing(PRO_ID,SUPP_ID,SUPP_PRICE) 
VALUES(1,2,1500),
 (3,5,30000), 
 (5,1,3000), 
 (2,3,2500),
 (4,1,1000), 
 (12,2,780),
 (12,4,789), 
 (3,1,31000), 
 (1,5,1450),
 (4,2,999), 
 (7,3,549), 
 (7,4,529), 
 (6,2,105), 
 (6,1,99),
 (2,5,2999), 
 (5,2,2999);
 INSERT INTO `ORDER`(ORD_ID,ORD_AMOUNT,ORD_DATE, CUS_ID, PRICING_ID) 
VALUES 
(101,1500,"2021-10-06",2,1), 
(102,1000,"2021-10-12",3,5), 
(103,30000,"2021-09-16",5,2), 
(104,1500,"2021-10-05",1,1), 
(105,3000,"2021-08-16",4,3), 
(106,1450,"2021-08-18",1,9),
(107,789,"2021-09-01",3,7),
(108,780,"2021-09-07",5,6), 
(109,3000,"2021-09-10",5,3), 
(110,2500,"2021-09-10",2,4), 
(111,1000,"2021-09-15",4,5), 
(112,789,"2021-09-16",4,7),
(113,31000,"2021-09-16",1,8), 
(114,1000,"2021-09-16",3,5),
(115,3000,"2021-09-16",5,3), 
(116,99,"2021-09-17",2,14);
INSERT INTO rating(ORD_ID,RAT_RATSTARS) 
VALUES
(101,4),
(102,3), 
(103,1), 
(104,2), 
(105,4), 
(106,3), 
(107,4), 
(108,4), 
(109,3), 
(110,5), 
(111,3), 
(112,4), 
(113,2), 
(114,1), 
(115,1), 
(116,0);


/* 3)Display the total number of customers based on gender who have placed orders of worth at least Rs.3000. */

SELECT count(DISTINCT customer.CUS_ID) AS NumberOfCustomers,CUS_Gender 
from customer 
inner join `order` on customer.CUS_ID = `order`.CUS_ID 
where ORD_Amount>=3000 group by CUS_Gender;

/* 4)Display all the orders along with product name ordered by a customer having Customer_Id=2 */

Select ORD_ID, ORD_Date, ORD_Amount, PRO_NAME, PRO_DESC 
from `order` inner join supplier_pricing
on `order`.PRICING_ID = supplier_pricing.PRICING_ID
inner join product on supplier_pricing.PRO_ID = product.PRO_ID where `order`.CUS_ID=2;

/* 5)Display the Supplier details who can supply more than one product. */

select supplier.SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE, count(PRO_ID) as `No.OfProduct`  
from supplier_pricing inner join supplier 
on supplier_pricing.SUPP_ID = supplier.SUPP_ID 
group by SUPP_ID having count(PRO_ID)>1;

/* Supplier details who can supply more than 3 product. */

select supplier.SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE, count(PRO_ID) as `No.OfProduct`  
from supplier_pricing inner join supplier 
on supplier_pricing.SUPP_ID = supplier.SUPP_ID 
group by SUPP_ID having count(PRO_ID)>3;


/* 6)Find the least expensive product from each category and print the table with category id, name, 
product name and price of the product. */

SELECT category.CAT_ID, category.CAT_NAME, product.PRO_NAME, supplier_pricing.SUPP_PRICE
FROM category
INNER JOIN product ON category.CAT_ID = product.CAT_ID
INNER JOIN supplier_pricing ON product.PRO_ID = supplier_pricing.PRO_ID
INNER JOIN (
    SELECT category.CAT_ID, MIN(supplier_pricing.SUPP_PRICE) AS min_price
    FROM category
    INNER JOIN product ON category.CAT_ID = product.CAT_ID
    INNER JOIN supplier_pricing ON product.PRO_ID = supplier_pricing.PRO_ID
    GROUP BY category.CAT_ID
) AS min_prices ON category.CAT_ID = min_prices.CAT_ID AND supplier_pricing.SUPP_PRICE = min_prices.min_price;


/* 7)Display the Id and Name of the Product ordered after “2021-10-05”. */

SELECT product.PRO_ID, product.PRO_NAME
FROM product
INNER JOIN supplier_pricing ON product.PRO_ID = supplier_pricing.PRO_ID
INNER JOIN `order` ON supplier_pricing.PRICING_ID = `order`.PRICING_ID
WHERE `order`.ORD_DATE > '2021-10-05';


/* 8)Display customer name and gender whose names start or end with character 'A'. */

SELECT CUS_NAME, CUS_GENDER
FROM customer
WHERE CUS_NAME LIKE 'A%' OR CUS_NAME LIKE '%A';


/* 9)Create a stored procedure to display supplier id, name, rating and Type_of_Service. 
For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, 
If rating >2 print “Average Service” else print “Poor Service”.
 */
 
 DELIMITER //

CREATE PROCEDURE GetSupplierServicesInfo()
BEGIN
    SELECT
        s.SUPP_ID,
        s.SUPP_NAME,
        avg_rating.rating AS avg_rating,
        CASE
            WHEN avg_rating.rating = 5 THEN 'Excellent Service'
            WHEN avg_rating.rating > 4 THEN 'Good Service'
            WHEN avg_rating.rating > 2 THEN 'Average Service'
            ELSE 'Poor Service'
        END AS Type_of_Service
    FROM supplier s
    LEFT JOIN (
        SELECT
            sp.SUPP_ID,
            AVG(r.RAT_RATSTARS) AS rating
        FROM supplier_pricing sp
        JOIN `order` o ON sp.PRICING_ID = o.PRICING_ID
        JOIN rating r ON o.ORD_ID = r.ORD_ID
        GROUP BY sp.SUPP_ID
    ) AS avg_rating ON s.SUPP_ID = avg_rating.SUPP_ID;
END //

DELIMITER ;

CALL GetSupplierServicesInfo();