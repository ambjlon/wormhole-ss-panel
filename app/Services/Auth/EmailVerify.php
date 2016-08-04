<?php


namespace App\Services\Auth;

use App\Services\Config, App\Services\Mail;
use App\Models\EmailVerify as EmailVerifyModel;
use App\Utils\Tools;

class EmailVerify
{
    /**
     * @param $email string
     * @return bool
     */
    public static function sendVerification($email)
    {
        $ttl = Config::get('emailVerifyTTL');
        $verification = EmailVerifyModel::where('email', '=', $email)->first();
        if ($verification == null) {
            $verification = new EmailVerifyModel();
            $verification->email = $email;
        }
        $verification->token = Tools::genRandomChar(Config::get('emailVerifyCodeLength'));
        $verification->expire_at = time() + $ttl * 60;
        if (!$verification->save()) {
            return false;
        }
        $appName = Config::get('appName');
        $subject = $appName . ' 邮箱验证码';
        $body = "您的验证码是:\n".$verification->token."\n验证码有效期".$ttl."分钟.\n";
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

    /**
     * @param string $email
     * @param string $verify_code
     * @return bool
     */
    public static function checkVerifyCode($email, $verify_code)
    {
        $verification = EmailVerifyModel::where('email', '=', $email)->first();
        if ($verification == null || $verification->expire_at < time() || $verification->token !== $verify_code) {
            return false;
        }
        $verification->delete();
        return true;
    }
}