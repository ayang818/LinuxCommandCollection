-- 查询所有函数
select name from mysql.proc where db='learn' and type="function";

-- 查询所有存储过程
select name from mysql.proc where db='learn' and type="procedure";

-- 查询函数详细内容
show create function  func_name;

-- 查询存储过程详细内容
show create procedure proc_name;