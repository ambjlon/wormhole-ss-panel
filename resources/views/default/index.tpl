{include file='header.tpl'}
<div class="section no-pad-bot" id="index-banner">
    <div class="container">
        <br><br>
        <h1 class="header center orange-text">{$config["appName"]}</h1>
        <div class="row center">
            <h5 class="header col s12 light">倡导科学上网   促进信息对等</h5>
            <h6><font color="#FF0000">严禁使用本站提供的服务浏览涉及反动和色情的互联网内容!!!</font></h3>
            {$homeIndexMsg}
        </div>
        {if $user->isLogin}
            <div class="row center">
                <a href="/user" id="download-button" class="btn-large waves-effect waves-light orange">进入用户中心</a>
            </div>
        {else}
        <div class="row center">
            <a href="/auth/register" id="download-button" class="btn-large waves-effect waves-light orange">立即注册</a>
        </div>
        {/if}
        <br><br>
    </div>
</div>


<div class="container">
    <div class="section">

        <!--   Icon Section   -->
        <div class="row">
            <div class="col s12 m4">
                <div class="icon-block">
                    <h2 class="center light-blue-text"><i class="material-icons">flash_on</i></h2>
                    <h5 class="center"><!--Super Fast-->极速</h5>

                    <p class="light">
                       前沿技术, 使用异步I/O和事件驱动编程.
                       <!-- Bleeding edge techniques using Asynchronous I/O and Event-driven programming.-->
                    </p>
                </div>
            </div>

            <div class="col s12 m4">
                <div class="icon-block">
                    <h2 class="center light-blue-text"><i class="material-icons">group</i></h2>
                    <h5 class="center">开源<!--Open Source--></h5>

                    <p class="light">
                       开源免费. 全世界范围内的开源社区提供长期支持和bug修复.
                       <!--Totally free and open source. A worldwide community devoted to deliver bug-free code and long-term support.-->
                    </p>
                </div>
            </div>

            <div class="col s12 m4">
                <div class="icon-block">
                    <h2 class="center light-blue-text"><i class="material-icons">settings</i></h2>
                    <h5 class="center"><!--Easy to work with-->多平台</h5>

                    <p class="light">
                       支持多平台使用, 包括Windows, Android, Mac, iOS等系统.
                       <!-- Avaliable on multiple platforms, including PC, MAC, Mobile (Android and iOS) and Routers (OpenWRT).-->
                    </p>
                </div>
            </div>
        </div>

    </div>
    <br><br>

    <div class="section">

    </div>
</div>
{include file='footer.tpl'}