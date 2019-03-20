<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/common/header.jsp"/>
	<div class="parkInfoView">
		<div class="survey">
			<h3 class="labelFont">National Parks Survey</h3>
			<h4 class="labelFont" id="vote">Vote for you favorite Park, then see which park is America's favorite!</h4>
			<div>
				<form:form path="survey" action="survey" method="POST" modelAttribute="survey">
					<p class="labelFont">Favorite Park: 
					<select name="parkCode">
						<c:forEach var="park" items="${parks}">
						
						<option value="${park.parkCode}">${park.parkName}</option>
						</c:forEach>
					</select>
					</p>
					
					<label for="email" class="labelFont">Email: </label>
					<form:input type="text" path="email" name="email"/>
					<form:errors path="email" cssClass="error"/>
					
					<p class="labelFont">
					State of Residence: 
					<select name="state">
						<option value="AL">Alabama</option>
						<option value="AK">Alaska</option>
						<option value="AZ">Arizona</option>
						<option value="AR">Arkansas</option>
						<option value="CA">California</option>
						<option value="CO">Colorado</option>
						<option value="CT">Connecticut</option>
						<option value="DE">Delaware</option>
						<option value="DC">District Of Columbia</option>
						<option value="FL">Florida</option>
						<option value="GA">Georgia</option>
						<option value="HI">Hawaii</option>
						<option value="ID">Idaho</option>
						<option value="IL">Illinois</option>
						<option value="IN">Indiana</option>
						<option value="IA">Iowa</option>
						<option value="KS">Kansas</option>
						<option value="KY">Kentucky</option>
						<option value="LA">Louisiana</option>
						<option value="ME">Maine</option>
						<option value="MD">Maryland</option>
						<option value="MA">Massachusetts</option>
						<option value="MI">Michigan</option>
						<option value="MN">Minnesota</option>
						<option value="MS">Mississippi</option>
						<option value="MO">Missouri</option>
						<option value="MT">Montana</option>
						<option value="NE">Nebraska</option>
						<option value="NV">Nevada</option>
						<option value="NH">New Hampshire</option>
						<option value="NJ">New Jersey</option>
						<option value="NM">New Mexico</option>
						<option value="NY">New York</option>
						<option value="NC">North Carolina</option>
						<option value="ND">North Dakota</option>
						<option value="OH">Ohio</option>
						<option value="OK">Oklahoma</option>
						<option value="OR">Oregon</option>
						<option value="PA">Pennsylvania</option>
						<option value="RI">Rhode Island</option>
						<option value="SC">South Carolina</option>
						<option value="SD">South Dakota</option>
						<option value="TN">Tennessee</option>
						<option value="TX">Texas</option>
						<option value="UT">Utah</option>
						<option value="VT">Vermont</option>
						<option value="VA">Virginia</option>
						<option value="WA">Washington</option>
						<option value="WV">West Virginia</option>
						<option value="WI">Wisconsin</option>
						<option value="WY">Wyoming</option>
					</select>
					</p>
					<p class="labelFont">Your Activity Level:				
					<form:radiobutton path="activity"  value="inactive" checked="checked"/>Inactive
					<form:radiobutton path="activity"  value="sedentary"/>Sedentary
					<form:radiobutton path="activity"  value="active"/>Active
					<form:radiobutton path="activity"  value="extremelyActive"/>Extremely Active
					</p>
					<input type="submit" path="survey" value="Submit"/>
				</form:form>
			</div>
		</div>	
	</div>
</body>
</html>