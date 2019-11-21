-- 最简单暴力的查询
select * from user_info;

-- 查询不重复的记录
select distinct user username, password from user_info;

-- where条件查询
select user username, password from user_info where id=1;

-- 排序(按id降序)
select * from user_info order by id desc;

-- 注意：若排序字段的值一样，那么值相等的字段会按照第二个字段进行排序。

-- 分页(第10条记录后的10条记录)
select * from user_info order by id desc limit 10 offset 10;

-- 效率高的分页
select a.* from user_info a, (select id from user_info where id>10 limit 10 offset 10) b where a.id=b.id;

-- 聚合函数 
select count(*) num, user from user_info group by user with rollup having count(*)>2;

-- having 关键字是对聚合后的结果进行条件的过滤， where时聚合前过滤

-- 内连接查询(表连接通常情况下会用来优化子查询)
select a.user, b.get_like from user_info a, message_info b where a.id=b.user_id;
select a.user, b.get_like from user_info a inner join message_info b on a.id=b.user_id;

-- 举例
-- Employee 表包含所有员工，他们的经理也属于员工。每个员工都有一个 Id，此外还有一列对应员工的经理的 Id。
-- +----+-------+--------+-----------+
-- | Id | Name  | Salary | ManagerId |
-- +----+-------+--------+-----------+
-- | 1  | Joe   | 70000  | 3         |
-- | 2  | Henry | 80000  | 4         |
-- | 3  | Sam   | 60000  | NULL      |
-- | 4  | Max   | 90000  | NULL      |
-- +----+-------+--------+-----------+
-- 给定 Employee 表，编写一个 SQL 查询，该查询可以获取收入超过他们经理的员工的姓名。在上面的表格中，Joe 是唯一一个收入超过他的经理的员工。

-- 使用子查询(对外层查询结果进行遍历时进行子查询)
select Name as Employee from Employee a where a.Salary > (select Salary from Employee b where b.id = a.ManagerId);

-- 使用内联查询
select a.Name Employee from Employee  a, Employee b where a.ManagerId = b.id and a.Salary >= b.Salary; 

-- 左连接查询
select a.user,b.get_like from user_info a left join message_info b on a.id=b.user_id;

-- 右连接查询 
select a.user,b.get_like from user_info a right join message_info b on a.id=b.user_id;

-- 子查询
select user from user_info a where id in (select user_id from message_info);

-- 联合记录(union all 比union少做了一次distinct)
select id from user_info union all select user_id from message_info;