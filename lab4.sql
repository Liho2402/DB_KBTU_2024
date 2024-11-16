create table Warehouses(
    code integer,
    location varchar(50),
    capacity integer
);
create table Packs(
    code varchar(50),
    contents varchar(50),
    value integer,
    warehouses integer
);

--4
SELECT * FROM Warehouses;

--5
SELECT * FROM Packs WHERE value > 150;

--6
SELECT DISTINCT contents FROM Packs;

--7
SELECT warehouses, COUNT(*) AS number_of_boxes
FROM Packs
GROUP BY warehouses;

--8
SELECT warehouses, COUNT(*) AS number_of_boxes
FROM Packs
GROUP BY warehouses
HAVING Packs.warehouses > 2;

--9
INSERT INTO Warehouses (code, location, capacity)
VALUES (6, 'New York', 3);

--10
INSERT INTO Packs (code, contents, value, warehouses)
VALUES ('H5RT', 'Papers', 200, 2);

--11
UPDATE Packs
SET value = value * 0.85
WHERE code IN (
    SELECT code FROM Packs
    ORDER BY value DESC
    LIMIT 1 OFFSET 2
);

--12
DELETE FROM Packs
WHERE value < 150;

--13
DELETE FROM Packs
WHERE warehouses IN (
    SELECT code FROM Warehouses WHERE location = 'New York'
)
RETURNING *;