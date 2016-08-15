--从流量记录统计某段时间内活跃用户
select count(distinct user_id) from user_traffic_log where d>1000 and timestampdiff(day,now(),log_time)<=-5 and timestampdiff(day,now(),log_time)>-10;
--关闭10天前注册但是使用流量不足1KB的用户的服务
update  user set d=0,u=0,transfer_enable=0 where d<1048 and timestampdiff(day,now(),reg_date)<=-10;

update user set d=0,u=0,transfer_enable=104857600 where transfer_enable!=0;

--给特殊用户加流量
update user set d=0,u=0,transfer_enable=53687091200,pay_status=1,service_deadline=date_add(now(), interval 360 day),next_service_deadline=date_add(now(), interval 30 day),purchase_time=now() where email='';
update user set d=0,u=0,transfer_enable=53687091200,pay_status=1,service_deadline=date_add(now(), interval 180 day),next_service_deadline=date_add(now(), interval 30 day),purchase_time=now() where email='';
