create database vishal_mega_mart;
use vishal_mega_mart;
CREATE TABLE BRANCH (
     brn_id int primary key not null,
brn_name varchar(50),
District varchar(20),
state varchar(30)
);
insert into BRANCH (brn_id, brn_name, District, state)
values ( 1, 'kolkata', 'jhargram', 'west_bengal'),
(2, 'dhundhera', 'gurgao', 'hariyana');
select * from BRANCH;

CREATE TABLE TIME (
tim_id int primary key,
     dat_id int,
delivery_dt date,
receive_dt date
);
select *from TIME;


CREATE TABLE DEPARTMENT (
     Dep_id int primary key not null,
brn_id int,
Dep_name varchar(255),
Sub_dep varchar(255),
FOREIGN KEY Department(brn_id) REFERENCES BRANCH(brn_id)
);
insert into DEPARTMENT(Dep_id, brn_id,Dep_name,Sub_dep)
values(11,1, 'Admin','security'),
(12,2,'manager','store_manager'),
(13, 1,'sales','garment_sales'),
(14,2,'supervisor','vendor_supervisor');
select * from DEPARTMENT;

CREATE TABLE EMPLOYEE (
    emp_id int not null auto_increment,
    brn_id int,
    FOREIGN KEY (brn_id) REFERENCES Branch(brn_id),
    dep_id int,
    FOREIGN KEY (dep_id) REFERENCES Department(dep_id),
    f_name varchar(255),
    l_name varchar(40),
    Email varchar(35),
    Ph_no int
    );
select * from EMPLOYEE;

CREATE TABLE LOCATION (
     loc_id int not null auto_increment primary key,
city varchar(50),
state varchar(40)
);
select * from LOCATION;

CREATE TABLE SALARY (
     brn_id int,
	 emp_id int,
    dep_id int,
    amount double,
    FOREIGN KEY (brn_id) REFERENCES Branch(brn_id),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id),
    FOREIGN KEY (dep_id) REFERENCES Department(dep_id)

);
select * from SALARY;

CREATE TABLE DATE (
dat_id int primary key,
delivery_dt date,
receive_dt date
     );
     select * from DATE;
     drop table DATE;
     
		CREATE TABLE CUSTOMER (
        cus_id int primary key,
f_name varchar(60),
l_name varchar(50),
Email varchar(50),
Ph_no int,
street varchar(70),
loc_id int,
FOREIGN KEY (loc_id) REFERENCES Location(loc_id)
     );
select * from CUSTOMER;

CREATE TABLE SUPPLIER (
sup_id int primary key,
f_name varchar(70),
l_name varchar(30),
Email varchar(20),
Ph_no int,
loc_id int,
FOREIGN KEY (loc_id) REFERENCES Location(loc_id),
street varchar(50)
     );
     select * from SUPPLIER;
     
     
     CREATE TABLE PRODUCT(
     prod_id int primary key,
cat_id int,
FOREIGN KEY (cat_id) REFERENCES category(cat_id),
prod_type varchar(20),
prod_name varchar(50),
p_unit_price double,
supplier_cost double,
margin double,
list_price float,
brn_id int,
FOREIGN KEY (brn_id) REFERENCES branch(brn_id)
     );
     select * from PRODUCT;

    
create table Order_to_Supplier (
    Ord_id int primary key auto_increment not null,
    Prod_id int,
    Sup_id int,
    Quantity int,
    Weight Varchar(50),
    height varchar(50),
    FOREIGN KEY (Prod_id) REFERENCES Product(Prod_id),
    FOREIGN KEY (Sup_id) REFERENCES Supplier(Sup_id)
    );
select * from ORDER_to_SUPPLIER; 
    
CREATE TABLE CATEGORY(
cat_id int primary key,
cat_name varchar(40),
sub_category varchar(50)
     );
select * from CATEGORY;

CREATE TABLE BILLING(
billing_id int primary key,
loc_id int,
FOREIGN KEY (loc_id) REFERENCES location(loc_id),
cus_id int,
FOREIGN KEY (cus_id) REFERENCES customer(cus_id),
prod_id int,
FOREIGN KEY (prod_id) REFERENCES product(prod_id),
tim_id int,
FOREIGN KEY (tim_id) REFERENCES time(tim_id),
dat_id int,
FOREIGN KEY (dat_id) REFERENCES date(dat_id),
quantity int,
billing_amount  double,
emp_id int,
Brn_id int
);
select * from BILLING;

CREATE TABLE SUPPLIED_PRODUCT(
SupProdct_id int primary key,
ord_id int,
FOREIGN KEY (ord_id) REFERENCES order_to_supplier(ord_id),
SupProduct_name varchar(50),
SupProd_UnitCost double,
quantity int,
dat_id int,
FOREIGN KEY (dat_id) REFERENCES date(dat_id),
loc_id int,
FOREIGN KEY (loc_id) REFERENCES location(loc_id)
);
select *from SUPPLIED_PRODUCT;

CREATE TABLE INVENTORY(
inv_id int primary key,
sup_id int,
FOREIGN KEY (sup_id) REFERENCES supplier(sup_id),
SupProdct_id int,
FOREIGN KEY (SupProdct_id) REFERENCES supplied_product(SupProdct_id),
SupProd_UnitCost double,
Recv_qty_in_stock  int,
qty_out_of_stock int,
remaining_stock int,
stock_location varchar(50),
category varchar(40),
descrip varchar(60)
);

CREATE TABLE INVENTORY_DETAILS(
inv_detail_id int primary key,
prod_id int,
FOREIGN KEY (prod_id) REFERENCES product(prod_id),
issuer_id int,
date_id int,
quantity  varchar(50),
inv_id int,
FOREIGN KEY (inv_id) REFERENCES inventory(inv_id)
);
select * from INVENTORY_DETAILS;

create table Purchase (
    Pur_id int primary key auto_increment,
    prod_id int,
    Ord_id int,
    Sup_id int,
    Dat_id int,
    Tim_id int,
    Quantity int,
    Pur_amount double,
    Foreign Key (Ord_id) references Order_to_Supplier (Ord_id),
    Foreign key (Prod_id) references Product (Prod_id),
    foreign key (Dat_id) references Date (Dat_id),
    foreign key (Sup_id) references Supplier (Sup_id),
    foreign key (Tim_id) references Time (Tim_id)
    );
    select * from Purchase;
    