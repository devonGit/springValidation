package com.validate.springValidate;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		
		String formattedDate = dateFormat.format(date);
		String add="2B/262, Vasundhara Ghaziabad";
		String myname="Devendra Kumar sharma and Ram kumar";
		model.addAttribute("nm", myname);
		model.addAttribute("varAdd", add);	
		
		List<String> lst=new ArrayList<String>();
		lst.add("Devendra ");
		lst.add("Ram");
		lst.add("Shyam");
		lst.add("Bhole Nath");
		
		model.addAttribute("list", lst);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	
	@RequestMapping(value="user1", method = RequestMethod.GET)
	public User user(){
		return new User(); 
	}
	
	@RequestMapping(value="createUser", method = RequestMethod.POST)
	public ModelAndView createUser(@ModelAttribute("user") @Valid User user,BindingResult result,ModelMap model) {
	    if(result.hasErrors()) {
	    	return new ModelAndView("user1");
	    }
		model.addAttribute("name",user.getName());
		model.addAttribute("age",user.getAge());
		
		return new ModelAndView("/success");
	}
	
	
}
