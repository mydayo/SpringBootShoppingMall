<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>


<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head></head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css"
      rel="stylesheet">


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Sweet Alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<jsp:include page="header.jsp"></jsp:include>

<div class="container" >

    <div class="row">
    <h3>dayoung</h3>
    <br>
    <div style="text-align: center;">
        <input type="text" style="margin-top:10px;" class="form-control" name="userId" id="userId"  placeholder="아이디" ><br/>
        <input type="password" class="form-control" name="password" id="password" placeholder="패스워드" >
    </div><br>
    <div class="col-md-12" style="text-align: center;">
        <button type="button" class="btn btn-info" id="userLogin" >로그인</button>
        <button type="button" class="btn btn-primary" onclick="location.href='/register';">회원가입</button>
    </div>

</div>

<jsp:include page="footer.jsp"></jsp:include>

    <script type="text/javascript">
        $(function() {
            $("#userLogin").on("click", function() {
                    var id = $("input:text").val();
                    var pw = $("input:password").val();

                    if (id == null || id.length < 1) {
                        alert("ID 를 입력하지 않으셨습니다.","","warning");
                        $("#userId").focus();
                        return;
                    }

                    if (pw == null || pw.length < 1) {
                        alert("패스워드를 입력하지 않으셨습니다.","","warning");
                        $("#password").focus();
                        return;
                    }

                $.ajax({
                    url: 'json/checkUser',
                    method: "post",
                    data: {
                        "userId" : id,"password" : pw
                    }
                }).success(function(JSONData) {
                   swal("환영합니다.");
                    $(location).attr('href', "/shop/main/"+id);
                }).error(function(JSONData){
                    alert("로그인에 실패하였습니다, 아이디와 패스워드를 확인해주세요. 로그인은 회원가입 후 가능합니다.");
                    console.log("Error: ",JSONData);
                });

            });
        });
    </script>
</html>

