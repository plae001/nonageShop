package com.nonage.controller.action;

import com.nonage.dao.AddressDAO;
import com.nonage.dao.MemberDAO;
import com.nonage.dto.AddressVO;
import com.nonage.dto.MemberVO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class LoginAction implements Action{
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //이동 페이지
        String url = "member/login_fail.jsp";
        HttpSession session = req.getSession();

        //파라미터 정보 받기
        String id = req.getParameter("id");
//        String pwd = req.getParameter("pwd");

        //DAO 요청
        MemberDAO memberDAO = MemberDAO.getInstance();
        MemberVO memberVO = memberDAO.getMember(id);
//        MemberVO memberVO = memberDAO.getMember(pwd);

        if(memberVO != null) {
            session.removeAttribute("id");
            session.setAttribute("loginUser",memberVO);
            url = "NonageServlet?command=index";
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher(url);
        dispatcher.forward(req, resp);
    }
}
