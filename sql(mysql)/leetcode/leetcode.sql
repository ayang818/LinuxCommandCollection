-- leetcode 185 部门工资前三高的所有员工
-- 思路 ：要是一个员工的工资只比两个工资低，那么他就是第三高的工资
select d.name Department, e.Name Employee , e.Salary
from employee as e inner join department 
as d 
on e.DepartmentId=d.id
where (select count(distinct Salary) from employee e1 where e1.salary > e.salary and e1.DepartmentId  = e.DepartmentId)<3 
order by d.name,e.salary desc;

-- leetcode 197 上升的温度
-- 计算时间差函数 datediff()
select a.Id from Weather a inner join Weather b where datediff(a.RecordDate, b.RecordDate) = 1 and a.Temperature > b.Temperature;

-- leetcode 196 删除重复的电子邮件
-- 思路：mysql 中不可以在要执行删除的表中执行查询，解决这个问题可以使用子查询间接解决
delete from Person where Id in (select Id from (select b.Id from Person a inner join Person b where a.Id < b.Id and a.Email = b.Email) d)

-- leetcode 177 第N高的薪水
-- 思路：limit offset 后面不可以加表达式
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  declare test int;
  set test=N-1;
  RETURN (
      select Salary from Employee  order by Salary desc limit 1 offset test;
  );
END