package com.techelevator;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.SingleConnectionDataSource;

import com.techelevator.npgeek.model.JDBCParkDAO;
import com.techelevator.npgeek.model.Park;

public class JDBCParkDAOIntegrationTest extends DAOIntegrationTest{
	
	private JDBCParkDAO dao;
	private static final String TEST_PARK = "XYZ";

	@Before
	public void setup() {
		String sqlInsertPark = "INSERT INTO park (parkcode, parkname, state, acreage, elevationinfeet, milesoftrail, numberofcampsites, climate, yearfounded, annualvisitorcount, inspirationalquote, inspirationalquotesource, parkdescription, entryfee, numberofanimalspecies) VALUES (?, 'testpark', 'ohio', 7, 0, 177, 0, 'Tropical', 2019, 27, 'test quote', 'mike wells', 'test description', 77, 1 )";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(getDataSource());
		jdbcTemplate.update(sqlInsertPark, TEST_PARK);
		dao = new JDBCParkDAO(getDataSource());
	}

	@Test
	public void get_park_by_park_code() {
		
		List<Park> results = new ArrayList <Park>();
		results.add(dao.getParkByParkCode(TEST_PARK));
		
		assertNotNull(results);
		assertEquals(1, results.size());
		
	}
	
	@Test
	public void get_all_parks() {
		List<Park> results = dao.getAllParks();
		int numOfParksBefore = results.size();
		String sqlInsertPark2 = "INSERT INTO park (parkcode, parkname, state, acreage, elevationinfeet, milesoftrail, numberofcampsites, climate, yearfounded, annualvisitorcount, inspirationalquote, inspirationalquotesource, parkdescription, entryfee, numberofanimalspecies) VALUES (?, 'testpark2', 'ohio', 7, 0, 177, 0, 'Tropical', 2019, 27, 'test quote', 'mike wells jr', 'test description', 77, 1 )";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(getDataSource());
		jdbcTemplate.update(sqlInsertPark2, "zzz");
		
		results = dao.getAllParks();
		assertNotNull(results);
		assertEquals(numOfParksBefore + 1, results.size());	
	}
}
