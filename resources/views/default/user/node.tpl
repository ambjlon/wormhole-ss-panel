{include file='user/main.tpl'}

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            节点列表
            <small>Node List</small>
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <!-- START PROGRESS BARS -->
        <div class="row">
            <div class="col-md-12">
                <div class="callout callout-warning">
                    <h4>注意!</h4>
                    <p><font color="#FF0000">请勿在任何地方公开节点地址！由此造成的流量损失本站概不负责!</font></p>
                    <p>流量比例的意思: 流量比例为0.5即使用1000MB按照500MB流量来记录.</p>
                    {$msg}
                </div>
            </div>
        </div>

        {foreach $nodes as $node}
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-widget">
                        <div class="box-body">
                            <ul class="products-list product-list-in-box">
                                <li class="item">
                                    <div class="product-img">
                                        <img src="../assets/public/img/iconfont-server.png" alt="Server Node">
                                    </div>
                                    <div class="product-info">
                                      {$node->name} <span class="label label-info pull-right">{$node->status}</span>
                                    </div>
                                </li><!-- /.item -->
                            </ul>
                        </div>
                        <div class="box-footer no-padding">
                            <div class="row">
                                <div class="col-md-6">
                                    <ul class="nav nav-stacked">
                                        <li>节点地址 <span class="pull-right badge bg-blue">{$node->server}</span></li>
                                        <li>连接端口 <span class="pull-right badge bg-aqua">{$user->port}</span></li>
                                        <li>加密方式 <span class="pull-right badge bg-green">{if $node->custom_method == 1} {$user->method} {else} {$node->method} {/if}</span></li>
                                        <li>负载: <span class="pull-right badge bg-green">{$node->getNodeLoad()}</span></li>
                                    </ul>
                                </div>
                                <div class="col-md-6">
                                    <ul class="nav nav-stacked">
                                        <li>流量比例 <span class="pull-right badge bg-blue">{$node->traffic_rate}</span></li>
                                        <li>在线人数 <span class="pull-right badge bg-aqua">{$node->getOnlineUserCount()}</span></li>
                                        <li>产生流量 <span class="pull-right badge bg-green">{$node->getNodeTrafficLoad()}</span></li>
                                        <li><a href="./node/{$node->id}"><!--Uptime-->配置详情 <!--span   
                                                        class="pull-right badge bg-green">{$node->getNodeUptime()}</span--></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div><!-- /.widget-user -->
                </div><!-- /.col -->
            </div>
            <!-- /.row -->


        {/foreach}
    </section>
    <!-- /.content -->
</div><!-- /.content-wrapper -->


{include file='user/footer.tpl'}
