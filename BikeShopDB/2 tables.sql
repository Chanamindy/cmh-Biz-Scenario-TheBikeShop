use BikeShopDB
go

drop table if exists Bike 
go

create table dbo.Bike(
    BikeId int not null identity primary key,
    CustomerFirstName varchar(30) not null constraint ck_Bike_CustomerFirstName_cannot_be_blank check(CustomerFirstName <> ''),
    CustomerLastName varchar(30) not null constraint ck_Bike_CustomerLastName_cannot_be_blank check(CustomerLastName <> ''),
    Address varchar(50) not null constraint ck_Bike_Address_cannot_be_blank check(Address <> ''),
    City varchar(20) not null constraint ck_Bike_City_cannot_be_blank check(City <> ''),
    State char(2) not null constraint ck_Bike_State_cannot_be_blank check(State <> ''),
    Zip char(5) not null constraint ck_Bike_Zip_must_all_be_numbers check(Zip like '[0-9][0-9][0-9][0-9][0-9]'),
    PhoneNumber char(12) not null constraint ck_Bike_PhoneNumber_cannot_be_blank check(PhoneNumber <> ''),
    BikeCompany varchar(20) not null constraint ck_Bike_BikeCompany_cannot_be_blank check(BikeCompany <> ''),
    Size int not null constraint ck_Bike_Size_must_be_greater_than_zero check(Size > 0),
    Color varchar(20) not null constraint ck_Bike_Color_cannot_be_blank check(Color <> ''),
    DateReceived date not null constraint ck_Bike_DateReceived_must_be_after_march_2022 check(datefromparts(2022, 3, 1) < DateReceived),
    DateSold date not null constraint ck_Bike_DateSold_must_be_before_or_equal_to_the_current_date check(DateSold <= getdate()),
    SeasonSold varchar(6) not null constraint ck_Bike_SeasonSold_must_be_winter_spring_summer_or_fall check(SeasonSold in('winter', 'spring', 'summer', 'fall')),
    New bit not null,
    ConditionUsed varchar(11) null constraint ck_Bike_ConditionUsed_must_be_Perfect_MinorFixup_MajorFixup_Restoration_or_blank check(ConditionUsed in ('Perfect', 'Minor Fixup','Major Fixup', 'Restoration')),
    PurchasedPrice decimal(6,2) not null constraint ck_Bike_PurchasedPrice_between_1_and_3000 check (PurchasedPrice between 1 and 3000),
    SoldPrice decimal (6,2) not null constraint ck_Bike_SoldPrice_between_1_and_3000 check(SoldPrice between 1 and 3000),
    constraint ck_Bike_DateSold_must_be_after_or_the_same_as_DateReceived check(DateSold >= DateReceived),
    constraint ck_Bike_is_used_and_ConditionUsed_is_not_null_or_bike_is_not_used_and_ConditionUsed_is_null check((new = 0 and ConditionUsed is not null) or (new = 1 and ConditionUsed is null))
)
go