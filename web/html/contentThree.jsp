<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header">
    <h1 class="page-title">账单记录/发货应收已收</h1>
    <div class="stats">
        <button class="btn btn-info stats" type="button" id="dbMonthBtn" data-toggle="modal" data-target="#dbPicModal" style="margin-top: -40px">本月图表</button>
    </div>
</div>
<div class="main-content">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#add-send-bill" data-toggle="tab">添加记录</a></li>
        <li><a href="#view-send-bill" data-toggle="tab">查询记录</a></li>
    </ul>
    <div class="row" style="margin-top: 10px;">
        <div class="col-sm-12 col-md-12" style="margin-top: 30px">
            <div id="sendContent" class="tab-content">

                <!---添加记录-->
                <div class="tab-pane active in " id="add-send-bill">
                    <form id="AddDeliverBillForm" action="" method="post" class="bs-example bs-example-form form-inline text-center" role="form">
                        <div class="input-group col-sm-4 col-md-4">
                            <span class="input-group-addon">日期&nbsp;</span>
                            <input id="addSendBillTime" name="dbTime" type="date" class="form-control">
                        </div>
                        <br><br>
                        <div class="input-group col-sm-4 col-md-4">
                            <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;收货人&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            <input type="text" name="dbCustomer" id="dbCustomerText" class="form-control">
                        </div>
                        <br><br>
                        <div class="input-group col-sm-4 col-md-4">
                            <span class="input-group-addon">本次金额(借方)</span>
                            <input type="text" name="dbProMoney" id="dbProMoneyText" class="form-control">
                            <span class="input-group-addon">元</span>
                        </div>
                        <br><br>
                        <div class="input-group col-sm-4 col-md-4">
                            <span class="input-group-addon">本次已收(贷方)</span>
                            <input type="text" name="dbGetMoney" id="dbGetMoneyText" class="form-control">
                            <span class="input-group-addon">元</span>
                        </div>
                        <br><br>
                        <div class="input-group col-sm-4 col-md-4">
                            <span class="input-group-addon">本次少收金额&nbsp;&nbsp;&nbsp;</span>
                            <input type="text" name="dbLackMoney" id="dbLackMoneyText" class="form-control">
                            <span class="input-group-addon">元</span>
                        </div>
                        <br><br>
                        <div class="input-group col-sm-6 col-md-6">
                            <textarea rows="3" name="dbNote"  style="border-radius: 15px" class="form-control" placeholder="备注"></textarea>
                        </div>
                        <br><br>
                        <p><h5 style="color: blue">计算公式：</h5>
                        <p><h5 style="color: blue">本次累计合计(累计应收结余)&nbsp;=&nbsp;金额(借方)&nbsp;-&nbsp;已收(贷方)&nbsp;+&nbsp;上次单人合计(上次应收结余)</h5></p>
                        <p><h5 style="color: blue">本次累计少收(累计少收金额)&nbsp;=&nbsp;少收金额&nbsp;+&nbsp;上次单人少收(上次少收金额)</h5>
                        <hr>
                        <div class="input-group col-sm-4 col-md-4">
                            <span class="input-group-addon">上次单人合计</span>
                            <input type="text" name="dbCtmLTCombined" id="dbCtmLTCombinedText" class="form-control" readonly="readonly">
                            <span class="input-group-addon">元</span>
                        </div>
                        <div class="input-group col-sm-4 col-md-4" style="margin-left: 140px">
                            <span class="input-group-addon">本次累计合计</span>
                            <input type="text" name="dbCtmNTCombined" id="dbCtmNTCombinedText" class="form-control" readonly="readonly">
                            <span class="input-group-addon">元</span>
                        </div>
                        <br><br>
                        <div class="input-group col-sm-4 col-md-4">
                            <span class="input-group-addon">上次单人少收</span>
                            <input type="text" name="dbCtmLTLack" id="dbCtmLTLackText" class="form-control" readonly="readonly">
                            <span class="input-group-addon">元</span>
                        </div>
                        <div class="input-group col-sm-4 col-md-4" style="margin-left: 140px">
                            <span class="input-group-addon">本次累计少收</span>
                            <input type="text" name="dbCtmNTLack" id="dbCtmNTLackText" class="form-control" readonly="readonly">
                            <span class="input-group-addon">元</span>
                        </div>
                        <br><br>
                        <hr>
                        <div class="input-group col-sm-4 col-md-4">
                            <span class="input-group-addon">上次应收结余</span>
                            <input type="text" name="dbLTMoney" id="dbLTMoneyText" class="form-control" readonly="readonly">
                            <span class="input-group-addon">元</span>
                        </div>
                        <div class="input-group col-sm-4 col-md-4"  style="margin-left: 140px" readonly="readonly">
                            <span class="input-group-addon">累计应收结余</span>
                            <input type="text" name="dbNTMoney" id="dbNTMoneyText" class="form-control" readonly="readonly">
                            <span class="input-group-addon">元</span>
                        </div>
                        <br><br>
                        <div class="input-group col-sm-4 col-md-4">
                            <span class="input-group-addon">上次少收金额</span>
                            <input type="text" name="dbLTLackMoney" id="dbLTLackMoneyText" class="form-control" readonly="readonly">
                            <span class="input-group-addon">元</span>
                        </div>
                        <div class="input-group col-sm-4 col-md-4"  style="margin-left: 140px" readonly="readonly">
                            <span class="input-group-addon">累计少收金额</span>
                            <input type="text" name="dbNTLackMoney" id="dbNTLackMoneyText" class="form-control" readonly="readonly">
                            <span class="input-group-addon">元</span>
                        </div>
                        <br><br>
                        <hr>
                        <button class="btn btn-info" id="deliverFormButton" type="button">添加</button>
                        <button class="btn btn-info" type="reset">重置</button>
                    </form>
                </div>

                <!--查询记录-->
                <div class="tab-pane fade" id="view-send-bill">
                    <div class="input-group col-sm-4 col-md-4">
                        <span class="input-group-addon">选择日期</span>
                        <input id="viewSendBillTime" type="date" class="form-control">
                    </div>
                    <br><hr>
                    <div class="input-group col-sm-4 col-md-4">
                        <span class="input-group-addon">选择月份</span>
                        <input id="viewSendBillMonth" type="month" class="form-control">
                    </div>
                    <br><hr>
                    <div class="input-group col-sm-4 col-md-4">
                        <span class="input-group-addon">收货人&nbsp;&nbsp;&nbsp;</span>
                        <input id="viewSendBillCustomer" type="text" class="form-control">
                    </div>
                    <hr>

                    <!--表格-->
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="panel panel-default">
                                <a href="#TFindDBBills" class="panel-heading text-center" data-toggle="collapse" style="font-size: 20px;">查询记录(<span id="allDeliverNum"></span>条)</a>
                                <div id="TFindDbBills" class="panel-body panel-collapse collapse in">
                                    <table class="table table-condensed table-hover table-striped" style="width: 100%;table-layout:fixed;word-wrap:break-word;font-size: 13px;" id="findDeliverTable">
                                        <tr>
                                            <th hidden="hidden">id</th>
                                            <th>发货时间</th>
                                            <th>客户姓名</th>
                                            <th>产品金额</th>
                                            <th>回收金额</th>
                                            <th>少收金额</th>
                                            <th hidden="hidden">上次少收总额</th>
                                            <th hidden="hidden">上次单人合计</th>
                                            <th hidden="hidden">本次少收总额</th>
                                            <th hidden="hidden">本次累计合计</th>
                                            <th hidden="hidden">上次总少收</th>
                                            <th hidden="hidden">上次总未收</th>
                                            <th hidden="hidden">累计总少收</th>
                                            <th hidden="hidden">累计总未收</th>
                                            <th width="200px">备注</th>
                                            <th></th>
                                            <th hidden="hidden"></th>
                                        </tr>
                                        <tbody id="findDeliverBody"></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal fade" id="dbInformModal" tabindex="-1" role="dialog" aria-labelledby="dbInformModal" aria-hidden="true">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title">详细信息</h4>
                            </div>
                            <div class="modal-body">
                                <form id="DBBillsForm" action="" method="post" class="bs-example bs-example-form form-inline text-center" role="form">
                                    <div class="input-group col-sm-4 col-md-4">
                                        <span class="input-group-addon">日期&nbsp;</span>
                                        <input id="dbInformBillTime" name="dbTime" type="date" class="form-control"  readonly="readonly">
                                    </div>
                                    <br><br>
                                    <div class="input-group col-sm-4 col-md-4">
                                        <span class="input-group-addon">&nbsp;&nbsp;&nbsp;&nbsp;收货人&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                        <input type="text" name="dbCustomer" id="dbInformCustomerText" class="form-control" readonly="readonly">
                                    </div>
                                    <br><br>
                                    <div class="input-group col-sm-4 col-md-4">
                                        <span class="input-group-addon">本次金额(借方)</span>
                                        <input type="text" name="dbProMoney" id="dbInformProMoneyText" class="form-control" readonly="readonly">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                    <br><br>
                                    <div class="input-group col-sm-4 col-md-4">
                                        <span class="input-group-addon">本次已收(贷方)</span>
                                        <input type="text" name="dbGetMoney" id="dbInformGetMoneyText" class="form-control" readonly="readonly">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                    <br><br>
                                    <div class="input-group col-sm-4 col-md-4">
                                        <span class="input-group-addon">本次少收金额&nbsp;&nbsp;&nbsp;</span>
                                        <input type="text" name="dbLackMoney" id="dbInformLackMoneyText" class="form-control" readonly="readonly">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                    <br><br>
                                    <div class="input-group col-sm-6 col-md-6">
                                        <textarea rows="3" name="dbNote" id="dbInformNote"  style="border-radius: 15px" class="form-control" placeholder="备注"></textarea>
                                    </div>
                                    <br><br>
                                    <hr>
                                    <div class="input-group col-sm-4 col-md-4">
                                        <span class="input-group-addon">上次单人合计</span>
                                        <input type="text" name="dbCtmLTCombined" id="dbInformCtmLTCombinedText" class="form-control" readonly="readonly">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                    <br><br>
                                    <div class="input-group col-sm-4 col-md-4" >
                                        <span class="input-group-addon">本次累计合计</span>
                                        <input type="text" name="dbCtmNTCombined" id="dbInformCtmNTCombinedText" class="form-control" readonly="readonly">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                    <br><br>
                                    <div class="input-group col-sm-4 col-md-4">
                                        <span class="input-group-addon">上次单人少收</span>
                                        <input type="text" name="dbCtmLTLack" id="dbInformCtmLTLackText" class="form-control" readonly="readonly">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                    <br><br>
                                    <div class="input-group col-sm-4 col-md-4" >
                                        <span class="input-group-addon">本次累计少收</span>
                                        <input type="text" name="dbCtmNTLack" id="dbInformCtmNTLackText" class="form-control" readonly="readonly">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                    <br><br>
                                    <hr>
                                    <div class="input-group col-sm-4 col-md-4">
                                        <span class="input-group-addon">上次应收结余</span>
                                        <input type="text" name="dbLTMoney" id="dbInformLTMoneyText" class="form-control" readonly="readonly">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                    <br><br>
                                    <div class="input-group col-sm-4 col-md-4">
                                        <span class="input-group-addon">累计应收结余</span>
                                        <input type="text" name="dbNTMoney" id="dbInformNTMoneyText" class="form-control" readonly="readonly">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                    <br><br>
                                    <div class="input-group col-sm-4 col-md-4">
                                        <span class="input-group-addon">上次少收金额</span>
                                        <input type="text" name="dbLTLackMoney" id="dbInformLTLackMoneyText" class="form-control" readonly="readonly">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                    <br><br>
                                    <div class="input-group col-sm-4 col-md-4">
                                        <span class="input-group-addon">累计少收金额</span>
                                        <input type="text" name="dbNTLackMoney" id="dbInformNTLackMoneyText" class="form-control" readonly="readonly">
                                        <span class="input-group-addon">元</span>
                                    </div>
                                    <input type="hidden" name="id" id="dbId"/>
                                    <br><br>
                                    <hr>
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
                <div class="modal fade" id="dbPicModal" tabindex="-1" role="dialog" aria-labelledby="dbPicModal" aria-hidden="true">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">发货-图表记录(默认为当月记录)</h4>
                        </div>
                        <div class="modal-body">

                            <div id="dbInformTable" style="width: 1280px;height:200px">
                                <div class="input-group col-sm-4 col-md-4">
                                    <span class="input-group-addon">选择月份</span>
                                    <input id="viewDeliverCompareMonth" type="month" class="form-control">
                                </div>
                                <br><hr>
                                <table class="table table-condensed table-hover table-striped" id="viewDBCompareTable" style="width: 100%;table-layout:fixed;word-wrap:break-word;font-size: 15px;">
                                    <tr>
                                        <th>本月发货总额(元)</th>
                                        <th>本月收回总额(元)</th>
                                        <th>本月少收总额(元)</th>
                                        <th>本月未收总额(元)</th>
                                        <th>累计少收总额(元)</th>
                                        <th>累计未收总额(元)</th>
                                    </tr>
                                    <tbody id="viewDBCompareBody"></tbody>
                                </table>
                            </div>

                            <p><h5 style="color: blue">说明:</h5></p>
                            <p><h5 style="color: blue">本月未收总额(元)=本月收回总额(元)-本月发货总额(元)+本月少收总额(元)</h5>
                            <p><h5 style="color: blue">累计少收总额(元)=到目前为止(或者到该月最后一天)在外总少收金额</h5>
                            <p><h5 style="color: blue">累计未收总额(元)=到目前为止(或者到该月最后一天)在外总未收金额</h5>

                            <!--echarts柱状图-->
                            <div id="TImgDbBills" style="width: 1280px;height: 600px">
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