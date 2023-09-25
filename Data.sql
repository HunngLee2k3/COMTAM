create database QLBANCOMTAM
GO
use QLBANCOMTAM 
go

--Table
--rice
--riceCategory
--soup
--soupCategory
--drink
--drinkCategory
--Food
--FoodCategory	
--Account
--Bill
--BillInfo

create table TableFood(
	id int identity primary key,
	name nvarchar(99) not null default N'Chưa đặt tên',
	status nvarchar(99) not null default 0, --0:trống || 1:có người || 2:đã thanh toán--
	)
go
create table account(
	userName nvarchar(99) PRIMARY KEY,
	displayName nvarchar(99) not null default N'21DTHC5-NHÓM 8',
	passWord nvarchar(99) not null,
	type int not null default 0-- 0:staff 1:admin
)
go
create table foodCategory(
	id int identity primary key,
	name nvarchar(99) not null default N'Chưa đặt tên'
)
go
create table drinkCategory(
	id int identity primary key,
	name nvarchar(99) not null default N'Chưa đặt tên'
)
go
create table riceCategory(
	id int identity primary key,
	name nvarchar(99) not null default N'Chưa đặt tên'
)
go
create table soupCategory(
	id int identity primary key,
	name nvarchar(99) not null default N'Chưa đặt tên'
)
go
create table rice(
	id int identity primary key,
	name nvarchar(99) not null default N'Chưa dặt tên',
	idCategory int not null,
	price float not null default 0

	foreign key (idCategory) references dbo.riceCategory(id)
)
go
create table soup(
	id int identity primary key,
	name nvarchar(99) not null default N'Chưa dặt tên',
	idCategory int not null,
	price float not null default 0

	foreign key (idCategory) references dbo.soupCategory(id)
)
go
create table drink(
	id int identity primary key,
	name nvarchar(99) not null default N'Chưa dặt tên',
	idCategory int not null,
	price float not null default 0

	foreign key (idCategory) references dbo.drinkCategory(id)
)
go
create table food(
	id int identity primary key,
	name nvarchar(99) not null default N'Chưa dặt tên',
	idCategory int not null,
	price float not null default 0

	foreign key (idCategory) references dbo.foodCategory(id)
)
go
create table bill(
	id int identity primary key,
	dateCheckIn date not null default getdate(),
	dateCheckOut date,
	idTable int not null,
	status int not null default 0 -- 0:chua thanh toan 1:da thanh toan
	foreign key (idTable) references dbo.tableFood(id)

)
go
create table billInfo(
	id int identity primary key,
	idBill int not null,
	idFood int not null,
	idDrink int not null,
	idRice int not null,
	idSoup int not null,
	count int not null default 0

	foreign key (idBill) references dbo.bill(id),
	foreign key (idFood) references dbo.food(id),
	foreign key (idDrink) references dbo.drink(id),
	foreign key (idRice) references dbo.rice(id),
	foreign key (idSoup) references dbo.soup(id)
)
go