<!---^^LICENSE-START^^--->
<!---

This file is part of the Meld Gallery application.

Meld Gallery is licensed under the GPL 2.0 license
Copyright (C) 2010 2011 Meld Solutions Inc. http://www.meldsolutions.com/

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation, version 2 of that license..

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

--->
<!---^^LICENSE-END^^--->




<cfcomponent displayname="DisplayimageGateway" output="false">
<!---^^GENERATEDSTART^^--->
	<cffunction name="init" access="public" output="false" returntype="DisplayimageGateway">
		<cfargument name="dsn" type="string" required="true">
		<cfargument name="dsnusername" type="string" required="true">
		<cfargument name="dsnpassword" type="string" required="true">
		<cfargument name="dsnprefix" type="string" required="true">
		<cfargument name="dsntype" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfset variables.dsnusername = arguments.dsnusername>
		<cfset variables.dsnpassword = arguments.dsnpassword>
		<cfset variables.dsnprefix = arguments.dsnprefix>
		<cfset variables.dsntype = arguments.dsntype>
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributesQuery" access="public" output="false" returntype="query">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="DisplayImageID" type="uuid" required="false" />
		<cfargument name="DisplayID" type="string" required="false" />
		<cfargument name="ImageID" type="string" required="false" />
		<cfargument name="IsProcessed" type="boolean" required="false" />
		<cfargument name="IsValid" type="boolean" required="false" />
		<cfargument name="FileID" type="string" required="false" />
		<cfargument name="Attempts" type="boolean" required="false" />
		<cfargument name="ProcessDate" type="string" required="false" />
		<cfargument name="IsProcessingID" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="IsExternal" type="boolean" required="false" />
		<cfargument name="LinkURL" type="string" required="false" />
		<cfargument name="IsMuraGallery" type="boolean" required="false" />
		<!---^^ATTRIBUTES-END^^--->
		<cfargument name="orderby" type="string" required="false" />
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				*,'true' AS BeanExists
			FROM	#variables.dsnprefix#mg_displayimage
			WHERE	0=0
		<!---^^VALUES-START^^--->
			<cfif structKeyExists(arguments,"DisplayImageID") and len(arguments.DisplayImageID)>
				AND DisplayImageID = <cfqueryparam value="#arguments.DisplayImageID#" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments,"DisplayID") and len(arguments.DisplayID)>
				AND DisplayID = <cfqueryparam value="#arguments.DisplayID#" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ImageID") and len(arguments.ImageID)>
				AND ImageID = <cfqueryparam value="#arguments.ImageID#" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments,"IsProcessed") and len(arguments.IsProcessed)>
				AND IsProcessed = <cfqueryparam value="#arguments.IsProcessed#" CFSQLType="cf_sql_tinyint" />
			</cfif>
			
			<cfif structKeyExists(arguments,"IsValid") and len(arguments.IsValid)>
				AND IsValid = <cfqueryparam value="#arguments.IsValid#" CFSQLType="cf_sql_tinyint" />
			</cfif>
			
			<cfif structKeyExists(arguments,"FileID") and len(arguments.FileID)>
				AND FileID = <cfqueryparam value="#arguments.FileID#" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments,"Attempts") and len(arguments.Attempts)>
				AND Attempts = <cfqueryparam value="#arguments.Attempts#" CFSQLType="cf_sql_tinyint" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ProcessDate") and len(arguments.ProcessDate)>
				AND ProcessDate = <cfqueryparam value="#arguments.ProcessDate#" CFSQLType="cf_sql_timestamp" />
			</cfif>
			
			<cfif structKeyExists(arguments,"IsProcessingID") and len(arguments.IsProcessingID)>
				AND IsProcessingID = <cfqueryparam value="#arguments.IsProcessingID#" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments,"DateCreate") and len(arguments.DateCreate)>
				AND DateCreate = <cfqueryparam value="#arguments.DateCreate#" CFSQLType="cf_sql_timestamp" />
			</cfif>
			
			<cfif structKeyExists(arguments,"DateLastUpdate") and len(arguments.DateLastUpdate)>
				AND DateLastUpdate = <cfqueryparam value="#arguments.DateLastUpdate#" CFSQLType="cf_sql_timestamp" />
			</cfif>
			
			<cfif structKeyExists(arguments,"IsExternal") and len(arguments.IsExternal)>
				AND IsExternal = <cfqueryparam value="#arguments.IsExternal#" CFSQLType="cf_sql_tinyint" />
			</cfif>
			
			<cfif structKeyExists(arguments,"LinkURL") and len(arguments.LinkURL)>
				AND LinkURL = <cfqueryparam value="#arguments.LinkURL#" CFSQLType="cf_sql_varchar" maxlength="150" />
			</cfif>
			
			<cfif structKeyExists(arguments,"IsMuraGallery") and len(arguments.IsMuraGallery)>
				AND IsMuraGallery = <cfqueryparam value="#arguments.IsMuraGallery#" CFSQLType="cf_sql_tinyint" />
			</cfif>
			<!---^^VALUES-END^^--->
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #rereplace(arguments.orderby,";.*","")#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getByAttributes" access="public" output="false" returntype="array">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="DisplayImageID" type="uuid" required="false" />
		<cfargument name="DisplayID" type="string" required="false" />
		<cfargument name="ImageID" type="string" required="false" />
		<cfargument name="IsProcessed" type="boolean" required="false" />
		<cfargument name="IsValid" type="boolean" required="false" />
		<cfargument name="FileID" type="string" required="false" />
		<cfargument name="Attempts" type="boolean" required="false" />
		<cfargument name="ProcessDate" type="string" required="false" />
		<cfargument name="IsProcessingID" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="IsExternal" type="boolean" required="false" />
		<cfargument name="LinkURL" type="string" required="false" />
		<cfargument name="IsMuraGallery" type="boolean" required="false" />
		<!---^^ATTRIBUTES-END^^--->
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var arrObjects = arrayNew(1) />
		<cfset var tmpObj = "" />
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","DisplayimageBean").init(argumentCollection=queryRowToStruct(qList,i)) />
			<cfset arrayAppend(arrObjects,tmpObj) />
		</cfloop>
				
		<cfreturn arrObjects />
	</cffunction>

	<cffunction name="getBeanByAttributes" access="public" output="false" returntype="any">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="DisplayImageID" type="uuid" required="false" />
		<cfargument name="DisplayID" type="string" required="false" />
		<cfargument name="ImageID" type="string" required="false" />
		<cfargument name="IsProcessed" type="boolean" required="false" />
		<cfargument name="IsValid" type="boolean" required="false" />
		<cfargument name="FileID" type="string" required="false" />
		<cfargument name="Attempts" type="boolean" required="false" />
		<cfargument name="ProcessDate" type="string" required="false" />
		<cfargument name="IsProcessingID" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="IsExternal" type="boolean" required="false" />
		<cfargument name="LinkURL" type="string" required="false" />
		<cfargument name="IsMuraGallery" type="boolean" required="false" />
		<!---^^ATTRIBUTES-END^^--->
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		

		<cfif qList.recordCount>
			<cfreturn createObject("component","DisplayimageBean").init(argumentCollection=queryRowToStruct(qList))>
		<cfelse>
			<cfreturn createObject("component","DisplayimageBean").init()>
		</cfif>
	</cffunction>

	
	<cffunction name="getByArray" access="public" output="false" returntype="Struct" >
		<cfargument name="idArray" type="array" required="true" />
		
		<cfset var qList			= "" />		
		<cfset var strObjects			= StructNew() />
		<cfset var tmpObj			= "" />
		<cfset var IDList			= "" />

		<cfif not arrayLen(arguments.idArray)>
			<cfreturn strObjects />
		</cfif>

		<cfset IDList = ArrayToList(arguments.idArray) />

		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				*
			FROM
				#variables.dsnprefix#mg_displayimage
			WHERE
			DisplayImageID IN (<cfqueryparam value="#IDList#" CFSQLType="cf_sql_char" list="true" />)
		</cfquery>
		
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","DisplayimageBean").init(argumentCollection=queryRowToStruct(qList,i)) />
			<cfset strObjects[qList.DisplayImageID[i]] = tmpObj />
		</cfloop>
		
		<cfreturn strObjects />
	</cffunction>
		
	<cffunction name="search" access="public" output="false" returntype="any">
		<cfargument name="criteria" type="struct" required="true" />
		<cfargument name="fieldList" type="string" required="true" />
		<cfargument name="start" type="numeric" required="false" default="0"/>
		<cfargument name="size" type="numeric" required="false" default="30"/>
		<cfargument name="orderby" type="string" required="false" default=""/>
		<cfargument name="isCount" type="boolean" required="false" default="false"/>
		
		<cfset var arrObjects		= ArrayNew(1)>
		<cfset var qList			= "" />
		<cfset var qLimit			= "" />
		<cfset var qFinal			= "" />
		<cfset var returnFields		= arguments.fieldList />

		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				<cfif arguments.isCount>
					COUNT(DisplayImageID) AS total
				<cfelse>
					*
				</cfif>
			FROM	#variables.dsnprefix#mg_displayimage
			WHERE
				0=0
				<!---^^SEARCH-START^^--->
			<cfif structKeyExists(arguments.criteria,"DisplayImageID") and len(arguments.criteria.DisplayImageID)>
			AND DisplayImageID LIKE <cfqueryparam value="%#arguments.criteria.DisplayImageID#%" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"DisplayID") and len(arguments.criteria.DisplayID)>
			AND DisplayID LIKE <cfqueryparam value="%#arguments.criteria.DisplayID#%" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"ImageID") and len(arguments.criteria.ImageID)>
			AND ImageID LIKE <cfqueryparam value="%#arguments.criteria.ImageID#%" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"IsProcessed") and len(arguments.criteria.IsProcessed)>
			AND IsProcessed = <cfqueryparam value="#arguments.criteria.IsProcessed#" CFSQLType="cf_sql_tinyint" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"IsValid") and len(arguments.criteria.IsValid)>
			AND IsValid = <cfqueryparam value="#arguments.criteria.IsValid#" CFSQLType="cf_sql_tinyint" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"FileID") and len(arguments.criteria.FileID)>
			AND FileID LIKE <cfqueryparam value="%#arguments.criteria.FileID#%" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"Attempts") and len(arguments.criteria.Attempts)>
			AND Attempts = <cfqueryparam value="#arguments.criteria.Attempts#" CFSQLType="cf_sql_tinyint" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"ProcessDate") and len(arguments.criteria.ProcessDate)>
			AND ProcessDate LIKE <cfqueryparam value="%#arguments.criteria.ProcessDate#%" CFSQLType="cf_sql_timestamp" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"IsProcessingID") and len(arguments.criteria.IsProcessingID)>
			AND IsProcessingID LIKE <cfqueryparam value="%#arguments.criteria.IsProcessingID#%" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"DateCreate") and len(arguments.criteria.DateCreate)>
			AND DateCreate LIKE <cfqueryparam value="%#arguments.criteria.DateCreate#%" CFSQLType="cf_sql_timestamp" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"DateLastUpdate") and len(arguments.criteria.DateLastUpdate)>
			AND DateLastUpdate LIKE <cfqueryparam value="%#arguments.criteria.DateLastUpdate#%" CFSQLType="cf_sql_timestamp" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"IsExternal") and len(arguments.criteria.IsExternal)>
			AND IsExternal = <cfqueryparam value="#arguments.criteria.IsExternal#" CFSQLType="cf_sql_tinyint" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"LinkURL") and len(arguments.criteria.LinkURL)>
			AND LinkURL LIKE <cfqueryparam value="%#arguments.criteria.LinkURL#%" CFSQLType="cf_sql_varchar" maxlength="150" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"IsMuraGallery") and len(arguments.criteria.IsMuraGallery)>
			AND IsMuraGallery = <cfqueryparam value="#arguments.criteria.IsMuraGallery#" CFSQLType="cf_sql_tinyint" />
			</cfif>
			<!---^^SEARCH-END^^--->															
			<cfif not arguments.isCount AND len( arguments.orderBy )>
				ORDER BY #rereplace(arguments.orderby,";.*","")#
			</cfif>
			<cfif not arguments.isCount and arguments.size gt 0>
				LIMIT <cfqueryparam value="#arguments.start#" CFSQLType="cf_sql_integer" />,<cfqueryparam value="#arguments.size#" CFSQLType="cf_sql_integer" />
			</cfif>
		</cfquery>

		<!--- we do not create beans here, in the interest of speed --->
		<cfif arguments.isCount>
			<cfreturn qList.total >
		<cfelse>
			<cfloop from="1" to="#qList.recordCount#" index="i">
				<cfset tmpObj = queryRowToStruct(qList,i) />
				<cfset arrayAppend(arrObjects,tmpObj) />
			</cfloop>
		</cfif>
		<cfreturn arrObjects />
	</cffunction>
	

	<cffunction name="queryRowToStruct" access="private" output="false" returntype="struct">
		<cfargument name="qry" type="query" required="true">
		
		<cfscript>
			/**
			 * Makes a row of a query into a structure.
			 * 
			 * @param query 	 The query to work with. 
			 * @param row 	 Row number to check. Defaults to row 1. 
			 * @return Returns a structure. 
			 * @author Nathan Dintenfass (nathan@changemedia.com) 
			 * @version 1, December 11, 2001 
			 */
			//by default, do this to the first row of the query
			var row = 1;
			//a var for looping
			var ii = 1;
			//the cols to loop over
			var cols = listToArray(qry.columnList);
			//the struct to return
			var stReturn = structnew();
			//if there is a second argument, use that for the row number
			if(arrayLen(arguments) GT 1)
				row = arguments[2];
			//loop over the cols and build the struct from the query row
			for(ii = 1; ii lte arraylen(cols); ii = ii + 1){
				stReturn[cols[ii]] = qry[cols[ii]][row];
			}		
			//return the struct
			return stReturn;
		</cfscript>
	</cffunction>
<!---^^GENERATEDEND^^--->
<!---^^CUSTOMSTART^^--->
	<cffunction name="setDisplayImages" access="public" output="false" returntype="boolean">
		<cfargument name="DisplayBean" type="any" required="true" />

		<cfset var qClean			= "" />
		<cfset var qList			= "" />
		<cfset var qUpdate			= "" />
		<cfset var doProcess		= false />
		<cfset var cDisplayID		= "" />

		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				displayImageID,fileID
			FROM
				#variables.dsnprefix#mg_displayimage
			WHERE
				displayID = <cfqueryparam value="#arguments.DisplayBean.getDisplayID()#" CFSQLType="cf_sql_char" maxlength="35" />
			AND
				imageID
			NOT IN
				(
				SELECT
					imageID
				FROM
					#variables.dsnprefix#mg_imagegroupimage
				WHERE
					imageGroupID = <cfqueryparam value="#arguments.DisplayBean.getContentID()#" CFSQLType="cf_sql_char" maxlength="35" />
				)
		</cfquery>

		<cfif qList.RecordCount>
			<cfloop query="qList">
				<cfif len( fileID )>
					<cfset getmmFileUpload().deleteFileByFileID( fileID ) />
				</cfif>
			</cfloop>
	
			<cfquery name="qClean" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
				DELETE FROM
					#variables.dsnprefix#mg_displayimage
				WHERE
					displayID = <cfqueryparam value="#arguments.DisplayBean.getDisplayID()#" CFSQLType="cf_sql_char" maxlength="35" />
				AND
					displayImageID IN (<cfqueryparam value="#valueList(qList.displayImageID)#" CFSQLType="cf_sql_char" maxlength="35" list="true" />)
			</cfquery>
		</cfif>

		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				ImageID
			FROM
				#variables.dsnprefix#mg_imagegroupimage
			WHERE
				imageGroupID = <cfqueryparam value="#arguments.DisplayBean.getContentID()#" CFSQLType="cf_sql_char" maxlength="35" />
			AND
				imageID
			NOT IN
				(
				SELECT
					imageID
				FROM
					#variables.dsnprefix#mg_displayimage
				WHERE
					DisplayID = <cfqueryparam value="#arguments.DisplayBean.getDisplayID()#" CFSQLType="cf_sql_char" maxlength="35" /> 
				)
		</cfquery>

		<cfif qList.RecordCount>
			<cfset doProcess = true />
			<cfquery name="qUpdate" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
				INSERT INTO
					#variables.dsnprefix#mg_displayimage
					(displayImageID,displayID,imageID,dateCreate,dateLastUpdate)
				VALUES
				<cfloop query="qList">
					(
					<cfqueryparam value="#createUUID()#" CFSQLType="cf_sql_char" maxlength="35" />,
					<cfqueryparam value="#arguments.DisplayBean.getDisplayID()#" CFSQLType="cf_sql_char" maxlength="35" />,
					<cfqueryparam value="#imageID#" CFSQLType="cf_sql_char" maxlength="35" />,
					<cfqueryparam value="#CreateODBCDateTime(now())#" CFSQLType="cf_sql_timestamp" />,
					<cfqueryparam value="#CreateODBCDateTime(now())#" CFSQLType="cf_sql_timestamp" />
					)
					<cfif currentRow lt qList.RecordCount>
					,
					</cfif>
				</cfloop>
			</cfquery>
		</cfif>
		<cfreturn doProcess>
	</cffunction>

	<cffunction name="cleanImageGroup" access="public" output="false" returntype="boolean">
		<cfargument name="ImageGroupID" type="string" required="true" />

		<cfset var qClean			= "" />
		<cfset var qList			= "" />
		<cfset var qDisplay			= "" />
		<cfset var doProcess		= false />

		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				di.displayImageID,di.fileID,di.imageID
			FROM
				#variables.dsnprefix#mg_displayimage di
			JOIN
				#variables.dsnprefix#mg_display d
			ON
				(di.displayID = d.displayID)
			WHERE
				d.contentID = <cfqueryparam value="#arguments.ImageGroupID#" CFSQLType="cf_sql_char" maxlength="35" />
			AND
				di.imageID
			NOT IN
				(
				SELECT
					imageID
				FROM
					#variables.dsnprefix#mg_imagegroupimage
				WHERE
					imageGroupID = <cfqueryparam value="#arguments.ImageGroupID#" CFSQLType="cf_sql_char" maxlength="35" />
				)
		</cfquery>

		<cfif qList.RecordCount>
			<cfloop query="qList">
				<cfif len( fileID )>
					<cfset getmmFileUpload().deleteFileByContentID( displayImageID ) />
				</cfif>
			</cfloop>
	
			<cfquery name="qClean" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
				DELETE FROM
					#variables.dsnprefix#mg_displayimage
				WHERE
					displayImageID IN (<cfqueryparam value="#valueList(qList.displayImageID)#" CFSQLType="cf_sql_char" maxlength="35" list="true" />)
			</cfquery>
		</cfif>

		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				DisplayID
			FROM
				#variables.dsnprefix#mg_display
			WHERE
				contentID = <cfqueryparam value="#arguments.ImageGroupID#" CFSQLType="cf_sql_char" maxlength="35" />
		</cfquery>

		<cfif qList.recordCount>
			<cfloop query="qList">
				<cfset cDisplayID = displayID >
				<cfquery name="qDisplay" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
					SELECT
						imageID
					FROM
						#variables.dsnprefix#mg_imagegroupimage
					WHERE
						imageGroupID = <cfqueryparam value="#arguments.ImageGroupID#" CFSQLType="cf_sql_char" maxlength="35" />
					AND
						imageID NOT IN
						(
						SELECT
							imageID
						FROM
							#variables.dsnprefix#mg_displayimage di
						WHERE
							displayID = <cfqueryparam value="#displayID#" CFSQLType="cf_sql_char" maxlength="35" />  
						)
				</cfquery>
			
				<cfif qDisplay.RecordCount>
					<cfset doProcess = true />

					<cfquery name="qUpdate" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
						INSERT INTO
							#variables.dsnprefix#mg_displayimage
							(displayImageID,displayID,imageID,dateCreate,dateLastUpdate)
						VALUES
						<cfloop query="qDisplay">
							(
							<cfqueryparam value="#createUUID()#" CFSQLType="cf_sql_char" maxlength="35" />,
							<cfqueryparam value="#cDisplayID#" CFSQLType="cf_sql_char" maxlength="35" />,
							<cfqueryparam value="#imageID#" CFSQLType="cf_sql_char" maxlength="35" />,
							<cfqueryparam value="#CreateODBCDateTime(now())#" CFSQLType="cf_sql_timestamp" />,
							<cfqueryparam value="#CreateODBCDateTime(now())#" CFSQLType="cf_sql_timestamp" />
							)
							<cfif currentRow lt qDisplay.RecordCount>
							,
							</cfif>
						</cfloop>
					</cfquery>
				</cfif>
			</cfloop>		
		</cfif>
		
		<cfreturn doProcess>
	</cffunction>

	<cffunction name="getByImageIDArray" access="public" output="false" returntype="Struct" >
		<cfargument name="idArray" type="array" required="true" />
		
		<cfset var qList			= "" />		
		<cfset var strObjects			= StructNew() />
		<cfset var tmpObj			= "" />
		<cfset var IDList			= "" />

		<cfif not arrayLen(arguments.idArray)>
			<cfreturn strObjects />
		</cfif>

		<cfset IDList = ArrayToList(arguments.idArray) />

		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				*
			FROM
				#variables.dsnprefix#mg_displayimage
			WHERE
			ImageID IN (<cfqueryparam value="#IDList#" CFSQLType="cf_sql_char" list="true" />)
		</cfquery>
		
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","DisplayimageBean").init(argumentCollection=queryRowToStruct(qList,i)) />
			<cfset strObjects[qList.ImageID[i]] = tmpObj />
		</cfloop>
		
		<cfreturn strObjects />
	</cffunction>

	<cffunction name="getImagesByDisplayID" access="public" output="false" returntype="array">
		<cfargument name="DisplayID" type="string" required="false" />
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var strObjects = structNew() />
		<cfset var tmpObj = "" />

		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","DisplayimageBean").init(argumentCollection=queryRowToStruct(qList,i)) />
			<cfset strObjects[tmpObj.getImageID] = tmpObj />
		</cfloop>
				
		<cfreturn strObjects />
	</cffunction>

	<cffunction name="invalidateDisplay" access="public" output="false" returntype="void">
		<cfargument name="DisplayID" type="uuid" required="true" />

		<cfset var qList = "" />
				
		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			UPDATE
				#variables.dsnprefix#mg_displayimage
			SET
				isValid = 0,
				isProcessed = 0,
				dateLastUpdate = <cfqueryparam value="#CreateODBCDateTime(now())#" CFSQLType="cf_sql_timestamp" />

			WHERE
				DisplayID = <cfqueryparam value="#arguments.DisplayID#" CFSQLType="cf_sql_char" maxlength="35" />
		</cfquery>
	</cffunction>

	<cffunction name="deleteByImageID" access="public" output="false" returntype="void">
		<cfargument name="ImageID" type="string" required="true" />

		<cfset var qList = "" />
		<cfset var qDelete = "" />

		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				displayImageID
			FROM
				#variables.dsnprefix#mg_displayimage
			WHERE
				imageID = <cfqueryparam value="#arguments.imageID#" CFSQLType="cf_sql_char" maxlength="35" />
		</cfquery>

		<cfloop query="qList">
			<cfset getmmFileUpload().deleteFileByContentID( displayImageID ) />
		</cfloop>

		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			DELETE FROM
				#variables.dsnprefix#mg_displayimage
			WHERE
				imageID = <cfqueryparam value="#arguments.imageID#" CFSQLType="cf_sql_char" maxlength="35" />
		</cfquery>
	</cffunction>

	<cffunction name="deleteByDisplayID" access="public" output="false" returntype="void">
		<cfargument name="DisplayID" type="string" required="true" />

		<cfset var qList = "" />
		<cfset var qDelete = "" />

		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				fileID
			FROM
				#variables.dsnprefix#mg_displayimage
			WHERE
				DisplayID = <cfqueryparam value="#arguments.DisplayID#" CFSQLType="cf_sql_char" maxlength="35" />
		</cfquery>

		<cfloop query="qList">
			<cfset getmmFileUpload().deleteFileByFileID( fileID ) />
		</cfloop>

		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			DELETE FROM
				#variables.dsnprefix#mg_displayimage
			WHERE
				DisplayID = <cfqueryparam value="#arguments.DisplayID#" CFSQLType="cf_sql_char" maxlength="35" />
		</cfquery>
	</cffunction>

	<cffunction name="invalidateByImageID" access="public" output="false" returntype="void">
		<cfargument name="ImageID" type="string" required="true" />

		<cfset var qList = "" />
		<cfset var qDelete = "" />

		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			UPDATE
				#variables.dsnprefix#mg_displayimage
			SET
				isValid = 0,
				isProcessed = 0,
				dateLastUpdate = <cfqueryparam value="#CreateODBCDateTime(now())#" CFSQLType="cf_sql_timestamp" />
			WHERE
				imageID = <cfqueryparam value="#arguments.imageID#" CFSQLType="cf_sql_char" maxlength="35" />
		</cfquery>
	</cffunction>

	<cffunction name="invalidateMuraGalleryImages" access="public" output="false" returntype="void">
		<cfargument name="SiteID" type="string" required="false" />

		<cfset var qList = "" />

		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			UPDATE
				#variables.dsnprefix#mg_displayimage
			SET
				isValid = 0,
				isProcessed = 0,
				dateLastUpdate = <cfqueryparam value="#CreateODBCDateTime(now())#" CFSQLType="cf_sql_timestamp" />
			WHERE
				isMuraGallery = 1
			<cfif StructKeyExists(arguments,"siteID") and len(arguments.siteID)>
				AND imageID IN
				(
					SELECT
						imageID
					FROM
						#variables.dsnprefix#mg_image
					WHERE
						siteID = <cfqueryparam value="#arguments.SiteID#" CFSQLType="cf_sql_char" maxlength="35" />
				)
			</cfif>
		</cfquery>
	</cffunction>

<!---^^CUSTOMEND^^--->
	<cffunction name="setmmFileUpload" access="public" returntype="void" output="false">
		<cfargument name="mmFileUpload" type="any" required="true" />
		<cfset variables.instance.mmFileUpload = arguments.mmFileUpload />
	</cffunction>
	<cffunction name="getmmFileUpload" access="public" returntype="any" output="false">
		<cfreturn variables.instance.mmFileUpload />
	</cffunction>

	<cffunction name="setImagegroupimageService" access="public" returntype="void" output="false">
		<cfargument name="ImagegroupimageService" type="any" required="true" />
		<cfset variables.instance.ImagegroupimageService = arguments.ImagegroupimageService />
	</cffunction>
	<cffunction name="getImagegroupimageService" access="public" returntype="any" output="false">
		<cfreturn variables.instance.ImagegroupimageService />
	</cffunction>
</cfcomponent>	





