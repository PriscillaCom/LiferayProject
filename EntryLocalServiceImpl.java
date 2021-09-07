/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

package com.liferay.docs.userbook.service.impl;

import com.liferay.docs.userbook.exception.NoSuchEntryException;
import com.liferay.docs.userbook.model.Entry;
import com.liferay.docs.userbook.service.base.EntryLocalServiceBaseImpl;
import com.liferay.portal.aop.AopService;

import java.util.List;

import org.osgi.service.component.annotations.Component;

/**
 * The implementation of the entry local service.
 *
 * <p>
 * All custom service methods should be put in this class. Whenever methods are added, rerun ServiceBuilder to copy their definitions into the <code>com.liferay.docs.userbook.service.EntryLocalService</code> interface.
 *
 * <p>
 * This is a local service. Methods of this service will not have security checks based on the propagated JAAS credentials because this service can only be accessed from within the same VM.
 * </p>
 *
 * @author Brian Wing Shun Chan
 * @see EntryLocalServiceBaseImpl
 */
@Component(
	property = "model.class.name=com.liferay.docs.userbook.model.Entry",
	service = AopService.class
)
public class EntryLocalServiceImpl extends EntryLocalServiceBaseImpl {

	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never reference this class directly. Use <code>com.liferay.docs.userbook.service.EntryLocalService</code> via injection or a <code>org.osgi.util.tracker.ServiceTracker</code> or use <code>com.liferay.docs.userbook.service.EntryLocalServiceUtil</code>.
	 */
	public List<Entry> findByPort(long port){
		return entryPersistence.findByPort(port);
	}
	
	public Entry findByEmail(String email) throws NoSuchEntryException {
		return entryPersistence.findByEmail(email);
	}
}