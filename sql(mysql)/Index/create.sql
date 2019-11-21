-- 查看字段前N字节区分度
select count(distinct left(Name, 2))/count(*) from Employee;

-- create index
create index idx_article on article_info(article);

-- create unique index
create unique index uk_article on article_info(article);

