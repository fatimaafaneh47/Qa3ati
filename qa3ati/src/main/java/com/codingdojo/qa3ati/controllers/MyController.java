package com.codingdojo.qa3ati.controllers;

import java.awt.PageAttributes.MediaType;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.ServletContextResource;
import com.codingdojo.qa3ati.models.City;
import com.codingdojo.qa3ati.models.Hall;
import com.codingdojo.qa3ati.models.LoginUser;
import com.codingdojo.qa3ati.models.ReserveDate;
import com.codingdojo.qa3ati.models.User;
import com.codingdojo.qa3ati.services.CityService;
import com.codingdojo.qa3ati.services.HallService;
import com.codingdojo.qa3ati.services.ReserveDateService;
import com.codingdojo.qa3ati.services.SpringMailSender;
import com.codingdojo.qa3ati.services.UserService;

@Controller
public class MyController {
	@Autowired
	private UserService userServ;

	@Autowired
	private HallService hallService;

	@Autowired
	private ReserveDateService reserveDateService;

	@Autowired
	private CityService cityService;

	@Autowired
	private SpringMailSender springMail;

	@GetMapping("/reg")
	public String index(Model model, HttpSession session) {
		if (session.getAttribute("user") != null) {
			return "redirect:/";
		}
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "reg.jsp";
	}

	@GetMapping("/")
	public String index1(Model model) {

		return "home.jsp";
	}

	@PostMapping("/register")
	public String register(
			@Valid @ModelAttribute("newUser") User newUser,
			BindingResult result,
			Model model,
			HttpSession session) {
		userServ.register(newUser, result);
		if(result.hasErrors()) { 
            model.addAttribute("newLogin", new LoginUser()); 
            return "reg.jsp";
        }
		session.setAttribute("user", newUser);
		return "redirect:/";
	}
	

	@GetMapping("/login")
	public String loginPage(@ModelAttribute("newLogin") LoginUser newLogin, Model model) {
		model.addAttribute("newUser", new User());
		return "log.jsp";
	}

	@PostMapping("/login")
    public String login(
    		@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result,
            Model model,
            HttpSession session) {
        User user = userServ.login(newLogin, result);
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "log.jsp";
        }
        session.setAttribute("user", user);
        return "redirect:/";
    }

	@GetMapping("/show")
	public String show(Model model, HttpSession session) {
		if (session.getAttribute("user") != null) {
			Long userId = (Long) session.getAttribute("user");
			User myUser = userServ.findUserById(userId);
			model.addAttribute("myUser", myUser);
			return "home.jsp";
		}

		return "redirect:/";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@GetMapping("/halls")
	public String halls(Model model, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:/login";
		} else {
			model.addAttribute("halls", hallService.allHalls());
			return "all_halls.jsp";
		}
	}

	@GetMapping("/halls/new")
	public String newHall(Model model, @ModelAttribute("hall") Hall hall, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:/login";
		} else {
			model.addAttribute("cities", cityService.allCities());
			return "addHall.jsp";
		}
	}

	@PostMapping("/halls/create")
	public String createHall(@Valid @ModelAttribute("hall") Hall hall, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("cities", cityService.allCities());
			return "addHall.jsp";
		} else {
			hallService.createHall(hall);
			return "redirect:/halls";
		}
	}

	@GetMapping("/halls/{id}")
	public String displayHall(@PathVariable("id") Long id, Model model,
			@ModelAttribute("reserveDate") ReserveDate reserveDate) {
		model.addAttribute("hall", hallService.findHallById(id));
		return "display_hall.jsp";
	}

	@PostMapping("/halls/{id}/add_availability")
	public String addAvailability(@PathVariable("id") Long id,@Valid @ModelAttribute("reserveDate") ReserveDate reserveDate,HttpSession session, Model model,
			 BindingResult result) {
			if (result.hasErrors()) {
				return "display_hall.jsp";
			}
			ReserveDate date = reserveDateService.createReserveDate(reserveDate);
			Hall hall = hallService.findHallById(id);
			hall.getReserveDates().add(date);
			User user = (User) session.getAttribute("user");
			
//			springMail.sendEmail(user.getEmail(),"Qa3ati Email","Successful of Hold a Hall");
			hallService.updateHall(hall);
		
		return "redirect:/halls/{id}";
	}

	@GetMapping("/halls/{id}/delete")
	public String deleteHall(@PathVariable("id") Long id) {
		hallService.deleteHall(id);
		return "redirect:/halls";
	}
	@GetMapping("/halls/hall{hallId}/date{dateId}/book")
	public String bookHall(
			@PathVariable("hallId") Long hallId,
			@PathVariable("dateId") Long dateId,
			HttpSession session) {
		ReserveDate date = reserveDateService.findReserveDateById(dateId);
		Hall hall = hallService.findHallById(hallId);
		User booker = (User) session.getAttribute("user");
		date.setAvailable(false);
		date.setBooker(booker);
		hall.getBookers().add(booker);
		hallService.updateHall(hall);
		
	    springMail.sendEmail(booker.getEmail(), "Qa3ati Email","Hello " + hall.getCreator().getUserName() + ". " + booker.getUserName() + " reserved " + hall.getName() + " on " + date.getDate().toString() + ", from " + date.getFromHour().toString() + " to " + date.getToHour().toString());
		
	    return "redirect:/halls/{hallId}";
	}
	
	@GetMapping("/halls/hall{hallId}/date{dateId}/unbook")
	public String unbookHall(
			@PathVariable("hallId") Long hallId,
			@PathVariable("dateId") Long dateId,
			HttpSession session) {
		ReserveDate date = reserveDateService.findReserveDateById(dateId);
		Hall hall = hallService.findHallById(hallId);
		User booker = (User) session.getAttribute("user");
		date.setAvailable(true);
		date.setBooker(null);
		hall.getBookers().remove(booker);
		hallService.updateHall(hall);
		return "redirect:/halls/{hallId}";
	}
	
	@GetMapping("/myhalls")
	public String myhalls(Model model, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:/login";
		} else {
			User user = (User) session.getAttribute("user");
			List<Hall> myHalls = user.getCreatedHalls();
			List<Hall> myReserves = user.getBookedHalls();
		model.addAttribute("myHalls", myHalls);
		model.addAttribute("myReserves", myReserves);
		return "myhalls.jsp";
	}
	}
}
	


