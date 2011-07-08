<!---^^LICENSE-START^^--->
<!---
||MELDGALLERYLICENSE||
--->
<!---^^LICENSE-END^^--->





<cfcomponent displayname="DisplayDAO" output="false">
<!---^^GENERATEDSTART^^--->

	<cffunction name="init" access="public" output="false" returntype="DisplayDAO">
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
		<cfargument name="DisplayBean" type="any" required="true" />

		<cfset var qCreate = "" />
		<cfquery name="qCreate" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			INSERT INTO
				#variables.dsnprefix#mg_display
				(
				<!---^^SAVECOLUMNS-START^^--->
				DisplayID,
				DisplayTypeID,
				ObjectID,
				Name,
				DateCreate,
				DateLastUpdate,
				SiteID,
				Params,
				Notes,
				IsActive,
				AdminID,
				ModuleID,
				ContentID,
				IsValid,
				Settings
				<!---^^SAVECOLUMNS-END^^--->
				)
			VALUES
				(
				<!---^^SAVEVALUES-START^^--->
				<cfqueryparam value="#arguments.DisplayBean.getDisplayID()#" CFSQLType="cf_sql_char" maxlength="35" />,
				<cfqueryparam value="#arguments.DisplayBean.getDisplayTypeID()#" CFSQLType="cf_sql_char" maxlength="35" />,
				<cfqueryparam value="#arguments.DisplayBean.getObjectID()#" CFSQLType="cf_sql_char" null="#(not len(arguments.DisplayBean.getObjectID()))#" maxlength="35" />,
				<cfqueryparam value="#arguments.DisplayBean.getName()#" CFSQLType="cf_sql_varchar" maxlength="150" />,
				<cfqueryparam value="#CreateODBCDateTime(now())#" CFSQLType="cf_sql_timestamp" />,
				<cfqueryparam value="#CreateODBCDateTime(now())#" CFSQLType="cf_sql_timestamp" />,
				<cfqueryparam value="#arguments.DisplayBean.getSiteID()#" CFSQLType="cf_sql_varchar" maxlength="25" />,
				<cfqueryparam value="#arguments.DisplayBean.getParams()#" CFSQLType="cf_sql_longvarchar" null="#(not len(arguments.DisplayBean.getParams()))#" />,
				<cfqueryparam value="#arguments.DisplayBean.getNotes()#" CFSQLType="cf_sql_longvarchar" null="#(not len(arguments.DisplayBean.getNotes()))#" />,
				<cfqueryparam value="#arguments.DisplayBean.getIsActive()#" CFSQLType="cf_sql_tinyint" />,
				<cfqueryparam value="#arguments.DisplayBean.getAdminID()#" CFSQLType="cf_sql_char" null="#(not len(arguments.DisplayBean.getAdminID()))#" maxlength="35" />,
				<cfqueryparam value="#arguments.DisplayBean.getModuleID()#" CFSQLType="cf_sql_char" null="#(not len(arguments.DisplayBean.getModuleID()))#" maxlength="35" />,
				<cfqueryparam value="#arguments.DisplayBean.getContentID()#" CFSQLType="cf_sql_char" null="#(not len(arguments.DisplayBean.getContentID()))#" maxlength="35" />,
				<cfqueryparam value="#arguments.DisplayBean.getIsValid()#" CFSQLType="cf_sql_tinyint" />,
				<cfqueryparam value="#arguments.DisplayBean.getSettings()#" CFSQLType="cf_sql_longvarchar" null="#(not len(arguments.DisplayBean.getSettings()))#" />
				<!---^^SAVEVALUES-END^^--->
				)
		</cfquery>
		<cfreturn true />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="void">
		<cfargument name="DisplayBean" type="any" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cfquery name="qRead" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				*,'true' AS BeanExists
			FROM
				#variables.dsnprefix#mg_display
			WHERE
			0=0
			<!---^^PRIMARYKEYS-START^^--->
				AND DisplayID = <cfqueryparam value="#arguments.DisplayBean.getDisplayID()#" CFSQLType="cf_sql_char" maxlength="35" />
			<!---^^PRIMARYKEYS-END^^--->
		</cfquery>

		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset arguments.DisplayBean.init(argumentCollection=strReturn)>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="DisplayBean" type="any" required="true" />

		<cfset var qUpdate = "" />
		<cfquery name="qUpdate" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			UPDATE
				#variables.dsnprefix#mg_display
			SET
				<!---^^UPDATEVALUES-START^^--->
				DisplayTypeID = <cfqueryparam value="#arguments.DisplayBean.getDisplayTypeID()#" CFSQLType="cf_sql_char" maxlength="35" />,
				ObjectID = <cfqueryparam value="#arguments.DisplayBean.getObjectID()#" CFSQLType="cf_sql_char" null="#(not len(arguments.DisplayBean.getObjectID()))#" maxlength="35" />,
				Name = <cfqueryparam value="#arguments.DisplayBean.getName()#" CFSQLType="cf_sql_varchar" maxlength="150" />,
				DateLastUpdate = <cfqueryparam value="#CreateODBCDateTime(now())#" CFSQLType="cf_sql_timestamp" />,
				SiteID = <cfqueryparam value="#arguments.DisplayBean.getSiteID()#" CFSQLType="cf_sql_varchar" maxlength="25" />,
				Params = <cfqueryparam value="#arguments.DisplayBean.getParams()#" CFSQLType="cf_sql_longvarchar" null="#(not len(arguments.DisplayBean.getParams()))#" />,
				Notes = <cfqueryparam value="#arguments.DisplayBean.getNotes()#" CFSQLType="cf_sql_longvarchar" null="#(not len(arguments.DisplayBean.getNotes()))#" />,
				IsActive = <cfqueryparam value="#arguments.DisplayBean.getIsActive()#" CFSQLType="cf_sql_tinyint" />,
				AdminID = <cfqueryparam value="#arguments.DisplayBean.getAdminID()#" CFSQLType="cf_sql_char" null="#(not len(arguments.DisplayBean.getAdminID()))#" maxlength="35" />,
				ModuleID = <cfqueryparam value="#arguments.DisplayBean.getModuleID()#" CFSQLType="cf_sql_char" null="#(not len(arguments.DisplayBean.getModuleID()))#" maxlength="35" />,
				ContentID = <cfqueryparam value="#arguments.DisplayBean.getContentID()#" CFSQLType="cf_sql_char" null="#(not len(arguments.DisplayBean.getContentID()))#" maxlength="35" />,
				IsValid = <cfqueryparam value="#arguments.DisplayBean.getIsValid()#" CFSQLType="cf_sql_tinyint" />,
				Settings = <cfqueryparam value="#arguments.DisplayBean.getSettings()#" CFSQLType="cf_sql_longvarchar" null="#(not len(arguments.DisplayBean.getSettings()))#" />
				<!---^^UPDATEVALUES-END^^--->
		WHERE
			0=0
			<!---^^PRIMARYKEYS-START^^--->
				AND DisplayID = <cfqueryparam value="#arguments.DisplayBean.getDisplayID()#" CFSQLType="cf_sql_char" maxlength="35" />
			<!---^^PRIMARYKEYS-END^^--->
		</cfquery>
		<cfreturn true />
	</cffunction>
	
	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="DisplayBean" type="any" required="true" />

		<cfset var qDelete = "">
		<cfquery name="qDelete" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			DELETE FROM
					#variables.dsnprefix#mg_display
			WHERE
				0=0
			<!---^^PRIMARYKEYS-START^^--->
				AND DisplayID = <cfqueryparam value="#arguments.DisplayBean.getDisplayID()#" CFSQLType="cf_sql_char" maxlength="35" />
			<!---^^PRIMARYKEYS-END^^--->
		</cfquery>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="DisplayBean" type="any" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				count(1) as idexists
			FROM
				#variables.dsnprefix#mg_display
			WHERE
				0=0
			<!---^^PRIMARYKEYS-START^^--->
				AND DisplayID = <cfqueryparam value="#arguments.DisplayBean.getDisplayID()#" CFSQLType="cf_sql_char" maxlength="35" />
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























