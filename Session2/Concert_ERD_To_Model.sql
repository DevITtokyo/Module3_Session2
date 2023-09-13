create database Convert_ERD_To_Model;
use Convert_ERD_To_Model;
create table Phieu_Xuat(
Phieu_Xuat_Id int primary key auto_increment,
Ngay_Xuat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
create table VATTU(
Ma_VTU char(4) primary key ,
Ten_VTu varchar(50) not null unique
);
create table CT_Phieu_Xuat (
Phieu_Xuat_Id int,
Ma_VTU char(4),
foreign key (Phieu_Xuat_Id) references Phieu_Xuat(Phieu_Xuat_Id),
foreign key (Ma_VTU ) references VATTU(Ma_VTU ),
DG_Xuat bit,
SL_Xuat int,
primary key (Phieu_Xuat_Id,Ma_VTU)
);
create table Phieu_Nhap(
Phieu_Nhap_Id int primary key auto_increment ,
Ngay_Nhap date 
);
create table CT_Phieu_Nhap(
Phieu_Nhap_Id int,
Ma_VTU char(4),
foreign key (Phieu_Nhap_Id) references Phieu_Nhap(Phieu_Nhap_Id),
foreign key (Ma_VTU ) references VATTU(Ma_VTU ),
DG_Nhap bit,
SL_Nhap int,
primary key (Phieu_Nhap_Id,Ma_VTU)
);
create table DONDH(
Don_Hang_Id int primary key auto_increment unique,
Ngay_Dat_hang date 
);
create table CT_Don_Dat_Hang(
Ma_VTU char(4),
Don_Hang_Id int,
foreign key (Ma_VTU) references VATTU(Ma_VTU ),
foreign key (Don_Hang_Id) references DONDH(Don_Hang_Id),
primary key (Ma_VTU,Don_Hang_Id)
);
create table NHACC(
Ma_NCC char(4) primary key unique,
Ten_NCC varchar(100) not null,
Dia_Chi varchar(200) not null,
SDT char(10)
);