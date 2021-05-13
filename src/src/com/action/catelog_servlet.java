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
import com.orm.TBook;
import com.orm.Tcatelog;

public class catelog_servlet extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String type = req.getParameter("type");

        if (type.endsWith("catelogMana")) {
            catelogMana(req, res);
        }
        if (type.endsWith("catelogAdd")) {
            catelogAdd(req, res);
        }
        if (type.endsWith("catelogDel")) {
            catelogDel(req, res);
        }
        if (type.endsWith("catelogAll")) {
            catelogAll(req, res);
        }
    }


    public void catelogAdd(HttpServletRequest req, HttpServletResponse res) {
        String name = req.getParameter("name");
        String introduction = req.getParameter("introduction");
        String del = "no";
        String sql = "insert into t_catelog (name,introduction,del) values(?,?,?)";
        Object[] params = {name, introduction, del};
        DB mydb = new DB();
        mydb.doPstm(sql, params);
        mydb.closed();

        req.setAttribute("message", "Add Subject successfully");
        req.setAttribute("path", "catelog?type=catelogMana");

        String targetURL = "/common/success.jsp";
        dispatch(targetURL, req, res);
    }

    public void catelogDel(HttpServletRequest req, HttpServletResponse res) {
        String sql = "update t_catelog set del='yes' where id=" + Integer.parseInt(req.getParameter("id"));
        Object[] params = {};
        DB mydb = new DB();
        mydb.doPstm(sql, params);
        mydb.closed();

        req.setAttribute("message", "Delete Subject successfully");
        req.setAttribute("path", "catelog?type=catelogMana");

        String targetURL = "/common/success.jsp";
        dispatch(targetURL, req, res);
    }

    public void catelogMana(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        List catelogList = new ArrayList();
        String sql = "select * from t_catelog where del='no'";
        Object[] params = {};
        DB mydb = new DB();
        try {
            mydb.doPstm(sql, params);
            ResultSet rs = mydb.getRs();
            while (rs.next()) {
                Tcatelog catelog = new Tcatelog();
                catelog.setId(rs.getInt("id"));
                catelog.setName(rs.getString("name"));
                catelog.setIntroduction(rs.getString("introduction"));
                catelogList.add(catelog);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        mydb.closed();

        req.setAttribute("catelogList", catelogList);
        req.getRequestDispatcher("admin/catelog/catelogMana.jsp").forward(req, res);
    }

    public void catelogAll(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        List bookList = new ArrayList();
        String sql = "select * from t_book where del='no'";
        Object[] params = {};
        DB mydb = new DB();
        try {
            mydb.doPstm(sql, params);
            ResultSet rs = mydb.getRs();
            while (rs.next()) {
                TBook book = new TBook();
                book.setId(rs.getInt("id"));
                book.setName(rs.getString("name"));
                book.setAuthor(rs.getString("author"));
                book.setPublisher(rs.getString("publisher"));
                book.setPublicationDate(rs.getString("publication_time"));
                book.setIsbn(rs.getString("isbn"));
                book.setPrice(rs.getString("price"));
                book.setPages(rs.getString("pages"));
                book.setStock(rs.getString("stock"));
                book.setCatelog_id(rs.getInt("catelog_id"));
                book.setDel(rs.getString("del"));
                book.setLanguage(rs.getString("language"));
                bookList.add(book);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        mydb.closed();
        System.out.println(bookList.size());
        req.setAttribute("bookList", bookList);
        req.getRequestDispatcher("admin/catelog/catelogAll.jsp").forward(req, res);
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
