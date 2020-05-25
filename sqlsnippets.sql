CREATE TABLE IF NOT EXISTS `people` (`nationalidno` CHAR(10) PRIMARY KEY, `firstname` VARCHAR_IGNORECASE, `surname` VARCHAR_IGNORECASE);

CREATE TABLE IF NOT EXISTS `calendar days` (`concat` INT(8) PRIMARY KEY, `y` SMALLINT(4), `m` TINYINT(2), `d` TINYINT(2),
CHECK (`d` <= 31), CHECK (`m` <= 12), CHECK (`y` >= 1350));

CREATE TABLE IF NOT EXISTS `carplates` (`concat` CHAR(10) PRIMARY KEY, `statecode` CHAR(2), `serial` CHAR(2), `areacode` CHAR(3), `random` CHAR(3));

CREATE TABLE IF NOT EXISTS `forms` (`no` BIGINT PRIMARY KEY,`comments` VARCHAR_IGNORECASE, `paper number` SMALLINT, `part number` SMALLINT, `submitted` VARCHAR_IGNORECASE,
`client` CHAR(10), FOREIGN KEY (`client`) REFERENCES `people`(`nationalidno`),
`date` INT(8), FOREIGN KEY (`date`) REFERENCES `calendar days`(`concat`),
`truck number` CHAR(10), FOREIGN KEY (`truck number`) REFERENCES `carplates`(`concat`));

-- to do جدا کردن این جدول کالاها و تصنعی نبودن کلید اصلی
CREATE TABLE IF NOT EXISTS `goods` (`description` VARCHAR_IGNORECASE, `qty` INT, `unit` VARCHAR_IGNORECASE, `gweight` DECIMAL(9, 3), `pweight` DECIMAL(9, 3), `nweight` DECIMAL(9, 3),
`form` BIGINT, FOREIGN KEY (`form`) REFERENCES `forms`(`no`) ON DELETE CASCADE,
PRIMARY KEY(`description`, `qty`, `unit`, `form`));

CREATE TABLE IF NOT EXISTS `received` (`origin` VARCHAR_IGNORECASE, `bill of lading number` VARCHAR_IGNORECASE,
`representative` CHAR(10), FOREIGN KEY (`representative`) REFERENCES `people`(`nationalidno`),
`form` BIGINT PRIMARY KEY, FOREIGN KEY (`form`) REFERENCES `forms`(`no`) ON DELETE CASCADE);

CREATE TABLE IF NOT EXISTS `dispatched` (`draft number` VARCHAR_IGNORECASE,
`beneficiary` CHAR(10), FOREIGN KEY (`beneficiary`) REFERENCES `people`(`nationalidno`),
`assignee` CHAR(10), FOREIGN KEY (`assignee`) REFERENCES `people`(`nationalidno`),
`draft date` INT(8), FOREIGN KEY (`draft date`) REFERENCES `calendar days`(`concat`),
`form` BIGINT PRIMARY KEY, FOREIGN KEY (`form`) REFERENCES `forms`(`no`) ON DELETE CASCADE);

CREATE TABLE IF NOT EXISTS currentform (`no` BIGINT);
INSERT INTO `currentform` (no) VALUES (0);

CREATE VIEW IF NOT EXISTS receivedreport AS
SELECT forms.no, forms.`date`, forms.client, forms.`paper number`, goods.qty, goods.unit, goods.description, goods.gweight, goods.pweight, goods.nweight
FROM (((forms JOIN goods ON forms.no = goods.form)
JOIN people ON people.nationalidno = forms.client)
JOIN received ON forms.no = received.form);

CREATE VIEW IF NOT EXISTS dispatchedreport AS
SELECT forms.no, forms.`date`, forms.client, forms.`paper number`, goods.qty, goods.unit, goods.description, goods.gweight, goods.pweight, goods.nweight
FROM (((forms JOIN goods ON forms.no = goods.form)
JOIN people ON people.nationalidno = forms.client)
JOIN dispatched ON forms.no = dispatched.form);

CREATE VIEW IF NOT EXISTS report AS
SELECT * 
FROM dispatchedreport
UNION ALL
SELECT *
FROM receivedreport
ORDER BY `date`, `paper number`, no ASC;

SELECT SUM(qty), unit, description, SUM(gweight), SUM(pweight), SUM(nweight)
FROM (SELECT * FROM dispatchedreport
WHERE `date` >= 13990129 AND `date` <= 13990131 AND description = 'ماست' AND unit = 'سطل');


SELECT SUM(qty), unit, description, SUM(gweight), SUM(pweight), SUM(nweight);
FROM (SELECT * FROM receivedreport
WHERE `date` >= 13990129 AND `date` <= 13990131)
GROUP BY description, unit
