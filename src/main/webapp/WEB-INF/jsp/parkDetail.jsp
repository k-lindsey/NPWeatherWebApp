<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<c:import url="/WEB-INF/jsp/common/header.jsp"/>
		<div class="parkInfoView">
			<div class="allInfo">
				<div class="parkDetailImage">
					<c:url var="parkDetailUrl" value="/parkDetail"><c:param name="parkCode" value="${park.parkCode}"/></c:url>
					<img alt="park picture" src="img/parks/${fn:toLowerCase(currentPark.parkCode)}.jpg" id="bigParkImage"/>
				</div>
				<div class="parkInfo">
					<div class="nAD">
						<div class="detailName" id="parkDetail">
							<h3><c:out value="${currentPark.parkName}"/></h3>
						</div>
						<div class="detailDescription" id="parkDetail">
							<c:out value="${currentPark.parkDescription}"/>
						</div>
					</div>
					<div class="manyInfo">
						<div class="firstFive">
							<div class="detailFounded" id="parkDetail">
								<c:out value="Year Founded: ${currentPark.yearFounded}"/>
							</div>
							<div class="detailState" id="parkDetail">
								<c:out value="Location: ${currentPark.state}"/>
							</div>
							<div class="detailAcreage" id="parkDetail">
								<c:out value="Acreage: ${currentPark.acreage}"/>
							</div>
							<div class="detailElevation" id="parkDetail">
								<c:out value="Elevation(in feet): ${currentPark.elevationInFeet}"/>
							</div>
							<div class="detailTrails" id="parkDetail">
								<c:out value="Miles of Trails: ${currentPark.milesOfTrail}"/>
							</div>
						</div>
						<div class="secondFive">
							<div class="detailCampsites" id="parkDetail">
								<c:out value="Number of Campsites: ${currentPark.numberOfCampsites}"/>
							</div>
							<div class="detailClimate" id="parkDetail">
								<c:out value="Climate: ${currentPark.climate}"/>
							</div>
							<div class="detailVisitor" id="parkDetail">
								<c:out value="Annual Visitor Count: ${currentPark.annualVisitorCount}"/>
							</div>
							<div class="detailFee" id="parkDetail">
								<c:out value="Entry fee: $${currentPark.entryFee}"/>
							</div>
							<div class="detailAnimal" id="parkDetail">
								<c:out value="Number of Animal Species: ${currentPark.numberOfAnimalSpecies}"/>
							</div>
						</div>
					</div>
					<div class="quote">
						<div class="detailQuote" id="parkQuote">
							<c:out value="${currentPark.inspirationalQuote}"/>
						</div>
						<div class="detailQuoteSource" id="parkQuote">
							<c:out value="- ${currentPark.inspirationalQuoteSource}"/>
						</div>
					</div>
				<div class="allWeather">
					<c:forEach var="weather" items="${weatherList}">
						<div id="parkDetail">
						
							<c:choose>
								<c:when test="${weather.fiveDayForeCastValue == 1}">	
									<div class="today">
									<h3 class="labelFont">Today</h3>
										<div class="weatherImgBig">
											<img src="img/weather/${weather.forecast}.png"/>
										</div>
										<div class="degrees" id="weatherFont1">
											<c:choose >
												<c:when test="${degree eq 'fahrenheit'}">
													<c:out value="High: ${weather.high}"/>
													<c:out value="Low: ${weather.low}"/>
												</c:when>
												<c:otherwise>
													<c:out value="High: ${weather.convertedHigh}" />
													<c:out value="Low: ${weather.convertedLow}" />
												</c:otherwise>
											</c:choose>
										</div>
										<div class="forecast" id="weatherFont1">
											<c:choose>
												<c:when test="${weather.forecast == 'sunny'}">
													<c:out value="Pack sunblock" />
												</c:when>
												<c:when test="${weather.forecast == 'snow'}">
													<c:out value="Pack snowshoes" />
												</c:when>
												<c:when test="${weather.forecast == 'rain'}">
													<c:out value="Pack rain gear and wear waterproof shoes" />
												</c:when>
												<c:when test="${weather.forecast == 'thunderstorms'}">
													<c:out value="Seek shelter and avoid hiking on exposed ridges" />
												</c:when>
												<c:when test="${weather.forecast == 'sunny' && weather.high > 75}">
													<c:out value="Pack sunblock and bring an extra gallon of water" />
												</c:when>
												<c:when test="${weather.forecast == 'sunny' && weather.low < 20}">
													<c:out value="Pack sunblock. DANGEROUSLY LOW TEMPERATURES" />
												</c:when>
												<c:when test="${weather.forecast == 'sunny' && (weather.high - weather.low) > 20}">
													<c:out value="Pack sunblock and wear breathable layers" />
												</c:when>
												<c:when test="${weather.forecast == 'snow' && weather.low < 20}">
													<c:out value="Pack snowshoes. DANGEROUSLY LOW TEMPERATURES" />
												</c:when>												<c:when test="${weather.forecast == 'snow' && (weather.high - weather.low) > 20}">
													<c:out value="Pack snowshoes and wear breathable layers" />
												</c:when>
												<c:when test="${weather.forecast == 'rain' && weather.high > 75}">
													<c:out value="Pack rain gear and wear waterproof shows and bring an extra gallon of water" />
												</c:when>
												<c:when test="${weather.forecast == 'rain' && (weather.high - weather.low) > 20}">
													<c:out value="Pack rain gear and wear waterproof shows and breathable layers" />
												</c:when>
												<c:when test="${weather.forecast == 'thunderstorms' && weather.high > 75}">
													<c:out value="Seek shelter and avoid hiking on exposed ridges and bring an extra gallon of water" />
												</c:when>
												<c:when test="${weather.forecast == 'thunderstorms' && (weather.high - weather.low) > 20}">
													<c:out value="Seek shelter and avoid hiking on exposed ridges and wear breathable layers" />
												</c:when>
											</c:choose>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="otherDays">
										<div class="weatherImg">
											<img src="img/weather/${weather.forecast}.png"/>
										</div>
										<div class="degrees" id="weatherFont">
											<c:choose >
												<c:when test="${degree eq 'fahrenheit'}">
													<c:out value="High: ${weather.high}"/><br />
													<c:out value="Low: ${weather.low}"/>
												</c:when>
												<c:otherwise>
													<c:out value="High: ${weather.convertedHigh}" /><br />
													<c:out value="Low: ${weather.convertedLow}" />
												</c:otherwise>
											</c:choose>
										</div>
										<div class="hoverForecast" id="weatherFont">
											<span id="showWarning">
												<c:choose>
													<c:when test="${weather.forecast == 'sunny'}">
														<c:out value="Pack sunblock" />
													</c:when>
													<c:when test="${weather.forecast == 'snow'}">
														<c:out value="Pack snowshoes" />
													</c:when>
													<c:when test="${weather.forecast == 'rain'}">
														<c:out value="Pack rain gear and wear waterproof shoes" />
													</c:when>
													<c:when test="${weather.forecast == 'thunderstorms'}">
														<c:out value="Seek shelter and avoid hiking on exposed ridges" />
													</c:when>
													<c:when test="${weather.forecast == 'sunny' && weather.high > 75}">
														<c:out value="Pack sunblock and bring an extra gallon of water" />
													</c:when>
													<c:when test="${weather.forecast == 'sunny' && weather.low < 20}">
														<c:out value="Pack sunblock. DANGEROUSLY LOW TEMPERATURES" />
													</c:when>
													<c:when test="${weather.forecast == 'sunny' && (weather.high - weather.low) > 20}">
														<c:out value="Pack sunblock and wear breathable layers" />
													</c:when>
													<c:when test="${weather.forecast == 'snow' && weather.low < 20}">
														<c:out value="Pack snowshoes. DANGEROUSLY LOW TEMPERATURES" />
													</c:when>
													<c:when test="${weather.forecast == 'snow' && (weather.high - weather.low) > 20}">
														<c:out value="Pack snowshoes and wear breathable layers" />
													</c:when>
													<c:when test="${weather.forecast == 'rain' && weather.high > 75}">
														<c:out value="Pack rain gear and wear waterproof shows and bring an extra gallon of water" />
													</c:when>
													<c:when test="${weather.forecast == 'rain' && (weather.high - weather.low) > 20}">
														<c:out value="Pack rain gear and wear waterproof shows and breathable layers" />
													</c:when>
													<c:when test="${weather.forecast == 'thunderstorms' && weather.high > 75}">
														<c:out value="Seek shelter and avoid hiking on exposed ridges and bring an extra gallon of water" />
													</c:when>
													<c:when test="${weather.forecast == 'thunderstorms' && (weather.high - weather.low) > 20}">
														<c:out value="Seek shelter and avoid hiking on exposed ridges and wear breathable layers" />
													</c:when>
												</c:choose>
											</span>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</c:forEach>
				</div>
	    			<div id="parkDetail">
		    			<c:url var="parkDetailUrl" value="/parkDetail">
			    			<c:param name="parkCode" value="${currentPark.parkCode}"/>
			    			<c:param name="degree" value="fahrenheit"/>
		    			</c:url>
		    			<a class="degree" href="${parkDetailUrl}">Fahrenheit</a>
		    			 | 
						<c:url var="parkDetailUrl" value="/parkDetail">
							<c:param name="parkCode" value="${currentPark.parkCode}"/>
							<c:param name="degree" value="celsius" />
						</c:url>
		    			<a class="degree" href="${parkDetailUrl}">Celsius</a>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>