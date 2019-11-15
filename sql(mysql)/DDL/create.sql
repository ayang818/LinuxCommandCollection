-- 创建数据库
create database test;

-- 创建数据表
create table user (
    id bigint unsigned primary key auto_increment not null,
    username varchar(40) null,
    password varchar(40) null
);

-- 修改数据表中的某一列类型
alter table user modify username varchar(50) null;

-- 往数据表中增加一列
alter table user add gmt_create datetime null;

-- 删除数据表的一列
alter table user drop gmt_create;

-- 字段改名
alter table user change username user varchar(40) null;

-- 修改表名
alter table user rename user_info;

-- 改变位置
alter table user change user user varchar(40) null after id;