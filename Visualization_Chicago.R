
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

> parole=read.csv("parole.csv")
Error in file(file, "rt") : cannot open the connection
In addition: Warning message:
In file(file, "rt") :
  cannot open file 'parole.csv': No such file or directory
> parole=read.csv("parole.csv")
> library(ggplot2)
> library(ggmap)
> parole$male = as.factor(parole$male)
> parole$state = as.factor(parole$state
+ )
> parole$state = as.factor(parole$state)
> table(parole$male)

  0   1 
130 545 
> 130/675
[1] 0.1925926
> table(parole$male,parole$violator)
   
      0   1
  0 116  14
  1 481  64
> 14/(116+481+14+64)
[1] 0.02074074
> 14/(14+640
+ )
[1] 0.02140673
> 14/(14+64)
[1] 0.1794872
> table(parole$state,parole$crime)
   
      1   2   3   4
  1  66   9  34  34
  2  42  10  64   4
  3  42  15  20   5
  4 165  72  35  58
> ggplot(data = parole, aes(x = age)) + geom_histogram()
stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
> ggplot(data = parole, aes(x = age)) + geom_histogram(binwidth=5)
> ggplot(data = parole, aes(x = age)) + geom_histogram(binwidth=5,color=blue)
Error in do.call("layer", list(mapping = mapping, data = data, stat = stat,  : 
  object 'blue' not found
> ggplot(data = parole, aes(x = age)) + geom_histogram(binwidth=5,color="blue")
> ggplot(data = parole, aes(x = age)) + geom_histogram(binwidth = 5) + facet_grid(male ~ .)
> ggplot(data = parole, aes(x = age)) + geom_histogram(binwidth = 5) + facet_grid(.~male)
> ggplot(data = parole, aes(x = age, fill = male)) + geom_histogram(binwidth = 5)
> ggplot(data = parole, aes(x = age, fill = male)) + geom_histogram(binwidth = 5,position="identity",alpha=0.5)
> ggplot(data = parole, aes(x = age, fill = male)) + geom_histogram(binwidth = 5)
> ggplot(data = parole, aes(x = age, fill = male)) + geom_histogram(binwidth = 5,position="identity",alpha=0.5)
> ggplot(data = parole, aes(x = time.served)) + geom_histogram(binwidth = 1)
> ggplot(data = parole, aes(x = time.served)) + geom_histogram(binwidth = 0.1)
> ggplot(data = parole, aes(x = time.served)) + geom_histogram(binwidth = 1) + facet_grid(crime~.)
> ggplot(data = parole, aes(x = age, fill = crime)) + geom_histogram(binwidth = 1,position="identity",alpha=0.5)
Error in unit(tic_pos.c, "mm") : 'x' and 'units' must have length > 0
> ggplot(data = parole, aes(x = age, fill = crime)) + geom_histogram(binwidth = 1,position="identity",alpha=0.5)
Error in unit(tic_pos.c, "mm") : 'x' and 'units' must have length > 0
> ggplot(data = parole, aes(x = time.served, fill = crime)) + geom_histogram(binwidth = 1,position="identity",alpha=0.5)
Error in unit(tic_pos.c, "mm") : 'x' and 'units' must have length > 0
> ggplot(data = parole, aes(x = time.served, fill = crime)) + geom_histogram(binwidth = 1,position="identity",alpha=0.5)
Error in unit(tic_pos.c, "mm") : 'x' and 'units' must have length > 0
> ggplot(data = parole, aes(x = time.served)) + geom_histogram(binwidth = 1,position="identity",alpha=0.5)
> ggplot(data = parole, aes(x = time.served,fill=crime)) + geom_histogram(binwidth = 1,position="identity",alpha=0.5)
Error in unit(tic_pos.c, "mm") : 'x' and 'units' must have length > 0
> ggplot(data = parole, aes(x = time.served,fill="crime")) + geom_histogram(binwidth = 1,position="identity",alpha=0.5)
> 
