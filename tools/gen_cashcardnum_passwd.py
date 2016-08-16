# -*- coding:utf-8 -*-
import time
from random import Random
def random_str(randomlength=8):
    str = ''
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789'
    length = len(chars) - 1
    random = Random()
    for i in range(randomlength):
        str+=chars[random.randint(0, length)]
    return str

def random_num(randomlength=8):
    nums = ''
    chars = '0123456789'
    length = len(chars) - 1
    random = Random()
    for i in range(randomlength):
        nums+=chars[random.randint(0, length)]
    return nums

def gen_cashcardnum_passwd(num=400):
    rst = {}
    while len(rst) < num:
        cardnum = random_num(8)
        if rst.has_key(cardnum):
            continue
        passwd = random_str(16)
        rst[cardnum] = passwd

    today = time.strftime('%Y%m%d',time.localtime(time.time()))
    file_obj_month = open('cardnum_passwd_'+ today + '_month.txt', 'w')
    file_obj_halfyear = open('cardnum_passwd_'+ today + '_halfyear.txt', 'w')
    file_obj_year = open('cardnum_passwd_'+ today + '_year.txt', 'w')
    file_obj_monpay = open('cardnum_passwd_'+ today + '_monpay.txt', 'w')
    i = 0
    for key in rst:
        if i >=0 and i<=499:
            file_obj_month.write( key + ' ' + rst[key] + '\n')
        if i >= 500 and i <= 999:
            file_obj_halfyear.write( key + ' ' + rst[key] + '\n')
        if i >= 1000 and i <= 1499:
            file_obj_year.write( key + ' ' + rst[key] + '\n')
        if i >= 1500 and i <= 1999:
            file_obj_monpay.write( key + ' ' + rst[key] + '\n')
        i = i + 1
    file_obj_month.close()
    file_obj_halfyear.close()
    file_obj_year.close()
    file_obj_monpay.close()

if __name__=="__main__":
    gen_cashcardnum_passwd(2000)
