package com.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.dao.DB;
import com.orm.TBook;
import com.orm.TCustomer;

public class liuService {
    public static TCustomer getUser(int id) {
        TCustomer user = new TCustomer();

        String sql = "select * from t_customer where id=" + id;
        Object[] params = {};
        DB mydb = new DB();
        try {
            mydb.doPstm(sql, params);
            ResultSet rs = mydb.getRs();
            rs.next();

            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setSex(rs.getString("sex"));
            user.setAge(rs.getString("age"));

            user.setAddress(rs.getString("address"));
            user.setTel(rs.getString("tel"));
            user.setEmail(rs.getString("email"));
            user.setId_code(rs.getString("id_code"));

            user.setDel(rs.getString("del"));

            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        mydb.closed();
        return user;
    }


    public static TBook getBook(int id) throws SQLException {
        TBook book = new TBook();

        String sql = "select * from t_book where del  = 'no' and id = " + id;
        Object[] params = {};
        DB mydb = new DB();
        mydb.doPstm(sql, params);
        ResultSet rs = mydb.getRs();
        while (rs.next()) {
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
        }
        rs.close();
        mydb.closed();
        return book;
    }
}
