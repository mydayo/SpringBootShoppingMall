<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>DayoungKim</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
    <link href="/css/sticky-footer-navbar.css" rel="stylesheet"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" ></script>


</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <ul class="nav navbar-nav">
      <li class="active"><a href="/">Home</a></li>
    </ul>
  </div>
</nav>


<script type="text/javascript">
    $(document).ready(function () {
        var userId = "${user.userId}";
        $(".purchaseButton").on("click", function() {
            var hidden_value =  $(this).parent().children().attr('value');
            var itemInfo = hidden_value.split(",");
            $.ajax({
                url: '/json/purchase',
                method: "post",
                data: {
                    "userId" : userId, "item" : itemInfo[0], "price" : itemInfo[1],
                    "img" : "1", "count" : "1", "paid_yn" : "1"
                }
            }).success(function(JSONData) {
                swal(JSONData);
                $(location).attr('href', "/shop/main/"+id);
            }).error(function(JSONData){
                swal("구매 실패");
                console.log("Error: ",JSONData);
            });
        });
    });
</script>