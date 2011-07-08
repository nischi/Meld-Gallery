<!---^^LICENSE-START^^--->
	<!---
||MELDGALLERYLICENSE||
--->
<!---^^LICENSE-END^^--->

<cfcomponent displayname="ImageGateway" output="false">
<!---^^GENERATEDSTART^^--->
	<cffunction name="init" access="public" output="false" returntype="ImageGateway">
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
		<cfargument name="ImageID" type="uuid" required="false" />
		<cfargument name="FileID" type="string" required="false" />
		<cfargument name="Caption" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="Tags" type="string" required="false" />
		<cfargument name="CategoryID" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="LinkURL" type="string" required="false" />
		<cfargument name="FriendlyName" type="string" required="false" />
		<cfargument name="IsActive" type="boolean" required="false" />
		<cfargument name="Type" type="string" required="false" />
		<cfargument name="AdminID" type="string" required="false" />
		<cfargument name="Summary" type="string" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="RemoteID" type="string" required="false" />
		<!---^^ATTRIBUTES-END^^--->
		<cfargument name="orderby" type="string" required="false" />
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				*,'true' AS BeanExists
			FROM	#variables.dsnprefix#mg_image
			WHERE	0=0
		<!---^^VALUES-START^^--->
			<cfif structKeyExists(arguments,"ImageID") and len(arguments.ImageID)>
				AND ImageID = <cfqueryparam value="#arguments.ImageID#" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments,"FileID") and len(arguments.FileID)>
				AND FileID = <cfqueryparam value="#arguments.FileID#" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments,"Caption") and len(arguments.Caption)>
				AND Caption = <cfqueryparam value="#arguments.Caption#" CFSQLType="cf_sql_varchar" maxlength="150" />
			</cfif>
			
			<cfif structKeyExists(arguments,"Description") and len(arguments.Description)>
				AND Description = <cfqueryparam value="#arguments.Description#" CFSQLType="cf_sql_longvarchar" />
			</cfif>
			
			<cfif structKeyExists(arguments,"Tags") and len(arguments.Tags)>
				AND Tags = <cfqueryparam value="#arguments.Tags#" CFSQLType="cf_sql_varchar" maxlength="255" />
			</cfif>
			
			<cfif structKeyExists(arguments,"CategoryID") and len(arguments.CategoryID)>
				AND CategoryID = <cfqueryparam value="#arguments.CategoryID#" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments,"DateCreate") and len(arguments.DateCreate)>
				AND DateCreate = <cfqueryparam value="#arguments.DateCreate#" CFSQLType="cf_sql_timestamp" />
			</cfif>
			
			<cfif structKeyExists(arguments,"DateLastUpdate") and len(arguments.DateLastUpdate)>
				AND DateLastUpdate = <cfqueryparam value="#arguments.DateLastUpdate#" CFSQLType="cf_sql_timestamp" />
			</cfif>
			
			<cfif structKeyExists(arguments,"SiteID") and len(arguments.SiteID)>
				AND SiteID = <cfqueryparam value="#arguments.SiteID#" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments,"LinkURL") and len(arguments.LinkURL)>
				AND LinkURL = <cfqueryparam value="#arguments.LinkURL#" CFSQLType="cf_sql_varchar" maxlength="150" />
			</cfif>
			
			<cfif structKeyExists(arguments,"FriendlyName") and len(arguments.FriendlyName)>
				AND FriendlyName = <cfqueryparam value="#arguments.FriendlyName#" CFSQLType="cf_sql_varchar" maxlength="150" />
			</cfif>
			
			<cfif structKeyExists(arguments,"IsActive") and len(arguments.IsActive)>
				AND IsActive = <cfqueryparam value="#arguments.IsActive#" CFSQLType="cf_sql_tinyint" />
			</cfif>
			
			<cfif structKeyExists(arguments,"Type") and len(arguments.Type)>
				AND Type = <cfqueryparam value="#arguments.Type#" CFSQLType="cf_sql_varchar" maxlength="10" />
			</cfif>
			
			<cfif structKeyExists(arguments,"AdminID") and len(arguments.AdminID)>
				AND AdminID = <cfqueryparam value="#arguments.AdminID#" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments,"Summary") and len(arguments.Summary)>
				AND Summary = <cfqueryparam value="#arguments.Summary#" CFSQLType="cf_sql_longvarchar" />
			</cfif>
			
			<cfif structKeyExists(arguments,"Name") and len(arguments.Name)>
				AND Name = <cfqueryparam value="#arguments.Name#" CFSQLType="cf_sql_varchar" maxlength="150" />
			</cfif>
			
			<cfif structKeyExists(arguments,"RemoteID") and len(arguments.RemoteID)>
				AND RemoteID = <cfqueryparam value="#arguments.RemoteID#" CFSQLType="cf_sql_char" maxlength="35" />
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
		<cfargument name="ImageID" type="uuid" required="false" />
		<cfargument name="FileID" type="string" required="false" />
		<cfargument name="Caption" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="Tags" type="string" required="false" />
		<cfargument name="CategoryID" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="LinkURL" type="string" required="false" />
		<cfargument name="FriendlyName" type="string" required="false" />
		<cfargument name="IsActive" type="boolean" required="false" />
		<cfargument name="Type" type="string" required="false" />
		<cfargument name="AdminID" type="string" required="false" />
		<cfargument name="Summary" type="string" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="RemoteID" type="string" required="false" />
		<!---^^ATTRIBUTES-END^^--->
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var arrObjects = arrayNew(1) />
		<cfset var tmpObj = "" />
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","ImageBean").init(argumentCollection=queryRowToStruct(qList,i)) />
			<cfset arrayAppend(arrObjects,tmpObj) />
		</cfloop>
				
		<cfreturn arrObjects />
	</cffunction>

	<cffunction name="getBeanByAttributes" access="public" output="false" returntype="any">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="ImageID" type="uuid" required="false" />
		<cfargument name="FileID" type="string" required="false" />
		<cfargument name="Caption" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="Tags" type="string" required="false" />
		<cfargument name="CategoryID" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="LinkURL" type="string" required="false" />
		<cfargument name="FriendlyName" type="string" required="false" />
		<cfargument name="IsActive" type="boolean" required="false" />
		<cfargument name="Type" type="string" required="false" />
		<cfargument name="AdminID" type="string" required="false" />
		<cfargument name="Summary" type="string" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="RemoteID" type="string" required="false" />
		<!---^^ATTRIBUTES-END^^--->
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		

		<cfif qList.recordCount>
			<cfreturn createObject("component","ImageBean").init(argumentCollection=queryRowToStruct(qList))>
		<cfelse>
			<cfreturn createObject("component","ImageBean").init()>
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
				#variables.dsnprefix#mg_image
			WHERE
			ImageID IN (<cfqueryparam value="#IDList#" CFSQLType="cf_sql_char" list="true" />)
		</cfquery>
		
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","ImageBean").init(argumentCollection=queryRowToStruct(qList,i)) />
			<cfset strObjects[qList.ImageID[i]] = tmpObj />
		</cfloop>
		
		<cfreturn strObjects />
	</cffunction>
	
	<cffunction name="search" access="public" output="false" returntype="any">
		<cfargument name="criteria" type="struct" required="true" />
		<cfargument name="fieldList" type="string" required="true" />
		<cfargument name="start" type="numeric" required="false" default="0"/>
		<cfargument name="size" type="numeric" required="false" default="25"/>
		<cfargument name="orderby" type="string" required="false" default=""/>
		<cfargument name="isCount" type="boolean" required="false" default="false"/>
		
		<cfset var arrObjects		= ArrayNew(1)>
		<cfset var qList			= "" />
		<cfset var qExclude			= "" />		
		<cfset var qKeep			= "" />		
		<cfset var returnFields		= arguments.fieldList />
		<cfset var tmpObj			= "" />
		<cfset var criteriaArray	= ArrayNew(1) />

		<cfif structKeyExists(criteria,"selectedlist")>
			<cfset criteriaArray = deserializeJSON( rereplacenocase(criteria.selectedlist,"grp","","all") ) />
		</cfif>

		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				<cfif not arguments.isCount and arguments.size gt 0 AND variables.dsntype eq "mssql"> 	
					TOP #Ceiling(Val(arguments.start+arguments.size))#
				</cfif>
				<cfif arguments.isCount>
					COUNT(ImageID) AS total
				<cfelse>
					#arguments.fieldList#
				</cfif>
			FROM	#variables.dsnprefix#mg_image
			WHERE
				0=0
			<cfif structKeyExists(arguments.criteria,"Name") and len(arguments.criteria.Name)>
			AND Name LIKE <cfqueryparam value="%#arguments.criteria.Name#%" CFSQLType="cf_sql_varchar" maxlength="150" />
			</cfif>

			<cfif structKeyExists(arguments.criteria,"Caption") and len(arguments.criteria.Caption)>
			AND Caption LIKE <cfqueryparam value="%#arguments.criteria.Caption#%" CFSQLType="cf_sql_varchar" maxlength="150" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"Description") and len(arguments.criteria.Description)>
			AND Description LIKE <cfqueryparam value="%#arguments.criteria.Description#%" CFSQLType="cf_sql_longvarchar" />
			</cfif>

			<cfif structKeyExists(arguments.criteria,"selected") and len(arguments.criteria.selected)>
				<cfif arguments.criteria.selected eq 0>
					AND imageID NOT IN (<cfqueryparam value="#ArrayToList(criteriaArray)#" CFSQLType="cf_sql_char" maxlength="35" list="true" />)
				<cfelse>
					AND imageID IN (<cfqueryparam value="#ArrayToList(criteriaArray)#" CFSQLType="cf_sql_char" maxlength="35" list="true" />)
				</cfif>
			</cfif>

			
			<cfif structKeyExists(arguments.criteria,"Tags") and len(arguments.criteria.Tags)>
			AND Tags LIKE <cfqueryparam value="%#arguments.criteria.Tags#%" CFSQLType="cf_sql_varchar" maxlength="255" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"idList") and len(arguments.criteria.idList)>
			AND	ImageID IN (<cfqueryparam value="#arguments.criteria.idList#" CFSQLType="cf_sql_char" list="true" />)
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"ContentID") and len(arguments.criteria.ContentID)>
			AND	ContentID = <cfqueryparam value="#arguments.criteria.ContentID#" CFSQLType="cf_sql_char" />
			</cfif>
		
			<cfif structKeyExists(arguments.criteria,"Any") and len(arguments.criteria.Any)>
			AND
				(
				Caption LIKE <cfqueryparam value="%#arguments.criteria.Any#%" CFSQLType="cf_sql_varchar" maxlength="150" />
				OR
				Name LIKE <cfqueryparam value="%#arguments.criteria.Any#%" CFSQLType="cf_sql_varchar" maxlength="150" />
				OR
				Description LIKE <cfqueryparam value="%#arguments.criteria.Any#%" CFSQLType="cf_sql_longvarchar" />
				OR
				Tags LIKE <cfqueryparam value="%#arguments.criteria.Any#%" CFSQLType="cf_sql_varchar" maxlength="255" />
				)
			</cfif>
						
			AND SiteID = <cfqueryparam value="#arguments.criteria.SiteID#" CFSQLType="cf_sql_varchar" maxlength="45" />
			
			<cfif structKeyExists(arguments.criteria,"isActive") and len(arguments.criteria.isActive)>
			AND isActive = <cfqueryparam value="#arguments.criteria.isActive#" CFSQLType="cf_sql_tinyint" />
			<cfelse>
			AND isActive = <cfqueryparam value="1" CFSQLType="cf_sql_tinyint" />
			</cfif>

			<cfif not arguments.isCount AND len( arguments.orderBy )>
				ORDER BY #rereplace(arguments.orderby,";.*","")#
			</cfif>
			<cfif not arguments.isCount and arguments.size gt 0 AND variables.dsntype eq "mysql">
				LIMIT <cfqueryparam value="#arguments.start#" CFSQLType="cf_sql_integer" />,<cfqueryparam value="#arguments.size#" CFSQLType="cf_sql_integer" />
			</cfif>
		</cfquery>

		<!--- if this is a MS SQL db, we have more work to do --->
		<cfif not arguments.isCount AND variables.dsntype eq "mssql" AND arguments.start gt 0>
			<cfquery name="qExclude" dbtype="query" maxrows="#arguments.start#" >  
	        	SELECT
					imageID  
				FROM
					qList    
			</cfquery>
			
			<cfquery name="qKeep" dbtype="query" maxrows="#arguments.count#">  
				SELECT
					*  
				FROM  
					qList  
				WHERE  
					imageID NOT IN (<cfqueryparam value="#valueList(qExclude.imageID)#" list="true" />)  
			</cfquery> 

			<cfset qList = qKeep> 
		</cfif>

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
				stReturn[lcase(cols[ii])] = qry[cols[ii]][row];
			}		
			//return the struct
			return stReturn;
		</cfscript>
	</cffunction>
<!---^^GENERATEDEND^^--->
<!---^^CUSTOMSTART^^--->
	<cffunction name="getImagesInDisplay" access="public" output="false" returntype="Array" >
		<cfargument name="DisplayBean" type="any" required="true" />
		<cfargument name="ImageGroupBean" type="any" required="true" />
		<cfargument name="LargeImageRenderBean" type="any" required="false" />
		<cfargument name="MediumImageRenderBean" type="any" required="false" />
		<cfargument name="SmallImageRenderBean" type="any" required="false" />
		<cfargument name="start" type="numeric" required="false" default="0"/>
		<cfargument name="size" type="numeric" required="false" default="10"/>
		<cfargument name="count" type="numeric" required="false" default="0"/>
		<cfargument name="isCount" type="numeric" required="false" default="false" />
		<cfargument name="orderby" type="string" required="false" default="caption" />

		<cfset var arrObjects		= ArrayNew(1)>
		<cfset var qList			= "" />
		<cfset var qExclude			= "" />		
		<cfset var qKeep			= "" />		
		<cfset var tmpObj			= "" />
		<cfset var sArgs			= StructNew() />
		<cfset var displayFileID	= "" />

		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				<cfif not arguments.isCount and arguments.size gt 0 AND variables.dsntype eq "mssql"> 	
					TOP #Ceiling(Val(arguments.start+arguments.size))#
				</cfif>
				<cfif arguments.isCount>
					COUNT(ImageID) AS total
				<cfelse>
					i.*,igi.imageGroupID,di.fileID AS DisplayFileID
				</cfif>
			FROM
				#variables.dsnprefix#mg_image i
			JOIN
				#variables.dsnprefix#mg_imagegroupimage igi
			ON
				(
				igi.imageID = i.imageID
				)
			LEFT JOIN
				#variables.dsnprefix#mg_displayimage di
			ON
				(
				i.imageID = di.imageID
				AND
				di.displayID = <cfqueryparam value="#arguments.displayBean.getDisplayID()#" CFSQLType="cf_sql_char" maxlength="35" />
				AND
				di.isValid = 1
				)
			WHERE
				igi.imageGroupID = <cfqueryparam value="#arguments.ImageGroupBean.getImageGroupID()#" CFSQLType="cf_sql_char" maxlength="35" /> 
			AND
				i.isActive = 1
			ORDER BY
				igi.orderNo
			<cfif not arguments.isCount and arguments.size gt 0 AND variables.dsntype eq "mysql">
				LIMIT <cfqueryparam value="#arguments.start#" CFSQLType="cf_sql_integer" />,<cfqueryparam value="#arguments.size#" CFSQLType="cf_sql_integer" />
			</cfif>
		</cfquery>

		<!--- if this is a MS SQL db, we have more work to do --->
		<cfif not arguments.isCount AND variables.dsntype eq "mssql" AND arguments.start gt 0>
			<cfquery name="qExclude" dbtype="query" maxrows="#arguments.start#" >  
	        	SELECT
					imageID  
				FROM
					qList    
			</cfquery>
			
			<cfquery name="qKeep" dbtype="query" maxrows="#arguments.count#">  
				SELECT
					*  
				FROM  
					qList  
				WHERE  
					imageID NOT IN (<cfqueryparam value="#valueList(qExclude.imageID)#" list="true" />)  
			</cfquery> 

			<cfset qList = qKeep> 
		</cfif>

		<!--- we do not create beans here, in the interest of speed --->
		<cfif arguments.isCount>
			<cfreturn qList.total >
		<cfelse>
			<cfset sArgs = StructNew() />
			<cfset sArgs.displayID = arguments.DisplayBean.getDisplayID() />

			<cfset sArgs.LargeImageRenderBean = arguments.LargeImageRenderBean />
			<cfif structKeyExists(arguments,"MediumImageRenderBean")>
				<cfset sArgs.MediumImageRenderBean = arguments.MediumImageRenderBean />
			</cfif>
			<cfif structKeyExists(arguments,"SmallImageRenderBean")>
				<cfset sArgs.SmallImageRenderBean = arguments.SmallImageRenderBean />
			</cfif>

			<cfloop from="1" to="#qList.recordCount#" index="i">
				<cfset tmpObj = createObject("component","ImageBean").init(argumentCollection=queryRowToStruct(qList,i)) />

				<cfset sArgs.imageID = tmpObj.getImageID() />
				<cfset sArgs.fileID = tmpObj.getFileID() />
				
				<!--- not set, either because cut image doesn't exist or was invalidated --->
				<cfif not len( tmpObj.getDisplayFileID() )>
					<cfset displayFileID = getNewDisplayFileID( argumentCollection=sArgs ) />
					<cfset tmpObj.setDisplayFileID( displayFileID ) />
				</cfif>
				<cfset arrayAppend(arrObjects,tmpObj) />
			</cfloop>
		</cfif>
		<cfreturn arrObjects />
	</cffunction>

	<cffunction name="renderImage" access="public" output="false" returntype="any">
		<cfargument name="ConfigBean" type="any" required="true" />
		<cfargument name="ImageBean" type="any" required="true" />
		<cfargument name="fileID" type="string" required="true">
		<cfargument name="width" type="int" required="false">
		<cfargument name="height" type="int" required="false">
		<cfargument name="resizeType" type="string" required="false">
		<cfargument name="aspectType" type="string" required="false">
		<cfargument name="cropType" type="string" required="false">
		<cfargument name="qualityType" type="string" required="false">

		<cfset var sArgs			= StructNew() />
		<cfset var settingsBean		= getMeldGalleryManager().getSiteSettings( arguments.imageBean.getSiteID() ) />
		<cfset var imageRenderBean	= "" />
		<cfset var tempFileID		= "" />
		
		<cfset sArgs.width			= iif( structKeyExists(arguments,"width"), de( arguments.width), de( settingsBean.getImageWidthMedium() ) ) />
		<cfset sArgs.height			= iif( structKeyExists(arguments,"height"), de( arguments.height), de( settingsBean.getImageHeightMedium() ) ) />
		<cfset sArgs.qualityType	= iif( structKeyExists(arguments,"qualityType"), de( arguments.qualityType), de( settingsBean.getImageQualityTypeMedium() ) ) />
		<cfset sArgs.resizeType		= iif( structKeyExists(arguments,"resizeType"), de( arguments.resizeType), de( settingsBean.getImageresizeTypeMedium() ) ) />
		<cfset sArgs.aspectType		= iif( structKeyExists(arguments,"aspectType"), de( arguments.aspectType), de( settingsBean.getImageaspectTypeMedium() ) ) />
		<cfset sArgs.cropType		= iif( structKeyExists(arguments,"cropType"), de( arguments.cropType), de( settingsBean.getImagecropTypeMedium() ) ) />

		<cfset imageRenderBean		= getmmImageRenderer().createImageRenderBean( argumentCollection=sArgs ) />

		<cfset sArgs						= StructNew() />
		<cfset sArgs.fileID					= imageBean.getFileID() />
		<cfset sArgs.contentID				= imageBean.getImageID() />
		<cfset sArgs.LargeImageRenderBean	= imageRenderBean />
		<cfset sArgs.MuraFileID				= arguments.fileID />

		<cfset tempFileID = getmmFileUpload().processLocalImage( argumentCollection=sArgs ) />

		<cfreturn imageRenderBean />
	</cffunction>

	<cffunction name="getNewDisplayFileID" access="public" output="false" returntype="string" >
		<cfargument name="displayID" type="uuid" required="true" />
		<cfargument name="imageID" type="uuid" required="true" />
		<cfargument name="fileID" type="uuid" required="true" />
		<cfargument name="LargeImageRenderBean" type="any" required="false" />
		<cfargument name="MediumImageRenderBean" type="any" required="false" />
		<cfargument name="SmallImageRenderBean" type="any" required="false" />
		<cfargument name="isExternal" type="boolean" required="false" default="0" />
		<cfargument name="contentID" type="uuid" required="false" />
		<cfargument name="isMuraGallery" type="boolean" required="false" default="0" />

		<cfset var displayImageBean = "" />
		<cfset var sArgs			= StructNew()/>

		<cfset sArgs.displayID		= arguments.displayID />
		<cfset sArgs.imageID		= arguments.imageID />

		<cfset displayImageBean = getDisplayImageService().getDisplayImageByImageID( argumentCollection=sArgs ) />

		<cfif not displayImageBean.beanExists()>
			<cfset displayImageBean = getDisplayImageService().createDisplayImage( argumentCollection=sArgs ) />
		</cfif>

		<cfset displayImageBean.setIsExternal( arguments.isExternal ) />
		<cfset displayImageBean.setIsMuraGallery( arguments.isMuraGallery ) />
		
		<cfif StructKeyExists(arguments,"contentID") and len(arguments.contentID)>
			<cfset sArgs.contentID = arguments.contentID />
		<cfelse>
			<cfset sArgs.contentID = displayImageBean.getDisplayImageID() />
		</cfif>
		
		<cfset sArgs.fileID							= arguments.fileID />
		<cfif structKeyExists( arguments,"LargeImageRenderBean" )>
			<cfset sArgs.LargeImageRenderBean			= arguments.LargeImageRenderBean />
		</cfif>
		<cfif structKeyExists( arguments,"MediumImageRenderBean" )>
			<cfset sArgs.MediumImageRenderBean			= arguments.MediumImageRenderBean />
		</cfif>
		<cfif structKeyExists( arguments,"SmallImageRenderBean" )>
			<cfset sArgs.SmallImageRenderBean			= arguments.SmallImageRenderBean />
		</cfif>
	
		<cfset displayFileID = getmmFileUpload().processLocalImage( argumentCollection=sArgs ) />
		
		<cfif displayImageBean.beanExists()>
			<cfif len( displayImageBean.getFileID() )>
				<cfset getmmFileUpload().deleteFileByFileID( displayImageBean.getFileID() ) />
			</cfif>
			<cfset displayImageBean.setFileID( displayFileID ) />
			<cfset displayImageBean.setIsValid( 1 ) />
			<cfset displayImageBean.setIsProcessed( 1 ) />
			<cfset getDisplayImageService().updateDisplayImage( displayImageBean ) />
		<cfelse>
			<cfset displayImageBean.setFileID( displayFileID ) />
			<cfset displayImageBean.setIsValid( 1 ) />
			<cfset displayImageBean.setIsProcessed( 1 ) />
			<cfset getDisplayImageService().saveDisplayImage( displayImageBean ) />
		</cfif>

		<cfreturn displayFileID />
	</cffunction>


	<cffunction name="cleanImages" access="public" output="false" returntype="void">
		<cfargument name="fileID" type="uuid" required="true" />
		<cfargument name="siteID" type="string" required="true" />

		<cfset var qList			= "" />
		<cfset var qDelete			= "" />
		<cfset var qClean			= "" />
		<cfset var settingsBean		= getMeldGalleryManager().getSiteSettings( arguments.siteID ) />

		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				imageID,fileID,siteID
			FROM
				#variables.dsnprefix#mg_image
			WHERE
				fileID = <cfqueryparam value="#arguments.fileID#" maxlength="35" cfsqltype="cf_sql_char"  />
			OR
				remoteID = <cfqueryparam value="#arguments.fileID#" maxlength="35" cfsqltype="cf_sql_char"  />
		</cfquery>
		
		<cfloop query="qList">
			<cfquery name="qDelete" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
				SELECT
					fileID
				FROM
					#variables.dsnprefix#mg_displayimage
				WHERE
					imageID = <cfqueryparam value="#qList.imageID#" maxlength="35" cfsqltype="cf_sql_char"  />
			</cfquery>
		
			<cfloop query="qDelete">
				<cfset getmmFileUpload().deleteFileByFileID( qDelete.fileID ) />
			</cfloop>

			<cfquery name="qClean" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
				DELETE
				FROM
					#variables.dsnprefix#mg_displayimage
				WHERE
					imageID = <cfqueryparam value="#qList.imageID#" maxlength="35" cfsqltype="cf_sql_char"  />
			</cfquery>
		
			<cfif settingsBean.getSyncInfo()>
				<cfset getmmFileUpload().deleteFileByFileID(  qList.fileID ) />
			</cfif>	
		</cfloop>

		<cfif settingsBean.getSyncInfo()>
			<cfquery name="qClean" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
				DELETE
				FROM
					#variables.dsnprefix#mg_image
				WHERE
					fileID = <cfqueryparam value="#arguments.fileID#" maxlength="35" cfsqltype="cf_sql_char"  />
				OR
					remoteID = <cfqueryparam value="#arguments.fileID#" maxlength="35" cfsqltype="cf_sql_char"  />
			</cfquery>
		</cfif>
	</cffunction>


<!---^^CUSTOMEND^^--->

	<cffunction name="setMeldGalleryManager" access="public" returntype="void" output="false">
		<cfargument name="MeldGalleryManager" type="any" required="true" />
		<cfset variables.instance.MeldGalleryManager = arguments.MeldGalleryManager />
	</cffunction>
	<cffunction name="getMeldGalleryManager" access="public" returntype="any" output="false">
		<cfreturn variables.instance.MeldGalleryManager />
	</cffunction>

	<cffunction name="setdisplayImageService" access="public" returntype="void" output="false">
		<cfargument name="displayImageService" type="any" required="true" />
		<cfset variables.instance.displayImageService = arguments.displayImageService />
	</cffunction>
	<cffunction name="getdisplayImageService" access="public" returntype="any" output="false">
		<cfreturn variables.instance.displayImageService />
	</cffunction>

	<cffunction name="setmmImageRenderer" access="public" returntype="void" output="false">
		<cfargument name="mmImageRenderer" type="any" required="true" />
		<cfset variables.instance.mmImageRenderer = arguments.mmImageRenderer />
	</cffunction>
	<cffunction name="getmmImageRenderer" access="public" returntype="any" output="false">
		<cfreturn variables.instance.mmImageRenderer />
	</cffunction>

	<cffunction name="setmmFileUpload" access="public" returntype="void" output="false">
		<cfargument name="mmFileUpload" type="any" required="true" />
		<cfset variables.instance.mmFileUpload = arguments.mmFileUpload />
	</cffunction>
	<cffunction name="getmmFileUpload" access="public" returntype="any" output="false">
		<cfreturn variables.instance.mmFileUpload />
	</cffunction>
</cfcomponent>	




