
R version 3.0.3 (2014-03-06) -- "Warm Puppy"
Copyright (C) 2014 The R Foundation for Statistical Computing
Platform: i386-w64-mingw32/i386 (32-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> library(ggplot2)
> library(ggmap)
> library(maps)
> WHO = read.csv("WHO.csv")
> 
> ggplot(WHO, aes(x = FertilityRate, y = Under15)) + geom_point(color=WHO$Region)
Error: invalid color name 'Eastern Mediterranean'
In addition: Warning message:
Removed 11 rows containing missing values (geom_point). 
> ggplot(WHO, aes(x = FertilityRate, y = Under15)) + geom_point(color=Region)
Error in do.call("layer", list(mapping = mapping, data = data, stat = stat,  : 
  object 'Region' not found
> str(WHO)
'data.frame':   194 obs. of  13 variables:
 $ Country                      : Factor w/ 194 levels "Afghanistan",..: 1 2 3 4 5 6 7 8 9 10 ...
 $ Region                       : Factor w/ 6 levels "Africa","Americas",..: 3 4 1 4 1 2 2 4 6 4 ...
 $ Population                   : int  29825 3162 38482 78 20821 89 41087 2969 23050 8464 ...
 $ Under15                      : num  47.4 21.3 27.4 15.2 47.6 ...
 $ Over60                       : num  3.82 14.93 7.17 22.86 3.84 ...
 $ FertilityRate                : num  5.4 1.75 2.83 NA 6.1 2.12 2.2 1.74 1.89 1.44 ...
 $ LifeExpectancy               : int  60 74 73 82 51 75 76 71 82 81 ...
 $ ChildMortality               : num  98.5 16.7 20 3.2 163.5 ...
 $ CellularSubscribers          : num  54.3 96.4 99 75.5 48.4 ...
 $ LiteracyRate                 : num  NA NA NA NA 70.1 99 97.8 99.6 NA NA ...
 $ GNI                          : num  1140 8820 8310 NA 5230 ...
 $ PrimarySchoolEnrollmentMale  : num  NA NA 98.2 78.4 93.1 91.1 NA NA 96.9 NA ...
 $ PrimarySchoolEnrollmentFemale: num  NA NA 96.4 79.4 78.2 84.5 NA NA 97.5 NA ...
> ggplot(WHO, aes(x = FertilityRate, y = Under15),color=WHO$Region) + geom_point()
Warning message:
Removed 11 rows containing missing values (geom_point). 
> ggplot(WHO, aes(x = FertilityRate, y = Under15,color=Region)) + geom_point()
Warning message:
Removed 11 rows containing missing values (geom_point). 
> statesMap = map_data("state")
> str(statesMap)
'data.frame':   15537 obs. of  6 variables:
 $ long     : num  -87.5 -87.5 -87.5 -87.5 -87.6 ...
 $ lat      : num  30.4 30.4 30.4 30.3 30.3 ...
 $ group    : num  1 1 1 1 1 1 1 1 1 1 ...
 $ order    : int  1 2 3 4 5 6 7 8 9 10 ...
 $ region   : chr  "alabama" "alabama" "alabama" "alabama" ...
 $ subregion: chr  NA NA NA NA ...
> str(statesMap$group)
 num [1:15537] 1 1 1 1 1 1 1 1 1 1 ...
> table(statesMap$group)

   1    2    3    4    5    6    7    8    9   10   11   12   13   14   15   16 
 202  149  312  516   79   91   94   10  872  381  233  329  257  256  113  397 
  17   18   19   20   21   22   23   24   25   26   27   28   29   30   31   32 
 650  399  566   36  220   30  460  370  373  382  315  238  208   70  125  205 
  33   34   35   36   37   38   39   40   41   42   43   44   45   46   47   48 
  78   16  290   21  168   37  733   12  105  238  284  236  172   66  304  166 
  49   50   51   52   53   54   55   56   57   58   59   60   61   62   63 
 289 1088   59  129   96   15  623   17   17   19   44  448  373  388   68 
> ggplot(statesMap, aes(x = long, y = lat, group = group)) + geom_polygon(fill = "white", color = "black") + coord_map("mercator")
> polling=read.csv("PollingImputed.csv")
> str(polling)
'data.frame':   145 obs. of  7 variables:
 $ State     : Factor w/ 50 levels "Alabama","Alaska",..: 1 1 2 2 3 3 3 4 4 4 ...
 $ Year      : int  2004 2008 2004 2008 2004 2008 2012 2004 2008 2012 ...
 $ Rasmussen : int  11 21 19 16 5 5 8 7 10 13 ...
 $ SurveyUSA : int  18 25 21 18 15 3 5 5 7 21 ...
 $ DiffCount : int  5 5 1 6 8 9 4 8 5 2 ...
 $ PropR     : num  1 1 1 1 1 ...
 $ Republican: int  1 1 1 1 1 1 1 1 1 1 ...
> pollTrain=subset(polling,polling$Year==2004&polling$Year==2008)
> table(polling$Year)

2004 2008 2012 
  50   50   45 
> table(pollTrain$Year)
< table of extent 0 >
> pollTrain=subset(polling,polling$Year==2004&&polling$Year==2008)
> table(pollTrain$Year)
< table of extent 0 >
> str(pollTrain)
'data.frame':   0 obs. of  7 variables:
 $ State     : Factor w/ 50 levels "Alabama","Alaska",..: 
 $ Year      : int 
 $ Rasmussen : int 
 $ SurveyUSA : int 
 $ DiffCount : int 
 $ PropR     : num 
 $ Republican: int 
> pollTrain=subset(polling,polling$Year=2004&&polling$Year=2008)
Error: unexpected '=' in "pollTrain=subset(polling,polling$Year="
> pollTrain=subset(polling,polling$Year==2004||polling$Year=2008)
Error: unexpected '=' in "pollTrain=subset(polling,polling$Year==2004||polling$Year="
> pollTrain=subset(polling,polling$Year==2004||polling$Year==2008)
> table(pollTrain$Year)

2004 2008 2012 
  50   50   45 
> pollTrain=subset(polling,polling$Year==2004||polling$Year==2008&&polling$Year!=2012)
> table(pollTrain$Year)

2004 2008 2012 
  50   50   45 
> pollTrain=subset(polling,polling$Year>=2004&&polling$Year<=2008)
> table(pollTrain$Year)

2004 2008 2012 
  50   50   45 
> str(pollTrain)
'data.frame':   145 obs. of  7 variables:
 $ State     : Factor w/ 50 levels "Alabama","Alaska",..: 1 1 2 2 3 3 3 4 4 4 ...
 $ Year      : int  2004 2008 2004 2008 2004 2008 2012 2004 2008 2012 ...
 $ Rasmussen : int  11 21 19 16 5 5 8 7 10 13 ...
 $ SurveyUSA : int  18 25 21 18 15 3 5 5 7 21 ...
 $ DiffCount : int  5 5 1 6 8 9 4 8 5 2 ...
 $ PropR     : num  1 1 1 1 1 ...
 $ Republican: int  1 1 1 1 1 1 1 1 1 1 ...
> pollTest=subset(polling,polling$Year==2012)
> str(pollTest)
'data.frame':   45 obs. of  7 variables:
 $ State     : Factor w/ 50 levels "Alabama","Alaska",..: 3 4 5 6 7 9 10 11 12 13 ...
 $ Year      : int  2012 2012 2012 2012 2012 2012 2012 2012 2012 2012 ...
 $ Rasmussen : int  8 13 -12 3 -7 2 5 -22 31 -22 ...
 $ SurveyUSA : int  5 21 -14 -2 -13 0 8 -24 24 -16 ...
 $ DiffCount : int  4 2 -6 -5 -8 6 4 -2 1 -5 ...
 $ PropR     : num  0.833 1 0 0.308 0 ...
 $ Republican: int  1 1 0 0 0 0 1 0 1 0 ...
> table(pollTest$Year)

2012 
  45 
> pollTrain=subset(polling,polling$Year==2004 | polling$Year==2008)
> str(pollTrain)
'data.frame':   100 obs. of  7 variables:
 $ State     : Factor w/ 50 levels "Alabama","Alaska",..: 1 1 2 2 3 3 4 4 5 5 ...
 $ Year      : int  2004 2008 2004 2008 2004 2008 2004 2008 2004 2008 ...
 $ Rasmussen : int  11 21 19 16 5 5 7 10 -11 -27 ...
 $ SurveyUSA : int  18 25 21 18 15 3 5 7 -11 -24 ...
 $ DiffCount : int  5 5 1 6 8 9 8 5 -8 -5 ...
 $ PropR     : num  1 1 1 1 1 1 1 1 0 0 ...
 $ Republican: int  1 1 1 1 1 1 1 1 0 0 ...
> table(pollTrain)
Error: cannot allocate vector of size 662.0 Mb
> table(pollTrain$Year)

2004 2008 
  50   50 
> mod2 = glm(Republican~SurveyUSA+DiffCount, data=pollTrain, family="binomial")
> TestPrediction = predict(mod2, newdata=pollTest, type="response")
> TestPredictionBinary = as.numeric(TestPrediction > 0.5)
> predictionDataFrame = data.frame(TestPrediction, TestPredictionBinary, Test$State)
Error in data.frame(TestPrediction, TestPredictionBinary, Test$State) : 
  object 'Test' not found
> predictionDataFrame = data.frame(TestPrediction, TestPredictionBinary, pollTest$State)
> table(TestPredictionBinary)
TestPredictionBinary
 0  1 
23 22 
> avg(TestPrediction)
Error: could not find function "avg"
> mean(TestPrediction)
[1] 0.4852626
> predictionDataFrame$region = tolower(predictionDataFrame$Test.State)
Error in `$<-.data.frame`(`*tmp*`, "region", value = character(0)) : 
  replacement has 0 rows, data has 45
> predictionDataFrame$region = tolower(predictionDataFrame$pollTest.State)
> str(predictionDataFrame)
'data.frame':   45 obs. of  4 variables:
 $ TestPrediction      : num  9.74e-01 9.99e-01 9.26e-05 9.43e-03 3.43e-05 ...
 $ TestPredictionBinary: num  1 1 0 0 0 1 1 0 1 0 ...
 $ pollTest.State      : Factor w/ 50 levels "Alabama","Alaska",..: 3 4 5 6 7 9 10 11 12 13 ...
 $ region              : chr  "arizona" "arkansas" "california" "colorado" ...
> predictionMap = merge(statesMap, predictionDataFrame, by = "region")
> predictionMap = predictionMap[order(predictionMap$order),]
> str(predictionMap)
'data.frame':   15034 obs. of  9 variables:
 $ region              : chr  "arizona" "arizona" "arizona" "arizona" ...
 $ long                : num  -115 -115 -115 -115 -115 ...
 $ lat                 : num  35 35.1 35.1 35.2 35.2 ...
 $ group               : num  2 2 2 2 2 2 2 2 2 2 ...
 $ order               : int  204 205 206 207 208 209 210 211 212 213 ...
 $ subregion           : chr  NA NA NA NA ...
 $ TestPrediction      : num  0.974 0.974 0.974 0.974 0.974 ...
 $ TestPredictionBinary: num  1 1 1 1 1 1 1 1 1 1 ...
 $ pollTest.State      : Factor w/ 50 levels "Alabama","Alaska",..: 3 3 3 3 3 3 3 3 3 3 ...
> str(statesMap)
'data.frame':   15537 obs. of  6 variables:
 $ long     : num  -87.5 -87.5 -87.5 -87.5 -87.6 ...
 $ lat      : num  30.4 30.4 30.4 30.3 30.3 ...
 $ group    : num  1 1 1 1 1 1 1 1 1 1 ...
 $ order    : int  1 2 3 4 5 6 7 8 9 10 ...
 $ region   : chr  "alabama" "alabama" "alabama" "alabama" ...
 $ subregion: chr  NA NA NA NA ...
> ggplot(predictionMap, aes(x = long, y = lat, group = group, fill = TestPredictionBinary)) + geom_polygon(color = "black")
> ggplot(predictionMap, aes(x = long, y = lat, group = group, fill = TestPredictionBinary))+ geom_polygon(color = "black") + scale_fill_gradient(low = "blue", high = "red", guide = "legend", breaks= c(0,1), labels = c("Democrat", "Republican"), name = "Prediction 2012")
> ggplot(predictionMap, aes(x = long, y = lat, group = group, fill = TestPrediction))+ geom_polygon(color = "black") + scale_fill_gradient(low = "blue", high = "red", guide = "legend", breaks= c(0,1), labels = c("Democrat", "Republican"), name = "Prediction 2012")
> ggplot(predictionMap, aes(x = long, y = lat, group = group, fill = TestPrediction))+ geom_polygon(color = "black") + scale_fill_gradient(low = "blue", high = "red", guide = "legend", name = "Prediction 2012")
> ggplot(predictionMap, aes(x = long, y = lat, group = group, fill = TestPredictionBinary))+ geom_polygon(color = "black") + scale_fill_gradient(low = "blue", high = "red", guide = "legend", breaks= c(0,1), labels = c("Democrat", "Republican"), name = "Prediction 2012")
> table(predictonMap$region,preictionMap$TestPrediction)
Error in table(predictonMap$region, preictionMap$TestPrediction) : 
  object 'predictonMap' not found
> table(predictonMap$region,predictionMap$TestPrediction)
Error in table(predictonMap$region, predictionMap$TestPrediction) : 
  object 'predictonMap' not found
> table(predictionMap$region,predictionMap$TestPrediction)
                
                 1.23697003202363e-07 1.25446252676014e-06 2.42965003739427e-06
  arizona                           0                    0                    0
  arkansas                          0                    0                    0
  california                        0                    0                    0
  colorado                          0                    0                    0
  connecticut                       0                    0                    0
  florida                           0                    0                    0
  georgia                           0                    0                    0
  idaho                             0                    0                    0
  illinois                          0                    0                    0
  indiana                           0                    0                    0
  iowa                              0                    0                    0
  kansas                            0                    0                    0
  kentucky                          0                    0                    0
  louisiana                         0                    0                    0
  maine                             0                    0                    0
  maryland                          0                    0                    0
  massachusetts                   286                    0                    0
  michigan                          0                    0                    0
  minnesota                         0                    0                    0
  mississippi                       0                    0                    0
  missouri                          0                    0                    0
  montana                           0                    0                    0
  nebraska                          0                    0                    0
  nevada                            0                    0                    0
  new hampshire                     0                    0                    0
  new jersey                        0                    0                    0
  new mexico                        0                    0                    0
  new york                          0                  495                    0
  north carolina                    0                    0                    0
  north dakota                      0                    0                    0
  ohio                              0                    0                  238
  oklahoma                          0                    0                    0
  oregon                            0                    0                    0
  pennsylvania                      0                    0                    0
  rhode island                      0                    0                    0
  south carolina                    0                    0                    0
  south dakota                      0                    0                    0
  tennessee                         0                    0                    0
  texas                             0                    0                    0
  utah                              0                    0                    0
  virginia                          0                    0                    0
  washington                        0                    0                    0
  west virginia                     0                    0                    0
  wisconsin                         0                    0                    0
                
                 2.43174763250482e-06 1.27154899595145e-05 1.77016906360532e-05
  arizona                           0                    0                    0
  arkansas                          0                    0                    0
  california                        0                    0                    0
  colorado                          0                    0                    0
  connecticut                       0                    0                    0
  florida                           0                    0                    0
  georgia                           0                    0                    0
  idaho                             0                    0                    0
  illinois                          0                    0                    0
  indiana                           0                    0                    0
  iowa                              0                    0                    0
  kansas                            0                    0                    0
  kentucky                          0                    0                    0
  louisiana                         0                    0                    0
  maine                             0                    0                    0
  maryland                        566                    0                    0
  massachusetts                     0                    0                    0
  michigan                          0                    0                  830
  minnesota                         0                    0                    0
  mississippi                       0                    0                    0
  missouri                          0                    0                    0
  montana                           0                    0                    0
  nebraska                          0                    0                    0
  nevada                            0                    0                    0
  new hampshire                     0                    0                    0
  new jersey                        0                  205                    0
  new mexico                        0                    0                    0
  new york                          0                    0                    0
  north carolina                    0                    0                    0
  north dakota                      0                    0                    0
  ohio                              0                    0                    0
  oklahoma                          0                    0                    0
  oregon                            0                    0                    0
  pennsylvania                      0                    0                    0
  rhode island                      0                    0                    0
  south carolina                    0                    0                    0
  south dakota                      0                    0                    0
  tennessee                         0                    0                    0
  texas                             0                    0                    0
  utah                              0                    0                    0
  virginia                          0                    0                    0
  washington                        0                    0                    0
  west virginia                     0                    0                    0
  wisconsin                         0                    0                    0
                
                 2.46484286030631e-05 3.43162705174893e-05 6.65144780263589e-05
  arizona                           0                    0                    0
  arkansas                          0                    0                    0
  california                        0                    0                    0
  colorado                          0                    0                    0
  connecticut                       0                   91                    0
  florida                           0                    0                    0
  georgia                           0                    0                    0
  idaho                             0                    0                    0
  illinois                          0                    0                    0
  indiana                           0                    0                    0
  iowa                              0                    0                    0
  kansas                            0                    0                    0
  kentucky                          0                    0                    0
  louisiana                         0                    0                    0
  maine                             0                    0                    0
  maryland                          0                    0                    0
  massachusetts                     0                    0                    0
  michigan                          0                    0                    0
  minnesota                         0                    0                    0
  mississippi                       0                    0                    0
  missouri                          0                    0                    0
  montana                           0                    0                    0
  nebraska                          0                    0                    0
  nevada                            0                    0                    0
  new hampshire                     0                    0                  125
  new jersey                        0                    0                    0
  new mexico                        0                    0                    0
  new york                          0                    0                    0
  north carolina                    0                    0                    0
  north dakota                      0                    0                    0
  ohio                              0                    0                    0
  oklahoma                          0                    0                    0
  oregon                            0                    0                    0
  pennsylvania                      0                    0                    0
  rhode island                      0                    0                    0
  south carolina                    0                    0                    0
  south dakota                      0                    0                    0
  tennessee                         0                    0                    0
  texas                             0                    0                    0
  utah                              0                    0                    0
  virginia                          0                    0                    0
  washington                      545                    0                    0
  west virginia                     0                    0                    0
  wisconsin                         0                    0                    0
                
                 9.25686131971522e-05 9.26152191331418e-05 9.26218790390465e-05
  arizona                           0                    0                    0
  arkansas                          0                    0                    0
  california                        0                  516                    0
  colorado                          0                    0                    0
  connecticut                       0                    0                    0
  florida                           0                    0                    0
  georgia                           0                    0                    0
  idaho                             0                    0                    0
  illinois                          0                    0                  329
  indiana                           0                    0                    0
  iowa                              0                    0                    0
  kansas                            0                    0                    0
  kentucky                          0                    0                    0
  louisiana                         0                    0                    0
  maine                             0                    0                    0
  maryland                          0                    0                    0
  massachusetts                     0                    0                    0
  michigan                          0                    0                    0
  minnesota                         0                    0                    0
  mississippi                       0                    0                    0
  missouri                          0                    0                    0
  montana                           0                    0                    0
  nebraska                          0                    0                    0
  nevada                            0                    0                    0
  new hampshire                     0                    0                    0
  new jersey                        0                    0                    0
  new mexico                        0                    0                    0
  new york                          0                    0                    0
  north carolina                    0                    0                    0
  north dakota                      0                    0                    0
  ohio                              0                    0                    0
  oklahoma                          0                    0                    0
  oregon                            0                    0                    0
  pennsylvania                    172                    0                    0
  rhode island                      0                    0                    0
  south carolina                    0                    0                    0
  south dakota                      0                    0                    0
  tennessee                         0                    0                    0
  texas                             0                    0                    0
  utah                              0                    0                    0
  virginia                          0                    0                    0
  washington                        0                    0                    0
  west virginia                     0                    0                    0
  wisconsin                         0                    0                    0
                
                 0.000179452619729017 0.000484304667422044 0.000484409112186807
  arizona                           0                    0                    0
  arkansas                          0                    0                    0
  california                        0                    0                    0
  colorado                          0                    0                    0
  connecticut                       0                    0                    0
  florida                           0                    0                    0
  georgia                           0                    0                    0
  idaho                             0                    0                    0
  illinois                          0                    0                    0
  indiana                           0                    0                    0
  iowa                              0                    0                    0
  kansas                            0                    0                    0
  kentucky                          0                    0                    0
  louisiana                         0                    0                    0
  maine                             0                    0                    0
  maryland                          0                    0                    0
  massachusetts                     0                    0                    0
  michigan                          0                    0                    0
  minnesota                         0                  373                    0
  mississippi                       0                    0                    0
  missouri                          0                    0                    0
  montana                           0                    0                    0
  nebraska                          0                    0                    0
  nevada                           70                    0                    0
  new hampshire                     0                    0                    0
  new jersey                        0                    0                    0
  new mexico                        0                    0                    0
  new york                          0                    0                    0
  north carolina                    0                    0                    0
  north dakota                      0                    0                    0
  ohio                              0                    0                    0
  oklahoma                          0                    0                    0
  oregon                            0                    0                    0
  pennsylvania                      0                    0                    0
  rhode island                      0                    0                   66
  south carolina                    0                    0                    0
  south dakota                      0                    0                    0
  tennessee                         0                    0                    0
  texas                             0                    0                    0
  utah                              0                    0                    0
  virginia                          0                    0                    0
  washington                        0                    0                    0
  west virginia                     0                    0                    0
  wisconsin                         0                    0                    0
                
                 0.000673996395883842 0.00093825356626608 0.00181718566508557
  arizona                           0                   0                   0
  arkansas                          0                   0                   0
  california                        0                   0                   0
  colorado                          0                   0                   0
  connecticut                       0                   0                   0
  florida                           0                   0                   0
  georgia                           0                   0                   0
  idaho                             0                   0                   0
  illinois                          0                   0                   0
  indiana                           0                   0                   0
  iowa                              0                   0                   0
  kansas                            0                   0                   0
  kentucky                          0                   0                   0
  louisiana                         0                   0                   0
  maine                             0                 399                   0
  maryland                          0                   0                   0
  massachusetts                     0                   0                   0
  michigan                          0                   0                   0
  minnesota                         0                   0                   0
  mississippi                       0                   0                   0
  missouri                          0                   0                   0
  montana                           0                   0                   0
  nebraska                          0                   0                   0
  nevada                            0                   0                   0
  new hampshire                     0                   0                   0
  new jersey                        0                   0                   0
  new mexico                        0                   0                  78
  new york                          0                   0                   0
  north carolina                    0                   0                   0
  north dakota                      0                   0                   0
  ohio                              0                   0                   0
  oklahoma                          0                   0                   0
  oregon                            0                   0                   0
  pennsylvania                      0                   0                   0
  rhode island                      0                   0                   0
  south carolina                    0                   0                   0
  south dakota                      0                   0                   0
  tennessee                         0                   0                   0
  texas                             0                   0                   0
  utah                              0                   0                   0
  virginia                          0                   0                   0
  washington                        0                   0                   0
  west virginia                     0                   0                   0
  wisconsin                       388                   0                   0
                
                 0.00351658088380676 0.00943296680203866 0.0181251615887524
  arizona                          0                   0                  0
  arkansas                         0                   0                  0
  california                       0                   0                  0
  colorado                         0                  79                  0
  connecticut                      0                   0                  0
  florida                          0                   0                  0
  georgia                          0                   0                  0
  idaho                            0                   0                  0
  illinois                         0                   0                  0
  indiana                          0                   0                  0
  iowa                             0                   0                  0
  kansas                           0                   0                  0
  kentucky                         0                   0                  0
  louisiana                        0                   0                  0
  maine                            0                   0                  0
  maryland                         0                   0                  0
  massachusetts                    0                   0                  0
  michigan                         0                   0                  0
  minnesota                        0                   0                  0
  mississippi                      0                   0                  0
  missouri                         0                   0                  0
  montana                          0                   0                  0
  nebraska                         0                   0                  0
  nevada                           0                   0                  0
  new hampshire                    0                   0                  0
  new jersey                       0                   0                  0
  new mexico                       0                   0                  0
  new york                         0                   0                  0
  north carolina                   0                   0                  0
  north dakota                     0                   0                  0
  ohio                             0                   0                  0
  oklahoma                         0                   0                  0
  oregon                         236                   0                  0
  pennsylvania                     0                   0                  0
  rhode island                     0                   0                  0
  south carolina                   0                   0                  0
  south dakota                     0                   0                  0
  tennessee                        0                   0                  0
  texas                            0                   0                  0
  utah                             0                   0                  0
  virginia                         0                   0                734
  washington                       0                   0                  0
  west virginia                    0                   0                  0
  wisconsin                        0                   0                  0
                
                 0.064866716064248 0.932548932501225 0.950613728930272
  arizona                        0                 0                 0
  arkansas                       0                 0                 0
  california                     0                 0                 0
  colorado                       0                 0                 0
  connecticut                    0                 0                 0
  florida                        0                 0                 0
  georgia                        0                 0                 0
  idaho                          0                 0                 0
  illinois                       0                 0                 0
  indiana                        0                 0                 0
  iowa                         256                 0                 0
  kansas                         0                 0               113
  kentucky                       0                 0                 0
  louisiana                      0                 0                 0
  maine                          0                 0                 0
  maryland                       0                 0                 0
  massachusetts                  0                 0                 0
  michigan                       0                 0                 0
  minnesota                      0                 0                 0
  mississippi                    0               382                 0
  missouri                       0                 0                 0
  montana                        0                 0                 0
  nebraska                       0                 0                 0
  nevada                         0                 0                 0
  new hampshire                  0                 0                 0
  new jersey                     0                 0                 0
  new mexico                     0                 0                 0
  new york                       0                 0                 0
  north carolina                 0                 0                 0
  north dakota                   0                 0                 0
  ohio                           0                 0                 0
  oklahoma                       0                 0                 0
  oregon                         0                 0                 0
  pennsylvania                   0                 0                 0
  rhode island                   0                 0                 0
  south carolina                 0                 0                 0
  south dakota                   0                 0                 0
  tennessee                      0                 0                 0
  texas                          0                 0                 0
  utah                           0                 0                 0
  virginia                       0                 0                 0
  washington                     0                 0                 0
  west virginia                  0                 0                 0
  wisconsin                      0                 0                 0
                
                 0.950620480776034 0.964039495344072 0.973902795869031
  arizona                        0                 0               149
  arkansas                       0                 0                 0
  california                     0                 0                 0
  colorado                       0                 0                 0
  connecticut                    0                 0                 0
  florida                        0               872                 0
  georgia                        0                 0                 0
  idaho                          0                 0                 0
  illinois                       0                 0                 0
  indiana                        0                 0                 0
  iowa                           0                 0                 0
  kansas                         0                 0                 0
  kentucky                       0                 0                 0
  louisiana                      0                 0                 0
  maine                          0                 0                 0
  maryland                       0                 0                 0
  massachusetts                  0                 0                 0
  michigan                       0                 0                 0
  minnesota                      0                 0                 0
  mississippi                    0                 0                 0
  missouri                       0                 0                 0
  montana                        0                 0                 0
  nebraska                       0                 0                 0
  nevada                         0                 0                 0
  new hampshire                  0                 0                 0
  new jersey                     0                 0                 0
  new mexico                     0                 0                 0
  new york                       0                 0                 0
  north carolina               782                 0                 0
  north dakota                   0                 0                 0
  ohio                           0                 0                 0
  oklahoma                       0                 0                 0
  oregon                         0                 0                 0
  pennsylvania                   0                 0                 0
  rhode island                   0                 0                 0
  south carolina                 0                 0                 0
  south dakota                   0                 0                 0
  tennessee                      0                 0                 0
  texas                          0                 0                 0
  utah                           0                 0                 0
  virginia                       0                 0                 0
  washington                     0                 0                 0
  west virginia                  0                 0                 0
  wisconsin                      0                 0                 0
                
                 0.99016589378291 0.99016799431119 0.994902264916468
  arizona                       0                0                 0
  arkansas                      0                0                 0
  california                    0                0                 0
  colorado                      0                0                 0
  connecticut                   0                0                 0
  florida                       0                0                 0
  georgia                       0              381                 0
  idaho                         0                0                 0
  illinois                      0                0                 0
  indiana                       0                0                 0
  iowa                          0                0                 0
  kansas                        0                0                 0
  kentucky                    397                0                 0
  louisiana                     0                0                 0
  maine                         0                0                 0
  maryland                      0                0                 0
  massachusetts                 0                0                 0
  michigan                      0                0                 0
  minnesota                     0                0                 0
  mississippi                   0                0                 0
  missouri                      0                0                 0
  montana                       0                0                 0
  nebraska                      0                0                 0
  nevada                        0                0                 0
  new hampshire                 0                0                 0
  new jersey                    0                0                 0
  new mexico                    0                0                 0
  new york                      0                0                 0
  north carolina                0                0                 0
  north dakota                  0                0                 0
  ohio                          0                0                 0
  oklahoma                      0                0                 0
  oregon                        0                0                 0
  pennsylvania                  0                0                 0
  rhode island                  0                0                 0
  south carolina                0                0                 0
  south dakota                  0                0               166
  tennessee                     0                0                 0
  texas                         0                0                 0
  utah                          0                0                 0
  virginia                      0                0                 0
  washington                    0                0                 0
  west virginia                 0                0                 0
  wisconsin                     0                0                 0
                
                 0.997364112948086 0.998104918440956 0.998638492491219
  arizona                        0                 0                 0
  arkansas                       0                 0                 0
  california                     0                 0                 0
  colorado                       0                 0                 0
  connecticut                    0                 0                 0
  florida                        0                 0                 0
  georgia                        0                 0                 0
  idaho                          0                 0                 0
  illinois                       0                 0                 0
  indiana                        0                 0                 0
  iowa                           0                 0                 0
  kansas                         0                 0                 0
  kentucky                       0                 0                 0
  louisiana                      0                 0                 0
  maine                          0                 0                 0
  maryland                       0                 0                 0
  massachusetts                  0                 0                 0
  michigan                       0                 0                 0
  minnesota                      0                 0                 0
  mississippi                    0                 0                 0
  missouri                       0                 0                 0
  montana                        0                 0               238
  nebraska                       0                 0                 0
  nevada                         0                 0                 0
  new hampshire                  0                 0                 0
  new jersey                     0                 0                 0
  new mexico                     0                 0                 0
  new york                       0                 0                 0
  north carolina                 0                 0                 0
  north dakota                   0                 0                 0
  ohio                           0                 0                 0
  oklahoma                       0                 0                 0
  oregon                         0                 0                 0
  pennsylvania                   0                 0                 0
  rhode island                   0                 0                 0
  south carolina                 0                 0                 0
  south dakota                   0                 0                 0
  tennessee                      0                 0                 0
  texas                       1088                 0                 0
  utah                           0                 0                 0
  virginia                       0                 0                 0
  washington                     0                 0                 0
  west virginia                  0               373                 0
  wisconsin                      0                 0                 0
                
                 0.999021911813457 0.999296925853894 0.999297026896568
  arizona                        0                 0                 0
  arkansas                       0                 0                 0
  california                     0                 0                 0
  colorado                       0                 0                 0
  connecticut                    0                 0                 0
  florida                        0                 0                 0
  georgia                        0                 0                 0
  idaho                          0                 0                 0
  illinois                       0                 0                 0
  indiana                        0                 0               257
  iowa                           0                 0                 0
  kansas                         0                 0                 0
  kentucky                       0                 0                 0
  louisiana                      0                 0                 0
  maine                          0                 0                 0
  maryland                       0                 0                 0
  massachusetts                  0                 0                 0
  michigan                       0                 0                 0
  minnesota                      0                 0                 0
  mississippi                    0                 0                 0
  missouri                     315                 0                 0
  montana                        0                 0                 0
  nebraska                       0                 0                 0
  nevada                         0                 0                 0
  new hampshire                  0                 0                 0
  new jersey                     0                 0                 0
  new mexico                     0                 0                 0
  new york                       0                 0                 0
  north carolina                 0                 0                 0
  north dakota                   0                 0                 0
  ohio                           0                 0                 0
  oklahoma                       0                 0                 0
  oregon                         0                 0                 0
  pennsylvania                   0                 0                 0
  rhode island                   0                 0                 0
  south carolina                 0                 0                 0
  south dakota                   0                 0                 0
  tennessee                      0                 0                 0
  texas                          0                 0                 0
  utah                           0                59                 0
  virginia                       0                 0                 0
  washington                     0                 0                 0
  west virginia                  0                 0                 0
  wisconsin                      0                 0                 0
                
                 0.999494906107201 0.999494942410613 0.999637156891794
  arizona                        0                 0                 0
  arkansas                       0               312                 0
  california                     0                 0                 0
  colorado                       0                 0                 0
  connecticut                    0                 0                 0
  florida                        0                 0                 0
  georgia                        0                 0                 0
  idaho                          0                 0               233
  illinois                       0                 0                 0
  indiana                        0                 0                 0
  iowa                           0                 0                 0
  kansas                         0                 0                 0
  kentucky                       0                 0                 0
  louisiana                      0               650                 0
  maine                          0                 0                 0
  maryland                       0                 0                 0
  massachusetts                  0                 0                 0
  michigan                       0                 0                 0
  minnesota                      0                 0                 0
  mississippi                    0                 0                 0
  missouri                       0                 0                 0
  montana                        0                 0                 0
  nebraska                       0                 0                 0
  nevada                         0                 0                 0
  new hampshire                  0                 0                 0
  new jersey                     0                 0                 0
  new mexico                     0                 0                 0
  new york                       0                 0                 0
  north carolina                 0                 0                 0
  north dakota                   0                 0                 0
  ohio                           0                 0                 0
  oklahoma                       0                 0               284
  oregon                         0                 0                 0
  pennsylvania                   0                 0                 0
  rhode island                   0                 0                 0
  south carolina               304                 0                 0
  south dakota                   0                 0                 0
  tennessee                      0                 0               289
  texas                          0                 0                 0
  utah                           0                 0                 0
  virginia                       0                 0                 0
  washington                     0                 0                 0
  west virginia                  0                 0                 0
  wisconsin                      0                 0                 0
                
                 0.999865524949068 0.999865544286216
  arizona                        0                 0
  arkansas                       0                 0
  california                     0                 0
  colorado                       0                 0
  connecticut                    0                 0
  florida                        0                 0
  georgia                        0                 0
  idaho                          0                 0
  illinois                       0                 0
  indiana                        0                 0
  iowa                           0                 0
  kansas                         0                 0
  kentucky                       0                 0
  louisiana                      0                 0
  maine                          0                 0
  maryland                       0                 0
  massachusetts                  0                 0
  michigan                       0                 0
  minnesota                      0                 0
  mississippi                    0                 0
  missouri                       0                 0
  montana                        0                 0
  nebraska                     208                 0
  nevada                         0                 0
  new hampshire                  0                 0
  new jersey                     0                 0
  new mexico                     0                 0
  new york                       0                 0
  north carolina                 0                 0
  north dakota                   0               105
  ohio                           0                 0
  oklahoma                       0                 0
  oregon                         0                 0
  pennsylvania                   0                 0
  rhode island                   0                 0
  south carolina                 0                 0
  south dakota                   0                 0
  tennessee                      0                 0
  texas                          0                 0
  utah                           0                 0
  virginia                       0                 0
  washington                     0                 0
  west virginia                  0                 0
  wisconsin                      0                 0
> ?geom_polygon
starting httpd help server ... done
> ggplot(predictionMap, aes(x = long, y = lat, group = group, fill = TestPredictionBinary))+ geom_polygon(color = "black",size=3) + scale_fill_gradient(low = "blue", high = "red", guide = "legend", breaks= c(0,1), labels = c("Democrat", "Republican"), name = "Prediction 2012")
> ggplot(predictionMap, aes(x = long, y = lat, group = group, fill = TestPredictionBinary))+ geom_polygon(color = "black",alpha=0.3) + scale_fill_gradient(low = "blue", high = "red", guide = "legend", breaks= c(0,1), labels = c("Democrat", "Republican"), name = "Prediction 2012")
> 
