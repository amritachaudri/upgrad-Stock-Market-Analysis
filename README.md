# upgrad-Stock-Market-Analysis (SQL)
### Purpose:
The purpose of this project is to determine which stocks can be bought/sold/held based on the
moving averages calculated for a period of 20 days [short term moving average] to the period
of 50 days [long term moving average].
### Summary:
Based on the data provided for 6 stocks, following has been done:

▪ Created Table bajaj1 and five similar tables containing Date, Close Price,20 Day MA,50 Day MA.

▪ Created table Master Stock, containing the date and closing price all 6 stocks.

▪ Created Table bajaj2 and five similar with the details from bajaj1, including signal (BUY, SELL, HOLD), which are calculated by Moving Average which depends on short term and long-term moving averages, the concept used is: 

➢ For 'BUY’: 20_Day_MA > 50_Day_MA and (lag(20_Day_MA,1) over (order by
Date)) < (lag(50_Day_MA,1) over (order by Date)).

➢ For 'SELL': 20_Day_MA < 50_Day_MA and (lag(20_Day_MA,1) over (order by
Date)) > (lag(50_Day_MA,1) over (order by Date)).

➢ Else the signal will be 'HOLD'
▪ Created a function which takes the input and returns the signal (BUY, SELL, HOLD).

### Inference Drawn:
It has been noted that the predictions based on the Moving Average may not always be correct. However, as per the trade signals calculated, the best predictions are:

▪ For Bajaj Auto: It shows Upward price trend in 05/2015, So the shares should be brought. And they should be sold around 01/2018.As there will a profit.

▪ Eicher Motors: It shows Upward price trend in 01/2016, So the shares should be brought. And they should be sold around 10/2017. As there will a profit.

▪ Hero MotoCorp: It shows Upward price trend in 10/2015, So the shares should be brought. And they should be sold around 10/2017 As there will a profit.

▪ Infosys: It shows downward price trend. The existing shares should be sold by 03/2015 and should be rebought around 10/2017 as they will profitable.

▪ TCS: It shows Upward price trend in 01/2017, So the shares should be brought. And they should be sold around 03/2018 As there will a profit.

▪ TVS Motors: It shows Upward price trend in 10/2015, So the shares should be brought.And they should be sold around 10/2017 As there will a profit.
