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

<style type="text/css">
.thumb_g {
    width: 200px;
}
</style>

<div class="container" >

    <div class="row">
        <h1>쇼핑</h1>
        <h3>DAYOUNG KIM</h3>
        <br>
        <p>${user.userId}님 환영합니다.</p>

        <!-- Button trigger modal -->
        <button type="button" class="btn btn-info" id="myPurchaseList" data-toggle="modal" data-target="#exampleModal" >
            나의 구매내역
        </button>

        <br>

        <div class="col-md-2">
            <input type="hidden" value="카카오쿠션,30000">
            <img src="https://t1.daumcdn.net/friends/prod/product/FRPBKBMFC0002_AW_00.jpg" class="thumb_g" alt="제품 상세사진">
            카카오 쿠션<br>
            30,000원<br>
            <button type="button" class="btn btn-success purchaseButton">바로구매</button>
        </div>

        <div class="col-md-2">
            <input type="hidden" value="차량용방향제1,10000">
            <img src="https://t1.daumcdn.net/friends/prod/product/8801051331783_AW_00.jpg" class="thumb_g" alt="제품 상세사진">
            차량용방향제1<br>
            10,000원<br>
            <button type="button" class="btn btn-success purchaseButton">바로구매</button>
        </div>

        <div class="col-md-2">
            <input type="hidden" value="차량용방향제2,10000">
            <img src="https://t1.daumcdn.net/friends/prod/product/8801051331790_AW_00.jpg" class="thumb_g" alt="제품 상세사진">
            차량용방향제2<br>
            10,000원<br>
            <button type="button" class="btn btn-success purchaseButton">바로구매</button>
        </div>

        <div class="col-md-2">
            <input type="hidden" value="차량용방향제3,10000">
            <img src="https://t1.daumcdn.net/friends/prod/product/8801051017724_AW_00.jpg" class="thumb_g" alt="제품 상세사진">
            차량용방향제3<br>
            10,000원<br>
            <button type="button" class="btn btn-success purchaseButton">바로구매</button>
        </div>

        <div class="col-md-2">
            <input type="hidden" value="무브방향제-어피치,5000">
            <img src="https://t1.daumcdn.net/friends/prod/product/8801051331776_AW_00.jpg" class="thumb_g" alt="제품 상세사진">
            무브방향제-어피치<br>
            5,000원<br>
            <button type="button" class="btn btn-success purchaseButton">바로구매</button>
        </div>
    </div>


    <!-- 나의 구매 내역 Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">나의 구매내역</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <jsp:include page="footer.jsp"></jsp:include>


    <script type="text/javascript">
        $(document).ready(function () {
            var userId = "${user.userId}";
            $(".purchaseButton").on("click", function() {
                var hidden_value =  $(this).parent().children().attr('value');
                var img_src =  $(this).parent().children("img").attr('src');

                var itemInfo = hidden_value.split(",");
                $.ajax({
                    url: '/json/purchase',
                    method: "post",
                    data: {
                        "userId" : userId, "item" : itemInfo[0], "price" : itemInfo[1],
                        "img" : img_src, "count" : "1", "paid_yn" : "1"
                    }
                }).success(function(JSONData) {
                    swal(JSONData);
                }).error(function(JSONData){
                    swal("구매 실패");
                    console.log("Error: ",JSONData);
                });
            });

            $("#myPurchaseList").on("click", function() {
                $.ajax({
                    url: '/json/myPurchaseList',
                    method: "post",
                    data: {
                        "userId" : userId
                    }
                }).success(function(Data) {
                    var itemInfo = Data.split("&");
                    for (var i =1; i<itemInfo.length ; i++) {
                        var itemDetail = itemInfo[i].split(",");
                            for (var k = 0 ; k<itemDetail.length; k++){
                                $(".modal-body").append("<p>"+itemDetail[k]+"</p>");
                            }
                        $(".modal-body").append("<p>-----------------</p>");
                    }
                }).error(function(JSONData){
                    swal("구매 실패");
                    console.log("Error: ",JSONData);
                });
            });


        });
    </script>


</html>

