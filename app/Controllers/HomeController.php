<?php

namespace App\Controllers;
use App\Models\Donation;
use App\Models\InviteCode;
use App\Services\Auth;
use App\Services\Config, App\Services\DbConfig, App\Services\Logger;
use App\Utils\Http;

/**
 *  HomeController
 */
class HomeController extends BaseController
{

    public function index()
    {
        $homeIndexMsg = DbConfig::get('home-index');
        return $this->view()->assign('homeIndexMsg',$homeIndexMsg)->display('index.tpl');
    }

    public function code()
    {
        $msg = DbConfig::get('home-code');
        $codes = InviteCode::where('user_id', '=', '0')->take(10)->get();
        return $this->view()->assign('codes', $codes)->assign('msg', $msg)->display('code.tpl');
    }

    public function debug($request, $response, $args)
    {
        $res = [
            "ip" => Http::getClientIP(),
            "version" => Config::get('version'),
        ];
        Logger::debug(json_encode($res));
        return $this->echoJson($response, $res);
    }

    public function tos()
    {
        return $this->view()->display('tos.tpl');
    }

    public function usage(){
        return $this->view()->display('usage.tpl');
    }
    public function donation(){
        return $this->view()->display('donation.tpl');
    }
    public function donationboard(){
        $donation = Donation::orderBy('amount', 'desc')->get();
        return $this->view()->assign('donation',$donation)->display('donationboard.tpl');
    }
    public function buyinstructor(){
        return $this->view()->assign('donation',$donation)->display('buyinstructor.tpl');
    }
    //这个函数本来是提供文件下载服务的, 但是在safarai浏览器上下载的东西总是带有.html后缀, 估计是nginx把下面的http设置重写了.
    //所以直接使用nginx提供文件下载服务.
    public function download(){
        $filename = $_REQUEST['filename'];
        //echo $filename;
        $filepath = BASE_PATH."/resources/download/".$filename;
        header("Content-Type:application");
        header('Content-Disposition:attachment;filename='.$filename);
        header("Content-Length: ". filesize($filepath));
        //header('Content-Transfer-Encodeing: binary');
        readfile($filepath);
        
    }
}