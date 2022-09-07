create database bank 

use bank 



--table creation about customer
create table customer_information(
customer_ID int identity(1,9) primary key  ,
first_name nvarchar(10),
middle_name nvarchar(10),
last_name nvarchar(10),
Date_of_birth Date,
contact_NO bigint,
Gender char(5),
citizenship_number bigint,
marital_satus char(1),
Email nvarchar(50),
Address nvarchar(20),
Guardian_name nvarchar(50)
)





--table creation about bank
Create table bank_info(
bank_code varchar(30) primary key ,
bank_name varchar(20),
Branch_code varchar(20),
branch_name varchar(20),
)





--table creation about account
create table account_information(
account_no bigint primary key,
customer_id int foreign key references customer_information(customer_id),
Account_type varchar(20),
Date_of_creation date,
bank_code varchar(30) foreign key references bank_info(bank_code),
Interest decimal,
opening_balance bigint,
Branch_name varchar
)



--__ table creation about ATM

create table atm_information(
bank_code varchar(30) foreign key references bank_info(bank_code),
Card_number bigint,
pin int,
Card_validity date
)


--table for cheque book 

create table cheque_information(
bank_code varchar(30) foreign key references bank_info(bank_code),
cheque_no bigint,
verification_type nvarchar(20),
)


-- insertion in customer_information


insert into customer_information values(customer_ID,'first_name','middle_name','last_name','day/MONTH/year',contact_no,'Gender',citizenship_number,'marital_satus','Email','Address','Guardian_name')

insert into customer_information values(customer_ID,'first_name','middle_name','last_name','day/MONTH/year',contact_no,'Gender',citizenship_number,'marital_satus','Email','Address','Guardian_name')






--insert into bank_info

insert into bank_info values('bank_code','bank_name','Branch_code','branch_name ')

insert into bank_info values('bank_code','bank_name','Branch_code','branch_name ')



--insert into  account_information


insert into  account_information values(account_no,customer_id,'Account_type','day/MONTH/year','bank_code','Interest',opening_balance,'Branch_name')

insert into  account_information values(account_no,customer_id,'Account_type','day/MONTH/year','bank_code','Interest',opening_balance,'Branch_name')




--insert into ATM_information 

insert into atm_information values('bank_code ',Card_number,pin,'day/MONTH/year')
insert into atm_information values('bank_code ',Card_number,pin,'day/MONTH/year')



-- insert into cheque_information 

insert into cheque_information values('bank_code ',cheque_no,'verification_type')


insert into cheque_information values('bank_code ',cheque_no,'verification_type')



--procedure to insert a new account number



create procedure pcreateaccount_no
 (
 @account_no bigint,
 @opening_balance bigint,
 )
 as
 Begin
   if @account_no=0
   Begin
	set @Account_no =(select max(isnull(account_no,0)+1) from account_information)
	 insert into account_information(account_no,opening_balance) values(@account_no,@opening_balance)
   end
   else
   begin
		update account_information set account_no=@account_no where opening_balance=@opening_balance
   end 
 end 


 go 

 exec pcreatedesignation 0,'number'  --add
  exec pcreatedesignation 2,'number'  --edit

  go 



-- function to display procedure
    create function fgetaccount_no()
  returns Table
  as
  return
  (
  select * from account_information
  )


  --display output

  -- select * from account_information 








