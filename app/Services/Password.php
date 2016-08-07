<?php


namespace App\Services;

use App\Models\PasswordReset;
use App\Utils\Tools;

/***
 * Class Password
 * @package App\Services
 */
class Password
{
    /**
     * @param $email string
     * @return bool
     */
    public static function sendResetEmail($email)
    {
        $pwdRst = new PasswordReset();
        $pwdRst->email = $email;
        $pwdRst->init_time = time();
        $pwdRst->expire_time = time() + 3600 * 24; // @todo
        $pwdRst->token = Tools::genRandomChar(64);
        if (!$pwdRst->save()) {
            return false;
        }
        $subject = Config::get('appName') . "重置密码";
        $resetUrl = Config::get('baseUrl') . "/password/token/" . $pwdRst->token;
        $body = "点击下面的链接或者将下面的链接复制到浏览器的地址栏, 完成密码的重置.\n".$resetUrl."\n此链接的有效期是一天. 请注意保密不要将此链接示人, 否则造成的账号丢失, 本站概不负责.";
        try {
            if(Mail::send($email, $subject, $body)){
                return true;
            }else{
                return false;
            }
        } catch (Exception $e) {
            return false;
        }
        return true;
    }

    public static function resetBy($token, $password)
    {

    }

}