package com.techelevator.npgeek.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;


@Component
public class JDBCParkDAO implements ParkDAO {
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCParkDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Park> getAllParks() {
		List<Park> parks = new ArrayList <Park>();
		
		String selectsql = "SELECT parkname, parkcode, state, acreage, elevationinfeet, milesoftrail, numberofcampsites, climate, yearfounded, annualvisitorcount, inspirationalquote, inspirationalquotesource, parkdescription, entryfee, numberofanimalspecies FROM park";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(selectsql);
		
		while(results.next()) {
			Park p = mapRowToPark(results);
			parks.add(p);
		}
		return parks;
	}
	
	private Park mapRowToPark(SqlRowSet results) {
		Park park = new Park();
		
		park.setParkName(results.getString("parkname"));
		park.setParkCode(results.getString("parkcode"));
		park.setState(results.getString("state"));
		park.setAcreage(results.getInt("acreage"));
		park.setElevationInFeet(results.getInt("elevationinfeet"));
		park.setMilesOfTrail(results.getFloat("milesoftrail"));
		park.setNumberOfCampsites(results.getInt("numberofcampsites"));
		park.setClimate(results.getString("climate"));
		park.setYearFounded(results.getInt("yearfounded"));
		park.setAnnualVisitorCount(results.getInt("annualvisitorcount"));
		park.setInspirationalQuote(results.getString("inspirationalquote"));
		park.setInspirationalQuoteSource(results.getString("inspirationalquotesource"));
		park.setParkDescription(results.getString("parkdescription"));
		park.setEntryFee(results.getInt("entryfee"));
		park.setNumberOfAnimalSpecies(results.getInt("numberofanimalspecies"));
		
		return park;
	}
	
	@Override
	public Park getParkByParkCode(String parkCode) {
		Park park = null;
		String selectSql = "SELECT * FROM park where parkcode = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(selectSql, parkCode);
		if(results.next()) {
			park = mapRowToPark(results);
		}
		return park;
	}
}
