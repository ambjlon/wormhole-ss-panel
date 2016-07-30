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
    <li class="active"><a href="#wxyuan10" data-toggle="tab">￥10</a></li>
    <li><a href="#wxyuan20" data-toggle="tab">￥20</a></li>
    <li><a href="#wxyuan30" data-toggle="tab">￥30</a></li>
    <li><a href="#wxyuan40" data-toggle="tab">￥40</a></li>
  </ul>
  <div id="myTabContent" class="tab-content">
    <div class="tab-pane fade in active" id="wxyuan10"><img src="/myimages/weixin10.jpg" height="422" width="320"/></div>
    <div class="tab-pane fade" id="wxyuan20"><img src="/myimages/weixin20.jpg" height="422" width="320"/></div>
    <div class="tab-pane fade" id="wxyuan30"><img src="/myimages/weixin30.jpg" height="422" width="320"/></div>
    <div class="tab-pane fade" id="wxyuan40"><img src="/myimages/weixin40.jpg" height="422" width="320"/></div>
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
