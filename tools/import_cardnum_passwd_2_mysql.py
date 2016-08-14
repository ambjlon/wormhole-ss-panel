#!/usr/bin/python
# -*- coding: utf-8 -*-
import MySQLdb

db = MySQLdb.connect(host="localhost",user="root",passwd="***",port=***,db="shadowsocks")
cursor = db.cursor()
pf = open('cardnum_passwd_20160730_year.txt')

line = pf.readline()
while line:
    line = line.strip()
    cardnum = line.split(' ')[0]
    passwd = line.split(' ')[1]
    sql = 'insert into cardnum_passwd (cardnum, passwd, amount, is_consumed) values("' + cardnum + '", "' + passwd + '", 45, 0 )';
    cursor.execute(sql)
    db.commit()
    line = pf.readline()

pf.close()
db.close()
