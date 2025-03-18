package com.nonage.admin.controller.action;

import com.nonage.admin.controller.dao.AdminDAO;
import com.nonage.admin.controller.dto.AdminVO;
import com.nonage.controller.action.Action;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AdminLoginAction implements Action {

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = "admin/worker/login_fail.jsp";  // 로그인 실패 페이지 URL
        HttpSession session = req.getSession();

        String id = req.getParameter("id");
        String pwd = req.getParameter("pwd");

        // 입력 정보 검증
        AdminDAO adminDAO = AdminDAO.getInstance();
        int result = adminDAO.confirmAuth(id, pwd);

        // 로그인 성공 시
        if (result > 0) {
            AdminVO adminVO = adminDAO.getAdminById(id);
            session.removeAttribute("adminLoginUser");
            session.setAttribute("adminLoginUser", adminVO);
            url = "NonageServlet?command=admin_product_list";  // 로그인 후 리디렉션
        } else {
            // 로그인 실패 시, 실패 페이지로 리디렉션
            session.removeAttribute("adminLoginUser");
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher(url);
        dispatcher.forward(req, resp);
    }
}