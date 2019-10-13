setwd("C:/Users/dudns_pk7j4bd/Desktop")
library(tidyverse)
df <- read_csv('pos_normalized.csv')
df2 <- df[5:61]
df_scaled <- scale(df2)
df.dist = dist(df_scaled)
df.mds = cmdscale(df.dist, k=2)


library(plotly)
p <- plot_ly(df, x = df.mds[,1] , y = df.mds[,2], text = df$title, alpha=0.6,
             mode = "markers+text", color = df$media,colors = c("#39A87B", "#DB4949"), symbol=df$genre, marker = list(size = 11)) 

p <- layout(p, title = "PCA of Netflix and Naver synopses", 
            xaxis = list(title = "PC 1"),
            yaxis = list(title = "PC 2"))

p

htmlwidgets::saveWidget(as_widget(p), "PCA_plotly.html")
