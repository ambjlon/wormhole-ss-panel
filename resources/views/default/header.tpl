<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Wormhole</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="/assets/public/css/bootstrap.min.3.3.5.css" rel="stylesheet" />
    <link href="/assets/public/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/assets/public/css/website.css" rel="stylesheet" />
    <!--[if lt IE 9]><script src="/Public/js/html5.js"></script><![endif]-->
    <style type="text/css">      body {
      padding-top: 50px;
      }
    </style>
    <style>
      .divcss5-b{ margin-left:13px}
    </style>
    <style type="text/css">
      {literal}
      .demo{height:1300px; padding-top:100px}
      .demo p{text-align:center; height:32px; line-height:32px; font-size:16px}
      .demo p span{margin:20px}
      .demo p a.cur{color:#f60; font-weight:bold}
      a.backToTop{width:28px; height:24px; background:#eaeaea url(top.gif) no-repeat -21px 4px; text-indent:-999em}
      a.backToTop:hover{background-position:-21px -19px}
      {/literal}
    </style>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="/assets/materialize/js/gotoTop.js"></script>
    <script type="text/javascript">
      {literal}
      $(function(){
      $(".backToTop").goToTop();
      $(window).bind('scroll resize',function(){
      $(".backToTop").goToTop();
      });
      });
      {/literal}
    </script>
  </head>
  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="false"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
          <!--a class="navbar-brand" href="/"> Wormhole</a-->
        </div>
        <div class="collapse navbar-collapse" id="navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li ><a href="/">首页</a></li>
            <li><a href="/usage">使用教程</a></li>
            <li><a href="/code">邀请码</a></li>
            {if $user->isLogin}
<li><a href="/user">用户中心</a></li>
<li><a href="/user/logout">退出</a></li>
{else}
<li><a href="/auth/login">登录</a></li>
<li><a href="/auth/register">注册</a></li>
{/if}
</ul>
</div>
</div>
</nav>
