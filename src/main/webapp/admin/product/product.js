// 상품 수정 페이지로 이동
function go_update() {
    var pseq = document.forms["formm"].pseq.value;
    window.location.href = "admin/product/adminProductUpdate.jsp?pseq=" + pseq;
}


// 상품 목록 페이지로 이동
function go_list() {

    window.location.href = "admin/product/adminProductList.jsp";
}

// 수정
function go_update(pseq) {
    window.location.href = "NonageServlet?command=admin_product_update_form&pseq=" + pseq;
}

// 취소
function go_list(pseq) {
    window.location.href = "NonageServlet?command=admin_product_list" + pseq;
}



