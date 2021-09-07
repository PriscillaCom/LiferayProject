<%@ include file="/init.jsp" %>

<portlet:renderURL var="searchURL">
    <portlet:param name="mvcPath" value="/search_entry.jsp"></portlet:param>
</portlet:renderURL>

<portlet:actionURL var="sendEmailUrl" name="sendEmail"/>

<%
	int entryId = ParamUtil.getInteger(request, "user_email");
	Entry entry = EntryLocalServiceUtil.getEntry(entryId);
	request.setAttribute("entry",entry);
%>

<div class="email-container">
	<div class="email-space">
		<img class="email-img" src="https://robohash.org/${entry.email}" alt="robot">
		<div class="email-info-container">
			<legend style="text-align:center; padding: 0 0 1rem 0;">${entry.fname} ${entry.lname}</legend>
			
			<aui:form action="${sendEmailUrl}" method="Post">
				<aui:input name="from" type="text" label="From:"/>
				<aui:input name="to" type="text" label="To:"/>
				<aui:input name="subject" type="text" label="Subject:"/>
				<aui:input name="body" type="textarea" label="Body"/>
				<div class="email-button">
					<aui:button type="submit" label="Email"/>
					<aui:button type="cancel" onClick="<%= searchURL.toString() %>"></aui:button>
				</div>
				
			</aui:form>
		</div>
	</div>
</div>