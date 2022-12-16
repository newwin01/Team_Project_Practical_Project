<%@ page import="com.booklist.book.BookListVO" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Edit Form</h1>


<form action="../fileUploadEdit" method="post" enctype="multipart/form-data">
  <input type="hidden" name="seq" value="${u.getSeq()}"/>
  <table>
    <tr><td>Title:</td><td><input type="text" name="title" value="${u.getTitle()}"/></td></tr>
    <tr><td>Category:</td><td><input type="text" name="category" value="${u.getCategory()} "/></td></tr>
    <tr><td>Writer:</td><td><input type="text" name="writer" value="${u.getWriter()}"/></td></tr>
    <tr><td>Price: </td><td><input type="number" name="price" value="${u.getPrice()}"></td></tr>
    <tr><td>Payment:</td><td><input type="text" name="pay_method" value="${u.getPay_method()}"></td></tr>
    <tr><td>Date:</td><td><input type="number" name="arrived_date" value="${u.getArrived_date()}"></td></tr>
    <tr><td>Photo:</td><td><input type="file" name="uploadFile" value="#{u.getUploadFile()}">
        <input type="hidden" name="photo" value="${u.getPhoto()}">
          <c:if test="${u.getPhoto() ne ''}"><br />
          <img src="${pageContext.request.contextPath}/upload/${u.getPhoto()}" class="photo" width="50%" height="50%">
        </c:if>
        </td></tr>
    <tr><td>Month: </td><td><input type="number" name="month" value="${u.getMonth()}"></td></tr>
  </table>
  <button value="Cancel" onclick="history.back()"> list </button>
  <input type="submit" value="Edit Post">
</form>


</body>
</html>
