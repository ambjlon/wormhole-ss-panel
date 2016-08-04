<?php


namespace App\Services\Mail;

use PHPMailer;
use App\Services\Config;

class Smtp extends Base
{

    private $mail, $config;

    public function __construct()
    {
        $this->config = $this->getConfig();
        $mail = new PHPMailer;
        //$mail->SMTPDebug = 3;                               // Enable verbose debug output
        $mail->isSMTP();                                      // Set mailer to use SMTP
        $mail->Host = $this->config['host'];  // Specify main and backup SMTP servers
        $mail->SMTPAuth = true;                               // Enable SMTP authentication
        $mail->Username = $this->config['username'];                 // SMTP username
        $mail->Password = $this->config['passsword'];                    // SMTP password
        $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
        $mail->Port = $this->config['port'];                                    // TCP port to connect to
        $mail->setFrom($this->config['sender'], $this->config['name']);
        $mail->CharSet = 'UTF-8';
        $this->mail = $mail;
    }

    public function getConfig()
    {
        $smtpHostAry = explode(';', Config::get('smtp_host'));
        $usernameAry = explode(';', Config::get('smtp_username'));
        $portAry = explode(';', Config::get('smtp_port'));
        $senderAry = explode(';', Config::get('smtp_sender'));
        $nameAry = explode(';', Config::get('smtp_name'));
        $passwordAry = explode(';', Config::get('smtp_password'));

        for($i=0;$i<count($portAry);$i++){
            $conf[$i]['host'] = $smtpHostAry[$i];
            $conf[$i]['username'] = $usernameAry[$i];
            $conf[$i]['port'] = $portAry[$i];
            $conf[$i]['sender'] = $senderAry[$i];
            $conf[$i]['name'] = $nameAry[$i];
            $conf[$i]['password'] = $passwordAry[$i];
        }

        $rnd = rand(0, count($portAry)-1);
                
        return [
            "host" => $conf[$rnd]['host'],
            "username" => $conf[$rnd]['username'],
            "port" => $conf[$rnd]['port'],
            "sender" => $conf[$rnd]['sender'],
            "name" => $conf[$rnd]['name'],
            "passsword" => $conf[$rnd]['password']
        ];
    }

    public function send($to, $subject, $text, $file)
    {
        $mail = $this->mail;
        $mail->addAddress($to);     // Add a recipient
        //$mail->isHTML(true);
        $mail->Subject = $subject;
        $mail->Body = $text;
        // $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
        if (!$mail->send()) {
            return false;
        }
        return true;
    }

}