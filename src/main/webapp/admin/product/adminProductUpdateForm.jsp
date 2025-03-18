<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="../adminheader.jsp" %>
<%@ include file="sub_img.html" %>
<%@ include file="sub_menu.html" %>

<!-- 상품 수정 페이지 시작 -->
<article>
    <h1>상품 수정</h1>
    <div id="itemUpdate">
        <form action="NonageServlet?command=admin_product_update_form" method="post" name="formm">
            <fieldset>
                <legend>상품 수정 정보</legend>
                <span style="float: left;">
                    <img src="product_images/${adminproductVO.image}" />
                </span>
                <h2>
                    <input type="text" name="name" value="${adminproductVO.name}" required />
                </h2>

                <label> 상품분류 : </label>
                <select name="kind">
                    <option value="1" ${adminproductVO.kind == '1' ? 'selected' : ''}>Boots</option>
                    <option value="2" ${adminproductVO.kind == '2' ? 'selected' : ''}>Heels</option>
                    <option value="3" ${adminproductVO.kind == '3' ? 'selected' : ''}>Sandals</option>
                    <option value="4" ${adminproductVO.kind == '4' ? 'selected' : ''}>Sneakers</option>
                    <option value="5" ${adminproductVO.kind == '5' ? 'selected' : ''}>Other</option>
                </select><br>

                <label> 원가[A] : </label> <p> ${adminproductVO.price1} 원</p>
                <label> 판매가[B] : </label> <p> ${adminproductVO.price2} 원</p>
                <label> 할인액 : </label> <p> ${adminproductVO.price2 - adminproductVO.price1} 원</p>
                <label> 상세설명 : </label> <p> ${adminproductVO.content} </p>

                <label>상품 설명: </label>
                <textarea name="content">${adminproductVO.content}</textarea><br>

                <label>이미지 URL: </label>
                <input type="text" name="image" value="${adminproductVO.image}" /><br>

                <label>사용 여부: </label>
                <select name="useyn">
                    <option value="Y" ${adminproductVO.useyn == 'Y' ? 'selected' : ''}>사용</option>
                    <option value="N" ${adminproductVO.useyn == 'N' ? 'selected' : ''}>사용 안함</option>
                </select><br>

                <label>베스트 여부: </label>
                <input type="checkbox" name="bestyn" value="Y" ${adminproductVO.bestyn == 'Y' ? 'checked' : ''}/> 베스트로 지정<br>

                <input type="hidden" name="pseq" value="${adminproductVO.pseq}" />
            </fieldset>

            <div class="clear"></div>
            <div id="buttons">
                <input type="submit" value="수정 완료" class="submit">
                <input type="button" value="목록" class="submit" onclick="go_list()">
            </div>
        </form>
    </div>
</article>
<!-- 상품 수정 페이지 끝 -->

<%@ include file="../adminfooter.jsp" %>

