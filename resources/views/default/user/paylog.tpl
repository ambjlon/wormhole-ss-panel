{include file='user/main.tpl'}

<div class="content-wrapper">
  <section class="content-header">
    <h1> 购买记录</h1>
  </section>

<section class="content">

{if $isPay}

    <tr>
      <th>购买时间</th>
      <th>支付金额</th>
      <th>服务类型</th>
      <th>支付方式</th>
    </tr>


    {foreach $logs as $log}
    <tr>
      <td>{$log->pay_time}</td>
      <td>￥{$log->amount}</td>
      <td>{$log->pay_type}</td>
      <td>{$log->pay_way}</td>
    </tr>
    {/foreach}



{else}
   <p>您还未购买过服务, 点击<a href="/user/buy">这里</a>前往购买.</p>
{/if}

</section>

</div>

{include file='user/footer.tpl'}
