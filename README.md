# R-STUDIO-data-science

                
                                                                                                           
                                                                                                           
                         TITLE
                         
Exploring Cardiovascular Health: A Comprehensive Analysis of Heart Attack Risk   

A-Introduction: 

This report aims to conduct a thorough analysis of cardiovascular health by exploring various factors that may contribute to the risk of heart attacks. The investigation is motivated by the critical importance of understanding and mitigating heart attack risks, given the significant impact cardiovascular diseases have on global health.


A-1 Background:

Cardiovascular diseases, including heart attacks, are leading causes of morbidity and mortality worldwide. Understanding the factors associated with heart attack risk is crucial for preventive healthcare strategies and improving overall heart health. The dataset under examination was downloaded from Kaggle comprises diverse variables related to age, gender, heart rate, blood pressure, glucose levels, and cardiac biomarkers.
(https://www.kaggle.com/datasets/bharath011/heart-disease-classification-dataset).
The motivation for examining this dataset lies in its potential to uncover patterns and associations between these variables and the likelihood of experiencing a heart attack. Such insights can inform targeted interventions, personalized healthcare plans, and public health initiatives to reduce the incidence of cardiovascular events. By conducting a comprehensive analysis of this dataset, we aim to enhance preventative measures and promote heart health at both individual and population levels.

 heartAt.df <- read.csv("Heart Attack.csv")
> str(heartAt.df)  # structure of the data frame
'data.frame':	1319 obs. of  9 variables:
 $ age          : int  64 21 55 64 55 58 32 63 44 67 ...
 $ gender       : int  1 1 1 1 1 0 0 1 0 1 ...
 $ impluse      : int  66 94 64 70 64 61 40 60 60 61 ...
 $ pressurehight: int  160 98 160 120 112 112 179 214 154 160 ...
 $ pressurelow  : int  83 46 77 55 65 58 68 82 81 95 ...
 $ glucose      : num  160 296 270 270 300 87 102 87 135 100 ...
 $ kcm          : num  1.8 6.75 1.99 13.87 1.08 ...
 $ troponin     : num  0.012 1.06 0.003 0.122 0.003 0.004 0.003 2.37 0.004 0.011 ...
 $ class        : chr  "negative" "positive" "negative" "positive" ...


summary(heartAt.df)  # find summary statistics for each column
      age             gender          impluse        pressurehight    pressurelow        glucose     
 Min.   : 14.00   Min.   :0.0000   Min.   :  20.00   Min.   : 42.0   Min.   : 38.00   Min.   : 35.0  
 1st Qu.: 47.00   1st Qu.:0.0000   1st Qu.:  64.00   1st Qu.:110.0   1st Qu.: 62.00   1st Qu.: 98.0  
 Median : 58.00   Median :1.0000   Median :  74.00   Median :124.0   Median : 72.00   Median :116.0  
 Mean   : 56.19   Mean   :0.6596   Mean   :  78.34   Mean   :127.2   Mean   : 72.27   Mean   :146.6  
 3rd Qu.: 65.00   3rd Qu.:1.0000   3rd Qu.:  85.00   3rd Qu.:143.0   3rd Qu.: 81.00   3rd Qu.:169.5  
 Max.   :103.00   Max.   :1.0000   Max.   :1111.00   Max.   :223.0   Max.   :154.00   Max.   :541.0  
      kcm             troponin          class          
 Min.   :  0.321   Min.   : 0.0010   Length:1319       
 1st Qu.:  1.655   1st Qu.: 0.0060   Class :character  
 Median :  2.850   Median : 0.0140   Mode  :character  
 Mean   : 15.274   Mean   : 0.3609                     
 3rd Qu.:  5.805   3rd Qu.: 0.0855                     
 Max.   :300.000   Max.   :10.3000          


 
 describe(heartAt.df)
              vars    n   mean    sd median trimmed   mad   min    max   range  skew kurtosis   se
age              1 1319  56.19 13.65  58.00   56.64 13.34 14.00  103.0   89.00 -0.24    -0.03 0.38
gender           2 1319   0.66  0.47   1.00    0.70  0.00  0.00    1.0    1.00 -0.67    -1.55 0.01
impluse          3 1319  78.34 51.63  74.00   74.77 16.31 20.00 1111.0 1091.00 18.21   361.02 1.42
pressurehight    4 1319 127.17 26.12 124.00  125.64 23.72 42.00  223.0  181.00  0.68     0.94 0.72
pressurelow      5 1319  72.27 14.03  72.00   71.70 13.34 38.00  154.0  116.00  0.49     0.85 0.39
glucose          6 1319 146.63 74.92 116.00  132.50 35.58 35.00  541.0  506.00  1.93     4.09 2.06
kcm              7 1319  15.27 46.33   2.85    4.36  2.21  0.32  300.0  299.68  4.97    25.35 1.28
troponin         8 1319   0.36  1.15   0.01    0.09  0.02  0.00   10.3   10.30  5.79    39.80 0.03
class*           9 1319   1.61  0.49   2.00    1.64  0.00  1.00    2.0    1.00 -0.47    -1.78 0.01


D- Summary and Conclusion

This comprehensive analysis aimed to uncover patterns and associations related to cardiovascular health, specifically examining factors that may contribute to the risk of heart attacks. The dataset, sourced from Kaggle, encompasses diverse variables such as age, gender, heart rate, blood pressure, glucose levels, and cardiac biomarkers. Cardiovascular diseases, including heart attacks, are significant contributors to global morbidity and mortality. Therefore, understanding the factors associated with heart attack risk is crucial for developing effective preventive healthcare strategies.
The findings reveal several key insights. Individuals in the age group of 60-65 face a higher risk of heart attacks compared to other age groups. Blood pressure emerges as a notable factor, with individuals experiencing heart attacks demonstrating higher systolic and diastolic blood pressure levels. A positive correlation (0.586) between diastolic and systolic blood pressure further underscores their interconnected influence on heart health.
Blood sugar levels also play a role, with individuals who have experienced heart attacks exhibiting higher glucose levels compared to those in the negative group. Cardiac biomarkers, specifically CK-MB and Troponin, display highly positively skewed distributions, suggesting the presence of potential outliers. Notably, individuals without heart attacks often present Troponin values of zero.
Gender differences indicate a slight male predominance in the dataset. The distribution of heart rate (impulse) is rightward skewed, suggesting potential outliers. These findings collectively contribute to a nuanced understanding of the multifaceted factors influencing heart attack risk.

While this analysis has identified meaningful associations, it is crucial to acknowledge that correlation does not imply causation. The dataset's limitations, including the potential impact of outliers, may influence the generalizability of the findings. Further exploration of outliers could offer additional insights into potential data anomalies or specific conditions affecting the variables under consideration.

 
