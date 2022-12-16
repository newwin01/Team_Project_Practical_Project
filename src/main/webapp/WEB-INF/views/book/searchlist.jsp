<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>free board</title>
  <style>
    #list {
      font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
      border-collapse: collapse;
      width: 100%;
    }

    #list td, #list th {
      border: 1px solid #ddd;
      padding: 8px;
      text-align: center;
    }

    #list tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    #list tr:hover {
      background-color: #ddd;
    }

    #list th {
      padding-top: 12px;
      padding-bottom: 12px;
      text-align: center;
      background-color: #006bb3;
      color: white;
    }

    h1 {
      text-align: center;
    }

    h3 {
      text-align: right;
    }
  </style>
  <script>
    function delete_ok(id) {
      var a = confirm("정말로 삭제하겠습니까?");
      if (a) location.href = 'deleteok/' + id;
    }
  </script>
</head>
<body>
<h1>자유게시판</h1>
<h3>${login.username}님 안녕하세요!</h3>
<table id="list" width="90%">
  <tr>
    <th>Id</th>
    <th>Category</th>
    <th>Title</th>
    <th>Writer</th>
    <th>Price</th>
    <th>Pay method</th>
    <th>Arrived date</th>
    <th>Regdate</th>
    <th>Moddate</th>
    <th>photo</th>
    <th>month</th>
    <th>Edit</th>
    <th>Delete</th>
  </tr>
  <c:forEach items="${list}" var="u" varStatus="status">
    <tr>
      <td>${status.index-fn.length(list)+1}</td>
      <td>${u.getCategory()}</td>
      <td>${u.getTitle()}</td>
      <td>${u.getWriter()}</td>
      <td>${u.getPrice()}원</td>
      <td>
        <c:if test="${u.getPay_method()==0}">
          무통장 입금
        </c:if>
        <c:if test="${u.getPay_method()==1}">
          카드 결제
        </c:if>
        <c:if test="${u.getPay_method()==2}">
          핸드폰 결제
        </c:if>
      </td>
      <td>${u.getArrived_date()}</td>
      <td>${u.getRegdate()}</td>
      <td>${u.getModdate()}</td>
      <td>
        <c:if test="${u.getPhoto() ne ''}"><br />
          <img src="${pageContext.request.contextPath}/upload/${u.getPhoto()}" class="photo" width="50%" height="50%">
        </c:if>
      </td>
      <td>${u.getMonth()}</td>
      <td><a href="editform/${u.getSeq()}">Edit</a></td>
      <td><a href="javascript:delete_ok('${u.getSeq()}')">Delete</a></td>
    </tr>
  </c:forEach>
</table>
<br/><a button type="button" onclick="location.href='listsort'">월별 정렬</a>
<form action="search" method="post">
  <div class="search_wrap">
    <div class="search_area">
      <input type="text" name="keyword">
      <button type="submit">Search</button>
    </div>
  </div>
</form>
<br/><a button type="button" onclick="location.href='add'">Add New Post</a>
<br/><a button type="button" onclick="location.href='../login/logout'">Logout</a>
</body>
</html>