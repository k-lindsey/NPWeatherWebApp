package com.techelevator.npgeek;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.ParkDAO;
import com.techelevator.npgeek.model.Survey;
import com.techelevator.npgeek.model.SurveyDAO;
import com.techelevator.npgeek.model.WeatherDAO;

@Controller
@SessionAttributes("degree")
public class MainController {

	@Autowired
	private ParkDAO parkdao;
	@Autowired
	private SurveyDAO surveydao;
	@Autowired
	private WeatherDAO weatherdao;
	
	public MainController() {
	}
	
	@RequestMapping("/")
	public String displayHomepage(ModelMap map) {
		map.addAttribute("parks", parkdao.getAllParks());
		return "homepage";
	}
	
	@RequestMapping(path="/parkDetail", method=RequestMethod.GET)
	public String showParkDetail(@RequestParam String parkCode, ModelMap map, @RequestParam String degree) {
		map.addAttribute("parks", parkdao.getAllParks());
		map.addAttribute("weatherList", weatherdao.getWeatherByParkCode(parkCode));
		Park park = parkdao.getParkByParkCode(parkCode);
		map.addAttribute("currentPark", park);
		map.addAttribute("degree", degree);
		return "parkDetail";
	}

	@RequestMapping("/survey")
	public String displaySurvey(ModelMap map) {
		map.addAttribute("parks", parkdao.getAllParks());
		
		if(! map.containsAttribute("survey")) {
			map.addAttribute("survey", new Survey());
		}
		
		return "survey";
	}
	
	@RequestMapping(path="/survey", method=RequestMethod.POST)
	public String surveyInput(HttpServletRequest request, @Valid @ModelAttribute("survey") Survey survey, BindingResult result, ModelMap map) {
		
		if(result.hasErrors()) {
			map.addAttribute("parks", parkdao.getAllParks());
			return "survey";
		}
		
		map.addAttribute("survey", new Survey());
		surveydao.save(survey);
		return "redirect:/favorites";
	}
	
	@RequestMapping("/favorites")
	public String displayFavorites(ModelMap map) {
		map.addAttribute("surveys",surveydao.getAllSurveys());
		List<Park> parks = parkdao.getAllParks();
		map.addAttribute("faveParks", parks);
		return "favorites";
	}
	
}
