<?php

namespace App\Models;
date_default_timezone_set('Asia/Shanghai');
/**
 * User Model
 */

use App\Services\Config;
use App\Utils\Hash;
use App\Utils\Tools;

class User extends Model

{
    protected $table = "user";

    public $isLogin;

    public $access_buy_times;
    
    public $isAdmin;

    protected $casts = [
        "t" => 'int',
        "u" => 'int',
        "d" => 'int',
        "port" => 'int',
        "transfer_enable" => 'float',
        "enable" => 'int',
        'is_admin' => 'boolean',
    ];

    public function getGravatarAttribute()
    {
        $hash = md5(strtolower(trim($this->attributes['email'])));
        return "https://secure.gravatar.com/avatar/$hash";
    }

    public function isAdmin()
    {
        return $this->attributes['is_admin'];
    }

    public function lastSsTime()
    {
        if ($this->attributes['t'] == 0) {
            return "从未使用";
        }
        return Tools::toDateTime($this->attributes['t']);
    }

    public function lastCheckInTime()
    {
        if ($this->attributes['last_check_in_time'] == 0) {
            return "从未签到";
        }
        return Tools::toDateTime($this->attributes['last_check_in_time']);
    }

    public function regDate()
    {
        return $this->attributes['reg_date'];
    }

    public function updatePassword($pwd)
    {
        $this->pass = Hash::passwordHash($pwd);
        $this->save();
    }

    public function updateSsPwd($pwd)
    {
        $this->passwd = $pwd;
        $this->save();
    }

    public function updateMethod($method)
    {
        $this->method = $method;
        $this->save();
    }

    public function addInviteCode()
    {
        $uid = $this->attributes['id'];
        $code = new InviteCode();
        $code->code = Tools::genRandomChar(32);
        $code->user = $uid;
        $code->save();
    }

    public function addManyInviteCodes($num)
    {
        for ($i = 0; $i < $num; $i++) {
            $this->addInviteCode();
        }
    }

    public function trafficUsagePercent()
    {
        $total = $this->attributes['u'] + $this->attributes['d'];
        $transferEnable = $this->attributes['transfer_enable'];
        if ($transferEnable == 0) {
            return 0;
        }
        $percent = $total / $transferEnable;
        $percent = round($percent, 2);
        $percent = $percent * 100;
        return $percent;
    }
    public function payInfo(){
        $deadlineTime = $this->attributes['service_deadline'];
        //if() < time() &&
        //$service_deadline = date('Y-m-d H:i:s',strtotime('+180 day',strtotime($this->user->service_deadline)));
        if($this->attributes['pay_status'] == '1'){
            $rst[0] = $deadlineTime; //服务到期时间
            $rst[1] = true; //服务是否在付费状态
            $nextDeadlineTime = $this->attributes['next_service_deadline'];
            $rst[2] = $nextDeadlineTime; //本月服务到期时间
            $rst[3] = true; //是否购买过服务
        }else if($this->attributes['pay_status'] == '0'){
            $rst[0] = "Rio 2016";
            $rst[1] = false;
            $rst[2] = "Rio 2016";
            $rst[3] = false;
        }else if($this->attributes['pay_status'] == '2'){
            $rst[0] = "Rio 2016";
            $rst[1] = false;
            $rst[2] = "Rio 2016";
            $rst[3] = true;
        }
        return $rst;
    }

    public function getMonthTrafficPercent(){
        
        $d = $this->attributes['d'];
        $transfer_enable = $this->attributes['transfer_enable'];
        return Tools::flowAutoShow($d)."/".Tools::flowAutoShow($transfer_enable);
    }
    
    public function enableTraffic()
    {
        $transfer_enable = $this->attributes['transfer_enable'];
        return Tools::flowAutoShow($transfer_enable);
    }

    public function enableTrafficInGB()
    {
        $transfer_enable = $this->attributes['transfer_enable'];
        return Tools::flowToGB($transfer_enable);
    }

    public function usedTraffic()
    {
        $total = $this->attributes['u'] + $this->attributes['d'];
        return Tools::flowAutoShow($total);
    }

    public function unusedTraffic()
    {
        $total = $this->attributes['u'] + $this->attributes['d'];
        $transfer_enable = $this->attributes['transfer_enable'];
        return Tools::flowAutoShow($transfer_enable - $total);
    }

    public function isAbleToCheckin()
    {
        $last = $this->attributes['last_check_in_time'];
        $hour = Config::get('checkinTime');
        if ($last + $hour * 3600 < time()) {
            return true;
        }
        return false;
    }

    /*
     * @param traffic 单位 MB
     */
    public function addTraffic($traffic)
    {
    }

    public function inviteCodes()
    {
        $uid = $this->attributes['id'];
        return InviteCode::where('user_id', $uid)->get();
    }

}
