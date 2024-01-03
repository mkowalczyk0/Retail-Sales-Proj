# Retail-Sales-Proj
Data Analysis of Retail Sales - [SQL] [Tableau] [Excel] [Weka ML]

```The Purpose of this analysis will be to analyze sales, products, customers and more, in order to potentially understand what products sell best where, identify unusual behaviors that might lead fraud investigations, forecast demand, create a promotional strategy.```



Understanding the Data
-
- InvoiceNo:	A 6-digit number uniquely assigned to each transaction. If the number is prefixed with 'c', it indicates a cancellation. (Nominal)
- StockCode:	A unique identifier for each product sold by the retailer. (Nominal)
- Description:	The name or a brief description of the product. (Nominal)
- Quantity:	The number of units of the product sold in each transaction. (Numeric)
- InvoiceDate:	The date and time when the transaction was made. (Datetime)
- UnitPrice: The price per unit of the product in sterling. (Numeric)
- Country:	The country where the customer resides. (Nominal)

Data Prep/Cleaning
-
- New Attributes
  - 'InvoiceNo' contains letter "C" indicating a canceled invoice. Created a new column 'IsCanc' that denominates a canceled order by using a nested IF function, searching for value = "C", if true, the output will be yes.
  - ```=IF(ISNUMBER(SEARCH("C", B2)), "Yes", "No")```
- Attribute Conversion
  - Used Excel function to convert 'InvoiceNo' from Nominal to Numerical by utilizing '=RIGHT' to remove "C" letter since we created the new 'IsCanc' column.
  - ```=RIGHT(B2,6)```
  - Named new Numerical Column 'Invoice'
- Reformat
  - 'InvoiceDate' originally formatted = m/d/yyyy h:mm will not be read correctly when importing CVS into SQL. Reformat column into yyyy-mm-dd hh:mm:ss
- New Calculation
  - 'Total Price' multiplying 'Quantity' by 'Unit Price'

SQL Prep [*mysql*] & [*PopSQL*]
-
```All code found in Repo 'SQL' Folder```
- Create New Database 'rsaproject' from terminal
  - ```CREATE DATABASE RSAProject;```
- New Query and create table 'online_retail' to import data
  - ![image](https://github.com/mkowalczyk0/Retail-Sales-Proj/assets/151803531/bdd53ca8-a6f6-41e5-a68d-eca16f4abc99)
- Import data through MySQL Workbench using Import Data Wizard
- View Table
  - ```SELECT * FROM online_retail;```
  - ![image](https://github.com/mkowalczyk0/Retail-Sales-Proj/assets/151803531/34f57e71-8201-4056-a8c3-9edfa2cb6931)
 
SQL Querying | Answering Some Questions [SQL]
-
```Q&A Report Found in 'SQL' Folder```
- What is the total amount of products sold and the revenue generated by the company?
  - ![image](https://github.com/mkowalczyk0/Retail-Sales-Proj/assets/151803531/8fd208aa-2e98-408e-8743-251ae7e0764d)
- What Countries are generating the store the most revenue?
  - ![image](https://github.com/mkowalczyk0/Retail-Sales-Proj/assets/151803531/063f3d6c-a425-4b32-8bd2-7c2b3ec25fac)
- Who are the top 25 most valuable customers?
  - ![image](https://github.com/mkowalczyk0/Retail-Sales-Proj/assets/151803531/97ed882b-8397-44d3-aeb2-2c674c83457e)
- How many Cancelations were there and what was the total loss of revenue because of those cancelations?
  - ![image](https://github.com/mkowalczyk0/Retail-Sales-Proj/assets/151803531/9c803e8c-2362-4861-bc71-219148a39a0d)
- What customer(s) could be suspected of potential fraud using cancelled invoices?
  - ![image](https://github.com/mkowalczyk0/Retail-Sales-Proj/assets/151803531/f1e356a3-08fb-441e-a88d-9c5a97a8e449)
- What are the top 5 selling products in France that is not Postage?
  - ![image](https://github.com/mkowalczyk0/Retail-Sales-Proj/assets/151803531/98de054c-fa26-42fc-a780-562344cd49fb)


Data Viz [Tableau]
- 
```Connect to Data using MySQL server```

**Create Visualizations**
- Revenue by Month: ![image](https://github.com/mkowalczyk0/Retail-Sales-Proj/assets/151803531/31b38118-16f9-4458-ba4c-ded37e7ac2aa)
- Revenue by Country: ![image](https://github.com/mkowalczyk0/Retail-Sales-Proj/assets/151803531/c2a40eb9-d7f0-4e62-b70e-8890f3762f66)
- Transactions by Month: ![image](https://github.com/mkowalczyk0/Retail-Sales-Proj/assets/151803531/88cfa7c0-d451-4f0e-9d33-1bed443e6900)
- Revenue By Cancellations: ![image](https://github.com/mkowalczyk0/Retail-Sales-Proj/assets/151803531/b2902466-249f-4e31-a3a7-435ac179b089)
- 6 Month Sell Quantity Demand Forecast: ![image](https://github.com/mkowalczyk0/Retail-Sales-Proj/assets/151803531/0ff0c9eb-210e-4e15-b5c0-ba7715bb5faf)
- 6 Month Revenue Forecast: ![image](https://github.com/mkowalczyk0/Retail-Sales-Proj/assets/151803531/f0f56eac-e348-49bb-ba61-907b02c4a900)

**Completed Dashboard:** ![](https://github.com/mkowalczyk0/Retail-Sales-Proj/blob/main/Tableau/Tableau.gif)
 
 
Credits
-
- https://data.world/uci
- https://www.kaggle.com/datasets/thedevastator/online-retail-transaction-data/data
