-- 表准备
create table film(id int unsigned primary key auto_increment, name varchar(20));

create table trigger_demo(id int unsigned primary key auto_increment, note varchar(20));

-- 创建插入触发器
create trigger ins_film_before
before insert on film for each row
begin
insert into trigger_demo(note) values("before insert");
end;
&&

create trigger ins_film_after
after insert on film for each row 
begin
insert into trigger_demo (note) values("after film insert");
end; 
$$