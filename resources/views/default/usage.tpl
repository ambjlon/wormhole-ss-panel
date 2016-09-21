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
</div>

<hr/>

<div class="divcss5-b">
  <h3>详细教程</h3>  
  <ul id="myTab" class="nav nav-tabs">
    <li class="active"><a href="#windows" data-toggle="tab">Windows客户端设置</a></li>
    <li><a href="#mac" data-toggle="tab">设置Mac</a></li>
    <li><a href="#linux" data-toggle="tab">设置linux</a></li>
    <li><a href="#andriod" data-toggle="tab">设置Android</a></li>
    <li><a href="#ios" data-toggle="tab">设置iOS</a></li>
  </ul>

  <div id="myTabContent" class="tab-content">
    <div class="tab-pane fade in active" id="windows">
      <p class="text-danger">注：如果你的系统安装了360或同类的国产“安全”软件，可能会导致客户端无法正常运行，请先将其关闭或卸载。</p>
      <p>1. 将下载下来的压缩文件解压缩到某文件夹下，运行解压缩出来的Shadowsocks.exe。此程序无需安装, 以后每次使用直接点击这个解压出来的.exe程序即可. 点击该程序后会在程序所在的同级目录生成一个json配置文件. 如下图:</p>
      <img src="/myimages/5.jpg" height="180" width="260"/>
      <p>如果无法运行，可能是缺少相关组件，需要安装<a href="http://download.microsoft.com/download/5/9/e/59e74271-2b59-49a1-b955-96b69cc34f38/vcredist_x86.exe">Microsoft Visual C++ 2008 SP1运行库</a>和<a href="https://www.microsoft.com/zh-cn/download/details.aspx?id=17718" target="_blank">.NET Framework 4.0</a></p>
      <p>2.配置</p>
      <p>2(1). 通过扫描二维码完成客户端配置. </p>
      <p>首先登录本站进入<a href="/user">用户中心</a>, 再点击左侧导航栏的"节点列表", 然后选择一台可用机器点击"配置详情", 进入配置详情页面后, 将配置二维码暴露在屏幕上.</p>
      <p>在第一步已经运行了客户端Shadowsocks.exe, 这时你应该能在桌面右下角的小图标中找到一个纸飞机的图标, 这就是运行中的客户端. 然后右击它, 选择服务器->扫描屏幕上的二维码. 如下图:</p>
      <img src="/myimages/9.png" height="180" width="260"/>
      <p>客户端会自动识别屏幕上的二维码, 然后会提示你确定添加服务器. 这样就完成了客户端配置.</p>
      <p>2(2). 手动填写完成客户端配置</p>
      <p>也可以通过手动完成客户端配置. 首先登录本站进入<a href="/user">用户中心</a>, 再点击进入左侧导航栏的的节点列表, 这时你可以看到每台机器的节点地址 连接端口 加密方式. 密码请返回<a href="/user">用户中心</a>,在连接信息中可以看到. 现在编辑客户端服务器配置, 操作如下图:</p>
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
</div>

<div class="tab-pane fade" id="mac">
  <p>1. 点击安装下载下来的ShadowsocksX-2.6.2-2.dmg文件.</p>
  <p>2.配置</p>
  <p>2(1). 通过扫描二维码完成客户端配置. </p>
  <p>首先登录本站进入<a href="/user">用户中心</a>, 再点击左侧导航栏的"节点列表", 然后选择一台可用机器点击"配置详情", 进入配置详情页面后, 将配置二维码暴露在屏幕上.</p>
  <p>运行ShadowsocksX-2.6.2, 这时你应该能在桌面右上角的小图标中找到一个纸飞机的图标, 这就是运行中的客户端. 然后右击它, 选择从屏幕上扫描二维码. 如下图:</p>
  <img src="/myimages/mac-1.png" height="180" width="260"/>
  <p>客户端会自动识别屏幕上的二维码, 然后会提示你确定添加服务器. 这样就完成了客户端配置.<p>
  <p>2(2). 手动填写完成客户端配置</p>
  <p>也可以通过手动完成配置. 首先登录本站进入<a href="/user">用户中心</a>, 再点击进入左侧单行栏的的节点列表, 这时你可以看到每台机器的节点地址 连接端口 加密方式. 密码请返回<a href="/user">用户中心</a>,在连接信息中可以看到. 现在编辑客户端服务器配置, 如下图:</p>
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
</div>

<div class="tab-pane fade" id="andriod">
  <p>1. 下载并在手机上安装shadowsocks-nightly-2.9.11 包</p>
  <p>2. 手动填写完成客户端配置</p>
  <p>首先登录本站进入<a href="/user">用户中心</a>, 再点击进入左侧单行栏的的节点列表, 这时你可以看到每台机器的节点地址 连接端口 加密方式. 密码请返回<a href="/user">用户中心</a>,在连接信息可以看到. 现在编辑客户端服务器配置, 如下图:</p>
  <img src="/myimages/andriod-1.png" height="460" width="260"/>
  <p>3. 连接服务器. 点击右上角的小图标. 如下图:</p>
  <img src="/myimages/android-2.png" height="460" width="260"/>
  <p>在弹出的对话框中选择信任应用程序, 之后会看到连接成功的提示.</p>
</div>

<div class="tab-pane fade" id="linux">
  <p>相信在linux下使用本服务的一定是技术工作者了, 所以这里的说明就略微专业一些. 这里只提供最通用的方法, 同时还给出了其他的一些建议, 大家可以研究一下.</p>
  <p>在linux下使用本服务需要两个步骤.首先要在本地的某个端口启动shadowsocks的客户端服务, 然后还要把网络请求转到在本地启动的这个客户端服务</p>
  <ol>
    <li>本地shadowsocks客户端开启
      <p>shadowsocks已经发布到python的包管理系统了. 我们通过pip安装shadowsocks, 所以首先要安装pip, 而pip通过easy_install来进行安装. </p>
      <ul>
        <li>安装easy_install
          <ul>
            <li>下载easy_install: wget https://pypi.python.org/packages/source/s/setuptools/setuptools-17.0.zip --no-check-certificate</li>
            <li>解压setuptools-17.0.zip并进入setuptools目录</li>
            <li>执行'python setup.py install'完成easy_install的安装.</li>
          </ul>
        </li>
        <li>easy_install安装完成后, 执行'easy_install pip'完成pip的安装</li>
        <li>pip安装完成后执行pip install shadowsocks完成shadowsocks扩展的安装.</li>
        <li>启动本地shadowsocks客户端
          <ul>
            <li>登录本站进入<a href="/user">用户中心</a>, 再点击进入左侧导航栏的节点列表, 随机选择一台机器点击进入配置详情, 拷贝页面左上角的配置josn.</li>
            <li>创建/etc/shadowsocks.json文件, 将刚才拷贝的json保存进去</li>
            <li>启动本地客户端: nohup sslocal -c /etc/shadowsocks.json & 看到提示starting local socks5 server at port xxxx…表示客户端启动成功.</li>
          </ul>
        </li>
        <p>本地客户端默认是使用1080端口启动的, 如果你本地的1080端口被占用, 客户端的启动会失败. 另外你还可以把客户端的启动放到开机启动项里面.</p>
      </ul>
    </li>
    <li>转发网络请求到本地shadowsocks客户端
      <p>这里主要介绍如何使用proxychains将请求转发到刚才启动的shadowsocks客户端</p>
      <ul>
        <li>安装proxychains
          <ul>
            <li>获得proxychains源码. 熟悉的git的同学可以使用'git clone https://github.com/rofl0r/proxychains-ng.git'获取, 不使用git的同学可以从<a href="/download/proxychains-ng.tar.gz">这里下载</a></li>
            <li>获得源码后进入proxychains-ng目录. 然后./configure && make && make install</li>
          </ul>
        </li>
        <li>在使用proxychains之前需要对它做个配置, 将下面的配置信息保存到/etc/proxychains.conf.<br/>
          <pre><code>
              strict_chain
              proxy_dns
              tcp_read_time_out 15000
              tcp_connect_time_out 8000
              quite_mode

              [ProxyList]
              socks5 127.0.0.1 1080
          </code></pre>
        </li>
        <li>尝试一下是否能够翻墙成功~_~
          <ul>
            <li>使用命令: proxychains4 telnet www.google.com 3128 可以连接成功.</li>
            <li>使用命令: proxychains4 wget “www.google.com” 可以获得一个index.html文件.</li>
            <li>使用命令: proxychains4 wget “https://www.youtube.com/watch?v=QMbHLF_zwjs” 可以下载一个视频文件.</li>
          </ul>
        </li>
        <li>其他.
          <ul>
            <li>可以看出proxychains总是要加在要执行的命令前面, 所以proxychains不算是全局代理. redsocks是一个全局代理, 感兴趣可以研究一下.</li>
            <li>相信大多数linux用户不大会在linux上使用浏览器的, 所以这里不介绍如何配置各种浏览器了.</li>
            <li>proxychains对wget curl pip git都是有效的. 但是发现对小部分命令无效, 比如对go get命令无效.</li>
            <li>当然你还可以尝试将本地的socks服务转换成http代理.</li>
          </ul>
        </li>
      </ul>
    </li>
  </ol>
</div>

<div class="tab-pane fade" id="ios">
  <p>iOS客户端推荐使用shadowrocket, 这个app是需要花6元人民币购买的. 这里郑重声明, 本站和这个app没有任何利益关系, 也没有推广这个app的意思, 是否购买由您自己决定. 因为本站的技术水平有限, 没有能力开发iOS下的app, 只能推荐大家用这个app做客户端. 目前这个app是ios平台下性价比最高的客户端了.</p>
  <p>1. 在appstore搜索shadowrocket, 就可以看到这个app了, 如下图.  点击购买并完成安装.</p>
  <img src="/myimages/ios1.png" height="460" width="260"/>
  <p>首先登录本站进入<a href="/user">用户中心</a>, 再点击左侧导航栏的"节点列表", 然后选择一台可用机器点击"配置详情", 进入配置详情页面后, 将配置二维码暴露在屏幕上.</p>
  <p>3. 打开shadowrocket, 点击左上角的扫描图标, 如下图所示,  扫描步骤二中的配置二维码, 这样就完成了配置.</p>
  <img src="/myimages/ios3.png" height="460" width="260"/>
  <p>4. 接下来滑动"Not Connected"后面的按钮.(注: 在滑动按钮之前你还可以点击ping test, 测试一下和我们的服务器的连通性.)</p>
  <img src="/myimages/ios4.png" height="460" width="260"/>
  <p>5. 接下来会有一个对话框弹出,大概是询问是否安装vpn配置. 点击Allow</p>
  <img src="/myimages/ios5.png" height="460" width="260"/>
  <p>6.进入iOS系统的设置-&gt 通用-&gt VPN,你会发现VPN那里显示已连接, 点VPN进去后如下图, 同时系统的右上角会有个VPN的图标, 这表示已经可以翻墙服务了, 试着在浏览器打开Google. </p>
  <img src="/myimages/ios7.png" height="460" width="260"/>
  <p>此外你还可以进入shadowrocket的setting进行一些代理规则的设置</p>
</div>
</div>
</div>

{include file='footer.tpl'}
