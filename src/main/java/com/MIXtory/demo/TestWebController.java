package com.MIXtory.demo;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
//@RequestMapping("/MIXtory")
public class TestWebController {

    final CocktailDAO c_dao;
    final IngredientDAO i_dao;
    final LikeDAO like_DAO;

    @Autowired
    public TestWebController(CocktailDAO c_dao, IngredientDAO i_dao, LikeDAO like_DAO) {
        this.c_dao =  c_dao;
        this.i_dao = i_dao;
        this.like_DAO = like_DAO;
    }

    @GetMapping("/search")
    public String search(Model m) {
        List<Cocktail> list;
        try {
            list = c_dao.getAll();
            m.addAttribute("cocktailist", list);
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("error", c_dao.error);
        }

        return "search";
    }
    @GetMapping("/search/insert")
    public String cocktailAdd() {
        return "insert";
    }
    @PostMapping("/search/insert")
    public String cocktailAdd(@ModelAttribute Cocktail c) {
        try {
            c_dao.addCocktail(c);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/search";
    }
    @GetMapping("/search/{cname}")
    public String recipe(@PathVariable String cname, Model m) {
        List<Recipes> list;
        try {
            list = c_dao.getRecipes(cname);
            m.addAttribute("title", cname);
            m.addAttribute("recipelist", list);
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("error", c_dao.error);
        }

        return "recipes";
    }
    @RequestMapping("/search/{cname}/delete")
    public String cocktailDelete(@PathVariable String cname, Model m) {
        try {
            m.addAttribute("title", cname);
            c_dao.deleteCocktail(cname);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/search";
    }
    @GetMapping("/search/{cname}/edit")
    public String recipeEdit(@PathVariable String cname, Model m) {
        List<Recipes> list;
        try {
            list = c_dao.getRecipes(cname);
            m.addAttribute("title", cname);
            m.addAttribute("recipelist", list);
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("error", c_dao.error);
        }

        return "edit";
    }
    @PostMapping("/search/{cname}/edit/{rcp_id}")
    public String recipeEdit(@ModelAttribute Recipes recipe, Model m,
                             @PathVariable String cname, @PathVariable int rcp_id) {
        try {
            recipe.setRcp_id(rcp_id);
            recipe.setRcp_cName(cname);
            c_dao.editRecipes(recipe);
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("error", c_dao.error);
        }

        return "redirect:./";
    }
    @RequestMapping("/search/{cname}/edit/{rcp_id}/delete")
    public String recipeDelete(Model m, @PathVariable int rcp_id, @PathVariable String cname) {
        try {
            c_dao.deleteRecipes(rcp_id);
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("error", c_dao.error);
        }

        return "redirect:/search/{cname}/edit/";
    }
    @PostMapping("/search/{cname}/edit/add")
    public String recipeAdd(@ModelAttribute Recipes recipe, Model m, @PathVariable String cname) {
        try {
            recipe.setRcp_cName(cname);
            c_dao.addRecipes(recipe);
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("error", c_dao.error);
        }

        return "redirect:./";
    }

    @GetMapping("/minibar")
    public String minibar(Model m, HttpSession session)
    {
        List<Ingredient> list;
        List<String> likedCnameList = new ArrayList<>();
        try {
            list = i_dao.getAll();
            m.addAttribute("igdlist", list);
//            String user_name = (String) session.getAttribute("user_id");
//
//            for (Like myLike : like_DAO.getLikes(user_name)) {
//                likedCnameList.add(myLike.getLike_cname());
//            }
//
//            list = i_dao.getLikesFilter(user_name, c_dao.catRecipes(likedCnameList));
//            m.addAttribute("igdlist", list);
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("error", i_dao.error);
        }

        return "minibar";
    }


    @GetMapping("/community")
    public String community()
    {
        return "community";
    }

    @GetMapping("/notice")
    public String notice()
    {
        return "notice";
    }

}
