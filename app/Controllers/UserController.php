<?php
namespace App\Controllers;
date_default_timezone_set('Asia/Shanghai');

use App\Models\User;
use App\Models\PayLog;
use App\Models\InviteCode;
use App\Services\Auth;
use App\Models\Node, App\Models\TrafficLog, App\Models\CheckInLog, App\Models\CardnumPasswd;
use App\Services\Config,App\Services\DbConfig;
use App\Utils\Hash, App\Utils\Tools;
use App\Services\RedisClient;

/**
 *  HomeController
 */
class UserController extends BaseController
{

    private $user;
    private $redisClient;

    public function __construct()
    {
        $this->user = Auth::getUser();
        $client = new RedisClient();
        $this->redisClient = $client;
    }
    
    public function view()
    {
        $userFooter = DbConfig::get('user-footer');
        return parent::view()->assign('userFooter',$userFooter); 
    }

    public function index($request, $response, $args)
    {
        $msg = DbConfig::get('user-index');
        if($msg == null ){
            $msg = "在后台修改用户中心公告...";
        }
        $payInfo = $this->user->payInfo();
        
        return $this->view()->assign('isBuyed',$payInfo[3])->assign('nextdeadline',$payInfo[2])->assign('deadline',$payInfo[0])->assign('isServering',$payInfo[1])->assign('msg',$msg)->display('user/index.tpl');
    }
    public function buy()
    {
        return $this->view()->display('user/buy.tpl');
    }
    public function payLog(){
        $uid = $this->user->id;
        $logs = PayLog::where('user_id', $uid)->orderBy('pay_time')->get();
        if(count($logs) > 0){
            $isPay = true;
        }else{
            $isPay = false;
        }
        return $this->view()->assign('isPay',$isPay)->assign('logs',$logs)->display('user/paylog.tpl');
    }
    public function handleBuy($request, $response, $args)
    {
        $uid = $this->user->id;
        $ref_by = $this->user->ref_by;
        //充值接口访问频次限制
        $key = 'ACCESS_BUY_'.$uid;
        $nowtime = time();
        if($this->redisClient->hexists($key,'times') && $this->redisClient->hexists($key,'expiretime')){
            $expiretime = $this->redisClient->hget($key,'expiretime');
            $times = $this->redisClient->hget($key,'times');
            if($expiretime >= $nowtime){
                $this->redisClient->hset($key,'times',$times+1);
                if($times >= 1000){
                    $res['ret'] = 0;
                    $res['ret'] = '访问充值接口太频繁, 请明天再试!';
                    return $this->echoJson($response, $res);
                }
            }else{
                $this->redisClient->hset($key,'times',1);
                $this->redisClient->hset($key,'expiretime',$nowtime+86400);
            }
        }else{
            $this->redisClient->hset($key,'times',1);
            $this->redisClient->hset($key,'expiretime',$nowtime+86400);
        }
        
        $cardnum = $request->getParam('cardnum');
        $passwd = $request->getParam('passwd');
        //error_log($cardnum.' '.$passwd."\n", 3,'/home/ss/debug.log');
        $log = CardnumPasswd::where('cardnum', $cardnum)->first();
        //error_log(gettype($log)."\n", 3,'/home/ss/debug.log');
        if($log == null){
            $res['ret'] = 0;
            $res['msg'] = '卡号或密码无效!';
            return $this->echoJson($response, $res);
        }
        if($passwd == $log->passwd && $log->is_consumed == 0){
            $amount = $log->amount;
            if($amount == 6){
                if($this->user->pay_status == 0 || $this->user->pay_status == 2){
                    $service_deadline = date('Y-m-d H:i:s',strtotime('+30 day'));
                    $next_service_deadline = date('Y-m-d H:i:s',strtotime('+30 day'));
                    $purchase_time = date('Y-m-d H:i:s',time());
                    $this->user->service_deadline = $service_deadline;
                    $this->user->purchase_time = $purchase_time;
                    $this->user->next_service_deadline = $next_service_deadline;
                    $this->user->d = 0;
                    $this->user->u = 0;
                    $this->user->transfer_enable = 53687091200;
                    $this->user->pay_status = 1;
                    if($this->user->reward == 1){
                        $this->rewardReference($ref_by);
                        $this->user->reward = 0;
                    }
                    $this->user->save();
                    $log->is_consumed = 1;
                    $log->save();
                    $res['ret'] = 1;
                    $res['msg'] = '成功购买了一个月的服务, 即将跳转到用户中心...';
                    $nowtime = time();
                    error_log('', 3,'/home/ss/accounts/'.$uid.'_'.$nowtime.'_'.$amount.'.log');
                    $this->writePaylogTable($uid, $purchase_time, 6, '月付', '代金卡');
                    return $this->echoJson($response, $res);
                }else{
                    $service_deadline = date('Y-m-d H:i:s',strtotime('+30 day',strtotime($this->user->service_deadline)));
                    $this->user->service_deadline = $service_deadline;
                    if($this->user->reward == 1){
                        $this->rewardReference($ref_by);
                        $this->user->reward = 0;
                    }
                    $this->user->save();
                    $log->is_consumed = 1;
                    $log->save();
                    $res['ret'] = 1;
                    $res['msg'] = '成功购买了一个月的服务, 即将跳转到用户中心...';
                    $nowtime = time();
                    error_log('', 3,'/home/ss/accounts/'.$uid.'_'.$nowtime.'_'.$amount.'.log');
                    $purchase_time = date('Y-m-d H:i:s',time());
                    $this->writePaylogTable($uid, $purchase_time, 6, '月付', '代金卡');
                    return $this->echoJson($response, $res);
                }
            }else if($amount == 8){
                if($this->user->pay_status == 0 || $this->user->pay_status == 2){
                    $res['ret'] = 0;
                    $res['msg'] = '你还未购买服务, 不能使用加油包, 请先购买服务!';
                    return $this->echoJson($response, $res);
                }else{
                    $this->user->transfer_enable += 53687091200;
                    if($this->user->reward == 1){
                        $this->rewardReference($ref_by);
                        $this->user->reward = 0;
                    }
                    $this->user->save();
                    $log->is_consumed = 1;
                    $log->save();
                    $res['ret'] = 1;
                    $res['msg'] = '加油包充值成功, 本月流量增加了50G, 即将跳转到用户中心...';
                    $nowtime = time();
                    error_log('', 3,'/home/ss/accounts/'.$uid.'_'.$nowtime.'_'.$amount.'.log');
                    $purchase_time = date('Y-m-d H:i:s',time());
                    $this->writePaylogTable($uid, $purchase_time, 8, '加油包', '代金卡');
                    return $this->echoJson($response, $res);
                }
            }else if($amount == 30){
                if($this->user->pay_status == 0 || $this->user->pay_status == 2){
                    //echo date('Y-m-d H:i:s',strtotime('+1 year',strtotime('2016-02-29 13:03:04')));
                    $service_deadline = date('Y-m-d H:i:s',strtotime('+180 day'));
                    $next_service_deadline = date('Y-m-d H:i:s',strtotime('+30 day'));
                    $purchase_time = date('Y-m-d H:i:s',time());
                    $this->user->service_deadline = $service_deadline;
                    $this->user->purchase_time = $purchase_time;
                    $this->user->next_service_deadline = $next_service_deadline;
                    $this->user->d = 0;
                    $this->user->u =0;
                    $this->user->transfer_enable = 53687091200;
                    $this->user->pay_status = 1;
                    if($this->user->reward == 1){
                        $this->rewardReference($ref_by);
                        $this->user->reward = 0;
                    }
                    $this->user->save();
                    $log->is_consumed = 1;
                    $log->save();
                    $res['ret'] = 1;
                    $res['msg'] = '成功购买了半年的服务, 即将跳转到用户中心...';
                    $nowtime = time();
                    error_log('', 3,'/home/ss/accounts/'.$uid.'_'.$nowtime.'_'.$amount.'.log');
                    $this->writePaylogTable($uid, $purchase_time, 30, '半年付', '代金卡');
                    return $this->echoJson($response, $res);
                }else{
                    $service_deadline = date('Y-m-d H:i:s',strtotime('+180 day',strtotime($this->user->service_deadline)));
                    $this->user->service_deadline = $service_deadline;
                    if($this->user->reward == 1){
                        $this->rewardReference($ref_by);
                        $this->user->reward = 0;
                    }
                    $this->user->save();
                    $log->is_consumed = 1;
                    $log->save();
                    $res['ret'] = 1;
                    $res['msg'] = '成功购买了半年的服务, 即将跳转到用户中心...';
                    $nowtime = time();
                    error_log('', 3,'/home/ss/accounts/'.$uid.'_'.$nowtime.'_'.$amount.'.log');
                    $purchase_time = date('Y-m-d H:i:s',time());
                    $this->writePaylogTable($uid, $purchase_time, 30, '半年付', '代金卡');
                    return $this->echoJson($response, $res);
                }
            }else if($amount == 45){
                if($this->user->pay_status == 0 || $this->user->pay_status == 2){
                    $service_deadline = date('Y-m-d H:i:s',strtotime('+360 day'));
                    $next_service_deadline = date('Y-m-d H:i:s',strtotime('+30 day'));
                    $purchase_time = date('Y-m-d H:i:s',time());
                    $this->user->service_deadline = $service_deadline;
                    $this->user->next_service_deadline = $next_service_deadline;
                    $this->user->purchase_time = $purchase_time;
                    $this->user->d = 0;
                    $this->user->u =0;
                    $this->user->transfer_enable = 53687091200;
                    $this->user->pay_status = 1;
                    if($this->user->reward == 1){
                        $this->rewardReference($ref_by);
                        $this->user->reward = 0;
                    }
                    $this->user->save();
                    $log->is_consumed = 1;
                    $log->save();
                    $res['ret'] = 1;
                    $res['msg'] = '成功购买了一年的服务, 即将跳转到用户中心...';
                    $nowtime = time();
                    error_log('', 3,'/home/ss/accounts/'.$uid.'_'.$nowtime.'_'.$amount.'.log');
                    $this->writePaylogTable($uid, $purchase_time, 45, '年付', '代金卡');
                    return $this->echoJson($response, $res);
                }else{
                    $service_deadline = date('Y-m-d H:i:s',strtotime('+360 days',strtotime($this->user->service_deadline)));
                    $this->user->service_deadline = $service_deadline;
                    if($this->user->reward == 1){
                        $this->rewardReference($ref_by);
                        $this->user->reward = 0;
                    }
                    $this->user->save();
                    $log->is_consumed = 1;
                    $log->save();
                    $res['ret'] = 1;
                    $res['msg'] = '成功购买了一年的服务, 即将跳转到用户中心...';
                    $nowtime = time();
                    $purchase_time = date('Y-m-d H:i:s',time());
                    $this->writePaylogTable($uid, $purchase_time, 45, '年付', '代金卡');
                    error_log('', 3,'/home/ss/accounts/'.$uid.'_'.$nowtime.'_'.$amount.'.log');
                    return $this->echoJson($response, $res);
                }
            }

        }else{
            $res['ret'] = 0;
            $res['msg'] = '卡号或密码无效!';
            return $this->echoJson($response, $res);
        }
    }

    
    public function node($request, $response, $args)
    {
        $msg = DbConfig::get('user-node');
        $user = Auth::getUser();
        //nodeload是通过在Node类中定义一个getNodeloadAttribute函数实现的"属性".
        //nodeload只能用在sortBy后面
        //参考http://laravel.io/forum/02-10-2014-orderby-with-my-custom-attributes
        //$nodes = Node::where('type', 1)->orderBy('sort')->get()->sortBy('nodeload');
        $nodes = Node::where('type', 1)->get();
        foreach($nodes as $node){
            $node->tmpSort = $node->getOnlineUserCount();
        }
        //uasort($nodes,array('UserController', "selfDefCmp"));
        $nodes = $nodes->sortBy('tmpSort');
        return $this->view()->assign('nodes', $nodes)->assign('user', $user)->assign('msg',$msg)->display('user/node.tpl');
    }
    // private function selfDefCmp($x, $y){
    //     if($x->tmpSort == $y->tmpSort){
    //         return 0;
    //     }
    //     return ($x->tmpSort < $y->tmpSort)? -1 : 1;
    // }

    public function nodeInfo($request, $response, $args)
    {
        $id = $args['id'];
        $node = Node::find($id);

        if ($node == null) {

        }
        $ary['server'] = $node->server;
        $ary['server_port'] = $this->user->port;
        $ary['password'] = $this->user->passwd;
        $ary['method'] = $node->method;
        if ($node->custom_method) {
            $ary['method'] = $this->user->method;
        }
        $json = json_encode($ary);
        $json_show = json_encode($ary, JSON_PRETTY_PRINT);
        $ssurl = $ary['method'] . ":" . $ary['password'] . "@" . $ary['server'] . ":" . $ary['server_port'];
        $ssqr = "ss://" . base64_encode($ssurl);

        $surge_base = Config::get('baseUrl') . "/downloads/ProxyBase.conf";
        $surge_proxy = "#!PROXY-OVERRIDE:ProxyBase.conf\n";
        $surge_proxy .= "[Proxy]\n";
        $surge_proxy .= "Proxy = custom," . $ary['server'] . "," . $ary['server_port'] . "," . $ary['method'] . "," . $ary['password'] . "," . Config::get('baseUrl') . "/downloads/SSEncrypt.module";
        return $this->view()->assign('json', $json)->assign('json_show', $json_show)->assign('ssqr', $ssqr)->assign('surge_base', $surge_base)->assign('surge_proxy', $surge_proxy)->display('user/nodeinfo.tpl');
    }

    public function profile($request, $response, $args)
    {
        return $this->view()->display('user/profile.tpl');
    }

    public function edit($request, $response, $args)
    {
        return $this->view()->display('user/edit.tpl');
    }


    public function invite($request, $response, $args)
    {
        $codes = $this->user->inviteCodes();
        return $this->view()->assign('codes', $codes)->display('user/invite.tpl');
    }

    public function doInvite($request, $response, $args)
    {
        $n = $this->user->invite_num;
        if ($n < 1) {
            $res['ret'] = 0;
            return $response->getBody()->write(json_encode($res));
        }
        for ($i = 0; $i < $n; $i++) {
            $char = Tools::genRandomChar(32);
            $code = new InviteCode();
            $code->code = $char;
            $code->user_id = $this->user->id;
            $code->save();
        }
        $this->user->invite_num = 0;
        $this->user->save();
        $res['ret'] = 1;
        return $this->echoJson($response, $res);
    }

    public function sys($request, $response, $args)
    {
        return $this->view()->assign('ana', "")->display('user/sys.tpl');
    }

    public function updatePassword($request, $response, $args)
    {
        $oldpwd = $request->getParam('oldpwd');
        $pwd = $request->getParam('pwd');
        $repwd = $request->getParam('repwd');
        $user = $this->user;
        if (!Hash::checkPassword($user->pass, $oldpwd)) {
            $res['ret'] = 0;
            $res['msg'] = "旧密码错误";
            return $response->getBody()->write(json_encode($res));
        }
        if ($pwd != $repwd) {
            $res['ret'] = 0;
            $res['msg'] = "两次输入不符合";
            return $response->getBody()->write(json_encode($res));
        }

        if (strlen($pwd) < 8) {
            $res['ret'] = 0;
            $res['msg'] = "密码太短啦";
            return $response->getBody()->write(json_encode($res));
        }
        $hashPwd = Hash::passwordHash($pwd);
        $user->pass = $hashPwd;
        $user->save();

        $res['ret'] = 1;
        $res['msg'] = "ok";
        return $this->echoJson($response, $res);
    }

    public function updateSsPwd($request, $response, $args)
    {
        $user = Auth::getUser();
        $pwd = $request->getParam('sspwd');
        $user->updateSsPwd($pwd);
        $res['ret'] = 1;
        return $this->echoJson($response, $res);
    }

    public function updateMethod($request, $response, $args)
    {
        $user = Auth::getUser();
        $method = $request->getParam('method');
        $method = strtolower($method);
        $user->updateMethod($method);
        $res['ret'] = 1;
        return $this->echoJson($response, $res);
    }

    public function logout($request, $response, $args)
    {
        Auth::logout();
        $newResponse = $response->withStatus(302)->withHeader('Location', '/auth/login');
        return $newResponse;
    }

    public function doCheckIn($request, $response, $args)
    {
        if (!$this->user->isAbleToCheckin()) {
            $res['msg'] = "您似乎已经签到过了...";
            $res['ret'] = 1;
            return $response->getBody()->write(json_encode($res));
        }
        $traffic = rand(Config::get('checkinMin'), Config::get('checkinMax'));
        $this->user->transfer_enable = $this->user->transfer_enable + Tools::toMB($traffic);
        $this->user->last_check_in_time = time();
        $this->user->save();
        $res['msg'] = sprintf("获得了 %u MB流量.", $traffic);
        $res['ret'] = 1;
        return $this->echoJson($response, $res);
    }

    public function kill($request, $response, $args)
    {
        return $this->view()->display('user/kill.tpl');
    }

    public function handleKill($request, $response, $args)
    {
        $user = Auth::getUser();
        $passwd = $request->getParam('passwd');
        // check passwd
        $res = array();
        if (!Hash::checkPassword($user->pass, $passwd)) {
            $res['ret'] = 0;
            $res['msg'] = " 密码错误";
            return $this->echoJson($response, $res);
        }
        Auth::logout();
        $user->delete();
        $res['ret'] = 1;
        $res['msg'] = "您的帐号已经从我们的系统中删除.";
        return $this->echoJson($response, $res);
    }

    public function trafficLog($request, $response, $args)
    {
        $pageNum = 1;
        if (isset($request->getQueryParams()["page"])) {
            $pageNum = $request->getQueryParams()["page"];
        }
        $traffic = TrafficLog::where('user_id', $this->user->id)->orderBy('id', 'desc')->paginate(15, ['*'], 'page', $pageNum);
        $traffic->setPath('/user/trafficlog');
        return $this->view()->assign('logs', $traffic)->display('user/trafficlog.tpl');
    }
    private function writePaylogTable($uid, $purchaseTime, $amount, $payType, $payWay){
        $payLog = new PayLog;
        $payLog->user_id = $uid;
        $payLog->pay_time = $purchaseTime;
        $payLog->amount = $amount;
        $payLog->pay_type = $payType;
        $payLog->pay_way = $payWay;
        $payLog->save();
    }
    private function rewardReference($ref_by){
        $user =  User::find($ref_by);
        if($user == NULL){
            return;
        }
        $uid = $user->id;
        if($user->pay_status == 0 || $user->pay_status == 2){
            $service_deadline = date('Y-m-d H:i:s',strtotime('+30 day'));
            $next_service_deadline = date('Y-m-d H:i:s',strtotime('+30 day'));
            $purchase_time = date('Y-m-d H:i:s',time());
            $user->service_deadline = $service_deadline;
            $user->purchase_time = $purchase_time;
            $user->next_service_deadline = $next_service_deadline;
            $user->d = 0;
            $user->u = 0;
            $user->transfer_enable = 53687091200;
            $user->pay_status = 1; 
            $user->save();
            $this->writePaylogTable($uid, $purchase_time, 0, '月付', '推荐奖励');
        }else{
            $service_deadline = date('Y-m-d H:i:s',strtotime('+30 day',strtotime($user->service_deadline)));
            $user->service_deadline = $service_deadline;
            $user->save();
            $purchase_time = date('Y-m-d H:i:s',time());
            $this->writePaylogTable($uid, $purchase_time, 0, '月付', '推荐奖励');
        }
    }
}
