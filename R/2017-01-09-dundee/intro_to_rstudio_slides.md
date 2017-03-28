# 2017-01-10 `R` for Reproducible Scientific Analysis

----

Please use the EtherPad to take communal notes:

[http://pad.software-carpentry.org/2017-01-09-dundee](http://pad.software-carpentry.org/2017-01-09-dundee)

---

## Introduction to `R` and `RStudio`

----

### Learning objectives

* Familiarity with the RStudio IDE
* Set up a working directory with version control
* Introduce `R` syntax
* Introduce package management

----

### Why `R`/`RStudio`?

* Open source & free
* Better than commercial alternatives
* Available on all platforms
* Widely used, good community
* Is a programming language: 
  - automation
  - reproducibility
  - sharing

----

### "But I already know Excel!"

![Dilbert cartoon](images/dt160107.gif)

----

### `R`/`RStudio` presentation

**Live Presentation**

![Vince Twitter quote](images/buffalo.png)


----

### Best practices

* No single 'best' way - only good principles
* Treat your data as read only (separate folder)
  * (cf. `Excel`'s interactive modification)
* Data cleaning
  * Keep 'cleaned' data in a separate folder
* All generated output should be considered disposable

----

### Creating files/directories

**Live Presentation**

----

### Challenge 1

* Download [gapminder-FiveYearData.csv](https://raw.githubusercontent.com/widdowquinn/2016-01-11-dundee/gh-pages/lessons/R_gapminder/data/gapminder-FiveYearData.csv) to `data` subfolder (link on Etherpad)
* Create a new subdirectory called `graphs` in your working directory
* Modify `.gitignore` so that Git does not track the `graphs/` directory
* Commit these changes to the local repository

(10min)

![Red/green sticky](images/red_green_sticky.png)

----

### `R` as a calculator

**Live Presentation**

```
> 1 + 100
[1] 101
> log10(10)
[1] 1
> 1 != 2
[1] TRUE
> x <- 1/40
```

----

### Good variable names

* letters, numbers, underscores and periods allowed
* cannot start with a number
* no spaces
* don't use existing names (e.g. `mean`, `df`, etc.)

* Explicit (e.g. `weight_kg`)
* Long variable names: **be consistent**
  * `periods.between.words`
  * `underscores_between_words`
  * `camelCaseToSeparateWords`

----

### MCQ1

What is the value of each variable after running the following program?

```
mass <- 47.5
age <- 122
mass <- mass * 2.3
age <- age - 20
```

* `mass = 47.5, age = 102`
* `mass = 109.25, age = 102`
* `mass = 47.5, age = 122`
* `mass = 109.25, age = 122`

----

### Package Management

**Live Presentation**

```
installed.packages()
install.packages("packagename")
update.packages()
remove.packages("packagename")
library(packagename)
```

----

### Challenge 2

* Install the following packages:
  * `plyr`
  * `gapminder`
  * `dplyr`
  * `tidyr`

(5min)

![Red/green sticky](images/red_green_sticky.png)

----

### Functions, and getting help

* Function ≈ "canned script", automates something complicated or convenient
* Some functions built-in (`base` packages e.g. `sqrt()`, `log()`, `lm()`)
* Some functions require package import with `library()`

```
fname(arg1, arg2, ...)
```

* Functions usually take *argument*s - some *default*s (e.g. which symbol is used for a plot)
* Functions (always) return *value*s

----

### Getting help for functions

**Live Presentation**

```
args(fname)
?fname
help(fname)
??fname
help.search("text")
vignette(fname)
```

----

### Where can I get more help?

* Ask locally: Colleagues? R user group?
* Google: [Search with your error message](http://lmgtfy.com/?q=R+error+message)
* Stack Overflow (`[r]` tag): [http://stackoverflow.com/questions/tagged/r](http://stackoverflow.com/questions/tagged/r)
* `R-help` mailing list: [https://stat.ethz.ch/mailman/listinfo/r-help](https://stat.ethz.ch/mailman/listinfo/r-help)
* Other topic-specific mailing lists: [http://www.r-project.org/mail.html](http://www.r-project.org/mail.html)

----

### Asking the right questions

* Make it easy for the person you're asking!
* Make the simplest possible example that reproduces the error
* Provide code and data
* For small data: `dput()` to write the data
* For large data use `saveRDS()` or provide the raw data file and script
* Use `sessionInfo()` to provide information about your platform

---

## Functions

----

### Learning objectives

* To understand why we divide programs into small, single-purpose functions
* To understand how to define a function
* To understand how to test a function (and why)

----

### What is a function

* Gathers a sequence of operations into one action
  * Preserves operations for future use
  * Keeps them under a memorable, meaningful name (readability)
  * Can be applied to several different inputs at different times (reproducibility)
* Functions are the building-blocks of programming

----

### Defining a function in `R`

**Live Presentation**

```
my_sum <- function(a, b) {
  the_sum <- a + b
  return(the_sum)
}
```

----

### Challenge 1

(5min)

* Can you write a function, called `kelvin_to_celsius`, that converts temperature from Kelvin to degrees Celsius?
  * Put the function in the `functions-lesson.R` script and save it, then `source` the file.

* Hint: 0K = -273.15C; 0C = 273.15K

![Red/green sticky](images/red_green_sticky.png)

----

### Challenge 2

(5min)

* Can you write a function, called `fahr_to_celsius`, that converts temperature from Fahrenheit to degrees Celsius?
  * Put the function in the `functions-lesson.R` script and save it, then `source` the file.

![Red/green sticky](images/red_green_sticky.png)

----

### Testing functions

* Testing functions to demonstrate that they work is critical
* Test against known good and bad values
* Tests can be automated (e.g. `testthat` package)

**Live Presentation**

```
fahr_to_celsius(32)
kelvin_to_celsius(-10)
```

----

### Not the best approach…

![PhD comic](images/phd033114s.gif)

…you always need negative examples
