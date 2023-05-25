package com.TVShow.TVShow.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TVShow.TVShow.Models.Show;
import com.TVShow.TVShow.Repository.ShowRepository;






@Service
public class ShowService {
	
	@Autowired
	private ShowRepository repo;
	
	private final ShowRepository showRepository;
	
	public ShowService(ShowRepository showRepository) {
		this.showRepository = showRepository;
	}
	
	public Show findById(Long id) {
		
		Optional<Show> result = repo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		
		return null;
	}
	

	public List<Show> all() {
		return repo.findAll();
	}
	
	public Show create(Show show) {
		return repo.save(show);
	}
	
	public Show updateShow(Show show) {
		return repo.save(show);
	}
	
	public void deleteShow(Show show) {
		showRepository.delete(show);
	}

}
