{include file='header.tpl'}
<div class="divcss5-b">
  <h3>目录</h3>
  <p><strong>说明</strong></p>
  <p>阅读使用教程之前请先看一下这个简单的说明, 好对配置过程有个整体上的把握.</p>
  <p>请先根据你的系统下载相应的安装程序, 然后阅读相应系统的配置说明.</p>
  <p>所谓配置, 只需要完成在客户端填写四个要素: 1.端口号 2.代理机器IP 3.密码 4.加密方式</p>
  <p>你可以通过使用客户端扫描屏幕上的二维码自动完成配置, 也可以手动填写这四个要素.</p>
  <p>本站的加密方式目前只支持rc4-md5.</p>
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

<div class="divcss5-b">
  <h3>详细教程</h3>
  <p id="client-win"></p>
  <p><strong>Windows客户端设置</strong></p>
  <p class="text-danger">注：如果你的系统安装了360或同类的国产“安全”软件，可能会导致客户端无法正常运行，请先将其关闭或卸载。</p>
  <p>1. 将下载下来的压缩文件解压缩到某文件夹下，运行解压缩出来的Shadowsocks.exe。此程序无需安装, 以后每次使用直接点击这个解压出来的.exe程序即可. 点击该程序后会在程序所在的同级目录生成一个json配置文件. 如下图:</p>
  <img src="/myimages/5.jpg" height="180" width="260"/>
  <p>如果无法运行，可能是缺少相关组件，需要安装<a href="http://download.microsoft.com/download/5/9/e/59e74271-2b59-49a1-b955-96b69cc34f38/vcredist_x86.exe">Microsoft Visual C++ 2008 SP1运行库</a>和<a href="https://www.microsoft.com/zh-cn/download/details.aspx?id=17718" target="_blank">.NET Framework 4.0</a></p>
  <p>2.配置</p>
  <p>2(1). 通过扫描二维码完成客户端配置. </p>
  <p>首先登录本站进入<a href="/user/node">用户中心</a>, 再点击进入左侧导航栏的节点列表, 随机选择一台机器点击进入配置详情, 并将配置二维码暴露在屏幕上.</p>
  <p>在第一步已经运行了客户端Shadowsocks.exe, 这时你应该能在桌面右下角的小图标中找到一个纸飞机的图标, 这就是运行中的客户端. 然后右击它, 选择服务器->扫描屏幕上的二维码. 如下图:</p>
  <img src="/myimages/9.png" height="180" width="260"/>
  <p>客户端会自动识别屏幕上的二维码, 然后会提示你确定添加服务器. 这样就完成了客户端配置.</p>
  <p>2(2). 手动填写完成客户端配置</p>
  <p>也可以通过手动完成客户端配置. 首先登录本站进入<a href="/user/node">用户中心</a>, 再点击进入左侧导航栏的的节点列表, 这时你可以看到每台机器的节点地址 连接端口 加密方式. 密码请返回<a href="/user/node">用户中心</a>,在连接信息中可以看到. 现在编辑客户端服务器配置, 操作如下图:</p>
  <img src="/myimages/6.jpg" height="180" width="260"/>
  <p>点击右侧的添加按钮. 将节点地址 链接端口 加密方式 密码这四个信息填入如下图所示的框内:</p>
  <img src="/myimages/7.jpg" height="180" width="260"/>
  <p>然后点击确定就完成了客户端的配置. 因为本站提供多台代理机器, 你可以使用任何一台, 所以有必要为每台机器添加备注起个别名.</p>
  <p>3. 连接服务器.</p>
  <p>选择前面配置好的服务器中的一台.</p>
  <img src="/myimages/8.jpg" height="180" width="260"/>
  <p>打开代理, 点击启用系统代理</p>
  <img src="/myimages/10.jpg" height="180" width="260"/>
  <p>选择PAC代理模式</p>
  <img src="/myimages/11.jpg" height="180" width="260"/>
  </p>然后开启PAC本地模式:</p>
  <img src="/myimages/4.jpg" height="180" width="260"/>
  <p>现在在地址栏输入google.com, 就能成功访问了.</p>
  <p>如不能翻墙可以尝试重启浏览器. 重启浏览器后还是不能翻墙, 再尝试先选择全局模式:</p>
  <img src="/myimages/12.jpg" height="180" width="260"/>
  <p> 等确定可以翻墙后再切回PAC模式</p>
  <p>备注:本地PAC(MAC下叫做自动代理)是指在对某个网址访问前先根据本地的某个配置文件决定这次访问是不是要走本代理, 在线PAC这个配置文件存储在远端某个位置. 和PAC模式对应是系统代理(MAC下叫做全局模式), 此时不管访问什么网址统统走本代理, 非常不建议使用此模式.</p>

<p id="client-mac"></p>
<p><strong>MAC客户端设置</strong></p>
<p>1. 点击安装下载下来的ShadowsocksX-2.6.2-2.dmg文件.</p>
<p>2.配置</p>
<p>2(1). 通过扫描二维码完成客户端配置. </p>
<p>首先登录本站进入<a href="/user/node">用户中心</a>, 再点击进入左侧导航栏的机器列表, 随机选择一台机器点击进入配置详情, 请将配置二维码暴露在屏幕上.</p>
<p>运行ShadowsocksX-2.6.2, 这时你应该能在桌面右上角的小图标中找到一个纸飞机的图标, 这就是运行中的客户端. 然后右击它, 选择从屏幕上扫描二维码. 如下图:</p>
<img src="/myimages/mac-1.png" height="180" width="260"/>
<p>客户端会自动识别屏幕上的二维码, 然后会提示你确定添加服务器. 这样就完成了客户端配置.<p>
<p>2(2). 手动填写完成客户端配置</p>
<p>也可以通过手动完成配置. 首先登录本站进入<a href="/user/node">用户中心</a>, 再点击进入左侧单行栏的的机器列表, 这时你可以看到每台机器的节点地址 连接端口 加密方式. 密码请返回<a href="/user/node">用户中心</a>,在连接信息中可以看到. 现在编辑客户端服务器配置, 如下图:</p>
<img src="/myimages/mac-5.png" height="180" width="260"/>
<p>点击右侧的添加按钮. 将节点地址 链接端口 加密方式 密码这四个信息填入如下图所示的框内:</p>
<img src="/myimages/mac-2.png" height="180" width="260"/>
<p>然后点击确定就完成了客户端的配置. 因为本站提供多台代理机器, 你可以使用任何一台, 所以有必要为每台机器添加备注起个别名.</p>
<p>3. 连接服务器.</p>
<p>选择前面配置好的服务器中的一台.</p>
<img src="/myimages/mac-3.png" height="180" width="260"/>
</p>然后开启自动代理模式:</p>
<img src="/myimages/mac-4.png" height="180" width="260"/>
<p>现在在地址栏输入google.com, 就能成功访问了.</p>
<p> 如不能翻墙,可以尝试重启浏览器. 重启后还是不能翻墙, 可以再尝试先选择全局代理:</p>
<img src="/myimages/mac-6.png" height="180" width="260"/>
<p> 等确定可以翻墙后再切回自动代理模式.</p>
<p>备注:自动代理是指在对某个网址访问前先根据本地的某个配置文件决定这次访问是不是要走本代理, 你可以编辑这个pac配置文件的规则. 和自动代理模式对应的是全局代理, 此时不管访问什么网址统统走本代理, 非常不建议使用此模式.</p>
<p id="client-android"></p>
<p><strong>Android客户端设置</strong></p>
<p>1. 下载并在手机上安装shadowsocks-nightly-2.9.11 包</p>
<p>2. 手动填写完成客户端配置</p>
<p>首先登录本站进入<a href="/user/node">用户中心</a>, 再点击进入左侧单行栏的的机器列表, 这时你可以看到每台机器的节点地址 连接端口 加密方式. 密码请返回用户中心在连接信息可以看到. 现在编辑客户端服务器配置, 如下图:</p>
<img src="/myimages/andriod-1.png" height="460" width="260"/>
<p>3. 连接服务器. 点击右上角的小图标. 如下图:</p>
<img src="/myimages/android-2.png" height="460" width="260"/>
<p>在弹出的对话框中选择信任应用程序, 之后会看到连接成功的提示.</p>
</div>
{include file='footer.tpl'}
