<%@ include file="/init.jsp" %>

<portlet:renderURL var="viewURL">
	<portlet:param name="mvcPath" value="/view.jsp"></portlet:param>
</portlet:renderURL>

<portlet:actionURL name="addEntry" var="addEntryURL"></portlet:actionURL>

<div class="form-container">
	<div class="form-space">
		<aui:form action="<%= addEntryURL %>" name="<portlet:namespace />fm">
		    <aui:fieldset>
		    	<legend class="title-space"><span>User Information</span></legend>
			    	<div class="fullname-container">
				        <aui:input label="First Name" placeholder="ex. John" name="fname">
				        	<aui:validator name="required"/>
				        
				        </aui:input>
				        <aui:input label="Last Name" placeholder="ex. Doe" name="lname">
				        	<aui:validator name="required"/>
				        </aui:input>
		        	</div>
		        <aui:input name="email" placeholder="ex. John.Doe@gmail.com">
		        	<aui:validator name="required"/>
		        	<aui:validator name="email" />
		        </aui:input>
		        
		        <legend><span>Birthdate</span></legend>
		        
	        	<div class="date-container">
		        	<div class="date-space">
		        		<aui:input name="month" placeholder="1">
				        	<aui:validator name="required" />
				        	<aui:validator name="number" />
							<aui:validator name="range">[1,12]</aui:validator>
						</aui:input>
		        	</div>
			        
			        <div class="date-space">
				        <aui:input name="day" placeholder="1">
				       		<aui:validator name="required" />
				        	<aui:validator name="number" />
							<aui:validator name="range">[1,31]</aui:validator>
						</aui:input>
					</div>
			        <aui:input name="year" placeholder="1970">
			        	<aui:validator name="required" />
			        	<aui:validator name="number" />
						<aui:validator name="range">[1903,2021]</aui:validator>
			        </aui:input>
		        </div>
		        <aui:input name="entryId" type="hidden" />
		        
		        <legend><span>Short Bio</span></legend>
		        <aui:input class="textarea" name="message" label="About Me" placeholder="I like to...">
		        	<aui:validator name="required" />
		        	<aui:validator name="minLength">10</aui:validator>
		            <aui:validator name="maxLength">250</aui:validator>
		        </aui:input>
			</aui:fieldset>
		
		    <aui:button-row>
		        <aui:button value="Add" type="submit"></aui:button>
		        <aui:button type="cancel" onClick="<%= viewURL.toString() %>"></aui:button>
		    </aui:button-row>
		</aui:form>
	</div>
</div>