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

public class book_servlet extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String type = req.getParameter("type");

        if (type.endsWith("bookMana")) {
            bookMana(req, res);
        }
        if (type.endsWith("bookAdd")) {
            bookAdd(req, res);
        }
        if (type.endsWith("bookDel")) {
            bookDel(req, res);
        }
        if (type.endsWith("bookStock")) {
            bookStock(req, res);
        }
    }

    public void bookAdd(HttpServletRequest req, HttpServletResponse res) {
        String name = req.getParameter("name");
        String author = req.getParameter("author");
        String publisher = req.getParameter("publisher");
        String publication_time = req.getParameter("publication_time");
        String language = req.getParameter("language");
        String isbn = req.getParameter("isbn");
        String price = req.getParameter("price");
        String pages = req.getParameter("pages");
        String stock = req.getParameter("stock");
        String catelog_id = req.getParameter("catelog_id");


        String sql = "insert into t_book(name,author,publisher,publication_time,isbn,price,pages,stock,catelog_id,del,language) values(?,?,?,?,?,?,?,?,?,?,?)";
        Object[] params = {name, author, publisher, publication_time,
                isbn, price, pages, stock,
                catelog_id, "no", language};
        DB mydb = new DB();
        mydb.doPstm(sql, params);
        mydb.closed();

        req.setAttribute("message", "Add book successfully");
        req.setAttribute("path", "book?type=bookMana");

        String targetURL = "/common/success.jsp";
        dispatch(targetURL, req, res);
    }


    public void bookMana(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String page1 = req.getParameter("page");
        if (page1 == null) {
            page1 = "1";
        }
        int EVERYPAGENUM = 5;
        int page = Integer.parseInt(page1);
        int cou = 1;
        int pagecount = 1;
        String sql1 = "select count(*) as cou from t_book where del = 'no'";
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

        List bookList = new ArrayList();
        String sql = "select * from t_book where del='no'";
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
                } else {
                    break;
                }
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        mydb.closed();

        req.setAttribute("bookList", bookList);
        req.getRequestDispatcher("admin/book/bookMana.jsp").forward(req, res);
    }

    public void bookDel(HttpServletRequest req, HttpServletResponse res) {
        String sql = "update t_book set del='yes' where id=" + Integer.parseInt(req.getParameter("id"));
        Object[] params = {};
        DB mydb = new DB();
        mydb.doPstm(sql, params);
        mydb.closed();

        req.setAttribute("message", "Delete Book successfully");
        req.setAttribute("path", "book?type=bookMana");

        String targetURL = "/common/success.jsp";
        dispatch(targetURL, req, res);
    }

    public void bookStock(HttpServletRequest req, HttpServletResponse res) {
        String sql = "update t_book set stock = 'yes' where id=" + Integer.parseInt(req.getParameter("id"));
        Object[] params = {};
        DB mydb = new DB();
        mydb.doPstm(sql, params);
        mydb.closed();

        req.setAttribute("message", "Change the stock of the Book successfully");
        req.setAttribute("path", "book?type=bookMana");

        String targetURL = "/common/success.jsp";
        dispatch(targetURL, req, res);
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
