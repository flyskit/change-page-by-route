<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header">
    <h1 class="page-title">账单记录/代收账单记录</h1>
    <div class="stats">
        <button class="btn btn-info stats" id="clMonthBtn" data-toggle="modal" data-target="#clPicModal" style="margin-top: -40px">本月图表</button>
    </div>
</div>
<div class="main-content">
    <!-- 内容nav -->
    <ul class="nav nav-tabs">
        <li class="active"><a href="#add-bill" data-toggle="tab">添加账单记录</a></li>
        <li><a href="#view-bill" data-toggle="tab">查询记录</a></li>
    </ul>

    <!--内容-->
    <div class="row" style="margin-top: 10px;">
        <div class="col-sm-12 col-md-12" style="margin-top: 30px">
            <div id="myTabContent" class="tab-content">

                <!--添加记录-->
                <div class="tab-pane active in " id="add-bill">
                    <form action="" method="post" id="AddCollectingBillForm" class="bs-example bs-example-form form-inline text-center" role="form">
                        <div class="input-group col-sm-4 col-md-4">
                            <span class="input-group-addon">日期&nbsp;&nbsp;&nbsp;</span>
                            <input id="addBillTime" name="clTime" type="date" class="form-control">
                        </div>
                        <br><br>
                        <div class="input-group col-sm-4 col-md-4">
                            <span class="input-group-addon">发生总额(借方)</span>
                            <input id="clProMoneyText" type="text" name="clProMoney" class="form-control">
                            <span class="input-group-addon">元</span>
                        </div>
                        <br><br>
                        <div class="input-group col-sm-4 col-md-4">
                            <span class="input-group-addon">收回总额(贷方)</span>
                            <input id="clGetMoneyText" type="text" name="clGetMoney" class="form-control">
                            <span class="input-group-addon">元</span>
                        </div>
                        <br><br>
                        <div class="input-group col-sm-4 col-md-4">
                            <span class="input-group-addon">上次发生总额</span>
                            <input id="clProLastMoneyText" type="text" class="form-control" readonly="readonly">
                            <span class="input-group-addon">元</span>
                        </div>
                        <br><br>
                        <div class="input-group col-sm-6 col-md-6">
                            <textarea rows="3" name="clNote" style="border-radius: 15px" class="form-control" placeholder="备注"></textarea>
                        </div>
                        <br><br>
                        <p><h5 style="color: blue">计算公式：</h5>
                        <p><h5 style="color: blue">本次应收总额&nbsp;=&nbsp;发生总额(借方)&nbsp;-&nbsp;回收总额(贷方)&nbsp;+&nbsp;上次应收总额</h5>
                        <hr>
                        <div class="input-group col-sm-4 col-md-4">
                            <span class="input-group-addon">上次应收总额</span>
                            <input id="clLTMoneyText" type="text" name="clLTMoney" class="form-control" readonly="readonly">
                            <span class="input-group-addon">元</span>
                        </div>
                        <div class="input-group col-sm-4 col-md-4"  style="margin-left: 140px">
                            <span class="input-group-addon">本次应收总额</span>
                            <input id="clNTMoneyText" type="text" name="clNTMoney" class="form-control" readonly="readonly">
                            <span class="input-group-addon">元</span>
                        </div>
                        <br><br><hr>
                        <button class="btn btn-info btn-lg" type="button" id="collectingFormButton">添加</button>
                        <button class="btn btn-info btn-lg" type="reset">重置</button>
                    </form>
                </div>

                <!--查询记录-->
                <div class="tab-pane fade" id="view-bill">
                    <div class="input-group col-sm-4 col-md-4">
                        <span class="input-group-addon">选择日期</span>
                        <input id="viewCollectingBillTime" type="date" class="form-control">
                    </div>
                    <br><hr>
                    <div class="input-group col-sm-4 col-md-4">
                        <span class="input-group-addon">选择月份</span>
                        <input id="viewCollectingBillMonth" type="month" class="form-control">
                    </div>
                    <br><hr>
                    <div class="input-group col-sm-4 col-md-4">
                        <span class="input-group-addon">备注查询</span>
                        <input id="viewCollectingBillNote" type="text" class="form-control">
                    </div>
                    <br><hr>

                    <!--表格-->
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="panel panel-default">
                                <a href="#TFindColBills" class="panel-heading text-center" data-toggle="collapse" style="font-size: 20px;">查询记录(<span id="allCollectingNum"></span>条)</a>
                                <div id="TFindColBills" class="panel-body panel-collapse collapse in">
                                    <table class="table table-condensed table-hover table-striped" id="findCollectingTable" style="width: 100%;table-layout:fixed;word-wrap:break-word;font-size: 13px;">
                                        <tr>
                                            <th hidden="hidden">id</th>
                                            <th>时间</th>
                                            <th>产品总值(元)</th>
                                            <th>收回金额(元)</th>
                                            <th>上次总未收(元)</th>
                                            <th>累计总未收(元)</th>
                                            <th width="200px">备注</th>
                                            <th hidden="hidden"></th>
                                        </tr>
                                        <tbody id="findCollectingBody"></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--详细信息-->
                    <div class="modal fade" id="clInformModal" tabindex="-1" role="dialog" aria-labelledby="clInformModal" aria-hidden="true">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title">详细信息</h4>
                            </div>
                            <div class="modal-body">
                                <form action="" method="post" id="CLBillForm" class="bs-example bs-example-form form-inline text-center" role="form">
                                    <div class="input-group col-sm-4 col-md-4">
                                        <span class="input-group-addon">日期&nbsp;&nbsp;&nbsp;</span>
                                        <input id="CLinformBillTime" name="clTime" type="date" class="form-control" readonly="readonly">
                                    </div>
                                    <br><br>
                                    <div class="input-group col-sm-4 col-md-4">
                                        <span class="input-group-addon">发生总额(借方)</span>
                                        <input id="CLinformProMoneyText" type="text" name="clProMoney" class="form-control" readonly="readonly">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                    <br><br>
                                    <div class="input-group col-sm-4 col-md-4">
                                        <span class="input-group-addon">收回总额(贷方)</span>
                                        <input id="CLinformGetMoneyText" type="text" name="clGetMoney" class="form-control" readonly="readonly">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                    <br><br>
                                    <div class="input-group col-sm-6 col-md-6">
                                        <textarea rows="3" name="clNote" style="border-radius: 15px" class="form-control" id="CLinformNoteText" placeholder="备注"></textarea>
                                    </div>
                                    <br><br>
                                    <hr>
                                    <div class="input-group col-sm-4 col-md-4">
                                        <span class="input-group-addon">上次应收总额</span>
                                        <input id="CLinformLTMoneyText" type="text" name="clLTMoney" class="form-control" readonly="readonly">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                    <br><br>
                                    <div class="input-group col-sm-4 col-md-4">
                                        <span class="input-group-addon">本次应收总额</span>
                                        <input id="CLinformNTMoneyText" type="text" name="clNTMoney" class="form-control" readonly="readonly">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                    <br><br><hr>
                                    <input type="hidden" name="id" id="clId"/>
                                    <button class="btn btn-info btn-lg" type="submit">修改备注</button>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!--本月图表-->
                <div class="modal fade" id="clPicModal" tabindex="-1" role="dialog" aria-labelledby="clPicModal" aria-hidden="true">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">代收-图表记录（默认为当月记录）</h4>
                        </div>
                        <div class="modal-body">
                            <div id="clInformTable" style="width: 1280px;height:200px">
                                <div class="input-group col-sm-4 col-md-4">
                                    <span class="input-group-addon">选择月份</span>
                                    <input id="viewCollectingCompareMonth" type="month" class="form-control">
                                </div>
                                <br><hr>
                                <table class="table table-condensed table-hover table-striped" id="viewCLCompareTable" style="width: 100%;table-layout:fixed;word-wrap:break-word;font-size: 15px;">
                                    <tr>
                                        <th>本月累计产品总额(元)</th>
                                        <th>本月累计收回总额(元)</th>
                                        <th>本月未收总额(元)</th>
                                        <th>累计未收总额(元)</th>
                                    </tr>
                                    <tbody id="viewCLCompareBody"></tbody>
                                </table>
                            </div>
                            <p><h5 style="color: blue">说明:</h5></p>
                            <p><h5 style="color: blue">本月未收总额(元)=本月累计收回总额(元)-本月累计产品总额(元)</h5>
                            <p><h5 style="color: blue">累计未收总额(元)=到目前为止(或者到该月最后一天)在外总未收金额</h5>
                            <!--echarts柱状图：声明width height -->
                            <div id="TImgClBills" style="width: 1280px;height: 600px">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

