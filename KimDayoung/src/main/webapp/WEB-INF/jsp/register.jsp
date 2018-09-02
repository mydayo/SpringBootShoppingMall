<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp"></jsp:include>

<h5>회원가입 완료 후 오른쪽 상단 Home Button을 눌러 로그인해주시기 바랍니다.</h5>

<h3>회원가입</h3>
<br>
<form action='/add' method='post'>
 
    <table class='table table-hover table-responsive table-bordered'>
 
        <tr>
            <td><b>아이디</b></td>
            <td><input type='text' name='userId' class='form-control'  required/></td>
        </tr>
 
        <tr>
            <td><b>패스워드</b></td>
            <td><input type='text' name='password' class='form-control' required /></td>
        </tr>
 
        <%--<tr>--%>
            <%--<td><b>이메일주소</b></td>--%>
            <%--<td><input type='text' name='email' class='form-control' size="20" required/></td>--%>
        <%--</tr>--%>
 
 
        <tr>
            <td></td>
            <td>
                <button type="submit" class="btn btn-primary">가입</button>
            </td>
        </tr>
 
    </table>
    <b><c:out value="${danger}"></c:out></b>
</form>



<h3>가입현황</h3>
<br>
<table class="table table-hover">

    <thead>
      <tr>
        <th><b>아이디</b></th>
        <th><b>패스워드</b></th>
      </tr>
    </thead>
    <tbody>

    <h5>정상적으로 가입되었는지 확인하실 수 있도록 아래에 가입 현황 테이블을 만들었습니다. (실제 서비스 환경에서는 Admin만 볼 수 있도록 해야겠죠.ㅎㅎ)</h5>
    <c:forEach items="${list}" var="user">
      <tr>
        <td><c:out value="${user.userId}"></c:out></td>
        <td><c:out value="${user.password}"></c:out></td>

      </tr>

    </c:forEach>
    </tbody>
  </table>
</div>

<jsp:include page="footer.jsp"></jsp:include>