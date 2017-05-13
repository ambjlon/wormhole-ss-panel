#!/usr/bin/python
# -*- coding: utf-8 -*-
from  datetime import *
import pytz
import MySQLdb

cntz = pytz.timezone('Asia/Shanghai')
today = datetime.now(cntz).strftime('%Y%m%d')
log_file = open('/home/ss/reconciliation/reconciliation_' + today + '.log', "w")
db = MySQLdb.connect(host="localhost",user="root",passwd="***",port=***,db="shadowsocks")
cursor = db.cursor()

def process_log(log):
    nowtime = datetime.now(cntz)
    uid = log[0]
    u = log[1]
    d = log[2]
    transfer_enable = log[3]
    pay_status = log[4]
    deadline_time = log[5]
    next_deadline_time = log[6]
    purchase_time = log[7]
    var_time = deadline_time
    log_file.write("user " + str(uid) + " u=" + str(u) + " d=" + str(d) + " transfer_enable=" + str(transfer_enable) + " next_service_deadline=" + next_deadline_time.strftime("%Y-%m-%d %H:%M:%S") + " purchase_time=" + purchase_time.strftime("%Y-%m-%d %H:%M:%S") + "\n")
    # 本脚本不保证每天凌晨都能准确无故障的处理每位用户, 所以有必要每次都做个异常数据特殊处理. 即便今天没有正常处理某位用户, 那第二天在进行异常处理的时候也能弥补回来的.
    
    if deadline_time.date() - nowtime.date() <= 0 and pay_status == 1:
        sql = "update user set u=0,d=0,transfer_enable=0,pay_status=2 where id=" +str(uid)
        try:
            cursor.execute(sql)
            db.commit()
            log_file.write("user " + str(uid) + "anomaly detection: service expire out, update mysql success: set u=0 d=0 transfer_enable=0 pay_status=2 \n")        
        except:
            log_file.write("Error: user " +str(uid) + "anomaly detection: service expire out, update mysql error.\n")
        return
    if next_deadline_time.date() - nowtime.date() < 0 and pay_status == 1:
        next_deadline_time = var_time + timedelta(days=30)
	next_deadline_time_string =  next_deadline_time.strftime("%Y-%m-%d %H:%M:%S")
        sql = "update user set u=0,d=0,transfer_enable=53687091200,next_service_deadline='" + next_deadline_time_string + "' where id=" + str(uid)
        try:
            cursor.execute(sql)
            db.commit()
            log_file.write("user " + str(uid) + "anomaly detection: get next month service, update mysql success: set u=0 d=0 transfer_enable=53687091200 next_deadline_time=" + next_deadline_time.strftime("%Y-%m-%d %H:%M:%S") + " \n")
        except:
            log_file.write("Error: user " + str(uid) + "anomaly detection: get next month service, update mysql error.\n")                    
        return;
        
    while (var_time.date() - nowtime.date()).days >= 0:
	# 今天刚购买, 已经在php那里给用户开始记账了
        if (nowtime.date() - purchase_time.date()).days == 0:
            break
        if (var_time.date() - nowtime.date()).days == 0:
            #服务到期
            if (deadline_time.date()-var_time.date()).days == 0:
                sql = "update user set u=0,d=0,transfer_enable=0,pay_status=2 where id=" +str(uid)
                try:
                    cursor.execute(sql)
                    db.commit()
                    log_file.write("user " + str(uid) + " service expire out, update mysql success: set u=0 d=0 transfer_enable=0 pay_status=2 \n")        
                except:
                    log_file.write("Error: user " +str(uid) + " service expire out, update mysql error.\n")        
            elif (next_deadline_time.date()-nowtime.date()).days == 0:
                next_deadline_time = var_time + timedelta(days=30)
		next_deadline_time_string =  next_deadline_time.strftime("%Y-%m-%d %H:%M:%S")
                sql = "update user set u=0,d=0,transfer_enable=53687091200,next_service_deadline='" + next_deadline_time_string + "' where id=" + str(uid)
                try:
                    cursor.execute(sql)
                    db.commit()
                    log_file.write("user " + str(uid) + " get next month service, update mysql success: set u=0 d=0 transfer_enable=53687091200 next_deadline_time=" + next_deadline_time.strftime("%Y-%m-%d %H:%M:%S") + " \n")
                except:
                    log_file.write("Error: user " + str(uid) + " get next month service, update mysql error.\n")                    
        var_time = var_time - timedelta(days=30)
    
if __name__ == '__main__':
    sql = "select id,u,d,transfer_enable,pay_status,service_deadline,next_service_deadline,purchase_time from user where pay_status='1'"
    try:
    	cursor.execute(sql)
    	results = cursor.fetchall()
    	for row in results:
            process_log(row)
    except:
        log_file.write("Error: read mysql error.\n")        
    log_file.close()
    db.close()
