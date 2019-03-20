<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<c:import url="/WEB-INF/jsp/common/header.jsp"/>
		<div class="parkInfoView">
			<div class="favoritesView">
				<div class="headingFavorites">
					<h1 class="labelFont" id="title">America's Favorite Parks</h1>
					<p class="labelFont" id="description">Here are the current results from the National Parks Survey!</p>
				</div>	
					<c:forEach var="survey" items="${surveys}">
						<div class="individualFavoriteView">
						<c:forEach var="park" items="${faveParks}">
						
							<c:if test="${survey.parkCode == park.parkCode }">
								<div class="faveImgDiv">
									<c:url var="parkDetailUrl" value="/parkDetail"><c:param name="parkCode" value="${park.parkCode}"/></c:url>
									<a href="${parkDetailUrl}">
									<img alt="park picture" src="img/parks/${fn:toLowerCase(survey.parkCode)}.jpg" id="faveImg"/>
									</a>
								</div>
								<div class="desciptors">
									<div class="faveName" id="favorites">
										<h3>${park.parkName}</h3>
									</div>
									<div class="faveCount" id="favorites">
										<p class="labelFont">Total Votes: 
										${survey.parkCount}
										</p>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
		</div>
	</body>
</html>