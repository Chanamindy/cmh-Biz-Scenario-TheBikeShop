/*
Bike
BikeId pk
CustomerFirstName varchar(30) not null not blank
CustomerLastName varchar(30) not null not blank
Address varchar(100) not null not blank
PhoneNumber char(12) not null not blank
BikeCompany varchar(20) not null not blank
Size int not null greater than zero
Color varchar(20) not null not blank
DateReceived date not null can't be after or = march 2022
DateSold date not null less than getdate
SeasonSold varchar(6) not null must be one of the 4 seasons
Used bit not null
ConditionUsed (11) not null must be one of the four conditions or blank
PurchasedPrice decimal (6,2) not null greater than zero max 3000
SoldPrice decimal (6,2) not null greater than zero max 3000
constraint DateSold must be after DateReceived
constraint either used = 0 and ConditionUsed = null or vice versa
*/