{include file='user/main.tpl'}
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1> 购买</h1>
  </section>
  <div class="container">
  </br>

  <ul id="myTab" class="nav nav-tabs">
    <li class="active"><a href="#halfyear" data-toggle="tab">半年付</a></li>
    <li><a href="#year" data-toggle="tab">年付</a></li>
    <li><a href="#month" data-toggle="tab">流量加油包</a></li>
  </ul>
  <div id="myTabContent" class="tab-content">
    <div class="tab-pane fade in active" id="halfyear">
      <div class="login-box-body">
        <form>
          <div class="form-group has-feedback">
            <input id="halfyearcardnum" name="Email" type="text" class="form-control" placeholder="半年付卡号"/>
            <span  class="glyphicon glyphicon-envelope form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input id="halyearpasswd" name="Password" type="password" class="form-control" placeholder="半年付卡号密码"/>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
        </form>
        <div class="row">
          <div class="col-xs-4">
            <button id="login" type="submit" class="btn btn-primary btn-block btn-flat">购买</button>
          </div><!-- /.col -->
        </div>
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
      <div class="tab-pane fade" id="year">
        
      </div>
      <div class="tab-pane fade" id="month">

      </div>

    </div>
  </br>

  </div>

  <script>
    $(document).ready(function () {
    $("#checkin").click(function () {
    $.ajax({
    type: "POST",
    url: "/user/checkin",
    dataType: "json",
    success: function (data) {
    $("#checkin-msg").html(data.msg);
    $("#checkin-btn").hide();
    },
    error: function (jqXHR) {
    alert("发生错误：" + jqXHR.status);
    }
    })
    })
    })
  </script>


  {include file='user/footer.tpl'}
