{include file='header.tpl'}
<div class="jumbotron">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <div class="hero-content">
          <h2>Wormhole</h2>
          <p>倡导科学上网   促进信息对等</p>
          <p><font color="#FF0000">严禁使用本站提供的服务浏览涉及反动和色情的互联网内容!!!</font></p>
          {if $user->isLogin}
          <p><a href="/user" class="btn btn-success btn-large">进入用户中心</a></p>
          {else}
          <p><a href="/auth/register" class="btn btn-success btn-large">立即注册</a></p>
          {/if}
        </div>
      </div>
    </div>
  </div>
</div>

<div class="container">
  <div class="alert alert-success">
    <p>最新动态: 推荐有奖, 推荐一个付费用户奖励一个月的服务! 赶快邀请你的好友使用本站的服务吧~_~</p>
    <p>获得帮助: 管理员qq695764872 wormhole翻墙交流群431706930 关注微信公众号"虫洞VPN"获得最新讯息</p>
    <p><font color="#FF0000">为了保持和本站的联系, 防止本站域名被封, 强烈建议你加入qq群431706930</font></p>
<!--    最新动态：2016年8月16日起, wormholevpn开始进行收费管理了, 详情见<a href="/user">用户中心</a>公告! 或者联系管理员(qq695764872).-->
  </div>

  <div class="row">
    <div class="col-md-4">
      <div class="well">
        <h3>多平台</h3>
        <p>支持多平台使用, 包括Windows, Android, Mac, iOS等系统.</p>
      </div>
    </div>
    <div class="col-md-4">
      <div class="well">
        <h3>使用简单</h3>
        <p>使用非常简单，按照使用教程的说明, 只需要几十秒就可以完成配置.</p>
      </div>
    </div>
    <div class="col-md-4">
      <div class="well">
        <h3>极速稳定</h3>
        <p>使用前沿技术,异步I/O和事件驱动编程,速度流畅. 面向小众提供服务, 稳定可靠.</p>
      </div>
    </div>
  </div>
</div>
{include file='footer.tpl'}
