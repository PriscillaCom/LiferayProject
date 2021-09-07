<%@ include file="/init.jsp" %>

<portlet:renderURL var="viewURL">
    <portlet:param name="mvcPath" value="/view.jsp"></portlet:param>
</portlet:renderURL>

<portlet:actionURL name="updateEntry" var="updateEntryURL"></portlet:actionURL>

<div class="form-container update-container">
	<div class="form-space">
		<aui:form action="<%= updateEntryURL %>" name="<portlet:namespace />fm">
		    <aui:fieldset>
		    	<legend class="title-space"><span>User Information</span></legend>
		    	<div class="fullname-container">
			        <aui:input label="First Name" placeholder="ex. John" name="fname">
			        </aui:input>
			        <aui:input label="Last Name" placeholder="ex. Doe" name="lname">
			        </aui:input>
	        	</div> 
	        	
		        <aui:input class="textarea" name="message" label="About Me" placeholder="I like to...">
		        	<aui:validator name="minLength">10</aui:validator>
		            <aui:validator name="maxLength">250</aui:validator>
		        </aui:input>
			</aui:fieldset>
			
			 <span>Input Email before Updating</span>   
	        <aui:input name="og-email" label="Current Email" placeholder="ex. John.Doe@gmail.com">
	        	<aui:validator name="required"/>
	        	<aui:validator name="email" />
	        </aui:input> 
		        
		    <aui:button-row>
		        <aui:button value="Update" type="submit"></aui:button>
		        <aui:button type="cancel" onClick="<%= viewURL.toString() %>"></aui:button>
		    </aui:button-row>
		</aui:form>
	</div>
</div>