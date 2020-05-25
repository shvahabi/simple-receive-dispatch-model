CREATE TABLE GoodsOwner(FirstName VARCHAR_IGNORECASE, SurName VARCHAR_IGNORECASE, NationalIDNo CHAR(10) PRIMARY KEY);

CREATE TABLE ReceivedGoods (FormNo INT PRIMARY KEY, ReceivedDate DATE, GoodsOwner CHAR(10), BillOfLadingNo VARCHAR_IGNORECASE, PartNo INT, Origin VARCHAR_IGNORECASE, TruckNo VARCHAR_IGNORECASE,
FOREIGN KEY (GoodsOwner) REFERENCES GoodsOwner(NationalIDNo));

CREATE TABLE ItemsList (Title VARCHAR_IGNORECASE, Quantity INT NOT NULL, Unit VARCHAR_IGNORECASE NOT NULL, GrossWeight INT, PackageWeight INT, NetWeight INT, ReceivedGoods INT,
PRIMARY KEY (Title, ReceivedGoods),
FOREIGN KEY (ReceivedGoods) REFERENCES ReceivedGoods(FormNo));

CREATE TABLE ReceivedGoodsForm(FormNo INT PRIMARY KEY, FormData JSON) 

INSERT INTO GoodsOwner (FirstName, SurName, NationalIDNo) VALUES (
 'شاهد',
 'وهابی',
 '0061234567');

INSERT INTO ReceivedGoods (FormNo, ReceivedDate, GoodsOwner, BillOfLadingNo, PartNo, Origin, TruckNo) VALUES (
 1389,
 DATE '2020-02-02',
 '0061234567',
 'GE-12-1398-S',
 5,
 'بندرعباس',
 '۱۲-ب-۲۳۴'
);

INSERT INTO ItemsList (Title, Quantity, Unit, GrossWeight, PackageWeight, NetWeight, ReceivedGoods) VALUES (
 'خامه',
 2,
 'کارتن',
 100,
 2,
 98,
 1389
);

