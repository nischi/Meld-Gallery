<!---^^LICENSE-START^^--->
<!---
||MELDGALLERYLICENSE||
--->
<!---^^LICENSE-END^^--->

<cfcomponent displayname="SettingGateway" output="false">
<!---^^GENERATEDSTART^^--->
	<cffunction name="init" access="public" output="false" returntype="SettingGateway">
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
		<cfargument name="SettingsID" type="uuid" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="IsMaster" type="boolean" required="false" />
		<cfargument name="ImageWidth" type="numeric" required="false" />
		<cfargument name="ImageHeight" type="numeric" required="false" />
		<cfargument name="ImageWidthMedium" type="numeric" required="false" />
		<cfargument name="ImageHeightMedium" type="numeric" required="false" />
		<cfargument name="ImageWidthSmall" type="numeric" required="false" />
		<cfargument name="ImageHeightSmall" type="numeric" required="false" />
		<cfargument name="ImageResizeType" type="string" required="false" />
		<cfargument name="ImageAspectType" type="string" required="false" />
		<cfargument name="ImageQualityType" type="string" required="false" />
		<cfargument name="ImageResizeTypeMedium" type="string" required="false" />
		<cfargument name="ImageAspectTypeMedium" type="string" required="false" />
		<cfargument name="ImageQualityTypeMedium" type="string" required="false" />
		<cfargument name="ImageResizeTypeSmall" type="string" required="false" />
		<cfargument name="ImageAspectTypeSmall" type="string" required="false" />
		<cfargument name="ImageQualityTypeSmall" type="string" required="false" />
		<cfargument name="ImageCropType" type="string" required="false" />
		<cfargument name="ImageCropTypeMedium" type="string" required="false" />
		<cfargument name="ImageCropTypeSmall" type="string" required="false" />
		<cfargument name="DefaultDisplayTypeID" type="string" required="false" />
		<cfargument name="FileSizeLimit" type="numeric" required="false" />
		<cfargument name="SyncInfo" type="boolean" required="false" />
		<!---^^ATTRIBUTES-END^^--->
		<cfargument name="orderby" type="string" required="false" />
		<cfset var qList = "" />	
		
		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				*,'true' AS BeanExists
			FROM	#variables.dsnprefix#mg_setting
			WHERE	0=0
		<!---^^VALUES-START^^--->
			<cfif structKeyExists(arguments,"SettingsID") and len(arguments.SettingsID)>
				AND SettingsID = <cfqueryparam value="#arguments.SettingsID#" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments,"SiteID") and len(arguments.SiteID)>
				AND SiteID = <cfqueryparam value="#arguments.SiteID#" CFSQLType="cf_sql_varchar" maxlength="25" />
			</cfif>
			
			<cfif structKeyExists(arguments,"DateCreate") and len(arguments.DateCreate)>
				AND DateCreate = <cfqueryparam value="#arguments.DateCreate#" CFSQLType="cf_sql_timestamp" />
			</cfif>
			
			<cfif structKeyExists(arguments,"DateLastUpdate") and len(arguments.DateLastUpdate)>
				AND DateLastUpdate = <cfqueryparam value="#arguments.DateLastUpdate#" CFSQLType="cf_sql_timestamp" />
			</cfif>
			
			<cfif structKeyExists(arguments,"IsMaster") and len(arguments.IsMaster)>
				AND IsMaster = <cfqueryparam value="#arguments.IsMaster#" CFSQLType="cf_sql_tinyint" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ImageWidth") and len(arguments.ImageWidth)>
				AND ImageWidth = <cfqueryparam value="#arguments.ImageWidth#" CFSQLType="cf_sql_integer" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ImageHeight") and len(arguments.ImageHeight)>
				AND ImageHeight = <cfqueryparam value="#arguments.ImageHeight#" CFSQLType="cf_sql_integer" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ImageWidthMedium") and len(arguments.ImageWidthMedium)>
				AND ImageWidthMedium = <cfqueryparam value="#arguments.ImageWidthMedium#" CFSQLType="cf_sql_integer" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ImageHeightMedium") and len(arguments.ImageHeightMedium)>
				AND ImageHeightMedium = <cfqueryparam value="#arguments.ImageHeightMedium#" CFSQLType="cf_sql_integer" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ImageWidthSmall") and len(arguments.ImageWidthSmall)>
				AND ImageWidthSmall = <cfqueryparam value="#arguments.ImageWidthSmall#" CFSQLType="cf_sql_integer" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ImageHeightSmall") and len(arguments.ImageHeightSmall)>
				AND ImageHeightSmall = <cfqueryparam value="#arguments.ImageHeightSmall#" CFSQLType="cf_sql_integer" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ImageResizeType") and len(arguments.ImageResizeType)>
				AND ImageResizeType = <cfqueryparam value="#arguments.ImageResizeType#" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ImageAspectType") and len(arguments.ImageAspectType)>
				AND ImageAspectType = <cfqueryparam value="#arguments.ImageAspectType#" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ImageQualityType") and len(arguments.ImageQualityType)>
				AND ImageQualityType = <cfqueryparam value="#arguments.ImageQualityType#" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ImageResizeTypeMedium") and len(arguments.ImageResizeTypeMedium)>
				AND ImageResizeTypeMedium = <cfqueryparam value="#arguments.ImageResizeTypeMedium#" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ImageAspectTypeMedium") and len(arguments.ImageAspectTypeMedium)>
				AND ImageAspectTypeMedium = <cfqueryparam value="#arguments.ImageAspectTypeMedium#" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ImageQualityTypeMedium") and len(arguments.ImageQualityTypeMedium)>
				AND ImageQualityTypeMedium = <cfqueryparam value="#arguments.ImageQualityTypeMedium#" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ImageResizeTypeSmall") and len(arguments.ImageResizeTypeSmall)>
				AND ImageResizeTypeSmall = <cfqueryparam value="#arguments.ImageResizeTypeSmall#" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ImageAspectTypeSmall") and len(arguments.ImageAspectTypeSmall)>
				AND ImageAspectTypeSmall = <cfqueryparam value="#arguments.ImageAspectTypeSmall#" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ImageQualityTypeSmall") and len(arguments.ImageQualityTypeSmall)>
				AND ImageQualityTypeSmall = <cfqueryparam value="#arguments.ImageQualityTypeSmall#" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ImageCropType") and len(arguments.ImageCropType)>
				AND ImageCropType = <cfqueryparam value="#arguments.ImageCropType#" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ImageCropTypeMedium") and len(arguments.ImageCropTypeMedium)>
				AND ImageCropTypeMedium = <cfqueryparam value="#arguments.ImageCropTypeMedium#" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ImageCropTypeSmall") and len(arguments.ImageCropTypeSmall)>
				AND ImageCropTypeSmall = <cfqueryparam value="#arguments.ImageCropTypeSmall#" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments,"DefaultDisplayTypeID") and len(arguments.DefaultDisplayTypeID)>
				AND DefaultDisplayTypeID = <cfqueryparam value="#arguments.DefaultDisplayTypeID#" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments,"FileSizeLimit") and len(arguments.FileSizeLimit)>
				AND FileSizeLimit = <cfqueryparam value="#arguments.FileSizeLimit#" CFSQLType="cf_sql_integer" />
			</cfif>
			
			<cfif structKeyExists(arguments,"SyncInfo") and len(arguments.SyncInfo)>
				AND SyncInfo = <cfqueryparam value="#arguments.SyncInfo#" CFSQLType="cf_sql_tinyint" />
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
		<cfargument name="SettingsID" type="uuid" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="IsMaster" type="boolean" required="false" />
		<cfargument name="ImageWidth" type="numeric" required="false" />
		<cfargument name="ImageHeight" type="numeric" required="false" />
		<cfargument name="ImageWidthMedium" type="numeric" required="false" />
		<cfargument name="ImageHeightMedium" type="numeric" required="false" />
		<cfargument name="ImageWidthSmall" type="numeric" required="false" />
		<cfargument name="ImageHeightSmall" type="numeric" required="false" />
		<cfargument name="ImageResizeType" type="string" required="false" />
		<cfargument name="ImageAspectType" type="string" required="false" />
		<cfargument name="ImageQualityType" type="string" required="false" />
		<cfargument name="ImageResizeTypeMedium" type="string" required="false" />
		<cfargument name="ImageAspectTypeMedium" type="string" required="false" />
		<cfargument name="ImageQualityTypeMedium" type="string" required="false" />
		<cfargument name="ImageResizeTypeSmall" type="string" required="false" />
		<cfargument name="ImageAspectTypeSmall" type="string" required="false" />
		<cfargument name="ImageQualityTypeSmall" type="string" required="false" />
		<cfargument name="ImageCropType" type="string" required="false" />
		<cfargument name="ImageCropTypeMedium" type="string" required="false" />
		<cfargument name="ImageCropTypeSmall" type="string" required="false" />
		<cfargument name="DefaultDisplayTypeID" type="string" required="false" />
		<cfargument name="FileSizeLimit" type="numeric" required="false" />
		<cfargument name="SyncInfo" type="boolean" required="false" />
		<!---^^ATTRIBUTES-END^^--->
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var arrObjects = arrayNew(1) />
		<cfset var tmpObj = "" />
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","SettingBean").init(argumentCollection=queryRowToStruct(qList,i)) />
			<cfset arrayAppend(arrObjects,tmpObj) />
		</cfloop>
				
		<cfreturn arrObjects />
	</cffunction>

	<cffunction name="getBeanByAttributes" access="public" output="false" returntype="any">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="SettingsID" type="uuid" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="IsMaster" type="boolean" required="false" />
		<cfargument name="ImageWidth" type="numeric" required="false" />
		<cfargument name="ImageHeight" type="numeric" required="false" />
		<cfargument name="ImageWidthMedium" type="numeric" required="false" />
		<cfargument name="ImageHeightMedium" type="numeric" required="false" />
		<cfargument name="ImageWidthSmall" type="numeric" required="false" />
		<cfargument name="ImageHeightSmall" type="numeric" required="false" />
		<cfargument name="ImageResizeType" type="string" required="false" />
		<cfargument name="ImageAspectType" type="string" required="false" />
		<cfargument name="ImageQualityType" type="string" required="false" />
		<cfargument name="ImageResizeTypeMedium" type="string" required="false" />
		<cfargument name="ImageAspectTypeMedium" type="string" required="false" />
		<cfargument name="ImageQualityTypeMedium" type="string" required="false" />
		<cfargument name="ImageResizeTypeSmall" type="string" required="false" />
		<cfargument name="ImageAspectTypeSmall" type="string" required="false" />
		<cfargument name="ImageQualityTypeSmall" type="string" required="false" />
		<cfargument name="ImageCropType" type="string" required="false" />
		<cfargument name="ImageCropTypeMedium" type="string" required="false" />
		<cfargument name="ImageCropTypeSmall" type="string" required="false" />
		<cfargument name="DefaultDisplayTypeID" type="string" required="false" />
		<cfargument name="FileSizeLimit" type="numeric" required="false" />
		<cfargument name="SyncInfo" type="boolean" required="false" />
		<!---^^ATTRIBUTES-END^^--->
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		

		<cfif qList.recordCount>
			<cfreturn createObject("component","SettingBean").init(argumentCollection=queryRowToStruct(qList))>
		<cfelse>
			<cfreturn createObject("component","SettingBean").init()>
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
				#variables.dsnprefix#mg_setting
			WHERE
			SettingsID IN (<cfqueryparam value="#IDList#" CFSQLType="cf_sql_char" list="true" />)
		</cfquery>
		
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","SettingBean").init(argumentCollection=queryRowToStruct(qList,i)) />
			<cfset strObjects[qList.SettingsID[i]] = tmpObj />
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
					COUNT(SettingsID) AS total
				<cfelse>
					*
				</cfif>
			FROM	#variables.dsnprefix#mg_setting
			WHERE
				0=0
				<!---^^SEARCH-START^^--->
			<cfif structKeyExists(arguments.criteria,"SettingsID") and len(arguments.criteria.SettingsID)>
			AND SettingsID LIKE <cfqueryparam value="%#arguments.criteria.SettingsID#%" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"SiteID") and len(arguments.criteria.SiteID)>
			AND SiteID LIKE <cfqueryparam value="%#arguments.criteria.SiteID#%" CFSQLType="cf_sql_varchar" maxlength="25" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"DateCreate") and len(arguments.criteria.DateCreate)>
			AND DateCreate LIKE <cfqueryparam value="%#arguments.criteria.DateCreate#%" CFSQLType="cf_sql_timestamp" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"DateLastUpdate") and len(arguments.criteria.DateLastUpdate)>
			AND DateLastUpdate LIKE <cfqueryparam value="%#arguments.criteria.DateLastUpdate#%" CFSQLType="cf_sql_timestamp" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"IsMaster") and len(arguments.criteria.IsMaster)>
			AND IsMaster = <cfqueryparam value="#arguments.criteria.IsMaster#" CFSQLType="cf_sql_tinyint" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"ImageWidth") and len(arguments.criteria.ImageWidth)>
			AND ImageWidth = <cfqueryparam value="#arguments.criteria.ImageWidth#" CFSQLType="cf_sql_integer" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"ImageHeight") and len(arguments.criteria.ImageHeight)>
			AND ImageHeight = <cfqueryparam value="#arguments.criteria.ImageHeight#" CFSQLType="cf_sql_integer" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"ImageWidthMedium") and len(arguments.criteria.ImageWidthMedium)>
			AND ImageWidthMedium = <cfqueryparam value="#arguments.criteria.ImageWidthMedium#" CFSQLType="cf_sql_integer" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"ImageHeightMedium") and len(arguments.criteria.ImageHeightMedium)>
			AND ImageHeightMedium = <cfqueryparam value="#arguments.criteria.ImageHeightMedium#" CFSQLType="cf_sql_integer" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"ImageWidthSmall") and len(arguments.criteria.ImageWidthSmall)>
			AND ImageWidthSmall = <cfqueryparam value="#arguments.criteria.ImageWidthSmall#" CFSQLType="cf_sql_integer" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"ImageHeightSmall") and len(arguments.criteria.ImageHeightSmall)>
			AND ImageHeightSmall = <cfqueryparam value="#arguments.criteria.ImageHeightSmall#" CFSQLType="cf_sql_integer" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"ImageResizeType") and len(arguments.criteria.ImageResizeType)>
			AND ImageResizeType LIKE <cfqueryparam value="%#arguments.criteria.ImageResizeType#%" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"ImageAspectType") and len(arguments.criteria.ImageAspectType)>
			AND ImageAspectType LIKE <cfqueryparam value="%#arguments.criteria.ImageAspectType#%" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"ImageQualityType") and len(arguments.criteria.ImageQualityType)>
			AND ImageQualityType LIKE <cfqueryparam value="%#arguments.criteria.ImageQualityType#%" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"ImageResizeTypeMedium") and len(arguments.criteria.ImageResizeTypeMedium)>
			AND ImageResizeTypeMedium LIKE <cfqueryparam value="%#arguments.criteria.ImageResizeTypeMedium#%" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"ImageAspectTypeMedium") and len(arguments.criteria.ImageAspectTypeMedium)>
			AND ImageAspectTypeMedium LIKE <cfqueryparam value="%#arguments.criteria.ImageAspectTypeMedium#%" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"ImageQualityTypeMedium") and len(arguments.criteria.ImageQualityTypeMedium)>
			AND ImageQualityTypeMedium LIKE <cfqueryparam value="%#arguments.criteria.ImageQualityTypeMedium#%" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"ImageResizeTypeSmall") and len(arguments.criteria.ImageResizeTypeSmall)>
			AND ImageResizeTypeSmall LIKE <cfqueryparam value="%#arguments.criteria.ImageResizeTypeSmall#%" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"ImageAspectTypeSmall") and len(arguments.criteria.ImageAspectTypeSmall)>
			AND ImageAspectTypeSmall LIKE <cfqueryparam value="%#arguments.criteria.ImageAspectTypeSmall#%" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"ImageQualityTypeSmall") and len(arguments.criteria.ImageQualityTypeSmall)>
			AND ImageQualityTypeSmall LIKE <cfqueryparam value="%#arguments.criteria.ImageQualityTypeSmall#%" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"ImageCropType") and len(arguments.criteria.ImageCropType)>
			AND ImageCropType LIKE <cfqueryparam value="%#arguments.criteria.ImageCropType#%" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"ImageCropTypeMedium") and len(arguments.criteria.ImageCropTypeMedium)>
			AND ImageCropTypeMedium LIKE <cfqueryparam value="%#arguments.criteria.ImageCropTypeMedium#%" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"ImageCropTypeSmall") and len(arguments.criteria.ImageCropTypeSmall)>
			AND ImageCropTypeSmall LIKE <cfqueryparam value="%#arguments.criteria.ImageCropTypeSmall#%" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"DefaultDisplayTypeID") and len(arguments.criteria.DefaultDisplayTypeID)>
			AND DefaultDisplayTypeID LIKE <cfqueryparam value="%#arguments.criteria.DefaultDisplayTypeID#%" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"FileSizeLimit") and len(arguments.criteria.FileSizeLimit)>
			AND FileSizeLimit = <cfqueryparam value="#arguments.criteria.FileSizeLimit#" CFSQLType="cf_sql_integer" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"SyncInfo") and len(arguments.criteria.SyncInfo)>
			AND SyncInfo = <cfqueryparam value="#arguments.criteria.SyncInfo#" CFSQLType="cf_sql_tinyint" />
			</cfif>
			<!---^^SEARCH-END^^--->									
			<cfif not arguments.isCount AND len( arguments.orderBy )>
				ORDER BY #rereplace(arguments.orderby,";.*","")#
			</cfif>
			<cfif not arguments.isCount and arguments.size gt 0 AND variables.dsntype eq "mysql">
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

	<cffunction name="createBaseSiteSettings" access="public" output="false" returntype="any">
		<cfargument name="siteID" type="string" required="true" />

		<cfset var settingBean		= "" />
		<cfset var qList			= "" />		

		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				siteID
			FROM	#variables.dsnprefix#mg_setting
			WHERE
				SiteID = <cfqueryparam value="#arguments.SiteID#" CFSQLType="cf_sql_varchar" maxlength="25" />
		</cfquery>
		
		<cfif qList.recordCount>
			<cfreturn getBeanByAttributes( siteID='default' ) />
		</cfif>
	
		<cfset settingBean = getBeanByAttributes( siteID='default' ) />

		<cfset settingBean.setSettingsID( createUUID() ) />
		<cfset settingBean.setSiteID( arguments.siteID ) />
		<cfset getSettingDAO().save( settingBean ) />

		<cfreturn settingBean />
	</cffunction>

	<cffunction name="setSettingDAO" access="public" returntype="void" output="false">
		<cfargument name="SettingDAO" type="any" required="true" />
		<cfset variables.instance.SettingDAO = arguments.SettingDAO />
	</cffunction>
	<cffunction name="getSettingDAO" access="public" returntype="any" output="false">
		<cfreturn variables.instance.SettingDAO />
	</cffunction>
<!---^^CUSTOMEND^^--->
</cfcomponent>	



