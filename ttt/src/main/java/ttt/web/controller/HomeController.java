package ttt.web.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

    @RequestMapping("/home.html")
    public String index()
    {
        return "home";
    }

    

	@RequestMapping(value="/welcome1", method = RequestMethod.GET)
	public String printWelcome(ModelMap model,HttpSession session,Principal principal) {
 
		String name = principal.getName();
	
		session.setAttribute("Username", name);
		return "redirect:/welcome.html";
 
	}
 
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
 
		return "login";
 
	}
	
	@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
 
		model.addAttribute("error", "true");
		return "login";
 
	}
    
}