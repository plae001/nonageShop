package com.nonage.dao;

import com.nonage.dto.CartVO;
import util.DBManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CartDAO {
    private CartDAO() {
    }

    private static CartDAO instance = new CartDAO();

    public static CartDAO getInstance() {
        return instance;
    }


    public void insertCart(CartVO cartVO){

        String sql = "insert into cart (cseq,id,pseq,quantity)" +
                " values (cart_seq.nextval,?,?,?) ";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);

            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, cartVO.getId());
            pstmt.setInt(2, cartVO.getPseq());
            pstmt.setInt(3, cartVO.getQuantity());
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt);
        }

    }

    public ArrayList<CartVO> listCart(String userid) {

        ArrayList<CartVO> cartList = new ArrayList<>();

        String sql = "select * from cart_view where id = ? order by cseq desc";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userid);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                CartVO cartVO = new CartVO();
                cartVO.setCseq(rs.getInt(1));
                cartVO.setId(rs.getString(2));
                cartVO.setPseq(rs.getInt(3));
                cartVO.setMname(rs.getString(4));
                cartVO.setPname(rs.getString(5));
                cartVO.setQuantity(rs.getInt(6));
                cartVO.setIndate(rs.getTimestamp(7));
                cartVO.setPrice2(rs.getInt(8));
                cartList.add(cartVO);
            }
            }catch(Exception e) {
            e.printStackTrace();
            }

        return cartList;
    }

    public void deleteCart(int cseq) {
        String sql = "delete cart where cseq = ? ";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,cseq);
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt);
        }

    }
}
