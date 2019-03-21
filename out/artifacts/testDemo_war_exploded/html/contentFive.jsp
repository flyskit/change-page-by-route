<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main-content">
    <div class="row">
        <div class="col-sm-12 col-md-12">
            <div class="panel panel-default">
                <div class="panel-body collapse in text-center">
                    <form action="" method="post" class="bs-example bs-example-form form-inline text-center" role="form">
                        <input type="hidden" id="lastIntroduceInfo" name="companyIntroduce">
                        <input type="hidden" id="companyNoteId" name="id">
                        <textarea rows="22" cols="140" id="companyNoteText" name="companyNoteInfo" style="border-radius: 15px" class="form-control" placeholder="笔记记录"></textarea>
                        <br><br><hr>
                        <button class="btn btn-info btn-lg" type="submit">保存</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>