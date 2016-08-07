--从流量记录统计某段时间内活跃用户
select count(distinct user_id) from user_traffic_log where d>1000 and timestampdiff(day,now(),log_time)<=-5 and timestampdiff(day,now(),log_time)>-10;
--关闭10天前注册但是使用流量不足1KB的用户的服务
update  user set d=0,u=0,transfer_enable=0 where d<1048 and timestampdiff(day,now(),reg_date)<=-10;
