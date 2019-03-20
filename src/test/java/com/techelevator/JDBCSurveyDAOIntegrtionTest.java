package com.techelevator;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.npgeek.model.JDBCSurveyDAO;
import com.techelevator.npgeek.model.JDBCWeatherDAO;
import com.techelevator.npgeek.model.Survey;

public class JDBCSurveyDAOIntegrtionTest extends DAOIntegrationTest {

	private JDBCSurveyDAO dao;
	private static final String TEST_PARK = "GNP";
	private JdbcTemplate jdbcTemplate = new JdbcTemplate(getDataSource());
	@Before
	public void setup() {
		dao = new JDBCSurveyDAO(getDataSource());
		jdbcTemplate.execute("DELETE FROM survey_result");
	}
	
	@Test
	public void get_all_surveys() {
		List<Survey> results = dao.getAllSurveys();
		
		int numOfSurveysBefore = results.size();
		String sqlInsertPark2 = "INSERT INTO survey_result(surveyid, parkcode, emailaddress, state, activitylevel) VALUES (DEFAULT, ?, 'test@gmail.com', 'ohio', 'inactive')";
		jdbcTemplate.update(sqlInsertPark2, TEST_PARK);
		results = dao.getAllSurveys();
		assertNotNull(results);
		assertEquals(numOfSurveysBefore + 1, results.size());
		
		
		assertNotNull(results);
	}
	
	@Test
	public void save_survey_and_verify() {
		int numOfSurveysBefore = dao.getAllSurveys().size();
		
		Survey survey  = setSurvey("GNP", "test@gmail.com", "ohio", "inactive");
		dao.save(survey);
		
		int numOfSurveysAfter = dao.getAllSurveys().size();
		
		assertEquals(numOfSurveysBefore + 1, numOfSurveysAfter);	
	}
	
	@Test 
	public void get_all_surveys_and_check_alphabetical_order() {
		Survey surveyA  = setSurvey("CVNP", "test@gmail.com", "ohio", "inactive");
		dao.save(surveyA);
		
		Survey surveyB  = setSurvey("ENP", "test@gmail.com", "ohio", "inactive");
		dao.save(surveyB);
		
		Survey surveyC  = setSurvey("YNP", "test@gmail.com", "ohio", "inactive");
		dao.save(surveyC);
		
		List<Survey> results = dao.getAllSurveys();
		
		assertEquals("CVNP", results.get(0).getParkCode());
	}
	
	private Survey setSurvey(String parkCode, String email, String state, String activityLevel) {
		Survey survey = new Survey();
		survey.setParkCode(parkCode);
		survey.setEmail(email);
		survey.setState(state);
		survey.setActivity(activityLevel);
		return survey;
	}
}
