<?php

namespace App\Controllers;

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

    public function download(){
        $filename = $_REQUEST['filename'];
        echo $filename;
        $filepath = "/home/ss/ss-panel-3.3.9/resources/download/".$filename;
        header("Content-Type:application/zip");
        header('Content-Disposition:attachment;filename='.$filename);
        header('Content-Transfer-Encodeing: binary');
        readfile($filepath);
        
    }
}