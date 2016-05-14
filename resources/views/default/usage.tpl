{include file='header.tpl'}
<div class="row">
<h3>目录</h3>
<p><strong>说明</strong></p>
<p>阅读使用教程之前请先看一下这个简单的说明, 好多配置过程有个整体上的把握.</p>
<p>请先根据你的系统下载相应的安装程序, 然后阅读相应系统的配置说明.</p>
<p>所谓配置, 只需要完成在客户端填写四个要素: 1.端口号 2.代理机器IP 3.密码 4.加密方式</p>
<p>你可以通过使用客户端扫描屏幕上的二维码自动完成配置, 也可以手动填写这四个要素.</>
<p>本站的加密方式默认为rc4-md5, 虽然可以修改加密方式, 但是不建议你修改.</>
<p><strong>客户端下载</strong></p>
<ul>
<li><a href="/download/Shadowsocks-win-2.5.2.zip">Windows 7</a></li>
<li><a href="/download/Shadowsocks-win-dotnet4.0-2.5.2.zip">Windows 8及以上</a></li>
<li><a href="/download/ShadowsocksX-2.6.2.dmg">Mac</a></li>
<!-- <a href="/download/shadowsocks-local-linux32" class="btn btn-success btn-sm">Linux-32bit</a> &nbsp; -->
<!-- <a href="/download/shadowsocks-local-linux64" class="btn btn-success btn-sm">Linux-64bit</a> &nbsp; -->
<!--<a href="https://play.google.com/store/apps/details?id=com.github.shadowsocks" target="_blank" class="btn btn-info btn-sm">Android&nbsp;(Google Play)</a> &nbsp; -->
<li><a href="/download/shadowsocks-nightly-2.9.11.apk">Android&nbsp;(APK)</a></li>
</ul>
<p><strong>客户端设置</strong></p>
<ul>
<li><a href="#client-win">设置Windows</a></li>
<li><a href="#client-mac">设置Mac</a></li>
<!--a href="#client-linux" class="btn btn-success btn-sm"><i class="fa fa-linux"></i> Linux</a> &nbsp;-->
<li><a href="#client-android">设置Android</a></li>
</ul>
</div>

<hr/>

<div>
<h3>详细教程</h3>
<p><strong>Windows客户端设置</strong></p>
<p class="text-danger">注：如果你的系统安装了360或同类的国产“安全”软件，可能会导致客户端无法正常运行，请先将其关闭或卸载。</p>
<p>1. 将下载下来的压缩文件解压缩到某文件夹下，运行解压缩出来的Shadowsocks.exe。此程序无需安装, 以后每次使用直接点击这个解压出来的.exe程序即可. 点击该程序后会在程序所在的同级目录生成一个json配置文件. 如下图:</p>
<img src="/myimages/5.jpg" height="130" width="200"/>
<p>如果无法运行，可能是缺少相关组件，需要安装<a href="http://download.microsoft.com/download/5/9/e/59e74271-2b59-49a1-b955-96b69cc34f38/vcredist_x86.exe">Microsoft Visual C++ 2008 SP1运行库</a>和<a href="https://www.microsoft.com/zh-cn/download/details.aspx?id=17718" target="_blank">.NET Framework 4.0</a></p>
<p>2-1. 通过扫描二维码完成配置. </p>
<p>首先登录本站进入<a href="/user/node">用户中心</a>, 点击左侧列表的机器列表, 随机选择一台机器点击进入配置详情, 请将配置二维码暴露在屏幕上.</p>
<p>在第一步已经运行了客户端Shadowsocks.exe.这是你应该能在桌面右下角的小图标中找到一个纸飞机的图标, 这就是运行中的客户端. 然后右击它, 选择服务器->扫描屏幕上的二维码. 如下图:</p>
<img src="/myimages/2.jpg" height="180" width="260"/>
<p>客户端会自动识别屏幕上的二维码, 然后会提示你确定添加服务器. 这样就完成了配置.<>
</div>

</body>