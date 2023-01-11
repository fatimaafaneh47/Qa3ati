package com.codingdojo.qa3ati.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.qa3ati.models.City;
import com.codingdojo.qa3ati.models.Hall;
import com.codingdojo.qa3ati.repositories.CityRepository;

@Service
public class CityService {
	private final CityRepository cityRepo;
	
	public CityService(CityRepository cityRepo) {
		this.cityRepo = cityRepo;
	}
	
	public City findCityById(Long id) {
		Optional<City> optionalCity = cityRepo.findById(id);
		if(optionalCity.isPresent()) {
			return optionalCity.get();
		}
		else {
			return null;
		}
	}
	
	public City createCity(City city) {
		return cityRepo.save(city);
	}
	
	public List<City> allCities() {
		return cityRepo.findAll();
	}
}
