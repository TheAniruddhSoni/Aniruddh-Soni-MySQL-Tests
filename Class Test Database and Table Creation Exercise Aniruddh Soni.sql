Drop database if exists Shopping_Management;
Create database Shopping_Management;
Use Shopping_Management;

Create table customers(
Customer_ID Int Primary Key Auto_Increment,
Customer_Name Varchar(100) not null,
Email Varchar(100) unique not null,
Phone_Number char(10) unique not null,
Age Int check(Age > 0),
Gender Enum('Male', 'Female', 'Other'),
Country Varchar(50) default 'India',
City Varchar(50) not null,
Pincode char(6) default '201301',
Registration_Date date default (current_date),
Registration_Time time default (current_time),
Created_At timestamp default (current_timestamp),
Address Varchar(250),
Customer_Status Enum('Active', 'Inactive', 'Blocked') default 'Active',
Customer_Notes tinytext);

Create table orders(
Order_ID Int Primary Key Auto_Increment,
Customer_ID Int,
Order_Date date default (Current_Date),
Order_Amount Decimal(10,2) not null,
Order_Status Enum('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled') default 'Pending',
Payment_Method Enum('Cash', 'Card', 'UPI', 'Net Banking'),
Payment_Status Enum('Pending', 'Paid', 'Failed') default 'Pending',
Shipping_Address Varchar(250) not null,
Delivery_Pincode char(6),
Quantity int unsigned check (Quantity > 0) not null,
Discount_Amount decimal(10,2) default 0,
Delivery_Date date,
Created_At timestamp default (current_timestamp),
Tracking_Number Varchar(30) unique not null,
Delivery_Status Enum('Not Dispatched', 'In Transit', 'Delivered', 'Returned') default 'Not Dispatched',
Order_Notes tinytext,
foreign key (Customer_ID) references customers(Customer_ID) on delete cascade,
foreign key (Customer_ID) references customers(Customer_ID) on update cascade);

