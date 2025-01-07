# Sales Transactions Dataset

## **Overview**
This dataset contains transactional sales data from a retail business. It provides detailed records of customer purchases, including product details, transaction amounts, customer demographics, and branch locations.

The dataset is structured to enable advanced analytics, such as sales performance analysis, customer behavior insights, and inventory optimization.

---

## **Dataset Story**
The dataset represents sales data across various branches in different cities and regions. It records individual transactions, including the product purchased, the branch location, and customer details. The dataset captures a wide range of information, including:

- **What was purchased**: Product details (name, brand, categories).
- **Where it was purchased**: Branch, city, and region information.
- **Who made the purchase**: Customer details like name, birthdate, and gender.
- **When it was purchased**: Date and time of the transaction.
- **How much was spent**: Quantity, unit price, and total price.

---

## **Attributes**
### **Transaction Details**
| **Attribute**      | **Description**                                                                                     |
|---------------------|-----------------------------------------------------------------------------------------------------|
| `id`               | Unique identifier for each transaction record.                                                      |
| `ficheno`          | Invoice or transaction number for the sale.                                                         |
| `date_`            | Date and time of the transaction.                                                                   |
| `item_code`        | Unique code for the product sold.                                                                   |
| `item_name`        | Name of the product sold.                                                                           |
| `brand`            | Brand name of the product.                                                                          |
| `category1`        | Main category of the product.                                                                       |
| `category2`        | Subcategory level 1 of the product.                                                                 |
| `category3`        | Subcategory level 2 of the product.                                                                 |
| `category4`        | Subcategory level 3 of the product.                                                                 |
| `amount`           | Quantity of the product sold.                                                                       |
| `price`            | Unit price of the product (numeric, 2 decimal places).                                              |
| `total_price`      | Total price for the transaction (calculated as `amount * price`).                                    |

### **Customer Details**
| **Attribute**          | **Description**                                                                                 |
|-------------------------|-------------------------------------------------------------------------------------------------|
| `customer_code`        | Unique identifier for the customer making the purchase.                                         |
| `customer_name`        | Full name of the customer.                                                                      |
| `customer_birhtdate`   | Birthdate of the customer (format: YYYY-MM-DD).                                                 |
| `customer_gender`      | Gender of the customer (`E` for Male, `K` for Female).                                          |

### **Branch and Location Details**
| **Attribute**          | **Description**                                                                                 |
|-------------------------|-------------------------------------------------------------------------------------------------|
| `branch`              | The branch where the transaction occurred.                                                      |
| `city`                | The city where the branch is located. Each city has one branch.                                  |
| `district`            | The district within the city where the branch is located.                                       |
| `region`              | The region (e.g., Marmara, Aegean) where the transaction occurred.                               |

---

## **Disclaimer**
- All queries for this dataset were tested and run on **PostgreSQL (psql)**.
- This dataset assumes that each city contains exactly **one branch**, so no additional branch-level grouping is required for queries.

---

## **Acknowledgments**
This dataset is fictional and for educational purposes only.