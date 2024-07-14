--1) I would like to know how many local customers I have as oppose to out-of-town customers.
select LocalCustomers = count(*)
from bike b
where b.City = 'spring valley'

select OutOfTownCustomers = count(*)
from bike b
where b.City <> 'spring valley'

--2) The amount of bikes sold per season to know what is my busiest season.
select SalesPerSeason = count(*), b.SeasonSold
from bike b 
group by b.SeasonSold
--3) I need a report with the average, minimum and maximum amount of time a bike was in my store before I sold it. Also show in this report my total profit so far.
select AvgDaysInStore = avg(datediff(day, b.DateReceived, b.DateSold)), MinDaysInStore = min(datediff(day, b.DateReceived, b.DateSold)), MaxDaysInStore = max(datediff(day, b.DateReceived, b.DateSold)), TotalProfit = sum(b.SoldPrice - b.PurchasedPrice)
from bike b 
--4) I need a report with the profit for each sale and show the Customers name, BikeCompany, PurchasePrice, SoldPrice, New/Used.
select ProfitPerSale = sum(b.SoldPrice - b.PurchasedPrice), b.CustomerFirstName, b.CustomerLastName, b.BikeCompany, b.PurchasedPrice, b.SoldPrice, Condition = case when b.New = 0 then 'Used' else 'New' end
from bike b
group by b.CustomerFirstName, b.CustomerLastName, b.BikeCompany, b.PurchasedPrice, b.SoldPrice, b.New
order by ProfitPerSale
--5) Which is the most popular bike company I sell.
select top 1 MostPopularCompany = count(*), b.BikeCompany
from bike b 
group by b.BikeCompany
order by MostPopularCompany desc
