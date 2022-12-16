<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>

<h1>Add New Post</h1>
<form action="fileUpload" method="post" enctype="multipart/form-data">
    <table>
        <tr><td>Title:</td><td><input type="text" name="title"/></td></tr>
        <tr><td>Category:</td><td><input type="text" name="category"/></td></tr>
        <tr><td>Writer:</td><td><input type="text" name="writer"/></td></tr>
        <tr><td>Price: </td><td><input type="number" name="price"></td></tr>
        <tr><td>Payment:</td><td><input type="text" name="pay_method"></td></tr>
        <tr><td>Date:</td><td><input type="number" name="arrived_date"></td></tr>
        <tr><td>Photo:</td><td><input type="file" name="uploadFile"></td></tr>
        <tr><td>Month: </td><td><input type="text" name="month"></td></tr>
    </table>
    <button type = "button" onclick="location.href='list'"> list </button>
    <button type= "submit"> Add post </button>
</form>

</body>
</html>