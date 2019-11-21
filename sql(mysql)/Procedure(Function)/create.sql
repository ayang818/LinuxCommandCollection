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