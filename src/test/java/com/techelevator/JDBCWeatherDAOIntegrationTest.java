package com.techelevator;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.npgeek.model.JDBCParkDAO;
import com.techelevator.npgeek.model.JDBCWeatherDAO;
import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.Weather;

public class JDBCWeatherDAOIntegrationTest extends DAOIntegrationTest {

	private JDBCWeatherDAO dao;
	private static final String TEST_PARK = "GNP";
	
	@Before
	public void setup() {
		dao = new JDBCWeatherDAO(getDataSource());
	}
	
	@Test
	public void get_weather_by_park_code() {
		int numOfWeatherBefore = dao.getWeatherByParkCode(TEST_PARK).size();
		
		String sqlInsertPark = "INSERT INTO weather (parkcode, fivedayforecastvalue, low, high, forecast) VALUES (?, 6, 77, 77, 'snow')";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(getDataSource());
		jdbcTemplate.update(sqlInsertPark, TEST_PARK);
		
		List<Weather> results = new ArrayList <Weather>(dao.getWeatherByParkCode(TEST_PARK));
		
		assertNotNull(results);
		assertEquals(numOfWeatherBefore + 1, results.size());
	}
}
