-- 更新记录
update user_info set user="modified" where id = 1;

-- 同时更新两个表的字段(注意 多表更新的语法更多用在根据一个表的字段来动态更新另一个表的字段)
update user_info as a, student_info set a.user=b.id*a.id, b.id=a.id*b.id where a.id=b.id;