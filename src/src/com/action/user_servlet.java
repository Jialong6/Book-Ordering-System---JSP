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
import com.orm.TCustomer;

public class user_servlet extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String type = req.getParameter("type");

        if (type.endsWith("userMana")) {
            userMana(req, res);
        }
        if (type.endsWith("userAdd")) {
            userAdd(req, res);
        }
        if (type.endsWith("userDel")) {
            userDel(req, res);
        }
        if (type.endsWith("userAll")) {
            userAll(req, res);
        }
    }


    public void userAdd(HttpServletRequest req, HttpServletResponse res) {
        String name = req.getParameter("name");
        String password = req.getParameter("pw");
        String sex = req.getParameter("sex");
        String age = req.getParameter("age");
        String address = req.getParameter("address");
        String tel = req.getParameter("tel");
        String email = req.getParameter("email");
        String id_code = req.getParameter("id_code");
        String del = "no";

        DB mydb = new DB();

        String sql = "insert into t_customer(name,password,sex,age,address,tel,email,id_code,del) values(?,?,?,?,?,?,?,?,?)";
        Object[] params = {name, password, sex, age, address, tel, email, id_code, del};
        mydb.doPstm(sql, params);

        String sql2 = "insert into t_manager (userName,userPw,userRole)  values (?,?,?)";
        Object[] params2 = {name, password, 1};
        mydb.doPstm(sql2, params2);

        mydb.closed();

        req.setAttribute("message", "Add user successfully");
        req.setAttribute("path", "user?type=userMana");

        String targetURL = "/common/success.jsp";
        dispatch(targetURL, req, res);
    }

    public void userDel(HttpServletRequest req, HttpServletResponse res) {
        String sql = "update t_customer set del='yes' where id=" + Integer.parseInt(req.getParameter("id"));
        Object[] params = {};
        DB mydb = new DB();
        mydb.doPstm(sql, params);
        mydb.closed();

        req.setAttribute("message", "Delete the user successfully");
        req.setAttribute("path", "user?type=userMana");

        String targetURL = "/common/success.jsp";
        dispatch(targetURL, req, res);
    }

    public void userMana(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String page1 = req.getParameter("page");
        if (page1 == null) {
            page1 = "1";
        }

        int EVERYPAGENUM = 5;
        int page = Integer.parseInt(page1);
        int cou = 1;
        int pagecount = 1;
        String sql1 = "select count(*) as cou from t_customer where del = 'no' ";
        DB mydb1 = new DB();
        try {
            mydb1.doPstm(sql1, null);
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

        List userList = new ArrayList();
        String sql = "select * from t_customer where del='no'";
        DB mydb = new DB();
        try {
            mydb.doPstm(sql, null);
            ResultSet rs = mydb.getRs();
            for (int i = 0; i < (page - 1) * EVERYPAGENUM; i++) {
                rs.next();
            }
            for (int t = 0; t < EVERYPAGENUM; t++) {
                if (rs.next()) {
                    TCustomer user = new TCustomer();

                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setSex(rs.getString("sex"));
                    user.setAge(rs.getString("age"));

                    user.setAddress(rs.getString("address"));
                    user.setTel(rs.getString("tel"));
                    user.setEmail(rs.getString("email"));
                    user.setId_code(rs.getString("id_code"));

                    user.setDel(rs.getString("del"));
                    userList.add(user);
                } else {
                    break;
                }
            }
            rs.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        mydb.closed();

        req.setAttribute("userList", userList);
        req.getRequestDispatcher("admin/user/userMana.jsp").forward(req, res);
    }

    public void userAll(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        List userList = new ArrayList();
        String sql = "select * from t_customer where del='no'";
        Object[] params = {};
        DB mydb = new DB();
        try {
            mydb.doPstm(sql, params);
            ResultSet rs = mydb.getRs();
            while (rs.next()) {
                TCustomer user = new TCustomer();

                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setSex(rs.getString("sex"));
                user.setAge(rs.getString("age"));

                user.setAddress(rs.getString("address"));
                user.setTel(rs.getString("tel"));
                user.setEmail(rs.getString("email"));
                user.setId_code(rs.getString("id_code"));

                user.setDel(rs.getString("del"));
                userList.add(user);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        mydb.closed();

        req.setAttribute("userList", userList);
        req.getRequestDispatcher("admin/user/userAll.jsp").forward(req, res);
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
