<%@ page language="java" contentType="text/html; charset=UTF-8"
                pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Nonage Shop</title>
  <link href="css/shopping.css" rel="stylesheet">  
  <script type="text/javascript" src="member/member.js"></script>
  <script type="text/javascript" src="product/product.js"></script>
  <script type="text/javascript" src="mypage/mypage.js"></script>
<style>
    body{
        background-color:#B96DB5;
        margin:0;
        padding:0;
        font-size:0.75em;
    }

    #wrap{
        width:971px; /* 각 웹 페이지 크기에 맞게 사이즈 조정 */
        text-align:left;
        margin:0;
        margin-right:auto;
        margin-left:auto;
        background-color:#B96DB5;
        background-repeat:repeat-y;
        min-height:780px;
    }

    .clear{clear:both;}

    #logo{
        float:left;
        width:180px;
        height:100px;
        margin:40px 0 0 40px;
    }

    nav#category_menu{
       float:right;
        margin:20px 64px 0 0;
        font-family: Arial, Helvetica, sans-serif;
    }

    table#cartList {
        border-collapse:collapse;    /* border 사이의 간격 없앰 */
        border-top: 2px solid  #333;
        border-bottom: 1px solid  #333;
        width:100%;                  /* 전체 테이블 길이 설정 */
        margin-bottom: 20px;
    }

    table#cartList th, td{
        border-bottom: 1px dotted  #333;
       text-align: center;
    }

    nav#category_menu ul{
        list-style:none;
    }

    nav#category_menu ul li{
       display:block;
        height:30px;
        float:left;
        font-family: 굴림;
    }

    nav#category_menu a{
        text-decoration:none;
        display:inline-block;
        width: 80px;
        text-align: center;
        color: #CCC;
        font-weight: bold;
    }

    nav#category_menu a:hover{
        color: #F90;
        font-weight: bold;
    }

    nav#top_menu{
        margin: 20px 0;
        float:right;
    }

    nav#top_menu ul{
        list-style:none;
        font-family:Verdana;
    }
    nav#top_menu ul li{
       float:left;
       margin:0 15px;
       font-size: 14pt;
    }

    nav#top_menu a{
       display:block;
        height:20px;
        text-decoration:none;
        color:#fff;
        padding: 10px;
    }

    nav#top_menu a:hover{
        background-image:url(../images/purple.gif);
        background-repeat:repeat-x;
        background-position:bottom;
    }

    article h1, div h1 {
       font-family: "Times New Roman", Times, serif;
       font-size: 45px;
       color: #CCC;
       margin: 20px 0;
       font-weight: normal;
    }

    article h2, div h2{
       font-family: "Times New Roman", Times, serif;
       font-size: 30px;
       color: #CCC;
       padding-bottom: 15px;
       border-bottom: 1px dotted #666; /* 제목 하단 부에 점선을 넣어 제목이라는 것을 표시해 줍니다. */
    }


    #bestProduct{
        border:solid 1px #FFFFFF;
        border-radius:10px;
        width:910px;
        min-height:260px;
        background:#ebebeb;
        padding:10px;
        text-align: center;
    }

    #kindProduct{
        border:solid 1px #FFFFFF;
        border-radius:10px;
        width:610px;
        min-height:900px;
        background:#ebebeb;
        padding:10px;
        text-align: center;
    }

    #item{
        width:200px;
        float:left; margin: 0 13px;
        text-align: center;
    }

    #item img{
       width: 190px;
       height : 200px;
    }

    #itemdetail  img{
       width: 190px;
       height : 200px;
       margin-right: 20px;
    }

    a{
        color:#F00;
        text-decoration:none;
    }
    a:hover{
        color:#F90;
        text-decoration:underline;
    }

    #pname {
       font-size: 20px;
       border-bottom: 1px dotted #666;
       padding: 5px 0;
    }

    footer {
       margin:10px 0 0 0;
       height:50px;
       background-image: url(../images/under_logo.gif);
       background-repeat: no-repeat;
       background-position: 40px center;
    }

    footer #copy {
       margin: 20px 0 10px 300px;
       width:600px;
       float:left;
    }

    #main_img{
       text-align: center;
    }
    #main_img img{
        margin:9px 0 0 0;
    }

    div#front{
        margin:5px 0 5px 20px;
    }

    #sub_img {
       text-align: center;
    }

    #sub_img img {
       margin: 9px 0 0 0;
    }

    #sub_menu {
       width: 250x;
       float: left;
       margin: 20px 0;
    }

    #sub_menu ul {
       margin: 20px 0 0 16px;
       list-style: none;
    }

    #sub_menu a {
       text-decoration: none;
       color: white; font-family: Arial, Helvetica, sans-serif;
       font-weight:bold; font-size:16px;
       display: block;
       height: 15px;
       width: 160px;
       padding: 7px;
       border-bottom: 1px dotted #999;
       background-image: url(../images/bullet.gif);
       background-repeat: no-repeat;
       background-position: right center;
    }

    #sub_menu a:hover {
       background-image: url(../images/bullet_orange.gif);
       background-repeat: no-repeat;
       background-position: right center;
       color: #F90;font-weight:bold; font-size:16px;
       font-family: Arial, Helvetica, sans-serif;
    }

    article {
       float: right;
       width: 680px;
       padding-right: 10px;
       font-family: Verdana, Geneva, sans-serif;
       font-size: 1em;
       line-height: 1.5em;
    }

    article p {
       padding-left: 10px;
    }

    article table#notice {
       width: 670px;
       border-collapse: collapse;
       border-top: 1px solid #999;
    }

    article table#notice th {
       height: 20px;
       width: 70px;
       font-size: 14px;
       font-weight: bold;
       padding: 5px;
       color: #FFF;
       border-bottom: 1px dotted #999;
    }

    article table#notice td {
       text-align: left;
       padding: 6px 0;
       border-bottom: 1px dotted #999;
    }

    article table#notice tr:hover {
       background-color: #DDF;
       cursor: pointer;
       color: red;
    }

    form {
       margin: 10px 0 0 0;
       width: 670px;
    }

    form fieldset {
       padding: 10px 0 20px 5px;
       border: none;
    }

    form fieldset legend {
       font-size: 20px; /* 제목으로 사용되기 때문에 크기를 크게 잡아 줍니다. */
       border-bottom: 1px dotted #666; /* 제목 하단 부에 점선을 넣어 제목이라는 것을 표시해 줍니다. */
       width: 600px; /* 전체 크기를 잡아 줍니다. */
       padding: 5px 0; /* 위와 아래로 여백을 주고 좌우로는 여백을 없애버립니다.
                                          여백을 안 주게 되면 밑줄과 너무 붙어버려 보기에 좋지 않습니다. */
    }

    form label {
       width: 140px; /* 전체의 크기를 정의합니다. */
       float: left; /* 왼쪽으로 이동시킵니다. */
       margin: 5px 0; /* 마진을 이용해서 상하로 간격을 줍니다. */
    }

    form input {
       margin: 5px 0; /* label과 마찬가지로 여기도 동일하게 상하로 간격을 줍니다. */
       border: 1px solid #999; /* input 박스의 테두리 모양을 정의해 줍니다. */
       background-color: #FCFDEA; /* 배경색을 이용하여 바탕화면 색과 차별을 줍니다. */
    }

    form input.id {
       width: 100px;
       height: 18px;
    }

    form input.dup {
       width: 90px; /* 버튼의 가로 크기를 정합니다. */
       height: 23px; /* 버튼의 세로 크기를 정합니다. */
       border-radius: 8px; /* border-radius 통해 둥그런 버튼으로 만듭니다. */
       border: none; /* 배경 이미지가 어둡기 때문에 여기서 border는 없애버리겠습니다. */
       margin: 0 0 0 5px; /* 마진을 왼쪽만 줘서 input과의 간격을 벌립니다. */
       font-weight: bold; /* 글꼴 두께를 두껍게 */
       color: #FFF; /* 글꼴의 색상은 흰색으로 */
       background-image: url(../images/dup.jpg);
       /* 백그라운드 이미지를 사용합니다. */
       background-repeat: repeat-x; /* 백그라운드 이미지를 x축으로 반복 */
       background-position: center center; /* 백그라운드 이미지의 위치를 중앙으로 위치 */
    }

    form #buttons {
       margin: 20px 0 0 0;
    }

    form  .submit,form  .cancel {
       height: 30px; /* 버튼의 세로 크기를 정의합니다. */
       width: 150px; /* 버튼의 가로 크기를 정의합니다. */
       border: 1px solid #666; /* 버튼의 테두리를 정의합니다. */
       border-radius: 10px; /* border-radius를 통해 버튼을 둥그렇게 만듭니다. */
       box-shadow: 3px 3px 2px #ccc; /* box-shadow를 이용해서 그림자를 만듭니다. */
       font-size: 14px; /* 글꼴 사이즈를 조절합니다. */
       background-repeat: repeat-x;
       background-position: center center;
       color: #fff;
       margin: 0 0 0 20px;
    }

    form  .submit {
       background-image: url(images/submit_back.jpg);
    }

    form  .cancel {
       background-image: url(images/cancel_back.jpg);
    }

</style>
</head>

<body>
<div id="wrap">
<!--헤더파일 들어가는 곳 시작 -->
  <header>
    <!--로고 들어가는 곳 시작--->
    <div id="logo">
      <a href="NonageServlet?command=index">
        <img src="images/logo.gif" width="180" height="100" alt="nonageshop">
      </a>
    </div>
    <!--로고 들어가는 곳 끝-->
    <nav id="category_menu">
     <ul>
       <c:choose>
       <c:when test="${empty sessionScope.loginUser}">
       <li>
         <a href="NonageServlet?command=login_form" style="width:110px;">LOGIN(CUSTOMER</a>
        <a href="NonageServlet?command=admin_login_form" style="width:100px;">| ADMIN)</a>
      </li>
       <li>/</li>
       <li><a href="NonageServlet?command=contract">JOIN</a></li>
       </c:when>
       <c:otherwise>
       <li style="color:orange">
         ${sessionScope.loginUser.name}(${sessionScope.loginUser.id})
       </li>
       <li><a href="NonageServlet?command=logout">LOGOUT</a></li>
       </c:otherwise>       
       </c:choose>
       <li>/</li>
       <li>
         <a href="NonageServlet?command=cart_list">CART</a>
       </li><li>/</li>
       <li>
         <a href="NonageServlet?command=mypage">MY PAGE</a>
       </li><li>/</li>
       <li>
         <a href="NonageServlet?command=qna_list">Q&amp;A(1:1)</a>
       </li>
     </ul>
    </nav>

    <nav id="top_menu">
      <ul>
        <li>
          <a href="NonageServlet?command=category&kind=1">Heels</a>
        </li>  
        <li>
          <a href="NonageServlet?command=category&kind=2">Boots</a>
        </li>  
        <li>
          <a href="NonageServlet?command=category&kind=3">Sandals</a>
        </li> 
        <li>
          <a href="NonageServlet?command=category&kind=4">Sneakers</a>
        </li> 
        <li>
          <a href="NonageServlet?command=category&kind=5">On Sale</a>
        </li>  
      </ul>
    </nav>
    <div class="clear"></div>
    <hr>
  </header>
  <!--헤더파일 들어가는 곳 끝 -->