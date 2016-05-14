<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
    <title>{$config["appName"]}</title>
    <!-- CSS fonts.googleapis.com -->
    <link href="//fonts.lug.ustc.edu.cn/icon?family=Material+Icons" rel="stylesheet">
    <!--link href="/assets/materialize/css/materialize.min.css.320" type="text/css" rel="stylesheet" media="screen,projection"/-->
    <link href="/assets/materialize/css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="/assets/materialize/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  </head>
  <body>
    <!-- 解决导航按钮响应式展示的问题. 参考http://www.imooc.com/code/3124
        <div class="navbar navbar-default" role="navigation">
          <div class="navbar-header">

            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-responsive-collapse">
              <span class="sr-only">Toggle Navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>

            <a href="/" class="navbar-brand">{$config["appName"]}</a>
          </div>

          <div class="collapse navbar-collapse navbar-responsive-collapse">
            <ul class="nav navbar-nav">
              <li><a href="/">首页</a></li>
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

          -->

    <nav class="light-blue lighten-1" role="navigation">
      <div class="nav-wrapper container"><a id="logo-container" href="/" class="brand-logo">{$config["appName"]}</a>
        <ul class="right hide-on-med-and-down">
          <li><a href="/">首页</a></li>
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

        <ul id="nav-mobile" class="side-nav">
          <li><a href="/">首页</a></li>
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
        <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
      </div>
    </nav>
