package com.codingdojo.qa3ati.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.codingdojo.qa3ati.models.City;
import com.codingdojo.qa3ati.services.CityService;

@RestController
public class CityController {
	
	@Autowired
    private CityService cityService;
	
	@RequestMapping(value="/city/add", method=RequestMethod.POST)
  	public City create(@RequestParam ("cityName") String cityName) {
	 City city = new City(cityName);
        return cityService.createCity(city);
  		}

}
