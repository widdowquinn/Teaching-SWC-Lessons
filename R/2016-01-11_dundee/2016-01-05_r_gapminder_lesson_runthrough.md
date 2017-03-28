# 2016-01-05 R Gapminder Lesson Runthrough

Notes to myself on the R Gapmnder lesson runthrough

* To clear the console environment: `rm(list=ls())`

## Lesson 0: Preamble?

Missing introduction to R/RStudio as context for the group. This will be different for every group, so I can see why it's not in the lesson.

* Stickies: green for those who've used R/RStudio before - ask them to be available to help neighbours who have not
* Point out "Why R?" - many useful packages; widely-used; free; great graphics/visualisation; good community; it's a programming language: promotes experimentation and exploration - gets away from point-and-click 'black boxes' in other tools; scripting; reproducibility; sharing; automation; autodocumentation; RMarkdown

## Lesson 1: Introduction to R and RStudio

Lesson aim seems to be to familiarise with workspace.

* Why RStudio?: Free, open source, IDE, works (and looks the same) on all platforms, centralised package management/version control/project management
* THREE console windows to start: interactive, history, files/plots etc.

### Workflow

1. Test and play in interactive console: needs a demo; show tab-completion and arrow keys (not mentioned in lesson)
2. Start writing in a `.R` file and use RStudio to push lines to the console: needs a demo

- New File (R Script)
- Opens new editor window
- Demo same lines (single line; select lines; source with/without echo)

Contrast reproducibility of running from source file with running at interactive/command-line.

* Other routes to run code include `Code->Run Lines` etc. from top menu.

### Introduction to R

* Read - Evaluate - Print loop.

### R as a calculator

* arithmetic; `[1]` indicates output (for now)
* incomplete commands - waits for completion: what `+` means. `Esc` to get command prompt back.
* same BODMAS commands as you should expect.
* Parentheses/style (*spaces between operators are clearer*)
* Scientific notation

### Mathematical functions

* `fn(arg)` form
* Pause during typing to show pop-up help and autocompletion
* How to get help: `?` before function name (demonstrates help window)

### Comparing things

* `==`, `!=`, `<`, `<=`
* The importance of `all.equal`! Maybe ask if anyone from engineering/physics here, first.

```
> all.equal(pi-1e-7, pi)
[1] "Mean relative difference: 3.183099e-08"
> all.equal(pi-1e-8, pi)
[1] TRUE
> pi-1e-8 == pi
[1] FALSE
```

### Variables and assignment

* Introduce `=` and `<-`: SWC recommends `<-` because it is more common.
* Note that the environment tab exists, and updates automatically
* RHS is fully evaluated before assignment
* variable name conventions: `periods.between.words`, `underscores_between_words`, `camelCaseToSeparateWords`


### Vectorisation

* Everyone familiar with vectors? Ask, and explain.
* We're delaying further discussion until later.

### Managing your environment

* `ls()` to see what's defined
* demonstrate `ls` to show that functions are variables and defined in `R`.
* demonstrate `rm()`
* demonstrate `rm(list=ls())`
* show `rm(list <- ls())` throws an error - `R` errors can be informative; R will try to help you diagnose your own problems

### R Packages

* `installed.packages()`
* `install.package("packagename")`
* `update.packages()`
* `library(packagename)`

### Challenges

Four challenges - 10min?

At the end of the challenges, everyone should have `ggplot2`, `plyr`, and `gapminder` installed.

* demonstrate `uninstall.packages()` and `install.packages()` when going through the challenges.


## Lesson 2: Project management with RStudio

Practical implementation of the project management lessons we've been trying to get across in other lessons - especially Git.

Recount the problems that arise from using poor project management, and the advantages of using good project management:

* better data integrity
* code sharing
* easy upload of code with manuscript
* easier to resume projects after time away - topical; just back after Xmas

### Create a new project in RStudio

* `File->New Project`
* `New Directory` - this will ask for a particular location to be a subdirectory of, defaulting to `~`
* `Empty Project`
* enter project name
* make sure create git repository is checked
* `Create Project`

This process replaces the RStudio IDE with a new interface. Draw attention to the file structure on the right: there's a `.gitignore` file, and an `.Rproj` file.

Opening the `.Rproj` file will put all our work in this directory, and under Git control

### Practices

* No one 'best' way - only good principles
* Treat data as read only (contrast with Excel, that modifies data interactively as analysis proceeds)
* Data cleaning: have a second folder with 'clean' read-only data
* All generated output (not data or scripts/analysis code) should be considered disposable

Ignoring ProjectTemplate for now as it may be excessive cognitive load

* Work interactively/play in the interactive session, but save/copy commands to a script when they work in the way we want.

### Challenge 1

Download gapminder data from link: [https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv](https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv) or local equivalent.

* Create `data` folder using RStudio within the project
* Download/copy the gapminder data over
* Show the data in its appropriate location

10min?


### Version control

Show the `Git` tab in the Environment tab.

Make an initial commit of template files:

* Select the tabs against each file to stage them (green 'A' for added)
* Select `Commit`
* A new window appears - describe the elements
* Show contents of individual files
* Add commit message
* Press `Commit`

Trying this, I got the message:

```
fatal: Unable to create '/Users/lpritc/Desktop/my_project/.git/index.lock': File exists.

If no other git process is currently running, this probably means a
git process crashed in this repository earlier. Make sure no other git
process is running and remove the file manually to continue.
```

There was no `index.lock` file, but a `Refresh` and `Commit` fixed it.

* Note that we don't want to version disposable output (such as graphs/visualisations)

### Challenge 2

* Create a new directory called `graphs`
* Modify `.gitignore` to contain `graphs/` and commit this change; clicking `.gitignore` in the file list brings up the contents in the editor; changing this and saving shows the modified file in the Git window. 
* Select the modified file and commit with appropriate message

10min?

## Lesson 3: Seeking help

Using `?` to get help:

* `?function` and `help(function)`
* Describe sections (e.g. `?exp` has them all)
* `?"+"` for help on operators

### Package help

* `vignette(packagename)`
* `vignette()` for all packages - list arrives in editor tab
* `vignette("venn")` is a decent example

Vignettes open in a suitable PDF reader.

### More general help

Maybe worth saving this until the end?

* `??functionname` is a fuzzy search, e.g. `??ven`
* CRAN Task Views: [http://cran.at.r-project.org/web/views/](http://cran.at.r-project.org/web/views/)
* Stack Overflow with `[r]` tag: [http://stackoverflow.com/](http://stackoverflow.com/)

### Challenge 1

* Introduces the `c()` function!
* Coercion! Vectors take the type as the elements, if all elements are the same type - otherwise coercion happens.

### Challenge 2

* Introduces the `paste` function

`sep` vs `collapse`:

```
> paste("1st", "2nd", "3rd", collapse = ", ")
[1] "1st 2nd 3rd"
> paste("1st", "2nd", "3rd", sep = ", ")
[1] "1st, 2nd, 3rd"
> paste(c("1st", "2nd", "3rd"), sep = ", ")
[1] "1st" "2nd" "3rd"
> paste(c("1st", "2nd", "3rd"), collapse = ", ")
[1] "1st, 2nd, 3rd"
```

Use `sep` for inputs of length 1 (i.e. lists/vectors), and `collapse` for lists/vectors.


## Lesson 4: Data Structures

What types of data does `R` handle, and how: types, classes, structures.

### Data types

Five atomic (can't be broken down into smaller things) types:

* logical
* integer - numeric
* double - numeric
* complex
* character ('text')

Commands to test data type:

```
typeof() # what is its atomic type?
is.logical() # is it TRUE/FALSE data?
is.numeric() # is it numeric?
is.integer() # is it an integer?
is.complex() # is it complex number data?
is.character() # is it character data?
str()  # what is it?
```

### Challenge 1

Revises assignment, introduces `is.X()`

```
> answer <- TRUE
> height <- 150
> dog_name <- "Snoopy"
> is.logical(answer)
[1] TRUE
> is.numeric(height)
[1] TRUE
> is.character(dog_name)
[1] TRUE
```

### Data Structures

Five common `R` data structures:

* vector
* factor
* list
* matrix
* `data.frame`

### Vectors

* Most common data structure
* Can only contain one data type, hence: "Atomic vectors"

Default vector creation is logical, length 0:

```
> x <- vector()
> x
logical(0)
```

Can specify length:

```
> x <- vector(length=10)
> x
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
```

Can specify data type:

```
> x <- vector("complex", length=10)
> x
 [1] 0+0i 0+0i 0+0i 0+0i 0+0i 0+0i 0+0i 0+0i 0+0i 0+0i
```

The `c` "concatenate" function creates vectors (if all elements are the same type), as does a sequence of numbers:

```
> x <- c(10, 12, 45, 33)
> x
[1] 10 12 45 33
> series <- 1:10
> series
 [1]  1  2  3  4  5  6  7  8  9 10
```

The `seq()` function also creates vectors:

```
> seq(10)
 [1]  1  2  3  4  5  6  7  8  9 10
> seq(1,10, by=0.5)
 [1]  1.0  1.5  2.0  2.5  3.0  3.5  4.0  4.5  5.0  5.5  6.0  6.5  7.0  7.5  8.0  8.5  9.0  9.5 10.0
```

The `c()` function can be used to append new values to a vector:

```
> x
[1] 10 12 45 33
> x <- c(x, 57)
> x
[1] 10 12 45 33 57
```

#### Challenge 2

Examples of explicit coercion

5min?

```
> c(1.7, "a")
[1] "1.7" "a"  
> c(TRUE, 2)
[1] 1 2
> c("a", TRUE)
[1] "a"    "TRUE"
```

### Coercion

Coercion rule: `R` takes the least common denominator for all elements:

`logical > integer > numeric > complex > character`

Use `as.X()` to coerce explicitly:

```
> as.character(x)
[1] "10" "12" "45" "33" "57"
> as.complex(x)
[1] 10+0i 12+0i 45+0i 33+0i 57+0i
> x <- 0:6
> as.logical(x)
[1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
```

If a coercion doesn't make sense, `R` will substitute `NA` values:

```
> x <- c('a', 'b', 'c')
> x
[1] "a" "b" "c"
> as.numeric(x)
[1] NA NA NA
Warning message:
NAs introduced by coercion 
> as.logical(x)
[1] NA NA NA
```

* `NA` is a **SPECIAL VALUE** that denotes a missing value. Other special values include `Inf` (infinity), `NaN` (not a number), and `NULL` (does not exist)

### Getting/setting information about vectors

* `head()`, `tail()`, `length()`

```
> x <- 1:10
> tail(x)
[1]  5  6  7  8  9 10
> head(x, n=2)
[1] 1 2
> length(x)
[1] 10
```

* String representation of vector (not the same as coercing to `character`)

```
> str(x)
 int [1:10] 1 2 3 4 5 6 7 8 9 10
> as.character(x)
 [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10"
```

* Naming positions in a vector:

```
> x <- 1:4
> x
[1] 1 2 3 4
> names(x) <- c('a', 'b', 'c', 'd')
> x
a b c d 
1 2 3 4 
```

### Matrices

* Matrices are *atomic* - one data type!
* Create with `matrix()` function

```
> set.seed(1) # For reproducibility - all get the same numbers
> x <- matrix(rnorm(18), ncol=6, nrow=3)
> x
           [,1]       [,2]      [,3]       [,4]       [,5]        [,6]
[1,] -0.6264538  1.5952808 0.4874291 -0.3053884 -0.6212406 -0.04493361
[2,]  0.1836433  0.3295078 0.7383247  1.5117812 -2.2146999 -0.01619026
[3,] -0.8356286 -0.8204684 0.5757814  0.3898432  1.1249309  0.94383621
```

* Need to explain `rnorm()`, `ncol`, `nrow`
* Difference between `str()` and `as.character()` - `str()` is "structure", not "string":

```
> str(x)
 num [1:3, 1:6] -0.626 0.184 -0.836 1.595 0.33 ...
> as.character(x)
 [1] "-0.626453810742332"  "0.183643324222082"   "-0.835628612410047"  "1.59528080213779"    "0.329507771815361"   "-0.820468384118015" 
 [7] "0.487429052428485"   "0.738324705129217"   "0.575781351653492"   "-0.305388387156356"  "1.51178116845085"    "0.389843236411431"  
[13] "-0.621240580541804"  "-2.2146998871775"    "1.12493091814311"    "-0.0449336090152309" "-0.0161902630989461" "0.943836210685299" 
```

Can use functions to find out more about a matrix - can also set row, column and dimension names to annotate data sensibly:

```
> nrow(x)
[1] 3
> ncol(x)
[1] 6
> rownames(x)
NULL
> colnames(x)
NULL
> dimnames(x)
NULL
```

#### Challenge 3

Simple length application - 5min?

#### Challenge 4

Create new matrix and fill with values 1:50 - 10min

```
> m <- matrix(1:50, nrow=10, ncol=5)
> m
      [,1] [,2] [,3] [,4] [,5]
 [1,]    1   11   21   31   41
 [2,]    2   12   22   32   42
 [3,]    3   13   23   33   43
 [4,]    4   14   24   34   44
 [5,]    5   15   25   35   45
 [6,]    6   16   26   36   46
 [7,]    7   17   27   37   47
 [8,]    8   18   28   38   48
 [9,]    9   19   29   39   49
[10,]   10   20   30   40   50
> m <- matrix(1:50, nrow=10, ncol=5, byrow=TRUE)
> m
      [,1] [,2] [,3] [,4] [,5]
 [1,]    1    2    3    4    5
 [2,]    6    7    8    9   10
 [3,]   11   12   13   14   15
 [4,]   16   17   18   19   20
 [5,]   21   22   23   24   25
 [6,]   26   27   28   29   30
 [7,]   31   32   33   34   35
 [8,]   36   37   38   39   40
 [9,]   41   42   43   44   45
[10,]   46   47   48   49   50
```

### Factors

* Does everyone know the difference between continuous and discrete/categorical data? Stickies
* Factors are special vectors representing categorical data.
* Very important for modelling (e.g. linear modelling, ANOVA, etc.) and plotting

Factors only contain predefined values:

```
> x <- factor(c('yes', 'no', 'no', 'yes', 'yes'))
> x
[1] yes no  no  yes yes
Levels: no yes
> str(x)
 Factor w/ 2 levels "no","yes": 2 1 1 2 2
```

* Every unique value gets a label.
* The label is an integer: it may look like a string/character, but it is not! (GOTCHA)

```
> x <- factor(c("case", "control", "control", "case"))
> str(x)
 Factor w/ 2 levels "case","control": 1 2 2 1
```

* Q: what is wrong with this?
* A: for modelling, you need to have the 'baseline'/'control' be the first factor. Your model interpretations can be incorrect if this convention is not upheld!
* To achieve this, specify levels (*this also helps reduce chance of typos*):

```
> x <- factor(c("case", "control", "control", "case"), levels = c("control", "case"))
> str(x)
 Factor w/ 2 levels "control","case": 2 1 1 2
``` 

### Lists

Lists are containers that can hold a series of any data type/structure - even themselves

```
> x <- list(1, "a", TRUE, 1+4i)
> x
[[1]]
[1] 1
[[2]]
[1] "a"
[[3]]
[1] TRUE
[[4]]
[1] 1+4i
> str(x)
List of 4
 $ : num 1
 $ : chr "a"
 $ : logi TRUE
 $ : cplx 1+4i
```

* Need to explain `[[]]` element brackets
* Here, each list element contains an atomic vector (`[1]`).
* Lists can contain complex data, and elements can be named individually:

```
> xlist <- list(a = "Research Bazaar", b = 1:10, data = head(iris))
> xlist
$a
[1] "Research Bazaar"
$b
 [1]  1  2  3  4  5  6  7  8  9 10
$data
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
> str(xlist)
List of 3
 $ a   : chr "Research Bazaar"
 $ b   : int [1:10] 1 2 3 4 5 6 7 8 9 10
 $ data:'data.frame':	6 obs. of  5 variables:
  ..$ Sepal.Length: num [1:6] 5.1 4.9 4.7 4.6 5 5.4
  ..$ Sepal.Width : num [1:6] 3.5 3 3.2 3.1 3.6 3.9
  ..$ Petal.Length: num [1:6] 1.4 1.4 1.3 1.5 1.4 1.7
  ..$ Petal.Width : num [1:6] 0.2 0.2 0.2 0.2 0.2 0.4
  ..$ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1
```

#### Challenge 5

10min?

```
> data_types = c("logical", "integer", "double", "complex", "character")
> data_structures = c("vector", "matrix", "factor", "list")
> my_list <- list(data_types, data_structures)
> my_list
[[1]]
[1] "logical"   "integer"   "double"    "complex"   "character"
[[2]]
[1] "vector" "matrix" "factor" "list"  
> str(my_list)
List of 2
 $ : chr [1:5] "logical" "integer" "double" "complex" ...
 $ : chr [1:4] "vector" "matrix" "factor" "list"
```


## Lesson 5: Data frames and reading in data

Need to explain the concept of a data frame:

* like matrices (rectangular, rows and columns)
* each column can be a different atomic type
* each column (or row…) is a vector

Data frames are complicated, but only so that they give you great power in handling data.

### Create a data frame manually

```
> df <- data.frame(id = c('a', 'b', 'c', 'd', 'e', 'f'), x = 1:6, y = c(214:219))
> df
  id x   y
1  a 1 214
2  b 2 215
3  c 3 216
4  d 4 217
5  e 5 218
6  f 6 219
```

### Challenge 1

Can run this as a quick example in class - MCQ?

```
> length(df)
[1] 3
```

The data frame is essentially a "list of columns", hence `length(df)` gives 3, here. The fundamental concept is that data frames store information in columns, where each row refers to the same 'item' in some way.

### Adding rows or columns

* `cbind()`, `rbind()`

```
> df <- cbind(df, 6:1)
> df
  id x   y 6:1
1  a 1 214   6
2  b 2 215   5
3  c 3 216   4
4  d 4 217   3
5  e 5 218   2
6  f 6 219   1
```

Replacing the automatic name:

```
> names(df)
[1] "id"  "x"   "y"   "6:1"
> names(df)[4] <- 'SixToOne'
> names(df)
[1] "id"       "x"        "y"        "SixToOne"
> df
  id x   y SixToOne
1  a 1 214        6
2  b 2 215        5
3  c 3 216        4
4  d 4 217        3
5  e 5 218        2
6  f 6 219        1
```

Specifying a name when we create (implicitly introduces `LETTERS`):

```
> df <- cbind(df, caps=LETTERS[1:6])
> df
  id x   y SixToOne caps
1  a 1 214        6    A
2  b 2 215        5    B
3  c 3 216        4    C
4  d 4 217        3    D
5  e 5 218        2    E
6  f 6 219        1    F
```

#### Adding rows

Try to add the row, with `rbind()` - using a list because we have several data types:

```
> df <- rbind(df, list("g", 11, 42, 0, "G"))
Warning messages:
1: In `[<-.factor`(`*tmp*`, ri, value = "g") :
  invalid factor level, NA generated
2: In `[<-.factor`(`*tmp*`, ri, value = "G") :
  invalid factor level, NA generated
```

We get an error - why? (ask learners)

The error message tells us that we have some problem with factors. Specifically that 'g' and 'G' are invalid factors. Did we specify any factors when we created the data frame? (ask learners)

No we didn't, but let's look at the first column, called `id` - this introduces the `$` notation to specify a column by name - can ignore by using `str(df)`:

```
> df
    id  x   y SixToOne caps
1    a  1 214        6    A
2    b  2 215        5    B
3    c  3 216        4    C
4    d  4 217        3    D
5    e  5 218        2    E
6    f  6 219        1    F
7 <NA> 11  42        0 <NA>
> df$id
[1] a    b    c    d    e    f    <NA>
Levels: a b c d e f
> class(df$id)
[1] "factor"
> str(df)
'data.frame':	7 obs. of  5 variables:
 $ id      : Factor w/ 6 levels "a","b","c","d",..: 1 2 3 4 5 6 NA
 $ x       : num  1 2 3 4 5 6 11
 $ y       : num  214 215 216 217 218 219 42
 $ SixToOne: num  6 5 4 3 2 1 0
 $ caps    : Factor w/ 6 levels "A","B","C","D",..: 1 2 3 4 5 6 NA
```

When we create a data frame, `R` automatically converts character strings into factors - as this is usually what you actually want.

Two workarounds:

* Convert factors columns into characters. Convenient, but factor structure can be very important for analyses (also catches typos…)
* Add new factor levels to accommodate `g` and `G`

Implement both solutions, one in each column:

```
> df$id <-as.character(df$id)
> class(df$id)
[1] "character"
> levels(df$caps) <- c(levels(df$caps), 'G')
> class(df$caps)
[1] "factor"
> str(df)
'data.frame':	7 obs. of  5 variables:
 $ id      : chr  "a" "b" "c" "d" ...
 $ x       : num  1 2 3 4 5 6 11
 $ y       : num  214 215 216 217 218 219 42
 $ SixToOne: num  6 5 4 3 2 1 0
 $ caps    : Factor w/ 7 levels "A","B","C","D",..: 1 2 3 4 5 6 NA
```

Add the row again:

```
> df <- rbind(df, list("g", 11, 42, 0, "G"))
> df
    id  x   y SixToOne caps
1    a  1 214        6    A
2    b  2 215        5    B
3    c  3 216        4    C
4    d  4 217        3    D
5    e  5 218        2    E
6    f  6 219        1    F
7 <NA> 11  42        0 <NA>
8    g 11  42        0    G
```

#### Deleting rows

Now we have an unwanted row:

```
> df
    id  x   y SixToOne caps
1    a  1 214        6    A
2    b  2 215        5    B
3    c  3 216        4    C
4    d  4 217        3    D
5    e  5 218        2    E
6    f  6 219        1    F
7 <NA> 11  42        0 <NA>
8    g 11  42        0    G
```

How do we get rid of it? At least three ways:

* delete the row explicitly
* use `complete.cases()` to return only rows with no missing values
* use `na.omit` to return only rows with no missing values

The first two of these introduce concepts of indexing within data frames (numerical and logical indexing), that we might want to skip/not talk about yet.

If there are many missing values, the last two are quicker.

```
> df[-7,]
  id  x   y SixToOne caps
1  a  1 214        6    A
2  b  2 215        5    B
3  c  3 216        4    C
4  d  4 217        3    D
5  e  5 218        2    E
6  f  6 219        1    F
8  g 11  42        0    G
> complete.cases(df)
[1]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE
> df[complete.cases(df),]
  id  x   y SixToOne caps
1  a  1 214        6    A
2  b  2 215        5    B
3  c  3 216        4    C
4  d  4 217        3    D
5  e  5 218        2    E
6  f  6 219        1    F
8  g 11  42        0    G
> na.omit(df)
  id  x   y SixToOne caps
1  a  1 214        6    A
2  b  2 215        5    B
3  c  3 216        4    C
4  d  4 217        3    D
5  e  5 218        2    E
6  f  6 219        1    F
8  g 11  42        0    G
```

We remove the row we don't want:

```
> df <- na.omit(df)
> df
  id  x   y SixToOne caps
1  a  1 214        6    A
2  b  2 215        5    B
3  c  3 216        4    C
4  d  4 217        3    D
5  e  5 218        2    E
6  f  6 219        1    F
8  g 11  42        0    G
```

#### Combining data frames

Use `rbind()` to row-bind dataframes:

```
> df2 <- rbind(df, df)
> df2
   id  x   y SixToOne caps
1   a  1 214        6    A
2   b  2 215        5    B
3   c  3 216        4    C
4   d  4 217        3    D
5   e  5 218        2    E
6   f  6 219        1    F
8   g 11  42        0    G
11  a  1 214        6    A
21  b  2 215        5    B
31  c  3 216        4    C
41  d  4 217        3    D
51  e  5 218        2    E
61  f  6 219        1    F
81  g 11  42        0    G
```

What has happened to the rownames? (ask learners)

`R` tries to ensure that we have unique names for rows - they're strings, not numbers. *Important* to note that the row names are names - the sequential numbering is a convenience, but it is not really a numerical system.

We can restore 'sequential numbering' names by resetting the row names:

```
> rownames(df2)
 [1] "1"  "2"  "3"  "4"  "5"  "6"  "8"  "11" "21" "31" "41" "51" "61" "81"
> rownames(df2) <- NULL
> rownames(df2)
 [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10" "11" "12" "13" "14"
> df2
   id  x   y SixToOne caps
1   a  1 214        6    A
2   b  2 215        5    B
3   c  3 216        4    C
4   d  4 217        3    D
5   e  5 218        2    E
6   f  6 219        1    F
7   g 11  42        0    G
8   a  1 214        6    A
9   b  2 215        5    B
10  c  3 216        4    C
11  d  4 217        3    D
12  e  5 218        2    E
13  f  6 219        1    F
14  g 11  42        0    G
```

### Challenge 2

10min?

Example solution

```
my_df <- data.frame(first_name = "Software", last_name = "Carpentry", age = 17)
my_df <- rbind(my_df, list("Jane", "Smith", 29))
my_df <- rbind(my_df, list(c("Jo", "John"), c("White", "Lee"), c(23, 41)))
my_df <- cbind(my_df, confused = c(FALSE, FALSE, TRUE, FALSE))
```

### Reading in data

Now is a good point to mention that, mostly, we may not be creating data frames by hand, but reading them in from well-formatted analysis/data collection output.

* Rather than dropping to the shell, use the `Files` tab to inspect the data in `data/gapminder-FiveYearData.csv` - this opens in the editor window
* The file extension is correct - this is comma-separated data (note that for, e.g. Euro data this might be a poor choice…)
* Note that there's a header line

Use `read.table` to read data in. Look at the help page. Lots of options, reflecting that there are many ways that data might be formatted. **ALWAYS INSPECT THE DATA FILE**

* can use tab-completion in the RStudio shell for filenames
* introduces `head()` - analogous to shell

```
> gapminder <- read.table(file="data/gapminder-FiveYearData.csv", header=TRUE, sep=",")
> head(gapminder)
      country year      pop continent lifeExp gdpPercap
1 Afghanistan 1952  8425333      Asia  28.801  779.4453
2 Afghanistan 1957  9240934      Asia  30.332  820.8530
3 Afghanistan 1962 10267083      Asia  31.997  853.1007
4 Afghanistan 1967 11537966      Asia  34.020  836.1971
5 Afghanistan 1972 13079460      Asia  36.088  739.9811
6 Afghanistan 1977 14880372      Asia  38.438  786.1134
```

For reproducibility, we're going to work in a script file.

* Create the `scripts` subdirectory

### Challenge 3

10min?

* `File->New File->R script`
* put code in file to read data (NEWLINE at end of file):

```
# Read data from file
gapminder <- read.table(file="data/gapminder-FiveYearData.csv", header=TRUE, sep=",")
```

* add the file to the Git repo in the Git tab
* commit

### Using dataframes

This is a revision example set

```
> class(gapminder)
[1] "data.frame"
> typeof(gapminder)
[1] "list"
```

#### Challenge 4

10min?

```
> typeof(gapminder$country)
[1] "integer"
> typeof(gapminder$year)
[1] "integer"
> typeof(gapminder$pop)
[1] "double"
> typeof(gapminder$continent)
[1] "integer"
> typeof(gapminder$lifeExp)
[1] "double"
> typeof(gapminder$gdpPercap)
[1] "double"
```

The `country` and `continent` columns are integers because they're really factors:

```
> class(gapminder$country)
[1] "factor"
> class(gapminder$continent)
[1] "factor"
```

`R` is treating these values as *categorical* data (check again whether learners understand the difference between categorical and continuous data) - this is appropriate for statistical modelling.

### Using dataframes

Looking at the strucure of `gapminder`

```
> str(gapminder)
'data.frame':	1704 obs. of  6 variables:
 $ country  : Factor w/ 142 levels "Afghanistan",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ year     : int  1952 1957 1962 1967 1972 1977 1982 1987 1992 1997 ...
 $ pop      : num  8425333 9240934 10267083 11537966 13079460 ...
 $ continent: Factor w/ 5 levels "Africa","Americas",..: 3 3 3 3 3 3 3 3 3 3 ...
 $ lifeExp  : num  28.8 30.3 32 34 36.1 ...
 $ gdpPercap: num  779 821 853 836 740 ...
```

* Note that we have *observations* and *variables* - should be familiar to anyone who's done PCA.
* Column names are given, with type and summary of data

We can get column names directly:

```
> colnames(gapminder)
[1] "country"   "year"      "pop"       "continent" "lifeExp"   "gdpPercap"
```

### Understanding how lists are used in function output

I think this skips ahead too far, too fast in terms of function syntax to be anything other than an example, and may confuse those who don't understand the statistics, already.

* data frames are powerful organises of data
* can run linear regression directly on the columns of a dataframe:

```
> reg <- lm(lifeExp ~ year, data=gapminder)
> reg
Call:
lm(formula = lifeExp ~ year, data = gapminder)
Coefficients:
(Intercept)         year  
  -585.6522       0.3259  
> summary(reg)
Call:
lm(formula = lifeExp ~ year, data = gapminder)
Residuals:
    Min      1Q  Median      3Q     Max 
-39.949  -9.651   1.697  10.335  22.158 
Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) -585.65219   32.31396  -18.12   <2e-16 ***
year           0.32590    0.01632   19.96   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
Residual standard error: 11.63 on 1702 degrees of freedom
Multiple R-squared:  0.1898,	Adjusted R-squared:  0.1893 
F-statistic: 398.6 on 1 and 1702 DF,  p-value: < 2.2e-16 
```


## Lesson 6: Subsetting data

There are several ways to subset data objects in `R`. 

* index
* name
* comparison operators (logical)

We'll start with a simple atomic vector as our example

```
> x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
> names(x) <- c('a', 'b', 'c', 'd', 'e')
> x
  a   b   c   d   e 
5.4 6.2 7.1 4.8 7.5
```

### Subsetting by indices

Each position in a vector is numbered/indexed sequentially. We use this number in square brackets to get a single element:

```
> x[1]
  a 
5.4 
> x[4]
  d 
4.8 
```

If we use a vector of indices, we get multiple elements:

```
> x[c(1,3)]
  a   c 
5.4 7.1 
> x[c(1,1,3,3,4)]
  a   a   c   c   d 
5.4 5.4 7.1 7.1 4.8 
```

We can slice, like in Python:

```
> x[1:4]
  a   b   c   d 
5.4 6.2 7.1 4.8 
```

`R` uses 1-based numbering (unlike Python) - asking for the zero index gives an empty vector:

```
> x[0]
named numeric(0)
```

Asking for an index that doesn't exist gives `NA` (special value):

```
> x[123]
<NA> 
  NA
```

#### Skipping/removing elements

Using a *negative* index means 'leave this one out':

```
> x[-2]
  a   c   d   e 
5.4 7.1 4.8 7.5 
> x[c(-1,-5)]
  b   c   d 
6.2 7.1 4.8 
```

If you want to negate a slice, use

```
> x[-(1:3)]
  d   e 
4.8 7.5 
> x[-1:3]
Error in x[-1:3] : only 0's may be mixed with negative subscripts
> -1:3
[1] -1  0  1  2  3
> 1:3
[1] 1 2 3
> -(1:3)
[1] -1 -2 -3
```

The errors happen because `:` is really a function, so we want to apply the negative sign to the output of the function, not its inputs.

So far we have *skipped* elements, but the original vector is unchanged:

```
> x
  a   b   c   d   e 
5.4 6.2 7.1 4.8 7.5 
```

If you want to *remove* elements, the results of skipping need to be assigned back to the variable:

```
> x
  a   b   c   d   e 
5.4 6.2 7.1 4.8 7.5 
> x[-4]
  a   b   c   e 
5.4 6.2 7.1 7.5 
> x
  a   b   c   d   e 
5.4 6.2 7.1 4.8 7.5 
> x <- x[-4]
> x
  a   b   c   e 
5.4 6.2 7.1 7.5 
```

### Challenge 1

10min?

```
x[2:4] 
x[-c(1,5)]
x[c("b", "c", "d")]
x[c(2,3,4)]
```


### Subsetting by logic

'Logic' here means `TRUE` and `FALSE` values. We subset values using a *mask* of `TRUE` where we want the element, and `FALSE` where we do not.

```
> mask = c(TRUE, FALSE, TRUE, FALSE, TRUE)
> mask
[1]  TRUE FALSE  TRUE FALSE  TRUE
> x
  a   b   c   d   e 
5.4 6.2 7.1 4.8 7.5 
> x[mask]
  a   c   e 
5.4 7.1 7.5 
```

If we use a mask vector that is shorter than the vector we're subsetting, the mask is cycled:

```
> x
  a   b   c   d   e 
5.4 6.2 7.1 4.8 7.5 
> x[c(TRUE, FALSE)]
  a   c   e 
5.4 7.1 7.5 
> x[c(TRUE, TRUE, FALSE)]
  a   b   d   e 
5.4 6.2 4.8 7.5 
```

We can use comparison operators to generate the logical subset:

```
> x > 7
    a     b     c     d     e 
FALSE FALSE  TRUE FALSE  TRUE 
> x[x > 7]
  c   e 
7.1 7.5
```

Logical operators can be combined to produce more complex subsetting:

* `|`, `&`, `!`

```
> !(x > 7) 
    a     b     c     d     e 
 TRUE  TRUE FALSE  TRUE FALSE 
> x[!(x > 7) ]
  a   b   d 
5.4 6.2 4.8 
> x < 5 | x > 7
    a     b     c     d     e 
FALSE FALSE  TRUE  TRUE  TRUE 
> x[x < 5 | x > 7]
  c   d   e 
7.1 4.8 7.5 
```

Several useful functions return logical values:

```
> is.na(x)
    a     b     c     d     e 
FALSE FALSE FALSE FALSE FALSE 
> is.nan(x)
    a     b     c     d     e 
FALSE FALSE FALSE FALSE FALSE 
> is.finite(x)
   a    b    c    d    e 
TRUE TRUE TRUE TRUE TRUE 
```

#### Challenge 2

5min

```
> x < 7 & x > 4
    a     b     c     d     e 
 TRUE  TRUE FALSE  TRUE FALSE 
> x[x < 7 & x > 4]
  a   b   d 
5.4 6.2 4.8 
```

### Subsetting by name

**We do this after logical subsets, because it's a smoother curve of explanation - some of the name subset work depends on the logical subsets**

If elements have a name, we can identify them using this name, rather than by index

```
> x[c('a', 'c')]
  a   c 
5.4 7.1 
```

* useful because names tend to be consistently attached to data, though the position of data may vary
* not so easy to skip or remove elements - for this we need logical or index subsetting


#### Logical subsets by single name

```
> names(x) == 'a'
[1]  TRUE FALSE FALSE FALSE FALSE
> x[names(x) == 'a']
  a 
5.4 
> x[names(x) != 'a']
  b   c   d   e 
6.2 7.1 4.8 7.5 
```

#### Indexing subsets by single name

The `which()` function returns a vector of indices corresponding to 

```
> names(x) == 'a'
[1]  TRUE FALSE FALSE FALSE FALSE
> which(names(x) == 'a')
[1] 1
> x[which(names(x) == 'a')]
  a 
5.4 
> x[-which(names(x) == 'a')]
  b   c   d   e 
6.2 7.1 4.8 7.5 
> which(names(x) != 'a')
[1] 2 3 4 5
> x[which(names(x) != 'a')]
  b   c   d   e 
6.2 7.1 4.8 7.5 
```

#### Subsetting by multiple names

Subsetting 'postively', by selecting specific names is easy:

```
> x[c('a', 'c')]
  a   c 
5.4 7.1 
```

Skipping or removing is not:

```
> x[-c('a','c')]
Error in -c("a", "c") : invalid argument to unary operator
> x[!c('a','c')]
Error in !c("a", "c") : invalid argument type
```

* we can't use `==`

```
> names(x) == c('a', 'c')
[1]  TRUE FALSE FALSE FALSE FALSE
Warning message:
In names(x) == c("a", "c") :
  longer object length is not a multiple of shorter object length
> x[names(x) == c('a', 'c')]
  a 
5.4 
Warning message:
In names(x) == c("a", "c") :
  longer object length is not a multiple of shorter object length
```


* we need to use logical or index subsetting, and the special `%in%` function:

```
> 'a' %in% c('a', 'c')
[1] TRUE
> 'b' %in% c('a', 'c')
[1] FALSE
```

Giving, with logical masking:

```
> names(x) %in% c('a', 'c')
[1]  TRUE FALSE  TRUE FALSE FALSE
> x[names(x) %in% c('a', 'c')]
  a   c 
5.4 7.1 
> x[!(names(x) %in% c('a', 'c'))]
  b   d   e 
6.2 4.8 7.5 
```

and with indexing:

```
> which(names(x) %in% c('a', 'c'))
[1] 1 3
> x[which(names(x) %in% c('a', 'c'))]
  a   c 
5.4 7.1 
> x[-which(names(x) %in% c('a', 'c'))]
  b   d   e 
6.2 4.8 7.5 
```

#### Repeated names

```
> x <- 1:3
> names(x) <- c('a', 'a', 'a')
> x
a a a 
1 2 3 
```

What happens if I issue `x['a']`? (ask learners) MCQ?

```
> x['a']
a 
1 
> x[names(x) == 'a']
a a a 
1 2 3 
```

* *Defensive programming*: direct indexing isn't always safe!

### Subsetting factors

Works the same way as for vectors:

```
> f <- factor(c('a', 'a', 'b', 'c', 'c', 'd'))
> f
[1] a a b c c d
Levels: a b c d
```

* factors are not names:

```
> names(f)
NULL
> f['a']
[1] <NA>
Levels: a b c d
```

* logical indexing

```
> f == 'a'
[1]  TRUE  TRUE FALSE FALSE FALSE FALSE
> f[f == 'a']
[1] a a
Levels: a b c d
> f %in% c('b', 'c')
[1] FALSE FALSE  TRUE  TRUE  TRUE FALSE
> f[f %in% c('b', 'c')]
[1] b c c
Levels: a b c d
```

* slicing

```
> f[1:3]
[1] a a b
Levels: a b c d
```

* Skipping removes the element, but not the level of the factor:

```
> f[-4]
[1] a a b c d
Levels: a b c d
> f[-3]
[1] a a c c d
Levels: a b c d
```


