package com.nonage.admin.controller.action;

import com.nonage.admin.controller.dao.AdminProductDAO;
import com.nonage.admin.controller.dto.AdminProductVO;
import com.nonage.controller.action.Action;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminProductDetailAction implements Action {

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = "admin/product/adminProductDetail.jsp";

        String pseq = req.getParameter("pseq");

        AdminProductDAO adminproductDAO = AdminProductDAO.getInstance();
        AdminProductVO adminproductVO = adminproductDAO.getProduct(pseq);

        // 상품분류 매핑
        String category = getCategoryByPseq(Integer.parseInt(pseq));
        adminproductVO.setKind(category);

        req.setAttribute("adminproductVO", adminproductVO);
        RequestDispatcher dispatcher = req.getRequestDispatcher(url);
        dispatcher.forward(req, resp);
    }

    // pseq에 따른 상품분류 반환
    private String getCategoryByPseq(int pseq) {
        switch (pseq) {
            case 1: case 2: case 6:
                return "Boots";
            case 3: case 5:
                return "Heels";
            case 4: case 7: case 8: case 10:
                return "Sandals";
            case 9: case 11:
                return "Sneakers";
            default:
                return "";
        }
    }
}
