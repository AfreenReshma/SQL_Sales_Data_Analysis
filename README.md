---

# **Sales_Data_Analysis project**

---

## **Project Overview**

I have worked on analyzing a dataset of sales_data records from an Amazon-like e-commerce platform. This project involves extensive querying of customer behavior, product performance, trends using MYSQL. Through this project, I have tackled various SQL problems, including revenue analysis, customer segmentation, and inventory management.Additionally, I created a comprehensive report on this dataset by exporting SQL data and visualizing key insights using Power BI.

The project also focuses on data cleaning, handling null values, and solving real-world business problems using structured queries.

---

## **Database Setup & Design**

### **Schema Structure**
_ The Database contain **2 tables:** 'Orders' and 'Details'.
_ These tables Design  with **primary key** and proper indexing to maintain data integrity , optimize query performance

### **Constraints**

_ Referential integrity is enforced using primary keys.
_ Default values and data types are applied where necessary to maintain consistency.
_ Uniqueness is guaranteed for fields like 'product_id' and 'order_id'.

---

## **Task: Data Cleaning**

I cleaned the dataset by:

• Removing duplicates: Duplicates in the customer and order tables were identified and removed.
• Handling missing values: Null values in critical fields (e.g., customer address, payment status) were either filled with default values or handled using appropriate methods

---

### **Handling Null Values**

Null values were handled based on their context:
• Customer addresses: Missing addresses were assigned default placeholder values.
• Payment statuses: Orders with null payment statuses were categorized as "Pending."
Shipping information: Null return dates were left as is, as not all shipments are returned.

---

## **Identifying Business Problems**

Key business problems identified:
1. Low product availability due to inconsistent restocking.
2. High return rates for specific product categories.
3. Significant delays in shipments and inconsistencies in delivery times.
4. High customer acquisition costs with a low customer retention rate.

---

## **Objectives**

The primary objective of this project is to show the sql profficiency through queries but address real world bussiness challenges. This project covers various operations, including:
_Customer Behaviour
_Sales Trends
_Inventory Management
_Payment and Shipping method

---

## **Learning Outcomes**

This project enabled me to:
_ Design and implement a normalized database schema.
_ Clean and preprocess real-world datasets for analysis.
_ Use advanced SQL techniques, including window functions, subqueries, and joins.
_ Conduct in-depth business analysis using SQL.
_ Optimize query performance and handle large datasets efficiently.
_Create visual reports using Power BI for a deeper analysis of the dataset.

---

## **Conclusion**

This advanced SQL project successfully demonstrates my ability to solve real-world e-commerce problems using structured queries. From improving customer retention to uncovering operational challenges, this project provides valuable insights into business decision-making processes. The Power BI report further strengthens the analysis, presenting key metrics in a visually appealing format.

By completing this project, I have gained a deeper understanding of how SQL can be used to tackle complex data problems and drive business decision making

---
