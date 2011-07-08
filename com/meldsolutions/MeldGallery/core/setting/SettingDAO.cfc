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

<cfcomponent displayname="SettingDAO" output="false">
<!---^^GENERATEDSTART^^--->

	<cffunction name="init" access="public" output="false" returntype="SettingDAO">
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
		<cfargument name="SettingBean" type="any" required="true" />

		<cfset var qCreate = "" />
		<cfquery name="qCreate" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			INSERT INTO
				#variables.dsnprefix#mg_setting
				(
				<!---^^SAVECOLUMNS-START^^--->
				SettingsID,
				SiteID,
				DateCreate,
				DateLastUpdate,
				IsMaster,
				ImageWidth,
				ImageHeight,
				ImageWidthMedium,
				ImageHeightMedium,
				ImageWidthSmall,
				ImageHeightSmall,
				ImageResizeType,
				ImageAspectType,
				ImageQualityType,
				ImageResizeTypeMedium,
				ImageAspectTypeMedium,
				ImageQualityTypeMedium,
				ImageResizeTypeSmall,
				ImageAspectTypeSmall,
				ImageQualityTypeSmall,
				ImageCropType,
				ImageCropTypeMedium,
				ImageCropTypeSmall,
				DefaultDisplayTypeID,
				FileSizeLimit,
				SyncInfo
				<!---^^SAVECOLUMNS-END^^--->
				)
			VALUES
				(
				<!---^^SAVEVALUES-START^^--->
				<cfqueryparam value="#arguments.SettingBean.getSettingsID()#" CFSQLType="cf_sql_char" maxlength="35" />,
				<cfqueryparam value="#arguments.SettingBean.getSiteID()#" CFSQLType="cf_sql_varchar" maxlength="25" />,
				<cfqueryparam value="#CreateODBCDateTime(now())#" CFSQLType="cf_sql_timestamp" />,
				<cfqueryparam value="#CreateODBCDateTime(now())#" CFSQLType="cf_sql_timestamp" />,
				<cfqueryparam value="#arguments.SettingBean.getIsMaster()#" CFSQLType="cf_sql_tinyint" />,
				<cfqueryparam value="#arguments.SettingBean.getImageWidth()#" CFSQLType="cf_sql_integer" />,
				<cfqueryparam value="#arguments.SettingBean.getImageHeight()#" CFSQLType="cf_sql_integer" />,
				<cfqueryparam value="#arguments.SettingBean.getImageWidthMedium()#" CFSQLType="cf_sql_integer" />,
				<cfqueryparam value="#arguments.SettingBean.getImageHeightMedium()#" CFSQLType="cf_sql_integer" />,
				<cfqueryparam value="#arguments.SettingBean.getImageWidthSmall()#" CFSQLType="cf_sql_integer" />,
				<cfqueryparam value="#arguments.SettingBean.getImageHeightSmall()#" CFSQLType="cf_sql_integer" />,
				<cfqueryparam value="#arguments.SettingBean.getImageResizeType()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				<cfqueryparam value="#arguments.SettingBean.getImageAspectType()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				<cfqueryparam value="#arguments.SettingBean.getImageQualityType()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				<cfqueryparam value="#arguments.SettingBean.getImageResizeTypeMedium()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				<cfqueryparam value="#arguments.SettingBean.getImageAspectTypeMedium()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				<cfqueryparam value="#arguments.SettingBean.getImageQualityTypeMedium()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				<cfqueryparam value="#arguments.SettingBean.getImageResizeTypeSmall()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				<cfqueryparam value="#arguments.SettingBean.getImageAspectTypeSmall()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				<cfqueryparam value="#arguments.SettingBean.getImageQualityTypeSmall()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				<cfqueryparam value="#arguments.SettingBean.getImageCropType()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				<cfqueryparam value="#arguments.SettingBean.getImageCropTypeMedium()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				<cfqueryparam value="#arguments.SettingBean.getImageCropTypeSmall()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				<cfqueryparam value="#arguments.SettingBean.getDefaultDisplayTypeID()#" CFSQLType="cf_sql_char" null="#(not len(arguments.SettingBean.getDefaultDisplayTypeID()))#" maxlength="35" />,
				<cfqueryparam value="#arguments.SettingBean.getFileSizeLimit()#" CFSQLType="cf_sql_integer" />,
				<cfqueryparam value="#arguments.SettingBean.getSyncInfo()#" CFSQLType="cf_sql_tinyint" />
				<!---^^SAVEVALUES-END^^--->
				)
		</cfquery>
		<cfreturn true />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="void">
		<cfargument name="SettingBean" type="any" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cfquery name="qRead" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				*,'true' AS BeanExists
			FROM
				#variables.dsnprefix#mg_setting
			WHERE
			0=0
			<!---^^PRIMARYKEYS-START^^--->
				AND SettingsID = <cfqueryparam value="#arguments.SettingBean.getSettingsID()#" CFSQLType="cf_sql_char" maxlength="35" />
			<!---^^PRIMARYKEYS-END^^--->
		</cfquery>

		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset arguments.SettingBean.init(argumentCollection=strReturn)>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="SettingBean" type="any" required="true" />

		<cfset var qUpdate = "" />
		<cfquery name="qUpdate" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			UPDATE
				#variables.dsnprefix#mg_setting
			SET
				<!---^^UPDATEVALUES-START^^--->
				SiteID = <cfqueryparam value="#arguments.SettingBean.getSiteID()#" CFSQLType="cf_sql_varchar" maxlength="25" />,
				DateLastUpdate = <cfqueryparam value="#CreateODBCDateTime(now())#" CFSQLType="cf_sql_timestamp" />,
				IsMaster = <cfqueryparam value="#arguments.SettingBean.getIsMaster()#" CFSQLType="cf_sql_tinyint" />,
				ImageWidth = <cfqueryparam value="#arguments.SettingBean.getImageWidth()#" CFSQLType="cf_sql_integer" />,
				ImageHeight = <cfqueryparam value="#arguments.SettingBean.getImageHeight()#" CFSQLType="cf_sql_integer" />,
				ImageWidthMedium = <cfqueryparam value="#arguments.SettingBean.getImageWidthMedium()#" CFSQLType="cf_sql_integer" />,
				ImageHeightMedium = <cfqueryparam value="#arguments.SettingBean.getImageHeightMedium()#" CFSQLType="cf_sql_integer" />,
				ImageWidthSmall = <cfqueryparam value="#arguments.SettingBean.getImageWidthSmall()#" CFSQLType="cf_sql_integer" />,
				ImageHeightSmall = <cfqueryparam value="#arguments.SettingBean.getImageHeightSmall()#" CFSQLType="cf_sql_integer" />,
				ImageResizeType = <cfqueryparam value="#arguments.SettingBean.getImageResizeType()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				ImageAspectType = <cfqueryparam value="#arguments.SettingBean.getImageAspectType()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				ImageQualityType = <cfqueryparam value="#arguments.SettingBean.getImageQualityType()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				ImageResizeTypeMedium = <cfqueryparam value="#arguments.SettingBean.getImageResizeTypeMedium()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				ImageAspectTypeMedium = <cfqueryparam value="#arguments.SettingBean.getImageAspectTypeMedium()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				ImageQualityTypeMedium = <cfqueryparam value="#arguments.SettingBean.getImageQualityTypeMedium()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				ImageResizeTypeSmall = <cfqueryparam value="#arguments.SettingBean.getImageResizeTypeSmall()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				ImageAspectTypeSmall = <cfqueryparam value="#arguments.SettingBean.getImageAspectTypeSmall()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				ImageQualityTypeSmall = <cfqueryparam value="#arguments.SettingBean.getImageQualityTypeSmall()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				ImageCropType = <cfqueryparam value="#arguments.SettingBean.getImageCropType()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				ImageCropTypeMedium = <cfqueryparam value="#arguments.SettingBean.getImageCropTypeMedium()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				ImageCropTypeSmall = <cfqueryparam value="#arguments.SettingBean.getImageCropTypeSmall()#" CFSQLType="cf_sql_varchar" maxlength="45" />,
				DefaultDisplayTypeID = <cfqueryparam value="#arguments.SettingBean.getDefaultDisplayTypeID()#" CFSQLType="cf_sql_char" null="#(not len(arguments.SettingBean.getDefaultDisplayTypeID()))#" maxlength="35" />,
				FileSizeLimit = <cfqueryparam value="#arguments.SettingBean.getFileSizeLimit()#" CFSQLType="cf_sql_integer" />,
				SyncInfo = <cfqueryparam value="#arguments.SettingBean.getSyncInfo()#" CFSQLType="cf_sql_tinyint" />
				<!---^^UPDATEVALUES-END^^--->
		WHERE
			0=0
			<!---^^PRIMARYKEYS-START^^--->
				AND SettingsID = <cfqueryparam value="#arguments.SettingBean.getSettingsID()#" CFSQLType="cf_sql_char" maxlength="35" />
			<!---^^PRIMARYKEYS-END^^--->
		</cfquery>
		<cfreturn true />
	</cffunction>
	
	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="SettingBean" type="any" required="true" />

		<cfset var qDelete = "">
		<cfquery name="qDelete" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			DELETE FROM
					#variables.dsnprefix#mg_setting
			WHERE
				0=0
			<!---^^PRIMARYKEYS-START^^--->
				AND SettingsID = <cfqueryparam value="#arguments.SettingBean.getSettingsID()#" CFSQLType="cf_sql_char" maxlength="35" />
			<!---^^PRIMARYKEYS-END^^--->
		</cfquery>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="SettingBean" type="any" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				count(1) as idexists
			FROM
				#variables.dsnprefix#mg_setting
			WHERE
				0=0
			<!---^^PRIMARYKEYS-START^^--->
				AND SettingsID = <cfqueryparam value="#arguments.SettingBean.getSettingsID()#" CFSQLType="cf_sql_char" maxlength="35" />
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




