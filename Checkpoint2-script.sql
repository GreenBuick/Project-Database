--1 - Find Top Condition Equipment
SELECT COUNT(*)
FROM equipment
WHERE e_equipmentcondition = 'A';

--2 - Find Richest Customer
SELECT c_customerkey, c_customerbalance
FROM customers
WHERE c_customerbalance = (SELECT MAX(c_customerbalance)
                           FROM customers);

--3 - Select which mining spots have silver
SELECT l_locationname
FROM locations
WHERE l_materialname = 'Silver';

--4 - Give all information of customer 1
SELECT *
FROM customers
WHERE c_customerkey = 1;

--5 - Give contact information of customer who had the order with the most tungsten
SELECT c_customername, c_phonenumber, c_email
FROM customers, sales
WHERE c_customerkey = s_customerkey
AND s_materialname = 'Tungsten'
AND s_materialamount = (SELECT MAX(s_materialamount)
                        FROM sales
                        WHERE s_materialname = 'Tungsten');

--6 - Give service name, material name, and material price on service and market for any services that sell material at less than material market price
SELECT ser_servicekey, m_materialname, ser_serviceprice, m_materialpriceperkg
FROM services, locations, materials
WHERE ser_servicekey = l_servicekey
AND l_materialname = m_materialname
AND ser_serviceprice < m_materialpriceperkg;

--7 - Find lowest grade equipment and count of use
SELECT e_equipmentkey, COUNT(er_usedate)
FROM equipment
JOIN equipmentrecord ON e_equipmentkey = er_equipmentkey
WHERE e_equipmentcondition = 'C'
GROUP BY e_equipmentkey;

--8 - Find most used location and remaining amount of material, if equal take alphabetical
SELECT DISTINCT l_locationname, l_materialamountkg
FROM locations, sales
WHERE l_servicekey = (SELECT s_servicekey FROM (SELECT s_servicekey, COUNT(s_salenumber)
                      FROM sales
                      GROUP BY s_servicekey
                      ORDER BY COUNT(s_servicekey) DESC
                      LIMIT 1));

--9 - Find sale with most amount sold and the price
SELECT s_salenumber, s_materialname, s_materialamount, s_totalprice
FROM sales
WHERE s_materialamount = (SELECT MAX(s_materialamount) FROM sales);

--10 - Find location with most potential MAX(amount of material * price per kg)
SELECT l_locationname, l_materialamountkg * m_materialpriceperkg
FROM locations, materials
WHERE l_materialname = m_materialname
AND (l_materialamountkg * m_materialpriceperkg) = (SELECT MAX(l_materialamountkg * m_materialpriceperkg)
                                                   FROM locations, materials
                                                   WHERE l_materialname = m_materialname);

--11 - Find customer who has spent the most money
SELECT c_customername, SUM(s_totalprice)
FROM sales, customers
WHERE c_customerkey = s_customerkey
AND s_customerkey = (SELECT s_customerkey FROM (SELECT s_customerkey, SUM(s_totalprice)
                                                FROM sales
                                                GROUP BY s_customerkey
                                                ORDER BY SUM(s_totalprice) DESC
                                                LIMIT 1));

--12 - Find customer who has made the most sales
SELECT c_customername, COUNT(s_salenumber)
FROM sales, customers
WHERE c_customerkey = s_customerkey
AND s_customerkey = (SELECT s_customerkey FROM (SELECT s_customerkey, COUNT(s_salenumber)
                                                FROM sales
                                                GROUP BY s_customerkey
                                                ORDER BY COUNT(s_salenumber) DESC
                                                LIMIT 1));

--13 - Total revenue gained from customer 1
SELECT COALESCE(SUM(s_totalprice), 0)
FROM sales
WHERE s_customerkey = 1;

--14 - Customer creates new account, update customers table
INSERT INTO customers (c_customerkey, c_customername, c_customerbalance, c_address, c_phonenumber, c_email)
VALUES (6, 'Customer#000000006', 45000.87, '3459 Yellow Brick Rd', 3458760924, 'Customer6Email@gmail.com');

SELECT *
FROM customers
WHERE c_customerkey = 6;

--15 - Remove service 3, update services table
SELECT *
FROM services
WHERE ser_servicekey = 3;

DELETE FROM services
WHERE ser_servicekey = 3;

--16 - Add new service 3 to services table, update services table
INSERT INTO services(ser_servicekey, ser_servicefee, ser_serviceprice, ser_servicedescription, ser_equipmentkey)
VALUES (3, 1000.00, 29, 'Silver mining at Silver Mine with Rotary Drill', 2);

SELECT *
FROM services
WHERE ser_servicekey = 3;

--17 - Customer 2 orders 1000kg of iron from Iron Cave using service 2, update sales, equipment record, material amount in locations, total material amount in materials, customer balance

INSERT INTO sales (s_salenumber, s_totalprice, s_orderdate, s_receiptdate, s_materialname, s_materialamount, s_servicekey, s_customerkey)
VALUES (4, 1150, '2024-11-11', '2024-11-11', 'Iron', 1000, 2, 2);

INSERT INTO equipmentrecord (er_usedate, er_conditionondate, er_equipmentkey, er_servicekey)
VALUES ('2024-11-11', 'A', 1, 2);

UPDATE locations
SET l_materialamountkg = l_materialamountkg - 1000
WHERE l_servicekey = 2;

UPDATE materials
SET m_materialamountkg = m_materialamountkg - 1000
WHERE m_materialname = 'Iron';

UPDATE customers
SET c_customerbalance = c_customerbalance - 1150
WHERE c_customerkey = 2;

SELECT *
FROM sales
WHERE s_salenumber = 4;

--18 - Tungsten increases in price, increase price per kg of tungsten at all services that have it relative to shift, update price in materials table
SELECT m_materialname, m_materialpriceperkg, ser_serviceprice
FROM materials, locations, services
WHERE ser_servicekey = l_servicekey
AND l_materialname = m_materialname
AND m_materialname = 'Tungsten';

UPDATE materials
SET m_materialpriceperkg = 21.23
WHERE m_materialname = 'Tungsten';

UPDATE services
SET ser_serviceprice = ser_serviceprice * 1.1
    FROM locations
    WHERE ser_servicekey = l_servicekey
    AND l_materialname = 'Tungsten';

SELECT m_materialname, m_materialpriceperkg, ser_serviceprice
FROM materials, locations, services
WHERE ser_servicekey = l_servicekey
AND l_materialname = m_materialname
AND m_materialname = 'Tungsten';

--19 - Location runs out of material, remove from locations table
DELETE FROM locations
WHERE l_materialamountkg <= 0;

--20 - Add new location and update materials table with new / more materials
INSERT INTO locations(l_locationfee, l_locationname, l_materialname, l_materialamountkg, l_servicekey)
VALUES (1250.00, 'Tungsten Tunnel', 'Tungsten', 927856.78, 4);

SELECT *
FROM locations
WHERE l_servicekey = 4;