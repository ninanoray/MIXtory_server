package com.MIXtory.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    UserDAO dao;
    LikeDAO dao_like;

    @Autowired
    public UserController(UserDAO dao, LikeDAO dao_like) {
        this.dao = dao;
        this.dao_like = dao_like;
    }

    @GetMapping(path="/login")
    public String login()
    {
        return "login";
    }

    @PostMapping(path="/login")
    public String login(HttpSession session, RedirectAttributes redirectAttr,
                        @RequestParam(name="user_name", required=true) String uname,
                        @RequestParam(name="user_passwd", required=true) String passwd)
    {
        UserDAO userDAO = new UserDAO();
        if (userDAO.login(uname, passwd)) {
            session.setAttribute("user_id", uname);
        } else {
            redirectAttr.addFlashAttribute("errorMessage", "로그인 실패");
            return "redirect:/login";
        }
        return "redirect:/";
    }

    @GetMapping(path="/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user_id");
        return "redirect:/";
    }

    @RequestMapping("/like/{title}")
    public String likedCocktail(@PathVariable String title, HttpSession session)
    {
        Like newLike = new Like();

        try {
            String user_name = (String) session.getAttribute("user_id");
            newLike.setLike_cname(title);
            newLike.setLike_uname(user_name);
            dao_like.addLike(newLike);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/minibar";
    }

}
