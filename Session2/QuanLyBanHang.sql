Create database Quan_Ly_Ban_Hang;
use Quan_Ly_Ban_Hang;
create table Customer(
	Customer_Id int auto_increment primary key,
    Customer_Name varchar(50) not null,
    Customer_Age int default 18
);
-- Mỗi khách hàng có thể mua hàng nhiều lần, nên có thể có nhiều hóa đơn cho mỗi khách.
create table Orders(
	Order_Id int auto_increment primary key unique,
    Customer_Id int not null,
    foreign key (Customer_Id) references Customer(Customer_Id),
    Oder_Date date default (now()),
    Order_Total_Price float 
);
-- Mỗi hóa đơn có thể có nhiều mặt hàng.
create table Product(
	Product_Id char(4) primary key,
    Product_Name varchar(100) not null,
    Product_Price float
);
-- Mỗi mặt hàng trong hóa đơn có thể được mua với số lượng nhiều hơn 1 cái.
create table Order_Detail(
	Order_Id int auto_increment,
    Product_Id char(4),
    primary key(Order_Id, Product_Id),
    foreign key (Order_Id) references Orders(Order_Id),
    foreign key (Product_Id) references Product(Product_Id),
    Order_Quantity int default 0
)