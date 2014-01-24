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

@Api(name = "docdetailsendpoint", namespace = @ApiNamespace(ownerDomain = "las.com", ownerName = "las.com", packagePath = "endpoints"))
public class DocDetailsEndpoint {

	/**
	 * This method lists all the entities inserted in datastore.
	 * It uses HTTP GET method and paging support.
	 *
	 * @return A CollectionResponse class containing the list of all entities
	 * persisted and a cursor to the next page.
	 */
	@SuppressWarnings({ "unchecked", "unused" })
	@ApiMethod(name = "listDocDetails")
	public CollectionResponse<DocDetails> listDocDetails(
			@Nullable @Named("cursor") String cursorString,
			@Nullable @Named("limit") Integer limit) {

		PersistenceManager mgr = null;
		Cursor cursor = null;
		List<DocDetails> execute = null;

		try {
			mgr = getPersistenceManager();
			Query query = mgr.newQuery(DocDetails.class);
			if (cursorString != null && cursorString != "") {
				cursor = Cursor.fromWebSafeString(cursorString);
				HashMap<String, Object> extensionMap = new HashMap<String, Object>();
				extensionMap.put(JDOCursorHelper.CURSOR_EXTENSION, cursor);
				query.setExtensions(extensionMap);
			}

			if (limit != null) {
				query.setRange(0, limit);
			}

			execute = (List<DocDetails>) query.execute();
			cursor = JDOCursorHelper.getCursor(execute);
			if (cursor != null)
				cursorString = cursor.toWebSafeString();

			// Tight loop for fetching all entities from datastore and accomodate
			// for lazy fetch.
			for (DocDetails obj : execute)
				;
		} finally {
			mgr.close();
		}

		return CollectionResponse.<DocDetails> builder().setItems(execute)
				.setNextPageToken(cursorString).build();
	}

	/**
	 * This method gets the entity having primary key id. It uses HTTP GET method.
	 *
	 * @param id the primary key of the java bean.
	 * @return The entity with primary key id.
	 */
	@ApiMethod(name = "getDocDetails")
	public DocDetails getDocDetails(@Named("id") Long id) {
		PersistenceManager mgr = getPersistenceManager();
		DocDetails docdetails = null;
		try {
			docdetails = mgr.getObjectById(DocDetails.class, id);
		} finally {
			mgr.close();
		}
		return docdetails;
	}

	/**
	 * This inserts a new entity into App Engine datastore. If the entity already
	 * exists in the datastore, an exception is thrown.
	 * It uses HTTP POST method.
	 *
	 * @param docdetails the entity to be inserted.
	 * @return The inserted entity.
	 */
	@ApiMethod(name = "insertDocDetails")
	public DocDetails insertDocDetails(DocDetails docdetails) {
		PersistenceManager mgr = getPersistenceManager();
		try {
			/*if (containsDocDetails(docdetails)) {
				throw new EntityExistsException("Object already exists");
			}*/
			mgr.makePersistent(docdetails);
		} finally {
			mgr.close();
		}
		return docdetails;
	}

	/**
	 * This method is used for updating an existing entity. If the entity does not
	 * exist in the datastore, an exception is thrown.
	 * It uses HTTP PUT method.
	 *
	 * @param docdetails the entity to be updated.
	 * @return The updated entity.
	 */
	@ApiMethod(name = "updateDocDetails")
	public DocDetails updateDocDetails(DocDetails docdetails) {
		PersistenceManager mgr = getPersistenceManager();
		try {
			if (!containsDocDetails(docdetails)) {
				throw new EntityNotFoundException("Object does not exist");
			}
			mgr.makePersistent(docdetails);
		} finally {
			mgr.close();
		}
		return docdetails;
	}

	/**
	 * This method removes the entity with primary key id.
	 * It uses HTTP DELETE method.
	 *
	 * @param id the primary key of the entity to be deleted.
	 */
	@ApiMethod(name = "removeDocDetails")
	public void removeDocDetails(@Named("id") Long id) {
		PersistenceManager mgr = getPersistenceManager();
		try {
			DocDetails docdetails = mgr.getObjectById(DocDetails.class, id);
			mgr.deletePersistent(docdetails);
		} finally {
			mgr.close();
		}
	}

	private boolean containsDocDetails(DocDetails docdetails) {
		PersistenceManager mgr = getPersistenceManager();
		boolean contains = true;
		try {
			mgr.getObjectById(DocDetails.class, docdetails.getDocId());
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
