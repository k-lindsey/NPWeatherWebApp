<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<c:import url="/WEB-INF/jsp/common/header.jsp"/>

		<div class="parkInfoView">
			<c:forEach var="park" items="${parks}">
				<div class="individualPark">
					<div class="parkViewImage">
						<c:url var="parkDetailUrl" value="/parkDetail"><c:param name="parkCode" value="${park.parkCode}"/> <c:param name="degree" value="fahrenheit"/></c:url>
						<a class="parkImage" href="${parkDetailUrl}">
						<img alt="park picture" src="img/parks/${fn:toLowerCase(park.parkCode)}.jpg" />
						</a>
					</div>
					<div class="nameAndDescription">
						<div class="parkViewName">
							<h3><c:out value="${park.parkName}"/></h3>
						</div>
						<div class="parkViewDescription">
							<c:out value="${park.parkDescription}"/>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</body>
</html>