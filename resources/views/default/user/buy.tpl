{include file='user/main.tpl'}
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1> 购买</h1>
  </section>
    <section class="content">
  <p>一. 购买代金卡</p>
  <div class="container">
    <ul id="myTab" class="nav nav-tabs">
      <li class="active"><a href="#halfyear" data-toggle="tab">半年付</a></li>
      <li><a href="#year" data-toggle="tab">年付</a></li>
      <li><a href="#month" data-toggle="tab">流量加油包</a></li>
    </ul>
    <div id="myTabContent" class="tab-content">
      <div class="tab-pane fade in active" id="halfyear"></div>
      <div class="tab-pane fade" id="year"></div>
      <div class="tab-pane fade" id="month"></div>
    </div>
  </div>
  </br></br>
  <p>二. 使用代金卡充值</p>
  <div class="login-box-body">
    <form class="form-horizontal" role="form">
      <div class="form-group">
        <label class="control-label col-sm-3">卡号:</label>
        <div class="col-sm-5">
          <input type="text" class="form-control" id="halfyearcardnum">
        </div>
      </div>
      <div class="form-group">
        <label class="control-label col-sm-3" for="pwd">密码:</label>
        <div class="col-sm-5">
          <input type="password" class="form-control" id="halfyearpwd">
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-3 col-sm-3">
          <button id="buy" type="submit" class="btn btn-default">购买</button>
        </div>
      </div>
    </form>
    <div id="msg-success" class="alert alert-info alert-dismissable" style="display: none;">
      <button type="button" class="close" id="ok-close" aria-hidden="true">&times;</button>
      <h4><i class="icon fa fa-info"></i> 购买成功!</h4>
      <p id="msg-success-p"></p>
    </div>
    <div id="msg-error" class="alert alert-warning alert-dismissable" style="display: none;">
      <button type="button" class="close" id="error-close" aria-hidden="true">&times;</button>
      <h4><i class="icon fa fa-warning"></i> 卡号或密码无效!</h4>
      <p id="msg-error-p"></p>
    </div>
  </div>
  </section>
</div>

{include file='user/footer.tpl'}
