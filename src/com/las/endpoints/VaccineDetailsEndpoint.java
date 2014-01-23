package com.las.endpoints;

import com.las.endpoints.PMF;

import com.google.api.server.spi.config.Api;
import com.google.api.server.spi.config.ApiMethod;
import com.google.api.server.spi.config.ApiNamespace;
import com.google.api.server.spi.response.CollectionResponse;
import com.google.appengine.api.datastore.Cursor;
import com.google.appengine.datanucleus.query.JDOCursorHelper;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Nullable;
import javax.inject.Named;
import javax.persistence.EntityExistsException;
import javax.persistence.EntityNotFoundException;
import javax.jdo.PersistenceManager;
import javax.jdo.Query;

@Api(name = "vaccinedetailsendpoint", namespace = @ApiNamespace(ownerDomain = "las.com", ownerName = "las.com", packagePath = "endpoints"))
public class VaccineDetailsEndpoint {

	/**
	 * This method lists all the entities inserted in datastore.
	 * It uses HTTP GET method and paging support.
	 *
	 * @return A CollectionResponse class containing the list of all entities
	 * persisted and a cursor to the next page.
	 */
	@SuppressWarnings({ "unchecked", "unused" })
	@ApiMethod(name = "listVaccineDetails")
	public CollectionResponse<VaccineDetails> listVaccineDetails(
			@Nullable @Named("cursor") String cursorString,
			@Nullable @Named("limit") Integer limit) {

		PersistenceManager mgr = null;
		Cursor cursor = null;
		List<VaccineDetails> execute = null;

		try {
			mgr = getPersistenceManager();
			Query query = mgr.newQuery(VaccineDetails.class);
			if (cursorString != null && cursorString != "") {
				cursor = Cursor.fromWebSafeString(cursorString);
				HashMap<String, Object> extensionMap = new HashMap<String, Object>();
				extensionMap.put(JDOCursorHelper.CURSOR_EXTENSION, cursor);
				query.setExtensions(extensionMap);
			}

			if (limit != null) {
				query.setRange(0, limit);
			}

			execute = (List<VaccineDetails>) query.execute();
			cursor = JDOCursorHelper.getCursor(execute);
			if (cursor != null)
				cursorString = cursor.toWebSafeString();

			// Tight loop for fetching all entities from datastore and accomodate
			// for lazy fetch.
			for (VaccineDetails obj : execute)
				;
		} finally {
			mgr.close();
		}

		return CollectionResponse.<VaccineDetails> builder().setItems(execute)
				.setNextPageToken(cursorString).build();
	}

	/**
	 * This method gets the entity having primary key id. It uses HTTP GET method.
	 *
	 * @param id the primary key of the java bean.
	 * @return The entity with primary key id.
	 */
	@ApiMethod(name = "getVaccineDetails")
	public VaccineDetails getVaccineDetails(@Named("id") Long id) {
		PersistenceManager mgr = getPersistenceManager();
		VaccineDetails vaccinedetails = null;
		try {
			vaccinedetails = mgr.getObjectById(VaccineDetails.class, id);
		} finally {
			mgr.close();
		}
		return vaccinedetails;
	}

	/**
	 * This inserts a new entity into App Engine datastore. If the entity already
	 * exists in the datastore, an exception is thrown.
	 * It uses HTTP POST method.
	 *
	 * @param vaccinedetails the entity to be inserted.
	 * @return The inserted entity.
	 */
	@ApiMethod(name = "insertVaccineDetails")
	public VaccineDetails insertVaccineDetails(VaccineDetails vaccinedetails) {
		PersistenceManager mgr = getPersistenceManager();
		try {
			if (containsVaccineDetails(vaccinedetails)) {
				throw new EntityExistsException("Object already exists");
			}
			mgr.makePersistent(vaccinedetails);
		} finally {
			mgr.close();
		}
		return vaccinedetails;
	}

	/**
	 * This method is used for updating an existing entity. If the entity does not
	 * exist in the datastore, an exception is thrown.
	 * It uses HTTP PUT method.
	 *
	 * @param vaccinedetails the entity to be updated.
	 * @return The updated entity.
	 */
	@ApiMethod(name = "updateVaccineDetails")
	public VaccineDetails updateVaccineDetails(VaccineDetails vaccinedetails) {
		PersistenceManager mgr = getPersistenceManager();
		try {
			if (!containsVaccineDetails(vaccinedetails)) {
				throw new EntityNotFoundException("Object does not exist");
			}
			mgr.makePersistent(vaccinedetails);
		} finally {
			mgr.close();
		}
		return vaccinedetails;
	}

	/**
	 * This method removes the entity with primary key id.
	 * It uses HTTP DELETE method.
	 *
	 * @param id the primary key of the entity to be deleted.
	 */
	@ApiMethod(name = "removeVaccineDetails")
	public void removeVaccineDetails(@Named("id") Long id) {
		PersistenceManager mgr = getPersistenceManager();
		try {
			VaccineDetails vaccinedetails = mgr.getObjectById(
					VaccineDetails.class, id);
			mgr.deletePersistent(vaccinedetails);
		} finally {
			mgr.close();
		}
	}

	private boolean containsVaccineDetails(VaccineDetails vaccinedetails) {
		PersistenceManager mgr = getPersistenceManager();
		boolean contains = true;
		try {
			mgr.getObjectById(VaccineDetails.class, vaccinedetails.getVacId());
		} catch (javax.jdo.JDOObjectNotFoundException ex) {
			contains = false;
		} finally {
			mgr.close();
		}
		return contains;
	}

	private static PersistenceManager getPersistenceManager() {
		return PMF.get().getPersistenceManager();
	}

}
