package com.codingdojo.qa3ati.repositories;

import java.util.List;
import org.springframework.data.repository.CrudRepository;
import com.codingdojo.qa3ati.models.City;
;


public interface CityRepository extends CrudRepository<City, Long> {
	List<City> findAll();
	City findByIdIs(Long id);

}
