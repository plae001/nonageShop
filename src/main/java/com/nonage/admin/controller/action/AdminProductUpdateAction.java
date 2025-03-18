package com.nonage.admin.controller.action;

import com.nonage.admin.controller.dao.AdminProductDAO;
import com.nonage.admin.controller.dto.AdminProductVO;
import com.nonage.admin.controller.dto.AdminVO;
import com.nonage.controller.action.Action;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AdminProductUpdateAction implements Action {

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = "NonageServlet?command=admin_product_list";  // 수정 완료 후 상품 리스트로 리디렉션

        HttpSession session = req.getSession();
        AdminVO loginUser = (AdminVO) session.getAttribute("adminLoginUser");

        // 로그인 체크
        if (loginUser == null) {
            url = "NonageServlet?command=admin_login_form";  // 로그인 페이지로 리디렉션
        } else {
            AdminProductVO adminProductVO = new AdminProductVO();
            adminProductVO.setPseq(Integer.parseInt(req.getParameter("pseq")));
            adminProductVO.setName(req.getParameter("name"));
            adminProductVO.setPrice1(Integer.parseInt(req.getParameter("price1")));
            adminProductVO.setPrice2(Integer.parseInt(req.getParameter("price2")));
            adminProductVO.setPrice3(Integer.parseInt(req.getParameter("price3")));
            adminProductVO.setContent(req.getParameter("content"));
            adminProductVO.setImage(req.getParameter("image"));
            adminProductVO.setUseyn(req.getParameter("useyn"));
            adminProductVO.setBestyn(req.getParameter("bestyn"));

            AdminProductDAO adminProductDAO = AdminProductDAO.getInstance();
            adminProductDAO.updateProduct(adminProductVO);  // 상품 정보 수정
        }

        resp.sendRedirect(url);
    }
}