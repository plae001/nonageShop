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


public class AdminProductUpdateFormAction implements Action {

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = "admin/product/adminProductUpdateForm.jsp";  // 상품 수정 폼 페이지

        HttpSession session = req.getSession();
        AdminVO loginUser = (AdminVO) session.getAttribute("adminLoginUser");

        // 로그인 체크
        if (loginUser == null) {
            url = "NonageServlet?command=admin_login_form";  // 로그인 페이지로 리디렉션
        } else {
            String pseq = req.getParameter("pseq");

            // pseq가 존재하면 상품 정보를 가져옴
            if (pseq != null) {
                AdminProductDAO adminProductDAO = AdminProductDAO.getInstance();
                AdminProductVO adminProductVO = adminProductDAO.getProduct(pseq);

                // 상품 정보 저장
                req.setAttribute("adminproductVO", adminProductVO);
            }
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher(url);
        dispatcher.forward(req, resp);
    }
}


