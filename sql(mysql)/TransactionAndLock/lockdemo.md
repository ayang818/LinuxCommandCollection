# 表级锁示例

|session_1|session_2|
|-|-|
|lock table film read;||
|can select |can select too|
||insert into film(name) values("lock test")|
||wait|
|unlock tables||
||insert successed|