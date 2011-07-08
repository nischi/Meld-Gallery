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
<cfcomponent displayname="ImageGroupDAO" output="false">
<!---^^GENERATEDSTART^^--->

	<cffunction name="init" access="public" output="false" returntype="ImageGroupDAO">
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
		<cfargument name="ImageGroupBean" type="any" required="true" />

		<cfset var qCreate = "" />
		<cfquery name="qCreate" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			INSERT INTO
				#variables.dsnprefix#mg_imagegroup
				(
				<!---^^SAVECOLUMNS-START^^--->
				ImageGroupID,
				Name,
				Description,
				DateCreate,
				DateLastUpdate,
				AdminID,
				Tags,
				SiteID,
				IsActive
				<!---^^SAVECOLUMNS-END^^--->
				)
			VALUES
				(
				<!---^^SAVEVALUES-START^^--->
				<cfqueryparam value="#arguments.ImagegroupBean.getImageGroupID()#" CFSQLType="cf_sql_char" maxlength="35" />,
				<cfqueryparam value="#arguments.ImagegroupBean.getName()#" CFSQLType="cf_sql_varchar" maxlength="145" />,
				<cfqueryparam value="#arguments.ImagegroupBean.getDescription()#" CFSQLType="cf_sql_varchar" null="#(not len(arguments.ImagegroupBean.getDescription()))#" maxlength="255" />,
				<cfqueryparam value="#CreateODBCDateTime(now())#" CFSQLType="cf_sql_timestamp" />,
				<cfqueryparam value="#CreateODBCDateTime(now())#" CFSQLType="cf_sql_timestamp" />,
				<cfqueryparam value="#arguments.ImagegroupBean.getAdminID()#" CFSQLType="cf_sql_char" null="#(not len(arguments.ImagegroupBean.getAdminID()))#" maxlength="45" />,
				<cfqueryparam value="#arguments.ImagegroupBean.getTags()#" CFSQLType="cf_sql_varchar" null="#(not len(arguments.ImagegroupBean.getTags()))#" maxlength="255" />,
				<cfqueryparam value="#arguments.ImagegroupBean.getSiteID()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				<cfqueryparam value="#arguments.ImagegroupBean.getIsActive()#" CFSQLType="cf_sql_tinyint" />
				<!---^^SAVEVALUES-END^^--->
				)
		</cfquery>
		<cfreturn true />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="void">
		<cfargument name="ImageGroupBean" type="any" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cfquery name="qRead" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				*,'true' AS BeanExists
			FROM
				#variables.dsnprefix#mg_imagegroup
			WHERE
			0=0
			<!---^^PRIMARYKEYS-START^^--->
				AND ImageGroupID = <cfqueryparam value="#arguments.ImagegroupBean.getImageGroupID()#" CFSQLType="cf_sql_char" maxlength="35" />
			<!---^^PRIMARYKEYS-END^^--->
		</cfquery>

		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset arguments.ImageGroupBean.init(argumentCollection=strReturn)>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="ImageGroupBean" type="any" required="true" />

		<cfset var qUpdate = "" />
		<cfquery name="qUpdate" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			UPDATE
				#variables.dsnprefix#mg_imagegroup
			SET
				<!---^^UPDATEVALUES-START^^--->
				Name = <cfqueryparam value="#arguments.ImagegroupBean.getName()#" CFSQLType="cf_sql_varchar" maxlength="145" />,
				Description = <cfqueryparam value="#arguments.ImagegroupBean.getDescription()#" CFSQLType="cf_sql_varchar" null="#(not len(arguments.ImagegroupBean.getDescription()))#" maxlength="255" />,
				DateLastUpdate = <cfqueryparam value="#CreateODBCDateTime(now())#" CFSQLType="cf_sql_timestamp" />,
				AdminID = <cfqueryparam value="#arguments.ImagegroupBean.getAdminID()#" CFSQLType="cf_sql_char" null="#(not len(arguments.ImagegroupBean.getAdminID()))#" maxlength="45" />,
				Tags = <cfqueryparam value="#arguments.ImagegroupBean.getTags()#" CFSQLType="cf_sql_varchar" null="#(not len(arguments.ImagegroupBean.getTags()))#" maxlength="255" />,
				SiteID = <cfqueryparam value="#arguments.ImagegroupBean.getSiteID()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				IsActive = <cfqueryparam value="#arguments.ImagegroupBean.getIsActive()#" CFSQLType="cf_sql_tinyint" />
				<!---^^UPDATEVALUES-END^^--->
		WHERE
			0=0
			<!---^^PRIMARYKEYS-START^^--->
				AND ImageGroupID = <cfqueryparam value="#arguments.ImagegroupBean.getImageGroupID()#" CFSQLType="cf_sql_char" maxlength="35" />
			<!---^^PRIMARYKEYS-END^^--->
		</cfquery>
		<cfreturn true />
	</cffunction>
	
	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="ImageGroupBean" type="any" required="true" />

		<cfset var qDelete = "">
		<cfquery name="qDelete" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			DELETE FROM
					#variables.dsnprefix#mg_imagegroup
			WHERE
				0=0
			<!---^^PRIMARYKEYS-START^^--->
				AND ImageGroupID = <cfqueryparam value="#arguments.ImagegroupBean.getImageGroupID()#" CFSQLType="cf_sql_char" maxlength="35" />
			<!---^^PRIMARYKEYS-END^^--->
		</cfquery>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="ImageGroupBean" type="any" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				count(1) as idexists
			FROM
				#variables.dsnprefix#mg_imagegroup
			WHERE
				0=0
			<!---^^PRIMARYKEYS-START^^--->
				AND ImageGroupID = <cfqueryparam value="#arguments.ImagegroupBean.getImageGroupID()#" CFSQLType="cf_sql_char" maxlength="35" />
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




