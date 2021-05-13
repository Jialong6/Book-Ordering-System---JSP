package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.orm.TOrder;
import com.service.liuService;

public class order_servlet extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String type = req.getParameter("type");

        if (type.endsWith("orderMana")) {
            orderMana(req, res);
        }
        if (type.endsWith("orderAdd")) {
            orderAdd(req, res);
        }
        if (type.endsWith("orderDel")) {
            orderDel(req, res);
        }
    }


    public void orderAdd(HttpServletRequest req, HttpServletResponse res) {
        String user_id = req.getParameter("user_id");
        String book_id = req.getParameter("book_id");
        String order_num = req.getParameter("order_num");
        String order_time = req.getParameter("order_time");
        String del = "no";


        String sql = "insert into t_order(user_id,book_id,order_num,order_time,del) values(?,?,?,?,?)";
        Object[] params = {Integer.parseInt(user_id),
                Integer.parseInt(book_id),
                Integer.parseInt(order_num),
                order_time,
                del};
        DB mydb = new DB();
        mydb.doPstm(sql, params);
        mydb.closed();

        req.setAttribute("message", "order success！");
        req.setAttribute("path", "order?type=orderMana");

        String targetURL = "/common/success.jsp";
        dispatch(targetURL, req, res);
    }

    public void orderDel(HttpServletRequest req, HttpServletResponse res) {
        String sql = "update t_order set del='yes' where id=" + Integer.parseInt(req.getParameter("id"));
        Object[] params = {};
        DB mydb = new DB();
        mydb.doPstm(sql, params);
        mydb.closed();

        req.setAttribute("message", "delete order success！");
        req.setAttribute("path", "order?type=orderMana");

        String targetURL = "/common/success.jsp";
        dispatch(targetURL, req, res);
    }

    public void orderMana(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String page1 = req.getParameter("page");
        if (page1 == null) {
            page1 = "1";
        }

        int EVERYPAGENUM = 5;
        int page = Integer.parseInt(page1);
        int cou = 1;
        int pagecount = 1;
        String sql1 = "select count(*) as cou from t_order where del = 'no' ";
        Object[] params1 = {};
        DB mydb1 = new DB();
        try {
            mydb1.doPstm(sql1, params1);
            ResultSet rs = mydb1.getRs();
            while (rs.next()) {
                cou = rs.getInt("cou");
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        mydb1.closed();


        if (cou % EVERYPAGENUM == 0) {
            pagecount = cou / EVERYPAGENUM;
        } else {
            pagecount = cou / EVERYPAGENUM + 1;
        }


        req.setAttribute("EVERYPAGENUM", EVERYPAGENUM);
        req.setAttribute("page", page);
        req.setAttribute("cou", cou);
        req.setAttribute("pagecount", pagecount);


        List orderList = new ArrayList();
        String sql = "select * from t_order where del='no'";
        Object[] params = {};
        DB mydb = new DB();
        try {
            mydb.doPstm(sql, params);
            ResultSet rs = mydb.getRs();
            for (int i = 0; i < (page - 1) * EVERYPAGENUM; i++) {
                rs.next();
            }
            for (int t = 0; t < EVERYPAGENUM; t++) {
                if (rs.next()) {
                    TOrder order = new TOrder();

                    order.setId(rs.getInt("id"));
                    order.setUser_id(rs.getInt("user_id"));
                    order.setBook_id(rs.getInt("book_id"));
                    order.setOrder_num(rs.getInt("order_num"));
                    order.setOrder_time(rs.getString("order_time"));
                    order.setDel(rs.getString("del"));
                    order.setUser(liuService.getUser(rs.getInt("user_id")));
                    order.setBook(liuService.getBook(rs.getInt("book_id")));


                    orderList.add(order);
                } else {
                    break;
                }
            }

            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        mydb.closed();

        req.setAttribute("orderList", orderList);
        req.getRequestDispatcher("admin/order/orderMana.jsp").forward(req, res);
    }




    public void dispatch(String targetURI, HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatch = getServletContext().getRequestDispatcher(targetURI);
        try {
            dispatch.forward(request, response);
            return;
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {

            e.printStackTrace();
        }
    }

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void destroy() {

    }
}
