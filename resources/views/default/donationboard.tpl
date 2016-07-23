{include file='header.tpl'}
  </br>
  <div class="col-md-12">
    <ul class="nav nav-tabs">
      <li><a href="/donation">捐赠方式</a></li>
      <li class="active"><a href="/donation/board">捐赠排行</a></li>
    </ul>
  </div>

<p><strong><font color="#FF0000">本站对你们的捐赠表示衷心的感谢!</font></strong></p>
</br>
<table class="table">

    <tr>
      <th>用户昵称</th>
      <th>用户邮箱</th>
      <th>捐赠金额</th>
      <th>捐赠时间</th>
      <th>捐赠方式</th>
    </tr>


    {foreach $donation as $log}
    <tr>
      <td>{$log->user_name}</td>
      <td>{$log->email}</td>
      <td>￥{$log->amount}</td>
      <td>{$log->donation_time}</td>
      <td>{$log->pay_way}</td>
    </tr>
    {/foreach}

</table>
{include file='footer.tpl'}
