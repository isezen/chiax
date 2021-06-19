
library(xts)
library(ggplot2)
library(lubridate)

options(digits.secs=3)
x = read.csv('rt.csv', header = FALSE,
             col.names = c("date", "elig", "found", "rt", "np"),
             colClasses = c("character", "numeric", "numeric",
                            "numeric", "numeric"))

x$date <- as.POSIXct(x$date, format = "%Y-%m-%dT%H:%M:%OS", tz = "UTC")
x <- x[complete.cases(x),]
x$type = format(x$date, "%Y-%m-%d")

ggplot(x, aes(x = type, y = elig)) + geom_boxplot() + geom_line(aes(y=np))


ggplot(x, aes(x=factor(elig), y = rt)) + geom_boxplot()
# x <- xts(x[,-1], x[,1])

# x <- period.apply(x, endpoints(x, "hours"), mean)

# x <- fortify(x)

# ggplot(x, aes(x = Index, y = elig)) +
#     geom_line()
