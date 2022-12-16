package com.MIXtory.demo;


import org.springframework.stereotype.Component;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Component
public class IngredientDAO {
    String JDBC_URL = "jdbc:h2:tcp://localhost/~/testdb";
    String dbID = "SA";
    String dbPassword = "1q2w3e4r";
    public String error = "실패";

    Connection conn = null;
    PreparedStatement pst;

    // DB 연결을 가져오는 메서드, DBCP를 사용하는 것이 좋음
    public void open() {
        conn = null;
        try {
            Class.forName("org.h2.Driver");
            conn = DriverManager.getConnection(JDBC_URL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
            this.error = "드라이버 실패";
        }
    }

    public List<Ingredient> getAll() throws Exception {
        open();
        List<Ingredient> igdList = new ArrayList<>();
        String sql = "SELECT * FROM INGREDIENTS";

        try {
            pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Ingredient igd = new Ingredient();
                igd.setIgd_id(rs.getInt("id"));
                igd.setIgd_name(rs.getString("name"));
                igd.setIgd_type(rs.getString("type"));
                igd.setIgd_category(rs.getString("category"));
                igd.setIgd_url(rs.getString("url"));

                igdList.add(igd);
            }
        } catch (Exception e) {
            e.printStackTrace();
            this.error = "가져오기 실패";
        }

        return igdList;
    }

    public List<Ingredient> getLikesFilter(String user_name, List<String> catList) throws SQLException {
        open();
        List<Ingredient> igdList = new ArrayList<>();
        String sql = "SELECT * FROM INGREDIENTS WHERE category IN (?)";
        Object[] arr = catList.toArray();

        try {
            pst = conn.prepareStatement(sql);
            pst.setArray(1, conn.createArrayOf("text", arr));
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Ingredient igd = new Ingredient();
                igd.setIgd_id(rs.getInt("id"));
                igd.setIgd_name(rs.getString("name"));
                igd.setIgd_type(rs.getString("type"));
                igd.setIgd_category(rs.getString("category"));
                igd.setIgd_url(rs.getString("url"));

                igdList.add(igd);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            this.error = "가져오기 실패";
        }

        return igdList;
    }
}
