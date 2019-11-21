-- 创建生成随机字符串函数
create function rand_str(len int) returns varchar(255)
begin
declare temp_str varchar(255) default 'abcdefghijklmnopqrstuvwxyzABCDEFJHIJKLMNOPQRSTUVWXYZ';
declare i int default 0;
declare res_str varchar(255) default '';
while i<len
do
set res_str = concat(res_str, substring(temp_str, floor(1+rand()*52), 1));
set i = i+1;
end while;
return res_str;
end $$

-- 创建插入数据的存储过程
create procedure insert_user_test(in start int(10), in max_num int(10))
begin 
    declare i int default 0;
    set autocommit = 0;
    repeat
        set i = i + 1;
        insert into tbl_user values((start+i), rand_str(8), concat(rand_str(6), '@ayang818.com'), 1+floor(rand()*100), 3 ,now());
        until i = max_num
    end repeat;
    commit;
end $$