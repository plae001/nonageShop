<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="../header.jsp" %>
<%@ include file="sub_img.html"%>
<%@ include file="sub_menu.html" %>

   <!-- 주문정보 페이지 시작 -->
<article>
      <h2> Order List </h2>
      <form name="formm" method="post">
        <table id="cartList">
       <tr>
        <th>상품명</th> <th>수 량</th><th>가 격</th> <th>주문일</th> <th> 진행 상태 </th>
       </tr>
<c:forEach items="${orderList}" var="orderVO">
       <tr>
        <td>
            <a href="">
              <h3> ${orderVO.pname} </h3>
          </a>
        </td>
        <td> ${orderVO.quantity} </td>
        <td> <fmt:formatNumber value="${orderVO.price2*orderVO.quantity}" type="currency"/> </td>
        <td> <fmt:formatDate value="${orderVO.indate}" type="date"/></td>
        <td> 처리 진행 중 </td>
       </tr>
</c:forEach>
       <tr>
         <th colspan="2"> 총 액 </th>
         <th colspan="2"> <fmt:formatNumber value="${totalPrice}" type="currency"/><br>     </th>
         <th> 주문 처리가 완료되었습니다. </th>
       </tr>
      </table>

      <div class="clear"></div>
      <div id="buttons" style="float: right">
       <input type="button"    value="쇼핑 계속하기"  class="cancel"  onclick="location.href='NonageServlet?command=index'">
      </div>
    </form>
  </article>
    <!-- 주문정보 페이지 끝 -->

<%@ include file="../footer.jsp" %>