package com.nonage.controller.action;

import com.nonage.dao.CartDAO;
import com.nonage.dto.CartVO;
import com.nonage.dto.MemberVO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class CartDeleteAction implements Action{


    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String url = "NonageServlet?command=cart_list";

        CartDAO cartDAO = CartDAO.getInstance();

        String[] cseqArr = req.getParameterValues("cseq");
        for(String cseq : cseqArr) {
            cartDAO.deleteCart(Integer.parseInt(cseq));
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher(url);
        dispatcher.forward(req, resp);

    }
}
