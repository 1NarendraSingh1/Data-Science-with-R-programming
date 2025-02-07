# Data-Science-with-R-programming
This R script provides a comprehensive overview of data visualization and data manipulation techniques using various libraries like DPLYR, TIDYR, &amp; Data Visualization using GGPLOT, PLOTLY etc.

**R Data Visualization and Manipulation Guide**

Overview

This repository provides a comprehensive guide to data visualization and manipulation in R, utilizing powerful libraries such as dplyr, tidyr, ggplot2, and plotly. It covers essential techniques for handling and visualizing data efficiently.

**Key Sections**

**Data Visualization Keywords:**
- ggplot2
- plotly
- plot(), hist(), boxplot()
- geom_bar(), geom_point(), geom_boxplot()
- aes(), facet_wrap(), coord_flip()
- scatter plot, bar chart, histogram, box plot, pie chart, heatmap, word cloud
  
**Data Manipulation (DPLYR) Keywords:**
- dplyr
- filter(), select(), mutate(), arrange(), summarise()
- group_by(), rename(), distinct(), count()
- left_join(), right_join(), inner_join(), full_join()
- %>% (Pipe Operator)
  
**Data Reshaping (TIDYR) Keywords:**
- tidyr
- gather(), spread()
- separate(), unite()
  
**General R Functions and Libraries:**
- install.packages(), library()
- View(), head(), tail()
- sample_n(), sample_frac()
- dataset: flights, mtcars, airquality, mpg
- Base R, grid graphics, MASS
- data transformation, data visualization, tidy data, data wrangling

📊 **Charts and Graphs**

Demonstrates various visualization techniques, including:

- Pie charts

- Bar charts

- Histograms

- Box plots

- Scatter plots

- Heatmaps

- Word clouds

![image](https://github.com/user-attachments/assets/eb5a6006-e651-4159-8861-9821bc0f1561)

![image](https://github.com/user-attachments/assets/530ca3cf-bc4e-4ae2-80d8-5e098c473154)

![image](https://github.com/user-attachments/assets/f9e1fc36-088a-4e95-aa7b-a1f3605c9999)

![image](https://github.com/user-attachments/assets/572ccfbb-a809-4feb-9f73-ffaad5226923)

![image](https://github.com/user-attachments/assets/2cfa2693-bcea-46b4-8a4a-3ff928688c45)

🛠 **DPLYR for Data Manipulation**

Learn how to efficiently manipulate datasets with functions like:

- filter(), select(), mutate(), arrange(), summarise()

- group_by(), rename(), distinct(), count()

- Data joining with left_join(), right_join(), inner_join(), full_join()

🔄 **TIDYR for Data Reshaping**

Transform and tidy datasets using:

- gather() to make wide data longer

- spread() to make long data wider

- separate() to split columns

- unite() to combine columns

📈 **Data Visualization Techniques**

Base R Graphics

- plot(), hist(), boxplot() for quick and easy visualizations.

ggplot2 for Advanced Visualizations

Create professional and customizable visualizations using the grammar of graphics.

plotly for Interactive Plots

Build interactive and dynamic web-based visualizations.

📂 **Examples and Use Cases**

Demonstrates practical applications using datasets such as:

- flights (from nycflights13)

- mtcars

- airquality

- mpg

🔧 **Installation**

Ensure you have R installed and then install the required libraries:

install.packages(c("dplyr", "tidyr", "ggplot2", "plotly", "nycflights13", "MASS", "grid", "plotrix"))

