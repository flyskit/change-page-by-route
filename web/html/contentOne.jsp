<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header">
    <h1 class="page-title">首页/关于公司</h1>
</div>
<div class="main-content">
    <!-- 公司简介 -->
    <div class="row">
        <div class="col-sm-12 col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading no-collapse text-center" style="font-size: 20px">公司简介<span class="fa fa-pencil" data-toggle="modal" data-target="#aboutCompanyText" role="button"  ></span></div>
                <div class="panel-body collapse in">
                    <textarea rows="10" id="companyIntroduceText" style="border-radius: 15px" class="form-control" placeholder="公司简介" readonly="readonly"></textarea>
                </div>
            </div>
        </div>
        <!-- 弹窗modal -->
        <div class="modal fade" id="aboutCompanyText" tabindex="-1" role="dialog" aria-labelledby="aboutCompanyText" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h2>修改公司简介</h2>
                    </div>
                    <div class="modal-body">
                        <form action="" method="post" class="bs-example bs-example-form form-inline text-center" role="form">
                            <div class="input-group col-sm-11 col-md-11">
                                <input type="hidden" id="lastNoteInfo" name="companyNoteInfo">
                                <input type="hidden" id="companyIntroduceId" name="id">
                                <textarea rows="15" id="changeCompanyTextArea" name="companyIntroduce" style="border-radius: 15px" class="form-control" placeholder="公司简介"></textarea>
                            </div>
                            <br><br><hr>
                            <button class="btn btn-info" id="introduceBtn" type="submit">修改</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- 公司成员 -->
        <div class="row">
            <div class="col-sm-12 col-md-12">
                <div class="panel panel-default">
                    <a href="#CompanyEmployeesInformation" class="panel-heading text-center" data-toggle="collapse" style="font-size: 20px;">公司成员(<span id="allEmpNum"></span>人)</a>
                    <div id="CompanyEmployeesInformation" class="panel-body panel-collapse collapse in">
                        <table class="table table-condensed table-hover table-striped" id="allEmpTable">
                            <tr>
                                <th hidden="hidden">id</th>
                                <th>姓名</th>
                                <th>入职时间</th>
                                <th>性别</th>
                                <th>电话</th>
                                <th>基本工资</th>
                                <th>提成</th>
                                <th></th>
                                <th hidden="hidden"></th>
                            </tr>
                            <tbody id="allEmpTbody"></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>