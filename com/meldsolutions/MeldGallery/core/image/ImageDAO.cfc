<!---^^LICENSE-START^^--->
	<!---
||MELDGALLERYLICENSE||
--->
<!---^^LICENSE-END^^--->
<cfcomponent displayname="ImageDAO" output="false">
<!---^^GENERATEDSTART^^--->

	<cffunction name="init" access="public" output="false" returntype="ImageDAO">
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
		<cfreturn this>
	</cffunction>
	
	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="ImageBean" type="any" required="true" />

		<cfset var qCreate = "" />
		<cfquery name="qCreate" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			INSERT INTO
				#variables.dsnprefix#mg_image
				(
				<!---^^SAVECOLUMNS-START^^--->
				ImageID,
				FileID,
				Caption,
				Description,
				Tags,
				CategoryID,
				DateCreate,
				DateLastUpdate,
				SiteID,
				LinkURL,
				FriendlyName,
				IsActive,
				Type,
				AdminID,
				Summary,
				Name,
				RemoteID
				<!---^^SAVECOLUMNS-END^^--->
				)
			VALUES
				(
				<!---^^SAVEVALUES-START^^--->
				<cfqueryparam value="#arguments.ImageBean.getImageID()#" CFSQLType="cf_sql_char" maxlength="35" />,
				<cfqueryparam value="#arguments.ImageBean.getFileID()#" CFSQLType="cf_sql_char" maxlength="35" />,
				<cfqueryparam value="#arguments.ImageBean.getCaption()#" CFSQLType="cf_sql_varchar" null="#(not len(arguments.ImageBean.getCaption()))#" maxlength="150" />,
				<cfqueryparam value="#arguments.ImageBean.getDescription()#" CFSQLType="cf_sql_longvarchar" null="#(not len(arguments.ImageBean.getDescription()))#" />,
				<cfqueryparam value="#arguments.ImageBean.getTags()#" CFSQLType="cf_sql_varchar" null="#(not len(arguments.ImageBean.getTags()))#" maxlength="255" />,
				<cfqueryparam value="#arguments.ImageBean.getCategoryID()#" CFSQLType="cf_sql_char" null="#(not len(arguments.ImageBean.getCategoryID()))#" maxlength="35" />,
				<cfqueryparam value="#CreateODBCDateTime(now())#" CFSQLType="cf_sql_timestamp" />,
				<cfqueryparam value="#CreateODBCDateTime(now())#" CFSQLType="cf_sql_timestamp" />,
				<cfqueryparam value="#arguments.ImageBean.getSiteID()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				<cfqueryparam value="#arguments.ImageBean.getLinkURL()#" CFSQLType="cf_sql_varchar" null="#(not len(arguments.ImageBean.getLinkURL()))#" maxlength="150" />,
				<cfqueryparam value="#arguments.ImageBean.getFriendlyName()#" CFSQLType="cf_sql_varchar" null="#(not len(arguments.ImageBean.getFriendlyName()))#" maxlength="150" />,
				<cfqueryparam value="#arguments.ImageBean.getIsActive()#" CFSQLType="cf_sql_tinyint" />,
				<cfqueryparam value="#arguments.ImageBean.getType()#" CFSQLType="cf_sql_varchar" null="#(not len(arguments.ImageBean.getType()))#" maxlength="10" />,
				<cfqueryparam value="#arguments.ImageBean.getAdminID()#" CFSQLType="cf_sql_char" null="#(not len(arguments.ImageBean.getAdminID()))#" maxlength="35" />,
				<cfqueryparam value="#arguments.ImageBean.getSummary()#" CFSQLType="cf_sql_longvarchar" null="#(not len(arguments.ImageBean.getSummary()))#" />,
				<cfqueryparam value="#arguments.ImageBean.getName()#" CFSQLType="cf_sql_varchar" null="#(not len(arguments.ImageBean.getName()))#" maxlength="150" />,
				<cfqueryparam value="#arguments.ImageBean.getRemoteID()#" CFSQLType="cf_sql_char" null="#(not len(arguments.ImageBean.getRemoteID()))#" maxlength="35" />
				<!---^^SAVEVALUES-END^^--->
				)
		</cfquery>
		<cfreturn true />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="void">
		<cfargument name="ImageBean" type="any" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cfquery name="qRead" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				*,'true' AS BeanExists
			FROM
				#variables.dsnprefix#mg_image
			WHERE
			0=0
			<!---^^PRIMARYKEYS-START^^--->
				AND ImageID = <cfqueryparam value="#arguments.ImageBean.getImageID()#" CFSQLType="cf_sql_char" maxlength="35" />
			<!---^^PRIMARYKEYS-END^^--->
		</cfquery>

		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset arguments.ImageBean.init(argumentCollection=strReturn)>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="ImageBean" type="any" required="true" />

		<cfset var qUpdate = "" />
		<cfquery name="qUpdate" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			UPDATE
				#variables.dsnprefix#mg_image
			SET
				<!---^^UPDATEVALUES-START^^--->
				FileID = <cfqueryparam value="#arguments.ImageBean.getFileID()#" CFSQLType="cf_sql_char" maxlength="35" />,
				Caption = <cfqueryparam value="#arguments.ImageBean.getCaption()#" CFSQLType="cf_sql_varchar" null="#(not len(arguments.ImageBean.getCaption()))#" maxlength="150" />,
				Description = <cfqueryparam value="#arguments.ImageBean.getDescription()#" CFSQLType="cf_sql_longvarchar" null="#(not len(arguments.ImageBean.getDescription()))#" />,
				Tags = <cfqueryparam value="#arguments.ImageBean.getTags()#" CFSQLType="cf_sql_varchar" null="#(not len(arguments.ImageBean.getTags()))#" maxlength="255" />,
				CategoryID = <cfqueryparam value="#arguments.ImageBean.getCategoryID()#" CFSQLType="cf_sql_char" null="#(not len(arguments.ImageBean.getCategoryID()))#" maxlength="35" />,
				DateLastUpdate = <cfqueryparam value="#CreateODBCDateTime(now())#" CFSQLType="cf_sql_timestamp" />,
				SiteID = <cfqueryparam value="#arguments.ImageBean.getSiteID()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				LinkURL = <cfqueryparam value="#arguments.ImageBean.getLinkURL()#" CFSQLType="cf_sql_varchar" null="#(not len(arguments.ImageBean.getLinkURL()))#" maxlength="150" />,
				FriendlyName = <cfqueryparam value="#arguments.ImageBean.getFriendlyName()#" CFSQLType="cf_sql_varchar" null="#(not len(arguments.ImageBean.getFriendlyName()))#" maxlength="150" />,
				IsActive = <cfqueryparam value="#arguments.ImageBean.getIsActive()#" CFSQLType="cf_sql_tinyint" />,
				Type = <cfqueryparam value="#arguments.ImageBean.getType()#" CFSQLType="cf_sql_varchar" null="#(not len(arguments.ImageBean.getType()))#" maxlength="10" />,
				AdminID = <cfqueryparam value="#arguments.ImageBean.getAdminID()#" CFSQLType="cf_sql_char" null="#(not len(arguments.ImageBean.getAdminID()))#" maxlength="35" />,
				Summary = <cfqueryparam value="#arguments.ImageBean.getSummary()#" CFSQLType="cf_sql_longvarchar" null="#(not len(arguments.ImageBean.getSummary()))#" />,
				Name = <cfqueryparam value="#arguments.ImageBean.getName()#" CFSQLType="cf_sql_varchar" null="#(not len(arguments.ImageBean.getName()))#" maxlength="150" />,
				RemoteID = <cfqueryparam value="#arguments.ImageBean.getRemoteID()#" CFSQLType="cf_sql_char" null="#(not len(arguments.ImageBean.getRemoteID()))#" maxlength="35" />
				<!---^^UPDATEVALUES-END^^--->
		WHERE
			0=0
			<!---^^PRIMARYKEYS-START^^--->
				AND ImageID = <cfqueryparam value="#arguments.ImageBean.getImageID()#" CFSQLType="cf_sql_char" maxlength="35" />
			<!---^^PRIMARYKEYS-END^^--->
		</cfquery>
		<cfreturn true />
	</cffunction>
	
	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="ImageBean" type="any" required="true" />

		<cfset var qDelete = "">
		<cfquery name="qDelete" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			DELETE FROM
					#variables.dsnprefix#mg_image
			WHERE
				0=0
			<!---^^PRIMARYKEYS-START^^--->
				AND ImageID = <cfqueryparam value="#arguments.ImageBean.getImageID()#" CFSQLType="cf_sql_char" maxlength="35" />
			<!---^^PRIMARYKEYS-END^^--->
		</cfquery>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="ImageBean" type="any" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				count(1) as idexists
			FROM
				#variables.dsnprefix#mg_image
			WHERE
				0=0
			<!---^^PRIMARYKEYS-START^^--->
				AND ImageID = <cfqueryparam value="#arguments.ImageBean.getImageID()#" CFSQLType="cf_sql_char" maxlength="35" />
			<!---^^PRIMARYKEYS-END^^--->
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
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
<!---^^CUSTOMEND^^--->
</cfcomponent>	










