NYSE Analytics App
========================================================
author: Nik Bosnyak
date: August 20th 2014





Coursera's Developing Data Products Class

Overview
========================================================

![alt text][id]
Stock analysis tool displays time series data of NYSE companies 
[id]: capture.png


Features
========================================================

* Comprehensive Company List

* Dynamic Date Ranges

* Multiple Chart Types


Data Query
========================================================

Quantmod package queries data from Yahoo Finance API

```r
require(quantmod)
symbol <- getSymbols('GOOGL', src='yahoo')
head(GOOGL[,c(2:3,5)])
```

```
           GOOGL.High GOOGL.Low GOOGL.Volume
2007-01-03      476.7     461.1     15397500
2007-01-04      483.9     468.4     15759400
2007-01-05      487.5     478.1     13730400
2007-01-08      489.9     482.2      9499200
2007-01-09      488.2     481.2     10752000
2007-01-10      493.6     482.0     11925000
```


Visually Apealing Graphics
========================================================

![alt text][id]
[id]: chart.png

* Volume and Price
* Color Indicators
 


