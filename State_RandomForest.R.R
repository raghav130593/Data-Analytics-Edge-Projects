
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

> data(state)
> statedata = data.frame(state.x77)
> str(statedata)
'data.frame':   50 obs. of  8 variables:
 $ Population: num  3615 365 2212 2110 21198 ...
 $ Income    : num  3624 6315 4530 3378 5114 ...
 $ Illiteracy: num  2.1 1.5 1.8 1.9 1.1 0.7 1.1 0.9 1.3 2 ...
 $ Life.Exp  : num  69 69.3 70.5 70.7 71.7 ...
 $ Murder    : num  15.1 11.3 7.8 10.1 10.3 6.8 3.1 6.2 10.7 13.9 ...
 $ HS.Grad   : num  41.3 66.7 58.1 39.9 62.6 63.9 56 54.6 52.6 40.6 ...
 $ Frost     : num  20 152 15 65 20 166 139 103 11 60 ...
 $ Area      : num  50708 566432 113417 51945 156361 ...
> LRmodel=lm(Life.Exp~.,data=statedata)
> summary(LRmodel)

Call:
lm(formula = Life.Exp ~ ., data = statedata)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.48895 -0.51232 -0.02747  0.57002  1.49447 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)  7.094e+01  1.748e+00  40.586  < 2e-16 ***
Population   5.180e-05  2.919e-05   1.775   0.0832 .  
Income      -2.180e-05  2.444e-04  -0.089   0.9293    
Illiteracy   3.382e-02  3.663e-01   0.092   0.9269    
Murder      -3.011e-01  4.662e-02  -6.459 8.68e-08 ***
HS.Grad      4.893e-02  2.332e-02   2.098   0.0420 *  
Frost       -5.735e-03  3.143e-03  -1.825   0.0752 .  
Area        -7.383e-08  1.668e-06  -0.044   0.9649    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.7448 on 42 degrees of freedom
Multiple R-squared:  0.7362,    Adjusted R-squared:  0.6922 
F-statistic: 16.74 on 7 and 42 DF,  p-value: 2.534e-10

> LRpred=predict(statedata$Life.Exp)
Error in UseMethod("predict") : 
  no applicable method for 'predict' applied to an object of class "c('double', 'numeric')"
> LRpred=predict(LRpred)
Error in predict(LRpred) : object 'LRpred' not found
> LRpred=predict(LRmodel)
> SSE=sum((LRpred-statedata$Life.Exp)^2)
> SSE
[1] 23.29714
> LRmodel2=lm(Life.Exp~Population+Murder+Frost+HS.Grad,data=statedata)
> summary(LRmodel2)

Call:
lm(formula = Life.Exp ~ Population + Murder + Frost + HS.Grad, 
    data = statedata)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.47095 -0.53464 -0.03701  0.57621  1.50683 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)  7.103e+01  9.529e-01  74.542  < 2e-16 ***
Population   5.014e-05  2.512e-05   1.996  0.05201 .  
Murder      -3.001e-01  3.661e-02  -8.199 1.77e-10 ***
Frost       -5.943e-03  2.421e-03  -2.455  0.01802 *  
HS.Grad      4.658e-02  1.483e-02   3.142  0.00297 ** 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.7197 on 45 degrees of freedom
Multiple R-squared:  0.736,     Adjusted R-squared:  0.7126 
F-statistic: 31.37 on 4 and 45 DF,  p-value: 1.696e-12

> LRpred2=predict(LRmodel2)
> SSE=sum((LRpred2-statedata$Life.Exp)^2)
> SSE
[1] 23.30804
> library(rpart)
> library(rpart.plot)
> CARTmodel=rpart(Life.Exp~.,data=statedata)
> prp(CARTmodel)
> CARTpred=predict(CARTmodel)
> SSECART=sum((CARTpred-statedata$Life.Exp)^2)
> SSECART
[1] 28.99848
> CARTmodel2=rpart(Life.Exp~.,data=statedata,control=rpart.control(minbucket=5))
> prp(CARTmodel2)
> CARTpred2=predict(CARTmodel2)
> SSECART2=sum((CARTpred2-statedata$Life.Exp)^2)
> SSECART2
[1] 23.64283
> CARTmodel3=rpart(Life.Exp~Area,data=statedata,control=rpart.control(minbucket=1))
> prp(CARTmodel3)
> CARTpred3=predict(CARTmodel3)
> SSECART2=sum((CARTpred3-statedata$Life.Exp)^2)
> SSECART2
[1] 9.312442
> library(caret)
Loading required package: lattice
Loading required package: ggplot2
> libray(e1081)
Error: could not find function "libray"
> fitCfitcontrol=trainControl(method="cv",number=10)
> cartGrid=expand.grid(.cp=(1:50)*0.01)
> set.seed(111)
> fitCfitcontrol=trainControl(method="cv",number=10)
> cartGrid=expand.grid(.cp=(1:50)*0.01)
> train(Life.Exp~.,data=statedata,method="rpart",trControl=fitCfitControl,tuneGrid=cartGrid)
Error in train.default(x, y, weights = w, ...) : 
  object 'fitCfitControl' not found
> train(Life.Exp~.,data=statedata,method="rpart",trControl=fitCfitcontrol,tuneGrid=cartGrid)
CART 

50 samples
 7 predictors

No pre-processing
Resampling: Cross-Validated (10 fold) 

Summary of sample sizes: 45, 45, 46, 45, 45, 43, ... 

Resampling results across tuning parameters:

  cp    RMSE   Rsquared  RMSE SD  Rsquared SD
  0.01  0.971  0.508     0.302    0.267      
  0.02  0.971  0.508     0.302    0.267      
  0.03  0.985  0.496     0.325    0.278      
  0.04  0.991  0.496     0.327    0.278      
  0.05  0.991  0.496     0.327    0.278      
  0.06  0.98   0.515     0.345    0.297      
  0.07  0.971  0.538     0.304    0.299      
  0.08  0.971  0.538     0.304    0.299      
  0.09  0.971  0.538     0.304    0.299      
  0.1   0.971  0.538     0.304    0.299      
  0.11  0.971  0.538     0.304    0.299      
  0.12  0.971  0.538     0.304    0.299      
  0.13  1.05   0.462     0.314    0.306      
  0.14  1.05   0.462     0.314    0.306      
  0.15  1.08   0.448     0.318    0.298      
  0.16  1.14   0.392     0.268    0.254      
  0.17  1.14   0.392     0.268    0.254      
  0.18  1.13   0.392     0.266    0.254      
  0.19  1.13   0.392     0.266    0.254      
  0.2   1.13   0.392     0.266    0.254      
  0.21  1.13   0.392     0.266    0.254      
  0.22  1.13   0.392     0.266    0.254      
  0.23  1.14   0.381     0.278    0.264      
  0.24  1.14   0.381     0.278    0.264      
  0.25  1.14   0.381     0.278    0.264      
  0.26  1.14   0.381     0.278    0.264      
  0.27  1.14   0.381     0.278    0.264      
  0.28  1.14   0.381     0.278    0.264      
  0.29  1.14   0.381     0.278    0.264      
  0.3   1.14   0.381     0.278    0.264      
  0.31  1.14   0.381     0.278    0.264      
  0.32  1.14   0.381     0.278    0.264      
  0.33  1.14   0.381     0.278    0.264      
  0.34  1.14   0.381     0.278    0.264      
  0.35  1.14   0.381     0.278    0.264      
  0.36  1.14   0.381     0.278    0.264      
  0.37  1.14   0.381     0.278    0.264      
  0.38  1.14   0.381     0.278    0.264      
  0.39  1.14   0.381     0.278    0.264      
  0.4   1.14   0.381     0.278    0.264      
  0.41  1.14   0.381     0.278    0.264      
  0.42  1.14   0.381     0.278    0.264      
  0.43  1.14   0.381     0.278    0.264      
  0.44  1.14   0.381     0.278    0.264      
  0.45  1.14   0.381     0.278    0.264      
  0.46  1.14   0.381     0.278    0.264      
  0.47  1.18   0.343     0.207    0.254      
  0.48  1.27   0.269     0.182    0.247      
  0.49  1.3    0.2       0.18     0.203      
  0.5   1.33   0.119     0.17     0.101      

RMSE was used to select the optimal model using  the smallest value.
The final value used for the model was cp = 0.12. 
Warning message:
In nominalTrainWorkflow(x = x, y = y, wts = weights, info = trainInfo,  :
  There were missing values in resampled performance measures.
> CVmodel=rpart(Life.Exp~.,data=statedata,control=rpart.control(cp=0.12))
> prp(CVmodel)
> CVpred=predict(CVmodel)
> SSECV=sum((CVpred-statedata$Life.Exp)^2)
> SSECV
[1] 32.86549
> set.seed(111)
> fitCfitcontrol=trainControl(method="cv",number=10)
> cartGrid2=expand.grid(.cp=(1:50)*0.01)
> train(Life.Exp~Area,data=statedata,method="rpart",trControl=fitCfitcontrol,tuneGrid=cartGrid)
CART 

50 samples
 7 predictors

No pre-processing
Resampling: Cross-Validated (10 fold) 

Summary of sample sizes: 45, 45, 46, 45, 45, 43, ... 

Resampling results across tuning parameters:

  cp    RMSE  Rsquared  RMSE SD  Rsquared SD
  0.01  1.21  0.539     0.444    0.319      
  0.02  1.21  0.539     0.444    0.319      
  0.03  1.22  0.506     0.436    0.287      
  0.04  1.22  0.506     0.436    0.287      
  0.05  1.22  0.506     0.436    0.287      
  0.06  1.23  0.505     0.432    0.285      
  0.07  1.28  0.541     0.491    0.244      
  0.08  1.3   0.516     0.482    0.213      
  0.09  1.31  0.501     0.468    0.21       
  0.1   1.31  0.501     0.468    0.21       
  0.11  1.31  0.501     0.468    0.21       
  0.12  1.3   0.501     0.475    0.21       
  0.13  1.38  0.421     0.47     0.167      
  0.14  1.38  0.421     0.47     0.167      
  0.15  1.4   0.446     0.447    0.173      
  0.16  1.44  0.388     0.44     0.131      
  0.17  1.44  0.416     0.376    0.00775    
  0.18  1.44  0.416     0.376    0.00775    
  0.19  1.44  0.416     0.376    0.00775    
  0.2   1.44  0.416     0.376    0.00775    
  0.21  1.37  0.41      0.298    NA         
  0.22  1.37  0.41      0.298    NA         
  0.23  1.37  0.41      0.298    NA         
  0.24  1.37  0.41      0.298    NA         
  0.25  1.37  0.41      0.298    NA         
  0.26  1.37  0.41      0.298    NA         
  0.27  1.32  NaN       0.206    NA         
  0.28  1.32  NaN       0.206    NA         
  0.29  1.32  NaN       0.206    NA         
  0.3   1.32  NaN       0.206    NA         
  0.31  1.32  NaN       0.206    NA         
  0.32  1.32  NaN       0.206    NA         
  0.33  1.32  NaN       0.206    NA         
  0.34  1.32  NaN       0.206    NA         
  0.35  1.32  NaN       0.206    NA         
  0.36  1.32  NaN       0.206    NA         
  0.37  1.32  NaN       0.206    NA         
  0.38  1.32  NaN       0.206    NA         
  0.39  1.32  NaN       0.206    NA         
  0.4   1.32  NaN       0.206    NA         
  0.41  1.32  NaN       0.206    NA         
  0.42  1.32  NaN       0.206    NA         
  0.43  1.32  NaN       0.206    NA         
  0.44  1.32  NaN       0.206    NA         
  0.45  1.32  NaN       0.206    NA         
  0.46  1.32  NaN       0.206    NA         
  0.47  1.32  NaN       0.206    NA         
  0.48  1.32  NaN       0.206    NA         
  0.49  1.32  NaN       0.206    NA         
  0.5   1.32  NaN       0.206    NA         

RMSE was used to select the optimal model using  the smallest value.
The final value used for the model was cp = 0.02. 
Warning message:
In nominalTrainWorkflow(x = x, y = y, wts = weights, info = trainInfo,  :
  There were missing values in resampled performance measures.
> CVmodel2=rpart(Life.Exp~Area,data=statedata,control=rpart.control(cp=0.02))
> prp(CVmodel2)
> CVpred2=predict(CVmodel2)
> SSECV2=sum((CVpred2-statedata$Life.Exp)^2)
> SSECV2
[1] 44.26817
> 
