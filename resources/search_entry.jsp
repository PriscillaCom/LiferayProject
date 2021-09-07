<%@ include file="/init.jsp" %>

<portlet:renderURL var="viewURL">
	<portlet:param name="mvcPath" value="/view.jsp"></portlet:param>
</portlet:renderURL>


<div class="search-container">	
	<div class="search-border">
			<h2 style="text-align:center">Contacts</h2>
		
		<liferay-ui:search-container emptyResultsMessage="No Users" delta="5" total="<%=EntryLocalServiceUtil.getEntriesCount()%>">
			
			<liferay-ui:search-container-results results="<%=EntryLocalServiceUtil.getEntries(searchContainer.getStart(),searchContainer.getEnd())%>" />
			
			<liferay-ui:search-container-row
			    className="com.liferay.docs.userbook.model.Entry" modelVar="entry">
			    <portlet:renderURL var="emailURL">
					<portlet:param name="user_email" value="${entry.entryId}"></portlet:param>
					<portlet:param name="mvcPath" value="/popup_email.jsp"></portlet:param>
				</portlet:renderURL>
				
				<liferay-ui:search-container-column-text property="fname" name="First Name" />
				<liferay-ui:search-container-column-text property="lname" name="Last Name" />
			    <liferay-ui:search-container-column-text property="email" />
			    <liferay-ui:search-container-column-text cssClass="button-send" href="${emailURL}" name="Send" value="Send Email" />
			    
			</liferay-ui:search-container-row>
		
			<liferay-ui:search-iterator />
		
		</liferay-ui:search-container>
	</div>
	<aui:button-row>
	    <aui:button type="cancel" onClick="<%= viewURL.toString() %>"></aui:button>
	</aui:button-row>

</div>