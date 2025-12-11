package com.skilljobbie.todolist.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.skilljobbie.todolist.entity.Login;
import com.skilljobbie.todolist.entity.Task;
import com.skilljobbie.todolist.service.LoginService;

@Controller
public class LoginController {
    
    @Autowired
    private LoginService service;
    
    @GetMapping("/")
    public String root() { 
        return "redirect:/login"; 
    }
    
    @GetMapping("/login")
    public String loginPage(Model model) {
        model.addAttribute("login", new Login());
        return "login";
    }
    
    @PostMapping("/login")
    public String Postlogin(@ModelAttribute("login") Login login, Model model, HttpSession session) {
        String input = login.getEmail();
        String pass = login.getPassword();
        Login data = service.login(input, pass);
        if(data != null) {
            // store logged-in user in session
        	session.setAttribute("loggedInUser", data);
            model.addAttribute("message", "Login Successfully!");
            return "home";
        } else {
            model.addAttribute("message", "Login Failed!");
            model.addAttribute("login", new Login());
            return "login";
        }
    }
    
    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("register", new Login());
        return "register";
    }
    
    @PostMapping("/register")
    public String Postregister(@ModelAttribute("register") Login login){
        int register = service.register(login);
        if(register != 0) {
            return "redirect:/login";
        } else {
            return "register";
        }
    }
    
    @GetMapping("/home")
    public String home(Model model) {
        model.addAttribute("home", new Task());
        return "home";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // clear session
        return "redirect:/login";
    }
    
    @GetMapping("/profile")
    public String profile(HttpSession session, Model model) {
        // Get logged-in user from session
        Login user = (Login) session.getAttribute("loggedInUser");
        if(user == null) {
            return "redirect:/login"; // Redirect if not logged in
        }
        model.addAttribute("user", user); // Add user to model
        return "profile"; // maps to profile.jsp
    }

}
