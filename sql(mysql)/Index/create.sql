-- create index
create index idx_article on article_info(article);

-- create unique index
create unique index uk_article on article_info(article);

