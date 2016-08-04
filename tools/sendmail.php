<?php
require_once('class.phpmailer.php');
include('class.smtp.php');
$mail = new PHPMailer;
$mail->isSMTP();                                      // Set mailer to use SMTP
$mail->Host = 'smtp.163.com';  // Specify main and backup SMTP servers
$mail->SMTPAuth = true;                               // Enable SMTP authentication
$mail->Username = 'wormhole_services';                 // SMTP username
$mail->Password = '******';                    // SMTP password
$mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
$mail->Port = 25;
$mail->setFrom('wormhole_services@163.com', 'wormhole');
$mail->CharSet = 'UTF-8';
$mail->addAddress('*********@qq.com');
//$mail->isHTML(true);
$mail->Subject    = 'nihao~';
$mail->Body    = '我是陈江龙   ~~#@';
//$mail->AltBody = '我是陈龙   ~~#@';

if(!$mail->send()) {
    echo 'Message could not be sent.';
    echo 'Mailer Error: ' . $mail->ErrorInfo;
} else {
    echo 'Message has been sent';
}

?>