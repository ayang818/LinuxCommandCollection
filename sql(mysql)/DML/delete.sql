-- 删除记录
delete from user_info where id=2;

-- 使用别名
delete a from user_info a where id=1;

-- 注意——无论单表还是多表，不加where条件会把表的所有记录删除，所以删除时一定要小心

