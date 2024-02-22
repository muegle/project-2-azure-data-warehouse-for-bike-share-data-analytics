# Building an Azure Data Warehouse for Bike Share Data Analytics

## Project Overview

![bikeshare](https://github.com/muegle/project-2-azure-data-warehouse-for-bike-share-data-analytics/assets/142508165/939332bb-6794-47e3-90a5-c7eecfc65ebb)

Divvy is a bike sharing program in Chicago, Illinois USA that allows riders to purchase a pass at a kiosk or use a mobile application to unlock a bike at stations around the city and use the bike for a specified amount of time. The bikes can be returned to the same station or to another station. The City of Chicago makes the anonymized bike trip data publicly available for projects like this where we can analyze the data.

The goal of this project is to develop a data warehouse solution using Azure Synapse Analytics. You will:

* Design a star schema based on the business outcomes listed below;
* Import the data into Synapse;
* Transform the data into the star schema;
* and finally, view the reports from Analytics.

## The business outcomes you are designing for are as follows:
1. Analyze how much time is spent per ride
* Based on date and time factors such as day of week and time of day
* Based on which station is the starting and / or ending station
* Based on age of the rider at time of the ride
* Based on whether the rider is a member or a casual rider

2. Analyze how much money is spent
* Per month, quarter, year
* Per member, based on the age of the rider at account start

3. EXTRA CREDIT - Analyze how much money is spent per member
* Based on how many rides the rider averages per month
* Based on how many minutes the rider spends on a bike per month

### **Task 1:** Create your Azure resources
* Azure Database for PostgresSQL
* Azure Synapse workspace
* Azure Synapse SQL Dedicated Pool

### **Task 2:** Design a star schema

![starschema](https://github.com/muegle/project-2-azure-data-warehouse-for-bike-share-data-analytics/assets/142508165/86245b50-5efd-4726-9c27-2cb55668268b)


### **Task 3:** Create the data in PostgresSQL

done

### **Task 4:** EXTRACT the data from PostgresSQL

![PostgreSQL2AzureBlopStorage](https://github.com/muegle/project-2-azure-data-warehouse-for-bike-share-data-analytics/assets/142508165/0440eb2c-b076-4921-b29f-71b322aeaf6d)

### **Task 5:** LOAD the data into external tables in the data warehouse
see the scripts under /scripts-loading-external-tables/

### **Task 6:** TRANSFORM the dat to the star schema using CETAS
see the scripts under /scripts-transform-to-the-starshema-using-CETAS/



