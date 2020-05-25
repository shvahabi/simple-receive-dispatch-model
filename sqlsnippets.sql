CREATE TABLE IF NOT EXISTS `people` (`nationalidno` CHAR(10) PRIMARY KEY, `firstname` VARCHAR_IGNORECASE, `surname` VARCHAR_IGNORECASE);

CREATE TABLE IF NOT EXISTS `calendar days` (`concat` INT(8) PRIMARY KEY, `y` SMALLINT(4), `m` TINYINT(2), `d` TINYINT(2),
CHECK (`d` <= 31), CHECK (`m` <= 12), CHECK (`y` >= 1350));

CREATE TABLE IF NOT EXISTS `carplates` (`concat` CHAR(8) PRIMARY KEY, `statecode` CHAR(2), `serial` CHAR(2), `areacode` CHAR(1), `random` CHAR(3));

CREATE TABLE IF NOT EXISTS `forms` (`no` BIGINT PRIMARY KEY,`comments` VARCHAR_IGNORECASE, `paper number` SMALLINT, `part number` SMALLINT, `submitted` VARCHAR_IGNORECASE,
`client` CHAR(10), FOREIGN KEY (`client`) REFERENCES `people`(`nationalidno`),
`date` INT(8), FOREIGN KEY (`date`) REFERENCES `calendar days`(`concat`),
`truck number` CHAR(8), FOREIGN KEY (`truck number`) REFERENCES `carplates`(`concat`));

-- to do جدا کردن این جدول کالاها و تصنعی نبودن کلید اصلی
CREATE TABLE IF NOT EXISTS `goods` (`description` VARCHAR_IGNORECASE, `qty` INT, `unit` VARCHAR_IGNORECASE, `gweight` DECIMAL(9, 3), `pweight` DECIMAL(9, 3), `nweight` DECIMAL(9, 3),
`form` BIGINT, FOREIGN KEY (`form`) REFERENCES `forms`(`no`),
PRIMARY KEY(`description`, `qty`, `unit`, `form`));

CREATE TABLE IF NOT EXISTS `received` (`origin` VARCHAR_IGNORECASE, `bill of lading number` VARCHAR_IGNORECASE,
`representative` CHAR(10), FOREIGN KEY (`representative`) REFERENCES `people`(`nationalidno`),
`form` BIGINT  PRIMARY KEY, FOREIGN KEY (`form`) REFERENCES `forms`(`no`));

CREATE TABLE IF NOT EXISTS `dispatched` (`draft number` VARCHAR_IGNORECASE,
`beneficiary` CHAR(10), FOREIGN KEY (`beneficiary`) REFERENCES `people`(`nationalidno`),
`assignee`  CHAR(10), FOREIGN KEY (`assignee`) REFERENCES `people`(`nationalidno`),
`draft date` INT(8), FOREIGN KEY (`draft date`) REFERENCES `calendar days`(`concat`),
`form` BIGINT PRIMARY KEY, FOREIGN KEY (`form`) REFERENCES `forms`(`no`));
