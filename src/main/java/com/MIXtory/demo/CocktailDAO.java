package com.MIXtory.demo;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.MIXtory.news.News;
import org.springframework.stereotype.Component;

@Component
public class CocktailDAO {
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

    public void close() {
        try {
            pst.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Cocktail> getAll() throws Exception {
        open();
        List<Cocktail> cocktailList = new ArrayList<>();
        String sql = "SELECT id, name, enname, method FROM COCKTAILS";

        try {
            pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Cocktail c = new Cocktail();
                c.setCocktail_id(rs.getInt("id"));
                c.setCocktail_name(rs.getString("name"));
                c.setCocktail_enname(rs.getString("enname"));
                c.setCocktail_method(rs.getString("method"));

                cocktailList.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
            this.error = "가져오기 실패";
        } finally {
            close();
        }
        return cocktailList;
    }

    public void addCocktail(Cocktail cocktail) throws Exception {
        open();
        String sql = "INSERT INTO Cocktails(name, enname, method) VALUES(?,?,?)";

        try {
            pst = conn.prepareStatement(sql);

            pst.setString(1, cocktail.getCocktail_name());
            pst.setString(2, cocktail.getCocktail_enname());
            pst.setString(3, cocktail.getCocktail_method());
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            this.error = "가져오기 실패";
        } finally {
            close();
        }
    }
    public void deleteCocktail(String cname) throws SQLException {
        open();
        String sql_1 = "DELETE FROM Cocktails WHERE name=?";
        String sql_2 = "DELETE FROM Recipes WHERE name=?";

        try {
            pst = conn.prepareStatement(sql_1);
            pst.setString(1, cname);
            pst.executeUpdate();

            pst = conn.prepareStatement(sql_2);
            pst.setString(1, cname);
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            this.error = "가져오기 실패";
        } finally {
            close();
        }
    }

    public List<Recipes> getRecipes(String cname) throws Exception {
        open();
        List<Recipes> recipeList = new ArrayList<>();
        String sql = "SELECT * FROM Recipes WHERE name=?";

        try {
            pst = conn.prepareStatement(sql);
            pst.setString(1, cname);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Recipes r = new Recipes();
                r.setRcp_id(rs.getInt("id"));
                r.setRcp_cName(rs.getString("name"));
                r.setRcp_igdCategory(rs.getString("igdcategory"));
                r.setRcp_amount(rs.getInt("amount"));

                recipeList.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
            this.error = "가져오기 실패";
        } finally {
            close();
        }

        return recipeList;
    }

    public void editRecipes(Recipes recipe) throws Exception {
        open();

        String sql = "UPDATE Recipes SET igdcategory=?, amount=? WHERE id=?";

        try {
            pst = conn.prepareStatement(sql);

            pst.setString(1, recipe.getRcp_igdCategory());
            pst.setInt(2, recipe.getRcp_amount());

            pst.setInt(3, recipe.getRcp_id());
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            this.error = "가져오기 실패";
        } finally {
            close();
        }
    }

    public void deleteRecipes(int rcp_id) throws SQLException {
        open();
        String sql = "DELETE FROM Recipes WHERE id=?";

        try {
            pst = conn.prepareStatement(sql);

            pst.setInt(1, rcp_id);
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            this.error = "가져오기 실패";
        } finally {
            close();
        }
    }

    public void addRecipes(Recipes recipe) {
        open();

        String sql = "INSERT INTO Recipes(name, igdcategory, amount) VALUES(?,?,?)";

        try {
            pst = conn.prepareStatement(sql);

            pst.setString(1, recipe.getRcp_cName());
            pst.setString(2, recipe.getRcp_igdCategory());
            pst.setInt(3, recipe.getRcp_amount());
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            this.error = "가져오기 실패";
        } finally {
            close();
        }
    }

    public List<String> catRecipes(List<String> cnameList) {
        open();
        List<String> catList = new ArrayList<>();
        String sql = "SELECT igdcategory FROM Recipes WHERE name=?";

        try {
            for (String cname : cnameList) {
                pst = conn.prepareStatement(sql);
                pst.setString(1, cname);
                ResultSet rs = pst.executeQuery();

                while (rs.next()) {
                    catList.add(rs.getString(0));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            this.error = "가져오기 실패";
        } finally {
            close();
        }
        return catList;
    }
}
