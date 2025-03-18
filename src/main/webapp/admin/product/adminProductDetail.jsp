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

<article>
    <h1> Item </h1>
    <div id="itemdetail">
        <form method="post" name="formm">
            <fieldset>
                <legend> Item detail Info</legend>
                <a href="">
                    <span style="float: left;">
                        <img src="product_images/${adminproductVO.image}" />
                    </span>
                    <h2> ${adminproductVO.name} </h2>
                </a>

                <!-- 상품분류 -->


                <!-- 원가, 판매가, 할인액, 상세설명 -->
                상품분류 :
                .kind}')">${adminproductVO.kind}</span>
                <label> 원가[A] : </label> <p> ${adminproductVO.price1} 원</p>
                <label> 판매가[B] : </label> <p> ${adminproductVO.price2} 원</p>
                <label> 할인액 : </label> <p> ${adminproductVO.price2 - adminproductVO.price1} 원</p>
                <label> 상세설명 : </label> <p> ${adminproductVO.content} </p>

                <!-- 베스트여부 체크박스 -->
                <label> 베스트여부 : </label>
                <input type="checkbox" name="bestyn" ${adminproductVO.bestyn == 'Y' ? 'checked' : ''} />

                <input type="hidden" name="pseq" value="${adminproductVO.pseq}">
            </fieldset>
            <div class="clear"></div>
            <div id="buttons">

                <!-- 수정 버튼 -->
                <input type="button" value="수정" class="submit"
                onclick="window.location.href='NonageServlet?command=admin_product_update_form&pseq=${adminproductVO.pseq}'">

                <!-- 목록 버튼 -->
                <input type="button" value="목록" class="submit"
                onclick="window.location.href='NonageServlet?command=admin_product_list'">
            </div>
        </form>
    </div>
</article>

<!-- JavaScript 파일 -->
<script src="../product/product.js"></script>

</div>

<%@ include file="../adminfooter.jsp" %>
