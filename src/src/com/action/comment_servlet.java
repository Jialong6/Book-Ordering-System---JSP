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
import com.orm.TComment;

public class comment_servlet extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String type = req.getParameter("type");

        if (type.endsWith("commentAdd")) {
            addComment(req, res);
        }
        if (type.endsWith("commentSHow")) {
            getComment(req, res);
        }

    }

    private void addComment(HttpServletRequest req, HttpServletResponse res) {
        String user_id = req.getParameter("user_id");
        String isbn = req.getParameter("isbn");
        String short_text = req.getParameter("short_text");
        String score = req.getParameter("score");
        String trustfulNess = req.getParameter("trustfulness");
        String usefulNess = req.getParameter("usefulness");


        String sql = "insert into t_comment (user_id,isbn,short_text,score,trustfulness,usefulness) values(?,?,?,?,?,?)";
        Object[] params = {Integer.parseInt(user_id),
                short_text,
                isbn,
                score,
                usefulNess,
                trustfulNess,
        };
        DB mydb = new DB();
        mydb.doPstm(sql, params);
        mydb.closed();

        req.setAttribute("message", "borrow success！");
        req.setAttribute("path", "comment?type=commentShow");

        String targetURL = "/common/success.jsp";
        dispatch(targetURL, req, res);
    }

    private List getComment(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String bookId = req.getParameter("isbn");
        List Comments = new ArrayList();
        String sql = "select * from t_order where isbn= ?";
        Object[] params = {Integer.parseInt(bookId)};
        DB mydb = new DB();
        try {
            mydb.doPstm(sql, params);
            ResultSet rs = mydb.getRs();
            while (rs.next()) {
                TComment comment = new TComment();
                comment.setId(rs.getInt("id"));
                comment.setIsbn(rs.getString("isbn"));
                comment.setScore(rs.getInt("score"));
                comment.setShort_text(rs.getString("short_text"));
                comment.setUsefulness(rs.getString("usefulness"));
                comment.setTrustfulness(rs.getString("trustfulness"));
                Comments.add(comment);

            }
            rs.close();
        } catch (
                Exception e) {
            e.printStackTrace();
        }
        mydb.closed();
        req.setAttribute("Comments", Comments);
        req.getRequestDispatcher("admin/search/searchMana.jsp").forward(req, res);
        return Comments;
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
