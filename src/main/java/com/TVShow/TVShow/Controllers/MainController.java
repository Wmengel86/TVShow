package com.TVShow.TVShow.Controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TVShow.TVShow.Models.LoginUser;
import com.TVShow.TVShow.Services.ShowService;
import com.TVShow.TVShow.Services.UserService;
import com.TVShow.TVShow.Models.Show;
import com.TVShow.TVShow.Models.User;







@Controller
public class MainController {
	
	@Autowired
	private UserService users;
	@Autowired
	private ShowService shows;
	
	
	@GetMapping("/")
    public String index(Model model) {
    
        // Bind empty User and LoginUser objects to the JSP
        // to capture the form input
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        
        // Call a register method in the service 
        // to do some extra validations and create a new user!
    	User user = users.register(newUser, result);
    	
        
        if(result.hasErrors()) {
            // Be sure to send in the empty LoginUser before 
            // re-rendering the page.
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.
        session.setAttribute("userId", user.getId());
    
        return "redirect:/home";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        
        // Add once service is implemented:
        User user = users.login(newLogin, result);
    
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
    
        // No errors! 
        // Store their ID from the DB in session, 
        // in other words, log them in.
        session.setAttribute("userId", user.getId());
    
        return "redirect:/home";
    }
    
    @GetMapping("/home")
    public String home(Model model, HttpSession session) {
    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	
    	model.addAttribute("shows", shows.all());
    	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
    	return "home.jsp";
    }
    
    @GetMapping("/addPage")
    public String addPage(@ModelAttribute("show") Show show, Model model, HttpSession session) {
    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	
    	User user = users.findById((Long)session.getAttribute("userId"));
    	model.addAttribute("user", user);
    	
    	return "addPage.jsp";
    }
    
    @PostMapping("/shows")
    public String createShow(@Valid @ModelAttribute("show") Show show, BindingResult result) {

    	if (result.hasErrors()) {
    		return "addPage.jsp";
    	}
    	
    	shows.create(show);
    	
    	return "redirect:/home";
    }
    
    @GetMapping("/shows/{id}")
    public String showPage(Model model, @PathVariable("id") Long id, HttpSession session) {
    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	
    	Show show = shows.findById(id);
    	model.addAttribute("show", show);
    	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
    	
    	return "show.jsp";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
    
    @GetMapping("/shows/edit/{id}")
	public String edit(@PathVariable("id") Long id, Model model, HttpSession session) {	
		
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	
    	model.addAttribute("show", shows.findById(id));
		return "edit.jsp";
	}
    
    @PostMapping("/shows/edit/{id}")
	public String updateShow(@Valid @ModelAttribute("show") Show show,BindingResult result,@PathVariable("id") Long id,Model model) {
		if (result.hasErrors()) {
			return "edit.jsp";
		}else {
			shows.updateShow(show);
			return "redirect:/home";
		}
	}
    
    @RequestMapping("/shows/delete/{id}")
	public String deleteExpense(@PathVariable("id") Long id) {
		Show show = shows.findById(id);
		shows.deleteShow(show);
		return "redirect:/home";
	}

}
