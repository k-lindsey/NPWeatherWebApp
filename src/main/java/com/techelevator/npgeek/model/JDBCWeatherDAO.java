package com.techelevator.npgeek.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCWeatherDAO implements WeatherDAO{

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCWeatherDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	private Weather mapRowToWeather(SqlRowSet results) {
		Weather weather = new Weather();
		 weather.setParkCode(results.getString("parkcode"));
		 weather.setFiveDayForeCastValue(results.getInt("fivedayforecastvalue"));
		 weather.setLow(results.getInt("low"));
		 weather.setHigh(results.getInt("high"));
		 weather.setForecast(results.getString("forecast"));
		
		return weather;
	}

	@Override
	public List<Weather> getWeatherByParkCode(String parkCode) {
		List<Weather> weatherList = new ArrayList<Weather>();
		String selectSql = "SELECT * FROM weather where parkcode = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(selectSql, parkCode);
		while(results.next()) {
		Weather w = mapRowToWeather(results);
		weatherList.add(w);
		}
		return weatherList;
	}
}
