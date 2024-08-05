#### read in data

heartAt.df <- read.csv("Heart Attack.csv")
str(heartAt.df)  # structure of the data frame
head(heartAt.df, 9)  #  show first 9 records
tail(heartAt.df)   # default, show last 6 records
View(heartAt.df)

#### summary statistics
summary(heartAt.df)  # find summary statistics for each column

# better summary statistics output 

library(dplyr)
library(psych)

describe(heartAt.df)

#### remove observations with missing values 
heartAt.df <- na.omit(heartAt.df)
str(heartAt.df)  # structure of the data frame

describe(heartAt.df)



### Draw Histogram ###
## histogram of troponin
hist(heartAt.df$troponin, xlab = "troponin")


### Draw Histogram ###
## histogram of kcm
hist(heartAt.df$kcm, xlab = "kcm")


# alternative plot with ggplot

library(ggplot2)
ggplot(heartAt.df) + geom_histogram(aes(x = troponin) )



### Draw Histograms ###
# histogram of glucose with smoothed density

library(plotly)
p <- ggplot(heartAt.df, aes(x=glucose)) +
  geom_histogram(aes(y = ..density..), binwidth=density(heartAt.df$glucose)$bw) +
  geom_density(fill="yellow", alpha = 0.2)

ggplotly(p)

### Draw Histograms ###
library(ggplot2)

# Set a common theme for all plots
theme_common <- theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Create histograms or density plots for some of the input variable colored by 'class'
ggplot(heartAt.df, aes(x = age, fill = class)) +
  geom_histogram(binwidth = 5, position = "dodge", alpha = 0.7) +
  labs(title = "Distribution of Age by Class") +
  theme_common


ggplot(heartAt.df, aes(x = pressurehight, fill = class)) +
  geom_density(alpha = 0.7) +
  labs(title = "Distribution of Pressure High by Class") +
  theme_common

ggplot(heartAt.df, aes(x = pressurelow, fill = class)) +
  geom_density(alpha = 0.7) +
  labs(title = "Distribution of Pressure Low by Class") +
  theme_common

ggplot(heartAt.df, aes(x = glucose, fill = class)) +
  geom_density(alpha = 0.7) +
  labs(title = "Distribution of Glucose by Class") +
  theme_common




### Draw Scatterplot  ###

library(ggplot2)
library(plotly)

# Set a common theme for all plots
theme_common <- theme_minimal()


# Scatter plot for glucose vs. pressurelow
ggplot(heartAt.df, aes(x = glucose, y = pressurelow, color = class)) +
  geom_point(alpha = 0.7) +
  labs(title = "Scatter Plot: glucose vs. Pressure Low", x = "glucose", y = "Pressure Low") +
  theme_common

# add linear regression fit
p <- ggplot(heartAt.df, aes(x = glucose, y = pressurelow, color = class))  +
  geom_point(shape=1) +    # Use hollow circles
  #   geom_smooth(method=lm, se=TRUE)    # Add linear regression line
  geom_smooth()            # Add a loess smoothed fit curve with confidence region
# loess (locally estimated scatterplot smoothing)
# lowess (locally weighted scatterplot smoothing)

ggplotly(p)


# Scatter plot for glucose vs. pressurehight
ggplot(heartAt.df, aes(x = glucose, y = pressurehight, color = class)) +
  geom_point(alpha = 0.7) +
  labs(title = "Scatter Plot: Glucose vs. Pressure High", x = "Glucose", y = "Pressure High") +
  theme_common


# add linear regression fit
p <- ggplot(heartAt.df, aes(x = glucose, y = pressurehight, color = class))  +
  geom_point(shape=1) +    # Use hollow circles
  #   geom_smooth(method=lm, se=TRUE)    # Add linear regression line
  geom_smooth()            # Add a loess smoothed fit curve with confidence region
# loess (locally estimated scatterplot smoothing)
# lowess (locally weighted scatterplot smoothing)

ggplotly(p)

# Scatter plot for pressurehight vs. pressurelow
ggplot(heartAt.df, aes(x = pressurehight, y = pressurelow, color = class)) +
  geom_point(alpha = 0.7) +
  labs(title = "Scatter Plot: Pressure High vs. Pressure Low", x = "Pressure High", y = "Pressure Low") +
  theme_common

# add linear regression fit
p <- ggplot(heartAt.df, aes(x = pressurehight, y = pressurelow, color = class))  +
  geom_point(shape=1) +    # Use hollow circles
  #   geom_smooth(method=lm, se=TRUE)    # Add linear regression line
  geom_smooth()            # Add a loess smoothed fit curve with confidence region
# loess (locally estimated scatterplot smoothing)
# lowess (locally weighted scatterplot smoothing)

ggplotly(p)

## matrix scatter plot
# use plot() to generate a matrix plot of variables in columns 2 to 5. 
plot(heartAt.df[,c(1,3,4,5,6,7,8)] )

# plot(heartAt.df)
# alternative, nicer plot (displayed)
library(GGally)
ggpairs(heartAt.df[,c(1,3,4,5,6,7,8)] )




## Boxplot with gender as a factor###


library(ggplot2)

# Select the variables to include in the boxplots
selected_vars <- c("pressurelow", "gender")

# Subset the data frame 
boxplot_data <- heartAt.df[selected_vars]

# Melt the data for easier plotting
library(reshape2)
melted_data <- melt(boxplot_data, id.vars = "gender")

# Create boxplots
boxplot <- ggplot(melted_data, aes(x = variable, y = value, fill = as.factor(gender))) +
  geom_boxplot() +
  labs(title = "Boxplots for pressurelow in Terms of Gender") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_manual(values = c("#a8766D", "#d9dFc4"), name = "Gender", labels = c("Female", "Male"))

# Display the boxplots
print(boxplot)



## Boxplot with gender as a factor###


library(ggplot2)

# Select the variables to include in the box plots
selected_vars <- c("pressurehight", "gender")

# Subset the data frame 
boxplot_data <- heartAt.df[selected_vars]

# Melt the data for easier plotting
library(reshape2)
melted_data <- melt(boxplot_data, id.vars = "gender")

# Create boxplots
boxplot <- ggplot(melted_data, aes(x = variable, y = value, fill = as.factor(gender))) +
  geom_boxplot() +
  labs(title = "Boxplots for pressurehight in Terms of Gender") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_manual(values = c("#b8766D", "#d9dFc4"), name = "Gender", labels = c("Female", "Male"))

# Display the boxplots
print(boxplot)



### Draw two side by side Box plot#####


library(ggplot2)

# Select the variables to include in the box plots
selected_vars <- c("troponin", "class")

# Subset the data frame 
boxplot_data <- heartAt.df[selected_vars]

# Melt the data for easier plotting
library(reshape2)
melted_data <- melt(boxplot_data, id.vars = "class")

# Create box plots
boxplot <- ggplot(melted_data, aes(x = variable, y = value, fill = class)) +
  geom_boxplot() +
  labs(title = "Boxplots for Troponin") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Display the box plots
print(boxplot)

### Draw two side by side Box plot#####


library(ggplot2)

# Select the variables to include in the box plots
selected_vars <- c("age", "class")

# Subset the data frame 
boxplot_data <- heartAt.df[selected_vars]

# Melt the data for easier plotting
library(reshape2)
melted_data <- melt(boxplot_data, id.vars = "class")

# Create box plots
boxplot <- ggplot(melted_data, aes(x = variable, y = value, fill = class)) +
  geom_boxplot() +
  labs(title = "Boxplots for age by class") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Display the box plots
print(boxplot)




### Draw individuals box plot  ###


## box plot of pressurehight  with ggplot

## individual box plot
ggplot(heartAt.df) + geom_boxplot(aes( y = pressurehight) ) 

## box plot of glucose  with ggplot
ggplot(heartAt.df) + geom_boxplot( aes( y = glucose) ) 


## box plot of pressure low  with ggplot
ggplot(heartAt.df) + geom_boxplot( aes( y = pressurelow) ) 







#  Draw Violin plot: pressurehigh vs gender

library(ggplot2)
violin_plot_pressurehigh_gender <- ggplot(heartAt.df, aes(x = as.factor(gender), y = pressurehight, fill = as.factor(gender))) +
  geom_violin() +
  labs(title = "Violin Plot: Pressure High vs Gender", x = "Gender", y = "Pressure High") +
  theme_minimal()
# Display the violin plot
print(violin_plot_pressurehigh_gender)


# Violin plot: pressurelow vs gender

violin_plot_pressurelow_gender <- ggplot(heartAt.df, aes(x = as.factor(gender), y = pressurelow, fill = as.factor(gender))) +
  geom_violin() +
  labs(title = "Violin Plot: Pressure Low vs Gender", x = "Gender", y = "Pressure Low") +
  theme_minimal()
# Display the violin plot
print(violin_plot_pressurelow_gender)

# Violin plot: glucose vs gender
violin_plot_glucose_gender <- ggplot(heartAt.df, aes(x = as.factor(gender), y = glucose, fill = as.factor(gender))) +
  geom_violin() +
  labs(title = "Violin Plot: Glucose vs Gender", x = "Gender", y = "Glucose") +
  theme_minimal()
# Display the violin plot
print(violin_plot_glucose_gender)

# Violin plot: pressurehight vs class
violin_plot_pressurehigh_class <- ggplot(heartAt.df, aes(x = class, y = pressurehight, fill = class)) +
  geom_violin() +
  labs(title = "Violin Plot: Pressure High vs Class", x = "Class", y = "Pressure High") +
  theme_minimal()
# Display the violin plot
print(violin_plot_pressurehigh_class)

# Violin plot: pressurelow vs class
violin_plot_pressurelow_class <- ggplot(heartAt.df, aes(x = class, y = pressurelow, fill = class)) +
  geom_violin() +
  labs(title = "Violin Plot: Pressure Low vs Class", x = "Class", y = "Pressure Low") +
  theme_minimal()
# Display the violin plot
print(violin_plot_pressurelow_class)

# Violin plot: glucose vs class
violin_plot_glucose_class <- ggplot(heartAt.df, aes(x = class, y = glucose, fill = class)) +
  geom_violin() +
  labs(title = "Violin Plot: Glucose vs Class", x = "Class", y = "Glucose") +
  theme_minimal()
# Display the violin plot
print(violin_plot_glucose_class)





#### Heatmap   #####

## simple heat map of correlations (without values)


library(ggplot2)
library(ggcorrplot)

# Calculate the correlation matrix
cor_matrix <- cor(heartAt.df[, c("age", "impluse", "pressurehight", "pressurelow", "glucose", "kcm", "troponin")])

# Simple heat map without values using ggplot2
simple_heatmap <- ggplot(as.data.frame(as.table(cor_matrix)), aes(Var1, Var2, fill = Freq)) +
  geom_tile() +
  labs(title = "Simple Heatmap of Correlations", x = "", y = "") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Display the heat map
print(simple_heatmap)



## heatmap with values

library(ggplot2)
library(ggcorrplot)

# Calculate the correlation matrix
cor_matrix <- cor(heartAt.df[, c("age", "impluse", "pressurehight", "pressurelow", "glucose", "kcm", "troponin")])

# Create a heat map with values using ggplot2
heatmap_with_values <- ggplot(as.data.frame(as.table(cor_matrix)), aes(Var1, Var2, fill = Freq)) +
  geom_tile() +
  geom_text(aes(label = round(Freq, 2)), vjust = 1) +  # Add text labels for correlation values
  labs(title = "Heatmap with Values", x = "", y = "") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Display the heat map with values
print(heatmap_with_values)



###### parcoord:  parallel coordinates plot  #####
# MASS: Modern Applied Statistics with S

library(MASS)

# Select variables 
numeric_vars <- c("age", "impluse", "pressurehight", "pressurelow", "glucose", "kcm", "troponin")

# Create a parallel coordinates plot
parcoord_plot <- parcoord(heartAt.df[, numeric_vars], col = rainbow(100), lty = 1, lwd = 2, var.label = TRUE)

# Display the parallel coordinates plot
print(parcoord_plot)


