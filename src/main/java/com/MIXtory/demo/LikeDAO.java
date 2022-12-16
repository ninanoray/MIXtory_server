package com.MIXtory.demo;


import org.springframework.stereotype.Component;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@Component
public class LikeDAO {
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

    public List<Like> getLikes(String user_id) throws Exception {
        open();
        List<Like> igdList = new ArrayList<>();
        String sql = "SELECT * FROM Likes WHERE uname=?";

        try {
            pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            pst.setString(1, user_id);

            while (rs.next()) {
                Like like = new Like();
                like.setLike_id(rs.getInt("id"));
                like.setLike_cname(rs.getString("cname"));
                like.setLike_uname(rs.getString("uname"));

                igdList.add(like);
            }
        } catch (Exception e) {
            e.printStackTrace();
            this.error = "가져오기 실패";
        }

        return igdList;
    }

    public void addLike(Like like) {
        open();
        String sql = "INSERT INTO Likes(cname, uname) VALUES(?,?)";

        try {
            pst = conn.prepareStatement(sql);

            pst.setString(1, like.getLike_cname());
            pst.setString(2, like.getLike_uname());
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            this.error = "가져오기 실패";
        }
    }
}
