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
        <label class="control-label col-sm-3" for="cardnum">卡号:</label>
        <div class="col-sm-5">
          <input type="text" class="form-control" id="cardnum"/>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label col-sm-3" for="passwd">密码:</label>
        <div class="col-sm-5">
          <input type="password" class="form-control" id="passwd"/>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-3 col-sm-3">
          <button id="buy" type="submit" class="btn btn-default">购买</button>
        </div>
      </div>
    </form>
    <p id="msg-success"  class="text-center" style="display: none;">
     <font size="5" color="#008000">购买成功! 正在向用户中心跳转...</font>
    </p>
    <p id="msg-error" class="text-center" style="display: none;">
      <font size="5" color="#DC143C">卡号或密码无效!</font>
    </p>
  </div>
  </section>
</div>
<!-- jQuery 2.1.3 -->
<script src="/assets/public/js/jquery.min.js"></script>
<!-- Bootstrap 3.3.2 JS -->
<script src="/assets/public/js/bootstrap.min.js" type="text/javascript"></script>

<script>
    $(document).ready(function(){
        function buy(){
            $.ajax({
                type:"POST",
                url:"/user/buy",
                dataType:"json",
                data:{
                    cardnum: $("#cardnum").val(),
                    passwd: $("#passwd").val()
                },
                success:function(data){
                    if(data.ret == 1){
                        $("#msg-success").show(1);
                        window.setTimeout("location.href='/user'", 2000);
                    }else{
                        $("#msg-error").fadeIn(1);
                        $("#msg-error").fadeOut(1500);
                    }
                },
                error:function(jqXHR){
                    $("#msg-error").hide(10);
                    $("#msg-error").show(100);
                    $("#msg-error-p").html("Ajax异步发生错误："+jqXHR.status);
                }
            });
        }
        $("html").keydown(function(event){
            if(event.keyCode==13){
                buy();
            }
        });
        $("#buy").click(function(){
            buy();
        });
        $("#ok-close").click(function(){
            $("#msg-success").hide(100);
        });
        $("#error-close").click(function(){
            $("#msg-error").hide(100);
        });
    })
</script>


{include file='user/footer.tpl'}
