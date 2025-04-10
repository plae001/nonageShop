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
import java.util.ArrayList;

public class CartListAction implements Action{
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = "mypage/cartList.jsp";
        HttpSession session = req.getSession();


        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

        if(loginUser == null) {
            url = "NonageServlet?command=login_form";
        }else {
            CartDAO cartDAO = CartDAO.getInstance();
            ArrayList<CartVO> cartList = cartDAO.listCart(loginUser.getId());
            int totalPrice = 0;
            for(CartVO cartVO : cartList) {
                totalPrice += cartVO.getPrice2() * cartVO.getQuantity();
            }
            req.setAttribute("cartList",cartList);
            req.setAttribute("totalPrice",totalPrice);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher(url);
        dispatcher.forward(req, resp);

    }
}
