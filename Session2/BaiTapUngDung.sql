Create database BaiTapUngDung;
use BaiTapUngDung;
Create table Product(
	Product_Id char(5) primary key,
    Product_Name varchar(100) not null unique,
    Price float check( price >0 ),
    Descriptions text not null,
    Product_Status bit default 1
);
Create table Orders(
	Order_Id int auto_increment,
    Created date default (current_date()), -- curdate(), now()
    Total_Amount float,
    Order_Status bit default 0,
    primary key(Order_Id)
);
create table Oder_Detail(
	Product_Id char(5),
	Order_Id int,
    primary key(Product_Id, Order_Id),
    foreign key (Product_Id) references Product(Product_Id),
    foreign key (Order_Id) references Orders(Order_Id),
	Price float,
    Quantity int,
    Amount FLOAT generated always as (Price * Quantity) stored -- tính tự động giá trị amount
);
