<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="../adminheader.jsp" %>

<div class="admin-container">
    <h2 class="admin-title">상품 리스트</h2>
    <div class="search-bar">
        <input type="text" placeholder="상품명" class="search-input">
        <button class="search-btn">검색</button>
        <button class="view-all-btn">전체보기</button>
        <button class="add-product-btn">상품등록</button>
    </div>

    <table class="product-table">
        <thead>
            <tr>
                <th>번호</th>
                <th>상품명</th>
                <th>원가</th>
                <th>판매가</th>
                <th>등록일</th>
                <th>사용유무</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${adminproductList}" var="adminproductVO">
                <tr>
                    <td>${adminproductVO.pseq}</td>
                    <td>
                        <a href="NonageServlet?command=admin_product_detail&pseq=${adminproductVO.pseq}">
                            ${adminproductVO.name}
                        </a>
                    </td>
                    <td>${adminproductVO.price1}</td>
                    <td>${adminproductVO.price2}</td>
                    <td>${adminproductVO.indate}</td>
                    <td>${adminproductVO.useyn}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div class="pagination">
        <a href="#" class="page-link">1</a>
        <a href="#" class="page-link">2</a>
        <a href="#" class="page-link">3</a>
    </div>
</div>

<%@ include file="../adminfooter.jsp" %>
