#!/usr/bin/env Rscript

library(ggplot2)

x <- read.csv("~/logs//chia_netspace.log", colClasses = c("POSIXct", "numeric"))

de <- x[nrow(x), 2] - x[1, 2]
dt <- as.numeric(difftime(x[nrow(x), 1], x[1, 1], units = "weeks"))
dx <- de/dt
perc <- 100 * dx/x[nrow(x), 2]

p <- ggplot(x, aes(date, EiB)) +
      geom_line() +
      annotate("text", x = min(x[,1]), y = max(x[,2]),
               label = sprintf("Growth Rate = %0.1f%% per week", perc),
               hjust = "left", vjust = "top") +
      labs(title="Chia Network Space Growth", x = "Time", y = "EiB")

ggsave(filename="~/netspace.pdf", plot=p, width = 8, height = 4)

