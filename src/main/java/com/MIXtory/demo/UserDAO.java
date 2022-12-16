package com.MIXtory.demo;


import org.springframework.stereotype.Component;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@Component
public class UserDAO {
    String JDBC_URL = "jdbc:h2:tcp://localhost/~/testdb";
    String dbID = "SA";
    String dbPassword = "1q2w3e4r";
    public String error = "실패";

    private String user_id;
    private String user_passwd;
    private String user_name;
    private Connection conn;
    private ResultSet rs;

    public UserDAO() {
        try {
            Class.forName("org.h2.Driver");
            conn = DriverManager.getConnection(JDBC_URL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
            this.error = "드라이버 실패";
        }
    }

    public boolean login(String user_id, String user_passwd)
    {
        try
        {
            PreparedStatement pst = conn.prepareStatement("SELECT passwd FROM Member WHERE uname = ?");
            pst.setString(1, user_id);
            rs = pst.executeQuery();
            if (rs.next())
            {
                return rs.getString(1).equals(user_passwd) ? true : false;
            } else
            {
                return false;
            }
        } catch (Exception e)
        {
            e.printStackTrace();
            return false;
        }
    }

    public UserDAO getUser(String user_id)
    {
        try
        {
            PreparedStatement pst = conn.prepareStatement("SELECT passwd FROM Member WHERE email = ?");
            pst.setString(1, user_id);
            rs = pst.executeQuery();
            if (rs.next())
            {
                UserDAO user = new UserDAO();
                user.setUser_id(rs.getString(1));
                user.setUser_passwd(rs.getString(2));
                user.setUser_name(rs.getString(3));

                return user;
            }
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return null;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_passwd() {
        return user_passwd;
    }

    public void setUser_passwd(String user_passwd) {
        this.user_passwd = user_passwd;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }
}
