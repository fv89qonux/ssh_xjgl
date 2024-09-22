## 本项目实现的最终作用是基于SSH学生学籍管理系统及教务管理系统
## 分为3个角色
### 第1个角色为管理员角色，实现了如下功能：
 - 学科管理
 - 学籍信息管理
 - 教务公告管理
 - 教师管理
 - 班级管理
 - 管理员登录
 - 课表管理
 - 身体素质管理
### 第2个角色为教师角色，实现了如下功能：
 - 修改密码
 - 成绩查询
 - 成绩管理
 - 教师登录
 - 查看学籍信息
 - 查看教务公告
 - 查看课表
 - 查看身体素质信息
### 第3个角色为学生角色，实现了如下功能：
 - 学生登录
 - 查看教务公告
## 数据库设计如下：
# 数据库设计文档

**数据库名：** ssh_xjgl

**文档版本：** 


| 表名                  | 说明       |
| :---: | :---: |
| [cj](#cj) |  |
| [class_room](#class_room) |  |
| [jiangchen](#jiangchen) |  |
| [jt](#jt) |  |
| [kb](#kb) |  |
| [manage](#manage) |  |
| [news](#news) | 新闻资讯表 |
| [stsz](#stsz) |  |
| [teacher](#teacher) | 教师信息表 |
| [teacher_class](#teacher_class) |  |
| [user](#user) | 用户表 |
| [xk](#xk) |  |

**表名：** <a id="cj">cj</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | df |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  3   | xq |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  4   | userid |   int   | 10 |   0    |    Y     |  N   |   NULL    | 用户ID  |
|  5   | xkId |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="class_room">class_room</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | isDelete |   int   | 10 |   0    |    Y     |  N   |   NULL    | 是否删除  |
|  3   | name |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 名字  |
|  4   | nj |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="jiangchen">jiangchen</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | code |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  3   | name |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 名字  |
|  4   | leixing |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  5   | shijian |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  6   | shuoming |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="jt">jt</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | age |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 年龄  |
|  3   | brgx |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  4   | dw |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  5   | name |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 名字  |
|  6   | phone |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 电话  |
|  7   | xb |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  8   | userid |   int   | 10 |   0    |    Y     |  N   |   NULL    | 用户ID  |

**表名：** <a id="kb">kb</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | name1 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 名称  |
|  3   | name10 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  4   | name11 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  5   | name12 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  6   | name13 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  7   | name14 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  8   | name15 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  9   | name16 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  10   | name17 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  11   | name18 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  12   | name19 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  13   | name2 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  14   | name20 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  15   | name21 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  16   | name22 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  17   | name23 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  18   | name24 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  19   | name25 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  20   | name26 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  21   | name27 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  22   | name28 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  23   | name29 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  24   | name3 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  25   | name30 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  26   | name31 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  27   | name32 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  28   | name33 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  29   | name34 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  30   | name35 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  31   | name36 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  32   | name37 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  33   | name38 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  34   | name39 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  35   | name4 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  36   | name40 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  37   | name5 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  38   | name6 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  39   | name7 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  40   | name8 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  41   | name9 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  42   | xq |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  43   | classroomId |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="manage">manage</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | name |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 名字  |
|  3   | password |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 密码  |
|  4   | realname |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 真实名字  |
|  5   | type |   int   | 10 |   0    |    N     |  N   |       | 类型  |

**表名：** <a id="news">news</a>

**说明：** 新闻资讯表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | content |   longtext   | 2147483647 |   0    |    Y     |  N   |   NULL    | 内容  |
|  3   | createTime |   datetime   | 19 |   0    |    Y     |  N   |   NULL    | 创建时间  |
|  4   | introduction |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  5   | title |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 标题  |

**表名：** <a id="stsz">stsz</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | fhl |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  3   | jzbs |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  4   | phone |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 电话  |
|  5   | sg |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  6   | tz |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  7   | xx |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  8   | xy |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  9   | ywjb |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  10   | userid |   int   | 10 |   0    |    Y     |  N   |   NULL    | 用户ID  |

**表名：** <a id="teacher">teacher</a>

**说明：** 教师信息表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | isDelete |   int   | 10 |   0    |    Y     |  N   |   NULL    | 是否删除  |
|  3   | passWrd |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  4   | realname |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 真实名字  |
|  5   | username |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 用户名  |
|  6   | xkId |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="teacher_class">teacher_class</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | classroomId |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  3   | teacherid |   int   | 10 |   0    |    Y     |  N   |   NULL    | 教师ID  |

**表名：** <a id="user">user</a>

**说明：** 用户表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | address |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 地址  |
|  3   | birth |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  4   | cf |   text   | 65535 |   0    |    Y     |  N   |   NULL    |   |
|  5   | createTime |   datetime   | 19 |   0    |    Y     |  N   |   NULL    | 创建时间  |
|  6   | isDelete |   int   | 10 |   0    |    Y     |  N   |   NULL    | 是否删除  |
|  7   | jg |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  8   | jl |   text   | 65535 |   0    |    Y     |  N   |   NULL    |   |
|  9   | mz |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 姓名  |
|  10   | password |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 密码  |
|  11   | phone |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 电话  |
|  12   | photoUrl |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  13   | realname |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 真实名字  |
|  14   | username |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 用户名  |
|  15   | xb |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  16   | classroomId |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  17   | jage1 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  18   | jage2 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  19   | jage3 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  20   | jdw1 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  21   | jdw2 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  22   | jdw3 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  23   | jgx1 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  24   | jgx2 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  25   | jgx3 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  26   | jlx1 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  27   | jlx2 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  28   | jlx3 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  29   | jname1 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  30   | jname2 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  31   | jname3 |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  32   | jsex1 |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  33   | jsex2 |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  34   | jsex3 |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  35   | bj |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  36   | nj |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  37   | xx |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |

**表名：** <a id="xk">xk</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | id |   int   | 10 |   0    |    N     |  Y   |       | 自增主键  |
|  2   | code |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  3   | name |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 名字  |

