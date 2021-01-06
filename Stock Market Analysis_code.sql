-- Creating assignment schemas.
create schema assignment;
-- creating tables for
-- bajaj_auto, eicher motors, hero motocorp, infosys, tcs and tvs motors.
create table Bajaj_Auto (
  `Date` date,
  `Open_Price` decimal(10,2),
  `High_Price` decimal(10,2),
  `Low_Price` decimal(10,2),
  `Close_Price` decimal(10,2),
  `WAP` decimal(10,2),
  `No_of_Shares` bigint,
  `No_of_Trades` bigint,
  `Total_Turnover` bigint,
  `Deliverable_Quantity` bigint,
  `Percent_Deli_Qty_to_Traded_Qty` decimal(4,2),
  `Spread_High_Low` decimal(10,2),
  `Spread_Close_Open` decimal(10,2)
);
-- Creating other tables.
create table Eicher_Motors like Bajaj_Auto;
create table Hero_Motocorp like Bajaj_Auto;
create table Infosys like Bajaj_Auto;
create table TCS like Bajaj_Auto;
create table TVS_Motors like Bajaj_Auto;

-- Inserting data into the above tables.
load data infile 'C:\Users\Amrita Chaudri\Documents\sql project\Bajaj Auto.csv' 
into table Bajaj_Auto 
fields terminated by "," 
lines terminated by "\n"
ignore 1 rows
(@Date, Open_Price, High_Price, Low_Price, Close_Price, WAP, No_of_Shares, No_of_Trades, 
  Total_Turnover, @Deliverable_Quantity, @Percent_Deli_Qty_to_Traded_Qty, Spread_High_Low, 
  Spread_Close_Open)
set
 Date = str_to_date(@Date, '%d-%M-%Y'),
 Deliverable_Quantity = nullif(@Deliverable_Quantity,''),
 Percent_Deli_Qty_to_Traded_Qty = nullif(@Percent_Deli_Qty_to_Traded_Qty,'');
  
load data infile 'C:\Users\Amrita Chaudri\Documents\sql project\Eicher Motors.csv' 
into table Eicher_Motors 
fields terminated by "," 
lines terminated by "\n"
ignore 1 rows
(@Date, Open_Price, High_Price, Low_Price, Close_Price, WAP, No_of_Shares, No_of_Trades, 
  Total_Turnover, @Deliverable_Quantity, @Percent_Deli_Qty_to_Traded_Qty, Spread_High_Low, 
  Spread_Close_Open)
set
 Date = str_to_date(@Date, '%d-%M-%Y'),
 Deliverable_Quantity = nullif(@Deliverable_Quantity,''),
 Percent_Deli_Qty_to_Traded_Qty = nullif(@Percent_Deli_Qty_to_Traded_Qty,'');
 
load data infile 'C:\Users\Amrita Chaudri\Documents\sql project\Hero Motocorp.csv' 
into table Hero_Motocorp 
fields terminated by "," 
lines terminated by "\n"
ignore 1 rows
(@Date, Open_Price, High_Price, Low_Price, Close_Price, WAP, No_of_Shares, No_of_Trades, 
  Total_Turnover, @Deliverable_Quantity, @Percent_Deli_Qty_to_Traded_Qty, Spread_High_Low, 
  Spread_Close_Open)
set
 Date = str_to_date(@Date, '%d-%M-%Y'),
 Deliverable_Quantity = nullif(@Deliverable_Quantity,''),
 Percent_Deli_Qty_to_Traded_Qty = nullif(@Percent_Deli_Qty_to_Traded_Qty,'');
 
load data infile 'C:\Users\Amrita Chaudri\Documents\sql project\Infosys.csv' 
into table Infosys 
fields terminated by "," 
lines terminated by "\n"
ignore 1 rows
(@Date, Open_Price, High_Price, Low_Price, Close_Price, WAP, No_of_Shares, No_of_Trades, 
  Total_Turnover, @Deliverable_Quantity, @Percent_Deli_Qty_to_Traded_Qty, Spread_High_Low, 
  Spread_Close_Open)
set
 Date = str_to_date(@Date, '%d-%M-%Y'),
 Deliverable_Quantity = nullif(@Deliverable_Quantity,''),
 Percent_Deli_Qty_to_Traded_Qty = nullif(@Percent_Deli_Qty_to_Traded_Qty,'');
 
load data infile 'C:\Users\Amrita Chaudri\Documents\sql project\TCS.csv' 
into table TCS
fields terminated by "," 
lines terminated by "\n"
ignore 1 rows
(@Date, Open_Price, High_Price, Low_Price, Close_Price, WAP, No_of_Shares, No_of_Trades, 
  Total_Turnover, @Deliverable_Quantity, @Percent_Deli_Qty_to_Traded_Qty, Spread_High_Low, 
  Spread_Close_Open)
set
 Date = str_to_date(@Date, '%d-%M-%Y'),
 Deliverable_Quantity = nullif(@Deliverable_Quantity,''),
 Percent_Deli_Qty_to_Traded_Qty = nullif(@Percent_Deli_Qty_to_Traded_Qty,'');
 
load data infile 'C:\Users\Amrita Chaudri\Documents\sql project\TVS Motors.csv' 
into table TVS_Motors 
fields terminated by "," 
lines terminated by "\n"
ignore 1 rows
(@Date, Open_Price, High_Price, Low_Price, Close_Price, WAP, No_of_Shares, No_of_Trades, 
  Total_Turnover, @Deliverable_Quantity, @Percent_Deli_Qty_to_Traded_Qty, Spread_High_Low, 
  Spread_Close_Open)
set
 Date = str_to_date(@Date, '%d-%M-%Y'),
 Deliverable_Quantity = nullif(@Deliverable_Quantity,''),
 Percent_Deli_Qty_to_Traded_Qty = nullif(@Percent_Deli_Qty_to_Traded_Qty,'');

-- Counting number of rows for each table
select count(*) from Bajaj_Auto;
select count(*) from Eicher_Motors;
select count(*) from Hero_Motocorp;
select count(*) from Infosys;
select count(*) from TCS;
select count(*) from TVS_Motors;


-- RESULT 1:Creating a new table named 'bajaj1' containing the date, close price, 20 Day MA and 50 Day MA.(This is done for all 6 stocks)
create table Bajaj1 (
	`Date` date,
	`Close_Price` decimal(10,2),
    `20_Day_MA` decimal(10,2),
    `50_Day_MA` decimal(10,2)  
);
create table Eicher1 like Bajaj1;
create table Hero1 like Bajaj1;	
create table Infosys1 like Bajaj1;
create table TCS1 like Bajaj1;
create table TVS1 like Bajaj1;	

-- Inserting values into the above tables
insert into Bajaj1 (Date, Close_Price, 20_Day_MA, 50_Day_MA)
	select Date, Close_Price,
       avg(Close_Price) over (order by Date asc rows 19 preceding) as MA20,
       avg(Close_Price) over (order by Date asc rows 49 preceding) as MA50
	from Bajaj_Auto
	order by Date;

insert into Eicher1 (Date, Close_Price, 20_Day_MA, 50_Day_MA)
	select Date, Close_Price,
       avg(Close_Price) over (order by Date asc rows 19 preceding) as MA20,
       avg(Close_Price) over (order by Date asc rows 49 preceding) as MA50
	from eicher_motors
	order by Date;
    
insert into Hero1 (Date, Close_Price, 20_Day_MA, 50_Day_MA)
	select Date, Close_Price,
       avg(Close_Price) over (order by Date asc rows 19 preceding) as MA20,
       avg(Close_Price) over (order by Date asc rows 49 preceding) as MA50
	from Hero_Motocorp
	order by Date;
    
insert into Infosys1 (Date, Close_Price, 20_Day_MA, 50_Day_MA)
	select Date, Close_Price,
       avg(Close_Price) over (order by Date asc rows 19 preceding) as MA20,
       avg(Close_Price) over (order by Date asc rows 49 preceding) as MA50
	from Infosys
	order by Date;
    
insert into TCS1 (Date, Close_Price, 20_Day_MA, 50_Day_MA)
	select Date, Close_Price,
       avg(Close_Price) over (order by Date asc rows 19 preceding) as MA20,
       avg(Close_Price) over (order by Date asc rows 49 preceding) as MA50
	from TCS
	order by Date;
        
insert into TVS1 (Date, Close_Price, 20_Day_MA, 50_Day_MA)
	select Date, Close_Price,
       avg(Close_Price) over (order by Date asc rows 19 preceding) as MA20,
       avg(Close_Price) over (order by Date asc rows 49 preceding) as MA50
	from TVS_Motors
	order by Date;
  
-- Viewing the values inserted 

select * from Bajaj1;
select * from Eicher1;
select * from Hero1;
select * from Infosys1;
select * from TCS1;
select * from TVS1;

-- RESULT 2: Creating a master table containing the date and close price of all the six stocks.
create table Master_Stocks (
	`Date` date,
	`Bajaj` decimal(10,2),
    `TCS` decimal(10,2),
    `TVS` decimal(10,2),
    `Infosys` decimal(10,2),
    `Eicher` decimal(10,2),
    `Hero` decimal(10,2)  
);

-- inserting  values into master stocks table

insert into Master_Stocks (Date, Bajaj, TCS, TVS, Infosys, Eicher, Hero) 
	select Bajaj_Auto.date, Bajaj_Auto.Close_Price, TCS.Close_Price, TVS_Motors.Close_Price, Infosys.Close_Price, 
		   Eicher_Motors.Close_Price, Hero_Motocorp.Close_Price	   	   
	from  Bajaj_Auto
   	inner join TCS on Bajaj_Auto.Date = TCS.Date
	inner join TVS_Motors on Bajaj_Auto.Date = TVS_Motors.Date
	inner join Infosys on Bajaj_Auto.Date = Infosys.Date
	inner join Eicher_Motors on Bajaj_Auto.Date = Eicher_Motors.Date
	inner join Hero_Motocorp on Bajaj_Auto.Date = Hero_Motocorp.Date
	order by Date;

-- Viewing  the Master_Stocks table
select * from master_stocks;

-- RESULT 3: Using the table created in RESULT(1) to generate buy and sell signal. Store this in another table named 'bajaj2'.

create table Bajaj2 (
	`Date` date,
	`Close_Price` decimal(10,2),
    `Signal` varchar(15)
);
create table Eicher2 like Bajaj2;
create table Hero2 like Bajaj2;
create table Infosys2 like Bajaj2;
create table TCS2 like Bajaj2;
create table TVS2 like Bajaj2;

-- Inserting data into tables Bajaj2, Eicher2, Hero2, Infosys2, TCS2, TVS2
-- Setting the first 49 rows signal as 'Not Applicable' in all the tables,as they need to be ignored, becuase from the 50th row onwards 50_Day_MA are valid and the signals starts from here.

insert into Bajaj2 (Date,Close_Price,`signal`) 
	select Date, Close_Price,		
		case
			when row_number() over(order by Date) < 50 
				then 'Not Applicable'
			when 20_Day_MA > 50_Day_MA and (lag(20_Day_MA,1) over (order by Date)) < (lag(50_Day_MA,1) over (order by Date)) 
				then 'BUY'
			when 20_Day_MA < 50_Day_MA and (lag(20_Day_MA,1) over (order by Date)) > (lag(50_Day_MA,1) over (order by Date))
				then 'SELL'
			else 'HOLD'	
		end	
	from  Bajaj1
   	order by Date; 
    

insert into Eicher2 (Date,Close_Price,`signal`) 
	select Date, Close_Price,
		case
			when row_number() over(order by Date) < 50 
				then 'Not Applicable'
			when 20_Day_MA > 50_Day_MA and (lag(20_Day_MA,1) over (order by Date)) < (lag(50_Day_MA,1) over (order by Date)) 
				then 'BUY'
			when 20_Day_MA < 50_Day_MA and (lag(20_Day_MA,1) over (order by Date)) > (lag(50_Day_MA,1) over (order by Date))
				then 'SELL'
			else 'HOLD'	
		end	
	from  Eicher1
   	order by Date;
    
insert into Hero2 (Date,Close_Price,`signal`) 
	select Date, Close_Price,
		case
			when row_number() over(order by Date) < 50 
				then 'Not Applicable'
			when 20_Day_MA > 50_Day_MA and (lag(20_Day_MA,1) over (order by date)) < (lag(50_Day_MA,1) over (order by Date)) 
				then 'BUY'
			when 20_Day_MA < 50_Day_MA and (lag(20_Day_MA,1) over (order by Date)) > (lag(50_Day_MA,1) over (order by Date))
				then 'SELL'
			else 'HOLD'	
		end	
	from  Hero1
   	order by Date;
       
insert into Infosys2 (Date,Close_Price,`signal`) 
	select Date, Close_Price,
		case
			when row_number() over(order by Date) < 50 
				then 'Not Applicable'
			when 20_Day_MA > 50_Day_MA and (lag(20_Day_MA,1) over (order by date)) < (lag(50_Day_MA,1) over (order by Date)) 
				then 'BUY'
			when 20_Day_MA < 50_Day_MA and (lag(20_Day_MA,1) over (order by Date)) > (lag(50_Day_MA,1) over (order by Date))
				then 'SELL'
			else 'HOLD'	
		end	
	from  Infosys1
   	order by Date;
    
insert into TCS2 (Date,Close_Price,`signal`) 
	select Date, Close_Price,
		case
			when row_number() over(order by Date) < 50 
				then 'Not Applicable'
			when 20_Day_MA > 50_Day_MA and (lag(20_Day_MA,1) over (order by date)) < (lag(50_Day_MA,1) over (order by Date)) 
				then 'BUY'
			when 20_Day_MA < 50_Day_MA and (lag(20_Day_MA,1) over (order by Date)) > (lag(50_Day_MA,1) over (order by Date))
				then 'SELL'
			else 'HOLD'	
		end	
	from  TCS1
   	order by Date;
    
    
insert into TVS2 (Date,Close_Price,`signal`) 
	select Date, Close_Price,
		case
			when row_number() over(order by Date) < 50 
				then 'Not Applicable'
			when 20_Day_MA > 50_Day_MA and (lag(20_Day_MA,1) over (order by date)) < (lag(50_Day_MA,1) over (order by Date)) 
				then 'BUY'
			when 20_Day_MA < 50_Day_MA and (lag(20_Day_MA,1) over (order by Date)) > (lag(50_Day_MA,1) over (order by Date))
				then 'SELL'
			else 'HOLD'	
		end	
	from  TVS1
   	order by Date;
    
-- Viewing all the tables 
select * from Bajaj2;
select * from Eicher2;
select * from Hero2;
select * from Infosys2;
select * from TCS2;
select * from TVS2;

-- RESULT 4: Creating a User defined function, that takes the date as input and returns the signal for that particular day (Buy/Sell/Hold) 
-- for the Bajaj stock.
drop function if exists getTradeSignals;
delimiter $$

create function getTradeSignals(input_date Date) 
  returns varchar(15) 
  deterministic
begin   
  declare output_trade_signal varchar(15);
  select Bajaj2.signal into output_trade_signal from Bajaj2 
  where Date = input_date;
  return output_trade_signal ;
  end
$$ delimiter ;
-- Calling the function
select getTradeSignals('2015-01-25') as trade_signal;
-- Checking the results 
-- For Bajaj
select Date, Close_Price
from Bajaj2
where `signal` = 'BUY'
order by Close_Price
limit 1;

select Date, Close_Price
from Bajaj2
where `signal` = 'SELL'
order by close_price desc
limit 1;

-- For Eicher
select Date, Close_Price
from Eicher2
where `signal` = 'BUY'
order by Close_Price
limit 1;

select date, Close_Price
from Eicher2
where `signal` = 'SELL'
order by Close_Price desc
limit 1;

-- For Hero
select Date, Close_Price
from Hero2
where `signal` = 'BUY'
order by Close_Price
limit 1;

select date, Close_Price
from Hero2
where `signal` = 'SELL'
order by Close_Price desc
limit 1;

-- For Infosys 
select Date, Close_Price
from Infosys2
where `signal` = 'BUY'
order by Close_Price
limit 1;

select date, Close_Price
from Infosys2
where `signal` = 'SELL'
order by Close_Price desc
limit 1;

-- For TCS 
select Date, Close_Price
from TCS2
where `signal` = 'BUY'
order by Close_Price
limit 1;

select Date, Close_Price
from TCS2
where `signal` = 'SELL'
order by Close_Price desc
limit 1;

-- For TVS 
select Date, Close_Price
from TVS2
where `signal` = 'BUY'
order by Close_Price
limit 1;

select Date, Close_Price
from TVS2
where `signal` = 'SELL'
order by Close_Price desc
limit 1;
