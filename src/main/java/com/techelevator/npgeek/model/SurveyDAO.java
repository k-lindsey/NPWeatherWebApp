package com.techelevator.npgeek.model;

import java.util.List;

public interface SurveyDAO {

	public void save(Survey survey);
	public List<Survey> getAllSurveys();
	
}
