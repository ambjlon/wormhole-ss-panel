#!/usr/bin/python
# -*- coding: utf-8 -*-
import sys
import getopt
from  datetime import *
import pytz
import MySQLdb

cntz = pytz.timezone('Asia/Shanghai')
today = datetime.now(cntz).strftime('%Y%m%d')
db = MySQLdb.connect(host="localhost", user="root", passwd="", port=3306, db="shadowsocks")
cursor = db.cursor()

def write_pay_log(uid, purchase_time, amount, pay_type, pay_way):
    sql = "insert into pay_log (user_id,pay_time,amount,pay_type,pay_way) values(" + str(uid) + ", '" + purchase_time.strftime("%Y-%m-%d %H:%M:%S") + "', " + str(amount) + ", '" + pay_type + "', '" + pay_way + "'"  + ")"
    try:
        cursor.execute(sql)
        db.commit()
        print "Execute sql: [" + sql + "]"
    except:
        print "Error when execute sql: [" + sql + "]"

def reward_ref(ref_by):
    nowtime = datetime.now(cntz)
    sql = "select pay_status,service_deadline from user where id=" + str(ref_by)
    try:
    	cursor.execute(sql)
    	log = cursor.fetchone()
        print "Execute sql: [" + sql + "]"
        if log is None:
            return
        pay_status = int(log[0])
        service_deadline = log[1]
    except:
        print "Error when execute sql: [" + sql + "]"

    if pay_status == 0 or pay_status == 2:
        service_deadline = nowtime + timedelta(days=30)
        next_service_deadline = nowtime + timedelta(days=30)
        purchase_time = nowtime
        sql = "update user set u=0,d=0,transfer_enable=53687091200, pay_status='" + "1', service_deadline='" + service_deadline.strftime("%Y-%m-%d %H:%M:%S") + "', next_service_deadline='" + next_service_deadline.strftime("%Y-%m-%d %H:%M:%S") + "', purchase_time='" + purchase_time.strftime("%Y-%m-%d %H:%M:%S") + "'" +  " where id=" + str(ref_by)
    else:
        service_deadline = service_deadline + timedelta(days=30)
        purchase_time = nowtime
        sql = "update user set service_deadline='" + service_deadline.strftime("%Y-%m-%d %H:%M:%S") + "' where id=" + str(ref_by)        

    try:
        cursor.execute(sql)
        db.commit()
        print "Execute sql: [" + sql + "]"
    except:
        print "Error when execute sql: [" + sql + "]"
    
    write_pay_log(ref_by, purchase_time, 0, '月付', '推荐奖励')
    

def scancode_pay_process(email, amount):
    sql = "select pay_status,service_deadline,reward,ref_by,id,transfer_enable from user where email='" + email + "'"
    try:
    	cursor.execute(sql)
    	log = cursor.fetchone()
        if log is None:
            print "No user found!"
            return
        pay_status = int(log[0])
        service_deadline = log[1]
        reward = log[2]
        ref_by = log[3]
        uid = log[4]
        transfer_enable = log[5]
        print "Execute sql: [" + sql + "]"
    except:
        print "Error when execute sql: [" + sql + "]"

    nowtime = datetime.now(cntz)
    if amount == 6:
        if pay_status == 0 or pay_status == 2:
            service_deadline = nowtime + timedelta(days=30)
            next_service_deadline = nowtime + timedelta(days=30)
            purchase_time = nowtime
            if reward == 1:
                reward_ref(ref_by)
                reward = 0
            sql = "update user set u=0,d=0,transfer_enable=53687091200, pay_status='" + "1', service_deadline='" + service_deadline.strftime("%Y-%m-%d %H:%M:%S") + "', next_service_deadline='" + next_service_deadline.strftime("%Y-%m-%d %H:%M:%S") + "', purchase_time='" + purchase_time.strftime("%Y-%m-%d %H:%M:%S") + "', reward=" + str(reward) + " where email='" + email + "'"
            write_pay_log(uid, purchase_time, 6, '月付', '扫码')
        else:
            service_deadline = service_deadline + timedelta(days=30)
            purchase_time = nowtime
            if reward == 1:
                reward_ref(ref_by)
                reward = 0
            sql = "update user set service_deadline='" + service_deadline.strftime("%Y-%m-%d %H:%M:%S") + "', reward=" + str(reward) + " where email='" + email + "'"
            write_pay_log(uid, purchase_time, 6, '月付', '扫码')
    elif amount == 8:
        if pay_status == 0 or pay_status == 2:
            print "cannot oiling, have to buy services firstly!"
            return
        else:
            transfer_enable = transfer_enable + 53687091200
            purchase_time = nowtime
            if reward == 1:
                reward_ref(ref_by)
                reward = 0
            sql = "update user set transfer_enable=" + str(transfer_enable) + ", reward=" + str(reward) +  " where email='" + email + "'"
            write_pay_log(uid, purchase_time, 8, '加油包', '扫码')
    elif amount ==  30:
        if pay_status == 0 or pay_status == 2:
            service_deadline = nowtime + timedelta(days=180)
            next_service_deadline = nowtime + timedelta(days=30)
            purchase_time = nowtime
            if reward == 1:
                reward_ref(ref_by)
                reward = 0
            sql = "update user set u=0,d=0,transfer_enable=53687091200, pay_status='" + "1', service_deadline='" + service_deadline.strftime("%Y-%m-%d %H:%M:%S") + "', next_service_deadline='" + next_service_deadline.strftime("%Y-%m-%d %H:%M:%S") + "', purchase_time='" + purchase_time.strftime("%Y-%m-%d %H:%M:%S") + "', reward=" + str(reward) + " where email='" + email + "'"
            write_pay_log(uid, purchase_time, 30, '半年付', '扫码')
        else:
            service_deadline = service_deadline + timedelta(days=180)
            purchase_time = nowtime
            if reward == 1:
                reward_ref(ref_by)
                reward = 0
            sql = "update user set service_deadline='" + service_deadline.strftime("%Y-%m-%d %H:%M:%S") + "', reward=" + str(reward) + " where email='" + email + "'"
            write_pay_log(uid, purchase_time, 30, '半年付', '扫码')
    elif amount == 45:
        if pay_status == 0 or pay_status == 2:
            service_deadline = nowtime + timedelta(days=360)
            next_service_deadline = nowtime + timedelta(days=30)
            purchase_time = nowtime
            if reward == 1:
                reward_ref(ref_by)
                reward = 0
            sql = "update user set u=0,d=0,transfer_enable=53687091200, pay_status='" + "1', service_deadline='" + service_deadline.strftime("%Y-%m-%d %H:%M:%S") + "', next_service_deadline='" + next_service_deadline.strftime("%Y-%m-%d %H:%M:%S") + "', purchase_time='" + purchase_time.strftime("%Y-%m-%d %H:%M:%S") + "', reward=" + str(reward) + " where email='" + email + "'"
            write_pay_log(uid, purchase_time, 45, '年付', '扫码')
        else:
            service_deadline = service_deadline + timedelta(days=360)
            purchase_time = nowtime
            if reward == 1:
                reward_ref(ref_by)
                reward = 0
            sql = "update user set service_deadline='" + service_deadline.strftime("%Y-%m-%d %H:%M:%S") + "', reward=" + str(reward) + " where email='" + email + "'"
            write_pay_log(uid, purchase_time, 45, '年付', '扫码')

    try:
        cursor.execute(sql)
        db.commit()
        print "Execute sql: [" + sql + "]"
    except:
        print "Error when execute sql: [" + sql + "]"

            
        

def usage():
    print 'scancode_pay_process.py usage:'
    print '-h --help: get help'
    print '-e --email: user email'
    print '-a --amount: pay amount'

if __name__ == '__main__':
    try:
        opts, args = getopt.getopt(sys.argv[1:], 'he:a:', ['email=', 'amount=', '--help'])
    except getopt.GetoptError, err:
        print str(err)
        usage()
        sys.exit(2)
    for o, a in opts:
        if o in ('-h', '--help'):
            usage()
            sys.exit(1)
        elif o in ('-e', '--email'):
            email = a
        elif o in ('-a', '--amount'):
            amount = a
        else:
            print 'unhandled option'
            sys.exit(3)

    if 'email' not in locals().keys():
        print 'email is necessary'
        sys.exit(3)
    if 'amount' not in locals().keys():
        print 'amount is necessary'
        sys.exit(3)

    scancode_pay_process(email, int(amount))
