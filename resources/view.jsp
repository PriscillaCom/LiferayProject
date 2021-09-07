<%@ include file="/init.jsp" %>
<portlet:renderURL var="addEntryURL">
    <portlet:param name="mvcPath" value="/edit_entry.jsp"></portlet:param>
</portlet:renderURL>

<portlet:renderURL var="searchEntryURL">
    <portlet:param name="mvcPath" value="/search_entry.jsp"></portlet:param>
</portlet:renderURL>

<portlet:actionURL name="addBlog" var="addBlogURL"></portlet:actionURL>

<% 
	if(EntryLocalServiceUtil.getEntriesCount() > 0){
		String fname = EntryLocalServiceUtil.findByPort(33).get(0).getFname();
		String lname = EntryLocalServiceUtil.findByPort(33).get(0).getLname();
		String email = EntryLocalServiceUtil.findByPort(33).get(0).getEmail();
		String message = EntryLocalServiceUtil.findByPort(33).get(0).getMessage();
		long month = EntryLocalServiceUtil.findByPort(33).get(0).getMonth();
		long day = EntryLocalServiceUtil.findByPort(33).get(0).getDay();
		long year = EntryLocalServiceUtil.findByPort(33).get(0).getYear();
	
		%>
		
		<div class="glass">
			<div class="profile">
				<div class="image-space">	
					<img src="https://robohash.org/<%=email%>" alt="robot" style="border-radius:50%; border-style: solid;">
					<h2 style="margin-top:1rem;"><%=fname %> <%=lname %></h2>
				</div>
				<div class="about-container">
					<div class="about-info">
						<h2>About Me</h2>
						<h3><liferay-ui:icon image="date" /><%=month%>/<%=day%>/<%=year%></h3>
					</div>
					<p class="about-message"><strong>Email: </strong><%=email%></p>
					<p class="about-message" style="margin-bottom: 1.5rem;"><strong>Bio: </strong><%=message%></p>
				</div>
			</div>
		<%
	} %>
	
	<div class="connections">
		<div class="connections-style">
			<aui:button-row>
		    	<aui:button onClick="<%= addEntryURL.toString() %>" value="Add Users"></aui:button>
			</aui:button-row>
		</div>
		
		<div class="connections-style">
			<aui:button-row>
		    	<aui:button onClick="<%= searchEntryURL.toString() %>" value="Email Users"></aui:button>
			</aui:button-row>
		</div>
	</div>
	
	
	<div class="container-limiter">
	
	<% 
	if(EntryLocalServiceUtil.getEntriesCount() > 1){
		for(int i = 1; i < EntryLocalServiceUtil.getEntriesCount(); ++i){
			String fnames = EntryLocalServiceUtil.findByPort(33).get(i).getFname();
			String lnames = EntryLocalServiceUtil.findByPort(33).get(i).getLname();
			String emails = EntryLocalServiceUtil.findByPort(33).get(i).getEmail();
			String messages = EntryLocalServiceUtil.findByPort(33).get(i).getMessage();
			long months = EntryLocalServiceUtil.findByPort(33).get(i).getMonth();
			long days = EntryLocalServiceUtil.findByPort(33).get(i).getDay();
			long years = EntryLocalServiceUtil.findByPort(33).get(i).getYear();
	
	%>
		<div class="friend-container">
			<div class="friend-image">
				<portlet:actionURL name="deleteEntry" var="deleteEntryURL">
					<portlet:param name="deletion" value="<%=emails%>" />
				</portlet:actionURL>		
				<aui:button-row>
			    	<aui:button onClick="<%= deleteEntryURL.toString() %>" value="X"></aui:button>
				</aui:button-row>
				<img src="https://robohash.org/<%=emails%>" alt="robot">
			</div>
			<div class="friend-info-container">
			
				<portlet:renderURL var="UpdateEntryURL">
				    <portlet:param name="mvcPath" value="/update_entry.jsp"></portlet:param>
				    <portlet:param name="og-email" value="<%=emails %>"></portlet:param>
				</portlet:renderURL>
			
				<div class="friend-info">
					<h2><%=fnames%> <%=lnames%></h2>
					<span style="font-size: 16px;"><liferay-ui:icon image="date" /><strong><%=months%>/<%=days%>/<%=years%></strong></span>
				</div>
				<span style="font-size: small;"><%=emails%></span>
				<span><%=messages%></span>
				<aui:button-row>
			    	<aui:button onClick="<%= UpdateEntryURL.toString() %>" value="Update"></aui:button>
				</aui:button-row>
			</div>
		</div>
	<%
		}
	}
	
	else if (EntryLocalServiceUtil.getEntriesCount() == 1){
		%>
		<div class="friend-container">
			<div class="friend-image">
				<img src="https://robohash.org/fakefriend" alt="robot">
			</div>
			<div class="friend-info-container">
				<div class="friend-info">
					<h2>Fake User</h2>
					<span><liferay-ui:icon image="subscribe" /><strong>1/1/1970</strong></span>
				</div>
				<span style="font-size: small;">fakefriend@gmail.com</span>
				<span>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. </span>
			</div>
		</div>
<% 	}
%>
	</div>
	
</div>



