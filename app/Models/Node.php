<?php

namespace App\Models;

/**
 * Node Model
 */

use App\Utils\Tools;

class Node extends Model

{
    protected $table = "ss_node";
    public $tmpSort;

    public function getLastNodeInfoLog()
    {
        $id = $this->attributes['id'];
        $log = NodeInfoLog::where('node_id', $id)->orderBy('id', 'desc')->first();
        if ($log == null) {
            return null;
        }
        return $log;
    }

    public function getNodeUptime()
    {
        $log = $this->getLastNodeInfoLog();
        if ($log == null) {
            return "暂无数据";
        }
        return Tools::secondsToTime((int)$log->uptime);
    }

    public function getNodeLoad()
    {
        $log = $this->getLastNodeInfoLog();
        if ($log == null) {
            return "暂无数据";
        }
        return $log->load;
    }

    public function getLastNodeOnlineLog()
    {
        $id = $this->attributes['id'];
        $log = NodeOnlineLog::where('node_id', $id)->orderBy('id', 'desc')->first();
        if ($log == null) {
            return null;
        }
        return $log;
    }
    public function getLastNodeOnlineLogNoid(){
        $id = $this->attributes['id'];
        $log = NodeOnlineLogNoid::where('node_id', $id)->first();
        if ($log == null) {
            return null;
        }
        return $log;
    }

    public function getOnlineUserCount()
    {
        $log = $this->getLastNodeOnlineLogNoid();
        if ($log == null) {
            return "暂无数据";
        }
        return $log->online_user;
    }

    public function getTrafficFromLogs()
    {
        $id = $this->attributes['id'];
        $traffic = TrafficLog::where('node_id', $id)->sum('u') + TrafficLog::where('node_id', $id)->sum('d');
        if ($traffic == 0) {
            return "暂无数据";
        }
        return Tools::flowAutoShow($traffic);
    }
    public function getNodeTrafficLoad(){
        $id = $this->attributes['id'];
        $log = NodeTrafficLoad::where('node_id', $id)->first();
        if($log == null) {
            return "暂无数据";
        }
        return Tools::flowAutoShow($log->load);
    }
    //参考http://stackoverflow.com/questions/34907575/eloquent-model-method-or-attribute-for-calculation
    //这里实现了一个"属性".
    public function getNodeloadAttribute(){
        $id = $this->attributes['id'];
        $log = NodeTrafficLoad::where('node_id', $id)->first();
        if($log == null) {
            return 0;
        }
        return $log->load;
    }
    
}
