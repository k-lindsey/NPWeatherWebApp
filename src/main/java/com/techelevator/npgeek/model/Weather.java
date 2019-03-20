package com.techelevator.npgeek.model;

public class Weather {
	
	private String parkCode;
	private int fiveDayForeCastValue;
	private int low;
	private int high;
	private String forecast;
	private int convertedLow;
	private int convertedHigh;

	public Weather() {
	}

	public String getParkCode() {
		return parkCode;
	}

	public void setParkCode(String parkCode) {
		this.parkCode = parkCode;
	}

	public int getFiveDayForeCastValue() {
		return fiveDayForeCastValue;
	}

	public void setFiveDayForeCastValue(int fiveDayForeCastValue) {
		this.fiveDayForeCastValue = fiveDayForeCastValue;
	}

	public int getLow() {
		return low;
	}

	public void setLow(int low) {
		this.low = low;
	}

	public int getHigh() {
		return high;
	}

	public void setHigh(int high) {
		this.high = high;
	}

	public String getForecast() {
		return forecast;
	}

	public void setForecast(String forecast) {
		this.forecast = forecast;
	}

	public int getConvertedLow() {
		convertedLow = (int) Math.round(((double)low - 32) * (5/9.0));
		return convertedLow;
	}

	public void setConvertedLow(int convertedLow) {
		this.convertedLow = convertedLow;
	}

	public int getConvertedHigh() {
		convertedHigh = (int) Math.round(((double)high - 32) * (5/9.0));
		return convertedHigh;
	}

	public void setConvertedHigh(int convertedHigh) {
		this.convertedHigh = convertedHigh;
	}	
	
}
