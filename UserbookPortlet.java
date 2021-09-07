package com.liferay.docs.userbook.portlet.portlet;

import com.liferay.counter.kernel.service.CounterLocalServiceUtil;
import com.liferay.docs.userbook.exception.NoSuchEntryException;
import com.liferay.docs.userbook.model.Entry;
import com.liferay.docs.userbook.portlet.constants.UserbookPortletKeys;
import com.liferay.docs.userbook.service.EntryLocalServiceUtil;
import com.liferay.mail.kernel.model.MailMessage;
import com.liferay.mail.kernel.service.MailServiceUtil;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.Validator;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.Portlet;

import org.osgi.service.component.annotations.Component;

/**
 * @author prisc
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.header-portlet-css=/css/main.css",
		"com.liferay.portlet.instanceable=true",
		"javax.portlet.display-name=Userbook",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + UserbookPortletKeys.USERBOOK,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"	
		},
	service = Portlet.class
)

public class UserbookPortlet extends MVCPortlet {
	public void addEntry(ActionRequest request, ActionResponse response) throws NoSuchEntryException {

		String fname = ParamUtil.getString(request, "fname");
		String lname = ParamUtil.getString(request, "lname");
		String email = ParamUtil.getString(request, "email");
		long month = ParamUtil.getLong(request, "month");
		long day = ParamUtil.getLong(request, "day");
		long year = ParamUtil.getLong(request, "year");
		String message = ParamUtil.getString(request, "message");
		long port = 33;
		
		if(checkEmail(email) == true) {
			try {
				Entry entry = EntryLocalServiceUtil.createEntry(CounterLocalServiceUtil.increment());
				entry.setFname(fname);
				entry.setLname(lname);
				entry.setEmail(email);
				entry.setMonth(month);
				entry.setDay(day);
				entry.setYear(year);
				entry.setMessage(message);
				entry.setPort(port);
				EntryLocalServiceUtil.addEntry(entry);
				
				System.out.println(fname+" "+email+" "+message);
	
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		else
			throw new NoSuchEntryException();
	}
	
	public boolean checkEmail(String email) throws NoSuchEntryException {
		int count = EntryLocalServiceUtil.getEntriesCount();
		
		for(int i = 0; i < count; ++i) {
			if(EntryLocalServiceUtil.findByPort(33).get(i).getEmail().equals(email)) {
				return false;
			}
		}
		
		return true;
	}
	
	public void deleteEntry(ActionRequest request, ActionResponse response) throws PortalException {
		String e = ParamUtil.getString(request, "deletion");	
		Entry user = EntryLocalServiceUtil.findByEmail(e);
		EntryLocalServiceUtil.deleteEntry(user.getEntryId());
	}	
	
	public void updateEntry(ActionRequest request, ActionResponse response) throws PortalException {
		String email = ParamUtil.getString(request, "og-email");
		String fname = ParamUtil.getString(request, "fname");
		String lname = ParamUtil.getString(request, "lname");
		String message = ParamUtil.getString(request, "message");
		
		System.out.println(email);
		
		Entry user = EntryLocalServiceUtil.findByEmail(email);
		Entry entry = EntryLocalServiceUtil.getEntry(user.getEntryId());
		
		System.out.println("OLD " + entry);
		if(!fname.isEmpty()) {
			entry.setFname(fname);
		}
		
		if(!lname.isEmpty()) {
			entry.setLname(lname);
		}
		
		if(!message.isEmpty()) {
			entry.setMessage(message);
		}
		
		EntryLocalServiceUtil.updateEntry(entry);
		System.out.println("UDPATED" + entry);
	}
	
	public void addBlog(ActionRequest request, ActionResponse response) {
	}
	
	public void sendEmail(ActionRequest request, ActionResponse response) throws AddressException {
		String from = ParamUtil.getString(request, "from");
		String to = ParamUtil.getString(request, "to");
		String subject = ParamUtil.getString(request, "subject");
		String body = ParamUtil.getString(request, "body");
		
		InternetAddress fromAddress = new InternetAddress(from);
		InternetAddress toAddress = new InternetAddress(to);
		
		MailMessage mailMessage = new MailMessage();
		mailMessage.setFrom(fromAddress);
		mailMessage.setTo(toAddress);
		mailMessage.setSubject(subject);
		mailMessage.setBody(body);
		
		MailServiceUtil.sendEmail(mailMessage);
		System.out.println("sent: "+mailMessage.getBody());
	}
	
}