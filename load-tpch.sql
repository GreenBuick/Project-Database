CREATE TABLE services (
    ser_servicekey decimal(3,0) not null, -- premium from company for using their services
    ser_servicefee decimal(7,2) not null,
    ser_serviceprice decimal(9,4) not null, -- price per kg of material being provided
    ser_servicedescription varchar(250) not null, -- new
    ser_equipmentkey decimal(2,0) not null
);

CREATE TABLE sales (
    s_salenumber decimal(4,0) not null, -- new
    s_totalprice decimal(8,2) not null,
    s_orderdate date not null,
    s_receiptdate date not null,
    s_materialname varchar(30) not null, -- new
    s_materialamount decimal(8,2) not null, -- material amount sold in kg, new
    s_servicekey decimal(3,0) not null,
    s_customerkey decimal(2,0) not null
);

CREATE TABLE customers (
    c_customerkey decimal(2,0) not null,
    c_customername varchar(25) not null,
    c_customerbalance decimal(9,2) not null,
    c_address varchar(46) not null,
    c_phonenumber varchar(15) not null,
    c_email varchar(256) not null
);

CREATE TABLE equipment (
    e_equipmentkey decimal(3,0) not null,
    e_equipmentname varchar(55) not null,
    e_equipmentcondition char(1) not null, -- A for top condition, B for medium condition, C for poor condition
    e_purchasedate date not null,
    e_purchaseprice decimal(8,2) not null
);

CREATE TABLE equipmentrecord (
    er_usedate date not null,
    er_conditionondate char(1) not null, -- A for top condition, B for medium condition, C for poor condition
    er_equipmentkey decimal(3,0) not null,
    er_servicekey decimal(3,0) not null
);

CREATE TABLE locations (
    l_locationfee decimal(7,2) not null, -- premium for using location
    l_locationname varchar(50) not null,
    l_materialname varchar(30) not null,
    l_materialamountkg decimal(8,2) not null, -- amount of material on site, new
    l_servicekey decimal(3,0) not null
);

CREATE TABLE materials (
    m_materialname varchar(30) not null,
    m_materialdensity decimal(4,2) not null, -- actual material density
    m_materialamountkg decimal(8,2) not null, -- total amount of material across all services
    m_materialpriceperkg decimal(9,4) not null -- in USD
);

. separator |
. import data/services.tbl services
. import data/sales.tbl sales
. import data/customers.tbl customers
. import data/equipment.tbl equipment
. import data/equipmentrecord.tbl equipmentrecord
. import data/locations.tbl locations
. import data/materials.tbl materials