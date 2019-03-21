<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header">
    <h1 class="page-title">财务总结</h1>
</div>
<div class="main-content">

    <ul class="nav nav-tabs">
        <li  class="active"><a href="#year-collecting" data-toggle="tab" id="id-year-collecting">代收总结</a></li>
        <li><a href="#year-deliver"  data-toggle="tab" id="id-year-deliver">发货总结</a></li>
        <li><a href="#year-getGoods"  data-toggle="tab" id="id-year-getGoods">进货总结</a></li>
        <li><a href="#year-bop"  data-toggle="tab" id="id-year-bop">收支总结</a></li>
        <li><a href="#year-cost"  data-toggle="tab" id="id-year-cost">小费总结</a></li>
        <li><a href="#year-ng"  data-toggle="tab" id="id-year-ng">未收总结</a></li>
    </ul>

    <div class="row" style="margin-top: 10px;">
        <div class="col-sm-12 col-md-12" style="margin-top: 30px">
            <div id="salaryContent" class="tab-content">

                <!---年代收查询-->
                <!--echarts柱状图-->
                <div class="tab-pane active in " id="year-collecting" style="width: 1100px;height: 500px;">
                </div>

                <!---发货查询-->
                <div class="tab-pane fade" id="year-deliver" style="width: 1100px;height: 500px;">
                </div>

                <!---进货查询-->
                <div class="tab-pane fade" id="year-getGoods" style="width: 1100px;height: 500px;">
                </div>

                <!---收支查询-->
                <div class="tab-pane fade " id="year-bop" style="width: 1100px;height: 500px;">
                </div>

                <!---小费查询-->
                <div class="tab-pane fade " id="year-cost" style="width: 1100px;height: 500px;">
                </div>

                <!---未收查询-->
                <div class="tab-pane fade " id="year-ng" style="width: 1100px;height: 500px;">
                </div>

            </div>
        </div>
    </div>
</div>
