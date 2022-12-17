<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
  Date now = new Date();
  SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
  String strNowDate = simpleDateFormat.format(now);
%>
<!DOCTYPE html>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>BookOfTheMonth</title>
  <style>
    body, html{
      font-family: 'Source Sans Pro', sans-serif;
      background-color:white;
      padding: 0;
      margin: 0;
    }
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }
    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }
    .mbg{
      background-color: rgb(85, 113, 83);
    }
    .btn-sm:hover{
      background-color: #FFFFFF;
    }
    #br{
      ext-align: center;
      font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS",
      sans-serif;
      font-size: 50pt;
      font-weight: bold;
      color: #ff7e1d;
      text-shadow: 1px 3px 3px rgba(194, 54, 3, 0.96);
    }

    .buy {
      border:0;
      background: rgb(125, 143, 105);
      color: #fafafa;
      border-radius: 100px;
      width: 340px;
      height: 49px;
      font-size: 16px;
      position: absolute;
      left: 50%;
      transform: translateX(-170px);
      transition: 0.3s;
      cursor: pointer;
      text-align: center;
    }
    .buy:hover {
      background: rgb(125, 143, 105);
    }
    .sort {
      border:0;
      background: rgb(125, 143, 105);
      color: #fafafa;
      border-radius: 100px;
      width: 100px;
      height: 30px;
      font-size: 16px;
      position: absolute;

      left: 85%;
      transition: 0.3s;
      cursor: pointer;
      text-align: center;
    }
    .sort:hover {
      background: rgb(125, 143, 105);
    }
  </style>

  <script>
    function delete_ok(id) {
      var a = confirm("정말로 삭제하겠습니까?");
      if (a) location.href = 'deleteok/' + id;
    }

  </script>
</head>
<form action="search" method="post">
  <div class="search_wrap">
    <div class="search_area">
      <input type="text" name="keyword">
      <button type="submit">Search</button>
    </div>
  </div>
</form>
<button id="add" type="button" class="buy"><a href="add" style="color: white; text-decoration: none; font-weight: 800;">책 추가하기</a></button>
<button id="sort" type="button" class="sort"><a href="listsort" style="color: white; text-decoration: none; font-weight: 800;">월별 정렬</a></button>
<body>

<div class="album py-5 bg-light">
  <div class="container">
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

      <c:forEach items="${list}" var="u" varStatus="status">
        <div class="col">
          <div class="card shadow-sm">
            <img width="inherit" height="440px" src="${u.getPhoto()}>">
            <div class="card-body">
              <h5>${u.getTitle()}</h5>

              <p class="card-text" style="height: 30px; overflow: hidden;">작가 - ${u.getWriter()}</p>
              <div class="d-flex justify-content-between align-items-center">
                <small class="text-muted">카테고리 - ${u.getCategory()}<br>예상 배송 도착일 - <%=strNowDate%> + ${u.getArrived_date()} 일<br>가격 - ${u.getPrice()}원<br>${u.getMonth()}월의 베스트셀러
                  <br>
                  결제 방법 -
                  <c:if test="${u.getPay_method()==0}">
                    무통장 입금
                  </c:if>
                  <c:if test="${u.getPay_method()==1}">
                    카드 결제
                  </c:if>
                  <c:if test="${u.getPay_method()==2}">
                    핸드폰 결제
                  </c:if>
                </small>

                <div class="btn-group" style="border-radius: 3px;">
                  <button id="edit" type="button" class="btn btn-sm btn-outline-secondary" style="border: none;"><a href="editform/${u.seq}" style="color: black; text-decoration: none; font-weight: 800;">수정</a></button>|
                  <button id="del" type="button" class="btn btn-sm btn-outline-secondary" style="color: red; font-weight: 800; border: none;" onClick="javascript:delete_ok('${u.seq}')">삭제</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</div>



</body>
</html>

