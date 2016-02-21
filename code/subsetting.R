# This is a comment
# this file explores subsetting.
x <- c(5.4, 6.2, 7.3, 4.1, 5.5) # this is a vector
names(x) <- letters[1:5]
x[1]
x[5]
x[c(1,3)]
x[1:4]
x[5:1]
x[7]
x[0]
x[!(names(x) == "d")]
x[-which(names(x) == "d")]

# subsetting factors
f <- factor(c("a","b","c","b","b","a"))
levels(f)
f[f == 'a']
f[3:5]

# subsetting matrices
y[2, 4]
y[2, ]
y[ , 4:5]
y[ , 5, drop=FALSE]
y[2,y[2,]>5]

# subsetting lists
xlist[2]
length(xlist["b"])
class(xlist["b"])
class(xlist[["a"]])
xlist[1:2]


