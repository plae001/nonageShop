package com.nonage.controller;


import com.nonage.admin.controller.action.*;
import com.nonage.controller.action.*;



public class ActionFactory {

private static ActionFactory instance = new ActionFactory();
private ActionFactory() {
    super();
}

public static ActionFactory getInstance() {
    return instance;
}
public Action getAction(String command) {
    Action action = null;

    //메인페이지(IndexAction)
    if (command.equals("index")) {
        action = new IndexAction();
    } else if (command.equals("product_detail")) {
        action = new ProductDetailAction();
    } else if (command.equals("category")) {
        action = new ProductKindAction();
    } else if (command.equals("contract")) {
        action = new ContractAction();
    } else if (command.equals("join_form")) {
        action = new JoinFormAction();
    } else if (command.equals("id_check_form")) {
        action = new IdCheckFormAction();
    } else if (command.equals("find_zip_num")) {
        action = new FindZipNumAction();
    } else if (command.equals("join")) {
        action = new JoinAction();
    } else if (command.equals("login_form")) {
        action = new LoginFormAction();
    } else if (command.equals("login")) {
        action = new LoginAction();
    } else if (command.equals("logout")) {
        action = new LogoutAction();
    } else if (command.equals("cart_insert")) {
        action = new CartInsertAction();
    } else if (command.equals("cart_list")) {
        action = new CartListAction();
    } else if (command.equals("cart_delete")) {
        action = new CartDeleteAction();
    } else if (command.equals("order_insert")) {
        action = new OrderInsertAction();
    } else if (command.equals("order_list")) {
        action = new OrderListAction();
    } else if (command.equals("qna_list")) {
        action = new QnaListAction();
    } else if (command.equals("qna_write_form")) {
        action = new QnaWriteFormAction();
    } else if (command.equals("qna_write")) {
        action = new QnaWriteAction();
    } else if (command.equals("qna_view")) {
        action = new QnaViewAction();
    } else if (command.equals("admin_login_form")) {
        action = new AdminLoginFormAction();        // 관리자 로그인 폼
    } else if (command.equals("admin_login")) {
        action = new AdminLoginAction();            // 관리자 로그인
    }else if (command.equals("admin_product_list")) {
        action = new AdminProductListAction();      // 관리자 상품리스트
    }else if(command.equals("admin_product_detail")) {
        action = new AdminProductDetailAction();    //관리자 상품정보
    }else if(command.equals("admin_product_update_form")) {
        action = new AdminProductUpdateFormAction();    //관리자 상품 수정
    }else if(command.equals("admin_product_update")) {
        action = new AdminProductUpdateAction();    //관리자 상품 수정
    }



    return action;
}
}
