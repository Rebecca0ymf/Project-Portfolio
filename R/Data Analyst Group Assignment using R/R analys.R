# setwd('/Users/goodfella/Desktop/xy220521')

data <- read.csv("C:/Users/lenovo/Downloads/CompleteDataset.csv", header = T)
EventDataset <- read.csv("C:/Users/lenovo/Downloads/EventDataset/EventDataset.csv", header = T)


library(tidyverse)
library(lubridate)

head(EventDataset)

newData <- data %>%
  mutate_at(.vars = vars(value), .fun = as.numeric)
#Get only numeric values
numeric_data <- subset(newData, subset = data, Type == "N")
numeric_data <- transform(numeric_data, value = as.numeric(value))
class(numeric_data$value)

t.newData <- newData %>% 
  mutate(time = str_extract(timestamp,' .+') %>% str_trim() %>% hms(),
         date = str_extract(timestamp,'.+ ') %>% str_trim() %>% as.Date(format = '%Y-%m-%d'))

# transform colum to list 
lnewdata <- t.newData %>% 
  select(variable,value,timestamp) %>% 
  pivot_wider(id_cols = timestamp,
              names_from = variable,
              values_from = value)

#yeay we got it. Finally
#Lets get the batch names
dbatch <- split(newData, newData$batch)
dbatchevent <- split(EventDataset, EventDataset$batch)


#selcet the data
{
  DP0003 <- filter(newData, variable == "DP0003") #Rotor speed  rpm (act)
  d.DP0003 <- filter(t.newData, variable == "DP0003")
  DP0006 <- filter(newData, variable == "DP0006") #main compr.force MV kN(set) Stat.1
  d.DP0006 <- filter(t.newData, variable == "DP0006")
  DP0007 <- filter(newData, variable == "DP0007") #main compr.force MV kN(act) stat.1
  DP0010 <- filter(newData, variable == "DP0010") #pre compr.force MV kN(set) Stat.1
  d.DP0010 <- filter(t.newData, variable == "DP0010")
  DP0011 <- filter(newData, variable == "DP0011") #pre compr.force MV kN(act) Stat.1
  #Good production(set):DP0012
  #good production(act):DP0013
  #bad production(act):DP0014
}

#change different value of variables to different name(retorspeed/maincompr/precompr)
{
  #DP0003 <- rename(DP0003, rotorspeed = value)
  #DP0006 <- rename(DP0006, maincompr = value)
  #DP0007 <- rename(DP0007, maincompr = value)
  #DP0010 <- rename(DP0010, precompr = value)
  #DP0011 <- rename(DP0011, precompr = value)
  # plyr::rename(DP0006,C(value = "rotorspeed"))
}

#dp0007.0010 <- right_join(d.DP0006, d.DP0010, by = "timestamp")

#library(esquisse)
#esquisse::esquisser()

#the plot for Rotor Speed
{d.DP0003 %>%
    filter(timestamp >= "2021-08-03 03:54:57" & timestamp <= "2021-08-06 10:28:07") %>%
    ggplot() +
    aes(x = timestamp, y = value) +
    geom_line(size = 0.5, colour = "#5FC35F") +
    labs(
      x = "Time",
      y = "Rotor Speed(rpm)",
      title = "Rotor Speed"
    ) +
    theme_classic()
}


library(ggplot2)
{d.DP0006 %>%
    filter(timestamp >= "2021-08-03 03:54:57" & timestamp <= "2021-08-06 10:28:07") %>%
    ggplot() +
    aes(x = timestamp, y = value) +
    geom_line(size = 0.5, colour = "#112446") +
    theme_minimal()}


#ANOVA 

# try to get the timestamps based on batches
# compare different batches
# compare good batches and bad batches under the same set.

#library(tidyverse)
#install.packages("patchwork")
library(patchwork)
#install.packages("gapminder")
library(gapminder)
#install.packages("forcats")
library(forcats)
#install.packages("ggdendro")   
library(ggdendro)   

{d.DP0006 %>%
    filter(timestamp >= "2021-08-03 03:54:57" & timestamp <= "2021-08-06 10:28:07") %>%
    filter(batch %in% 
             "OSDI Placebo Rampe 1") %>%
    ggplot() +
    aes(x = timestamp, y = value) +
    geom_line(size = 0.5, colour = "#112446") +
    theme_minimal()}

{d.DP0006 %>%
    filter(timestamp >= "2021-08-03 03:54:57" & timestamp <= "2021-08-06 10:28:07") %>%
    filter(batch %in% 
             "OSDI Manitol Rampe 2") %>%
    ggplot() +
    aes(x = timestamp, y = value) +
    geom_line(size = 0.5, colour = "#112446") +
    theme_minimal()}

{d.DP0006 %>%
    filter(timestamp >= "2021-08-03 03:54:57" & timestamp <= "2021-08-06 10:28:07") %>%
    filter(batch %in% 
             "OSDI M/P Rampe 3") %>%
    ggplot() +
    aes(x = timestamp, y = value) +
    geom_line(size = 0.5, colour = "#112446") +
    theme_minimal()}

{d.DP0003 %>%
    filter(timestamp >= "2021-08-03 03:54:57" & timestamp <= "2021-08-06 10:28:07") %>%
    filter(batch %in% 
             "OSDI M/P Rampe 3") %>%
    ggplot() +
    aes(x = timestamp, y = value) +
    geom_line(size = 0.5, colour = "#112446") +
    theme_minimal()
}
#batch06 <- split(DP0006, DP0006$batch)
#timestamp <- split(DP0006,DP0006$timestamp)
library(stringr)
library(dplyr)

#plot the DP0006 and DP0007 ����ͼ��
bind_rows(DP0006,DP0007) %>% 
  mutate(date = str_extract(timestamp,'.+ ') %>% str_remove(' '),
         date = as.Date(date,format = '%Y-%m-%d'),
         dayofweek = weekdays(date),
         timestamp = as.POSIXct(timestamp)) %>% 
  ggplot(aes(x = timestamp,y = value,group = variable,color = variable)) +
  geom_point(size = 0.8) +
  scale_x_datetime(date_labels = '%a') +
  theme_minimal()

midwest <- library(midwest)

#change the language enviroment
Sys.getlocale()
Sys.setenv(LANG="en")
Sys.setlocale("LC_MESSAGES", 'en_GB.UTF-8')
Sys.setlocale("LC_ALL","English")
Sys.setenv(LANG = "en_US.UTF-8")

# ANOVA
{
  Rampe2132 <- filter(DP0007, batch == "OSDI M/P Rampe2.1"| batch == "OSDi M/P Rampe 23")
  R2132_4 <- filter(DP0007, timestamp %in% c("2021-08-06 07:00:05.523000000", "2021-08-06 07:02:05.917000000", 
                                             "2021-08-06 07:03:06.117000000", "2021-08-06 07:04:06.307000000", 
                                             "2021-08-06 07:05:06.490000000", "2021-08-06 07:06:06.667000000", 
                                             "2021-08-06 07:07:06.853000000", "2021-08-06 07:08:07.057000000", 
                                             "2021-08-06 07:09:07.300000000", "2021-08-06 07:10:07.517000000", 
                                             "2021-08-06 07:11:07.723000000", "2021-08-06 07:12:07.907000000", 
                                             "2021-08-06 07:13:08.093000000", "2021-08-06 07:14:08.267000000",
                                             "2021-08-03 13:20:37.520000000", "2021-08-03 13:21:37.703000000", 
                                             "2021-08-03 13:22:37.913000000", "2021-08-03 13:23:38.097000000", 
                                             "2021-08-03 13:24:38.267000000", "2021-08-03 13:25:38.443000000", 
                                             "2021-08-03 13:26:38.673000000", "2021-08-03 13:27:38.867000000",
                                             "2021-08-03 13:28:39.050000000", "2021-08-03 13:29:39.253000000", 
                                             "2021-08-03 13:30:39.460000000", "2021-08-03 13:31:39.657000000"))
  a_2.132 <- Rampe2132[,c("value","batch")]
}
  
  #scattered distribution map
  if(!require(devtools)) 
    #install.packages("devtools")
    library(devtools)
  devtools::install_github("kassambara/ggpubr")
  #install.packages("ggpubr")
  library(ggpubr)
  {ggline(R2132_4, x = "batch", y = "value",
          title = "MainCompr (Set Value 4)",
          add=c("mean_se","jitter"),
          order=c("OSDI M/P Rampe2.1","OSDi M/P Rampe 23" ),
          ylab = "value",xlab="batch")}
  #normality test
  {R2132_4$batch <- as.factor(R2132_4$batch)
    levels(R2132_4$batch)
    shapiro.test(R2132_4$value)
    hist(R2132_4$value)
    # group_data <- split(R2132_4[,1],R2132_4[,2])
    #unlist(lapply(group_data,function(x){
    # shapiro.test(x)$p.value}))
    library(car)
    #qqplot(group_data[[1]]) #qqplot
  }
  R2132_4$batch <- ordered(R2132_4$batch,
                           levels = c("OSDI M/P Rampe2.1","OSDi M/P Rampe 23"))
  library(dplyr)
  #ANOVA
  {
    #summarise the data
    {
      group_by(R2132_4, batch) %>%
        summarise(
          count = n(),
          mean = mean(value, na.rm = TRUE),
          sd = sd(value, na.rm = TRUE)
        )}
    ## Box plots
    {
      require(cowplot)
      require(tidyverse)
      require(ggplot2)
      require(ggsci)
      require(ggpubr)
      sp <- ggboxplot(R2132_4, x = "batch", y = "value", 
                      color = "batch", palette = c("#00AFBB", "#E7B800"),
                      order = c("OSDI M/P Rampe 3","OSDi M/P Rampe 23"),
                      title = "Maincompr (Set Value 4)",
                      ylab = "Value", xlab = "Batch",
                      width = 0.8)
      sp + ylim(0, 8)
    }
    #Create a boxplot with pValue
    p <- ggboxplot(R2132_4, x = "batch", y = "value",
                   title = "Maincompr (Set Value 4)",
                   color = "batch", palette = "jama",
                   add = "jitter")
    #  Add p-value
    p + stat_compare_means()
    
    # Mean plots
    {# Plot valu by batch
      # Add error bars: mean_se
      # (other values include: mean_sd, mean_ci, median_iqr, ....)
      library("ggpubr")
      ggline(R2132_4, x = "batch", y = "value", 
             add = c("mean_se", "jitter"),
             point.color = "#00AFBB",
             order = c("OSDI M/P Rampe2.1","OSDi M/P Rampe 23"),
             title ="MainCompr Mean plots (Set Value 4)",
             ylab = "value", xlab = "batch")
      # Box plot
      boxplot(value ~ batch, data = R2132_4,
              xlab = "batch", ylab = "value",
              frame = FALSE, col = c("#00AFBB", "#E7B800"),
              main ="MainCompr Box plot(Set Value 4)")
      aggregate(value ~ batch,
                data = R2132_4,
                function(x) round(c(mean = mean(x), sd = sd(x)), 2))
    }
    # plotmeans
    #install.packages("gplots")
    library(gplots)
    plotmeans(value ~ batch, data = R2132_4, frame = FALSE,
              xlab = "batch", ylab = "value",
              main="MainCompr Means(Set Value 4)") 
    # Compute the analysis of variance
    res.aov <- aov(value ~ batch, data = R2132_4)
    # Summary of the analysis
    temp = summary(res.aov)
    write.csv(temp[[1]],'temp.csv')
  
    #TukeyHSD(res.aov)
    #install.packages("remotes")
    #remotes::install_github("easystats/report")
    report(res.aov)
    
    
    # Homogeneity of variances
    plot(res.aov, 1)
  }

library(lubridate)
library(tsibble)
#install.packages("feasts")
library(feasts)
#install.packages("fable")
library(fable)
devtools::install_github('cttobin/ggthemr')  
#install.packages("ggthemr")
library(ggthemr)
#install.packages("forecast")
library(forecast)
library(cowplot)


  {
    #Set Value 8
    R2132_8 <- filter(DP0007, timestamp %in% c("2021-08-06 06:55:04.557000000", "2021-08-06 06:56:04.743000000", "2021-08-06 06:57:04.927000000", 
                                               "2021-08-06 06:58:05.143000000", "2021-08-06 06:59:05.300000000", "2021-08-06 07:22:09.753000000", 
                                               "2021-08-06 07:23:09.897000000", "2021-08-06 07:24:10.160000000", "2021-08-06 07:25:10.347000000",
                                               "2021-08-06 07:26:10.517000000", "2021-08-06 07:27:10.737000000", "2021-08-06 07:28:10.927000000",
                                               "2021-08-06 07:29:11.113000000", "2021-08-06 07:30:11.303000000", "2021-08-06 07:32:11.647000000",
                                               "2021-08-06 07:33:11.847000000", "2021-08-06 07:34:12.023000000", "2021-08-06 07:35:12.223000000",
                                               "2021-08-06 07:36:12.397000000", "2021-08-06 07:37:12.583000000", "2021-08-06 07:38:12.790000000",
                                               "2021-08-03 13:43:42.037000000", "2021-08-03 13:44:42.223000000", "2021-08-03 13:45:42.413000000",
                                               "2021-08-03 13:46:42.570000000", "2021-08-03 13:47:42.710000000", "2021-08-03 13:48:42.870000000",
                                               "2021-08-03 13:49:43.053000000", "2021-08-03 13:50:43.240000000", "2021-08-03 13:51:43.440000000",
                                               "2021-08-03 13:52:43.660000000", "2021-08-03 13:53:43.830000000", "2021-08-03 13:54:44.003000000"
    ))
    
    #install.packages("ggpubr")
    #library(ggpubr)
    {ggline(R2132_8, x = "batch", y = "value",
            title = "MainCompr (Set Value 8)",
            add=c("mean_se","jitter"),
            order=c("OSDI M/P Rampe2.1","OSDi M/P Rampe 23" ),
            ylab = "value",xlab="batch")}
    R2132_8$batch <- ordered(R2132_8$batch,
                             levels = c("OSDI M/P Rampe2.1","OSDi M/P Rampe 23"))
    #ANOVA
    {
      #summarise the data
      {
        group_by(R2132_8, batch) %>%
          summarise(
            count = n(),
            mean = mean(value, na.rm = TRUE),
            sd = sd(value, na.rm = TRUE))
      }
      ## Box plots
      {
        require(cowplot)
        require(tidyverse)
        require(ggplot2)
        require(ggsci)
        require(ggpubr)
        sp <- ggboxplot(R2132_8, x = "batch", y = "value", 
                        color = "batch", palette = c("#00AFBB", "#E7B800"),
                        order = c("OSDI M/P Rampe2.1","OSDi M/P Rampe 23"),
                        title = "Maincompr (Set Value 8)",
                        ylab = "Value", xlab = "Batch",
                        width = 0.8)
        
      }
      #Create a boxplot with pValue
      p <- ggboxplot(R2132_8, x = "batch", y = "value",
                     title = "Maincompr (Set Value 8)",
                     color = "batch", palette = "jama",
                     add = "jitter")
      #  Add p-value
      p + stat_compare_means()
      
      # Mean plots
      {# Plot valu by batch
        # Add error bars: mean_se
        # (other values include: mean_sd, mean_ci, median_iqr, ....)
        #library("ggpubr")
        ggline(R2132_8, x = "batch", y = "value", 
               add = c("mean_se", "jitter"),
               color = "gray",
               point.color = "#00AFBB",
               order = c("OSDI M/P Rampe2.1","OSDi M/P Rampe 23"),
               title ="MainCompr Mean plots (Set Value 8)",
               ylab = "value", xlab = "batch")
        # Box plot
        boxplot(value ~ batch, data = R2132_8,
                xlab = "batch", ylab = "value",
                frame = FALSE, col = c("#00AFBB", "#E7B800"),
                main ="MainCompr Box plot(Set Value 8)")
      }
      # plotmeans
      #install.packages("gplots")
      #library(gplots)
      plotmeans(value ~ batch, data = R2132_8, frame = FALSE,
                xlab = "batch", ylab = "value",
                main="MainCompr Means(Set Value 8)") 
      # Compute the analysis of variance
      aov8 <- aov(value ~ batch, data = R2132_8)
      # Summary of the analysis
      summary(aov8)
      #TukeyHSD(res.aov)
      #install.packages("remotes")
      #remotes::install_github("easystats/report")
      library("report") # Load the package every time you start R
      
      report(aov8)
      
      
      # Homogeneity of variances
      plot(aov8, 1)
    }
    
  }
  
  
  
  
  {
    sink("test.txt")
    data.sum <- group_by(R2132_4, batch) %>%summarise(
      count = n(),
      mean = mean(value, na.rm = TRUE),
      sd = sd(value, na.rm = TRUE)
    )
    summary(data.sum)
    summary(res.aov)
    sink(NULL)
  }
  library(stringr)
  #remove(iris)
  
  
  
  # At least one type has significantly different mean.
  # But, how many and which one? 
  
  #PCA
  {
    #install.packages("FactoMineR")
    library(FactoMineR)
    #install.packages("factoextra")
    library(factoextra)
    
    
    
  }

language = EN
