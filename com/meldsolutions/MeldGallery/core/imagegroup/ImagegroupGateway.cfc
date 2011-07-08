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
<cfcomponent displayname="ImageGroupGateway" output="false">
<!---^^GENERATEDSTART^^--->
	<cffunction name="init" access="public" output="false" returntype="ImageGroupGateway">
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
		<cfargument name="ImageGroupID" type="uuid" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="AdminID" type="string" required="false" />
		<cfargument name="Tags" type="string" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="IsActive" type="boolean" required="false" />
		<!---^^ATTRIBUTES-END^^--->
		<cfargument name="orderby" type="string" required="false" />
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				*,'true' AS BeanExists
			FROM	#variables.dsnprefix#mg_imagegroup
			WHERE	0=0
		<!---^^VALUES-START^^--->
			<cfif structKeyExists(arguments,"ImageGroupID") and len(arguments.ImageGroupID)>
				AND ImageGroupID = <cfqueryparam value="#arguments.ImageGroupID#" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments,"Name") and len(arguments.Name)>
				AND Name = <cfqueryparam value="#arguments.Name#" CFSQLType="cf_sql_varchar" maxlength="145" />
			</cfif>
			
			<cfif structKeyExists(arguments,"Description") and len(arguments.Description)>
				AND Description = <cfqueryparam value="#arguments.Description#" CFSQLType="cf_sql_varchar" maxlength="255" />
			</cfif>
			
			<cfif structKeyExists(arguments,"DateCreate") and len(arguments.DateCreate)>
				AND DateCreate = <cfqueryparam value="#arguments.DateCreate#" CFSQLType="cf_sql_timestamp" />
			</cfif>
			
			<cfif structKeyExists(arguments,"DateLastUpdate") and len(arguments.DateLastUpdate)>
				AND DateLastUpdate = <cfqueryparam value="#arguments.DateLastUpdate#" CFSQLType="cf_sql_timestamp" />
			</cfif>
			
			<cfif structKeyExists(arguments,"AdminID") and len(arguments.AdminID)>
				AND AdminID = <cfqueryparam value="#arguments.AdminID#" CFSQLType="cf_sql_char" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments,"Tags") and len(arguments.Tags)>
				AND Tags = <cfqueryparam value="#arguments.Tags#" CFSQLType="cf_sql_varchar" maxlength="255" />
			</cfif>
			
			<cfif structKeyExists(arguments,"SiteID") and len(arguments.SiteID)>
				AND SiteID = <cfqueryparam value="#arguments.SiteID#" CFSQLType="cf_sql_varchar" maxlength="45" />
			</cfif>
			
			<cfif structKeyExists(arguments,"IsActive") and len(arguments.IsActive)>
				AND IsActive = <cfqueryparam value="#arguments.IsActive#" CFSQLType="cf_sql_tinyint" />
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
		<cfargument name="ImageGroupID" type="uuid" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="AdminID" type="string" required="false" />
		<cfargument name="Tags" type="string" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="IsActive" type="boolean" required="false" />
		<!---^^ATTRIBUTES-END^^--->
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var arrObjects = arrayNew(1) />
		<cfset var tmpObj = "" />
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","ImageGroupBean").init(argumentCollection=queryRowToStruct(qList,i)) />
			<cfset arrayAppend(arrObjects,tmpObj) />
		</cfloop>
				
		<cfreturn arrObjects />
	</cffunction>

	<cffunction name="getBeanByAttributes" access="public" output="false" returntype="any">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="ImageGroupID" type="uuid" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="AdminID" type="string" required="false" />
		<cfargument name="Tags" type="string" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="IsActive" type="boolean" required="false" />
		<!---^^ATTRIBUTES-END^^--->
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		

		<cfif qList.recordCount>
			<cfreturn createObject("component","ImageGroupBean").init(argumentCollection=queryRowToStruct(qList))>
		<cfelse>
			<cfreturn createObject("component","ImageGroupBean").init()>
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
				#variables.dsnprefix#mg_imagegroup
			WHERE
			ImageGroupID IN (<cfqueryparam value="#IDList#" CFSQLType="cf_sql_char" list="true" />)
		</cfquery>
		
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","ImageGroupBean").init(argumentCollection=queryRowToStruct(qList,i)) />
			<cfset strObjects[qList.ImageGroupID[i]] = tmpObj />
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
		<cfset var qExclude			= "" />
		<cfset var qKeep			= "" />
		<cfset var qCount			= "" />
		<cfset var qCountGroup		= "" />
		<cfset var returnFields		= arguments.fieldList />

		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				<cfif not arguments.isCount and arguments.size gt 0 AND variables.dsntype eq "mssql"> 	
					TOP #Ceiling(Val(arguments.start+arguments.size))#
				</cfif>
				<cfif arguments.isCount>
					COUNT(ig.ImageGroupID) AS total
				<cfelse>
					#arguments.fieldList#,0 as ImageCount
				</cfif>
			FROM	#variables.dsnprefix#mg_imagegroup ig
			WHERE
				0=0
			<cfif structKeyExists(arguments.criteria,"Name") and len(arguments.criteria.Name)>
			AND ig.Name LIKE <cfqueryparam value="%#arguments.criteria.Name#%" CFSQLType="cf_sql_varchar" maxlength="145" />
			</cfif>
			<cfif structKeyExists(arguments.criteria,"Tags") and len(arguments.criteria.Tags)>
			AND ig.Tags LIKE <cfqueryparam value="%#arguments.criteria.Tags#%" CFSQLType="cf_sql_varchar" maxlength="255" />
			</cfif>
			<cfif structKeyExists(arguments.criteria,"Any") and len(arguments.criteria.Any)>
			AND
				(
				ig.Tags LIKE <cfqueryparam value="%#arguments.criteria.Any#%" CFSQLType="cf_sql_varchar" maxlength="255" />
				OR
				ig.Name LIKE <cfqueryparam value="%#arguments.criteria.Any#%" CFSQLType="cf_sql_varchar" maxlength="255" />
				OR
				ig.Description LIKE <cfqueryparam value="%#arguments.criteria.Any#%" CFSQLType="cf_sql_longvarchar" />
				)
			</cfif>

			AND ig.SiteID = <cfqueryparam value="#arguments.criteria.SiteID#" CFSQLType="cf_sql_varchar" maxlength="25" />
			<cfif structKeyExists(arguments.criteria,"isActive") and len(arguments.criteria.isActive)>
			AND ig.isActive = <cfqueryparam value="#arguments.criteria.isActive#" CFSQLType="cf_sql_tinyint" />
			<cfelse>
			AND ig.isActive = <cfqueryparam value="1" CFSQLType="cf_sql_tinyint" />
			</cfif>

			<cfif structKeyExists(arguments.criteria,"imagetags") and len(arguments.criteria.imagetags)>
			AND imageGroupID IN
			(
				SELECT imageGroupID From
					#variables.dsnprefix#mg_imagegroupimage igi
				JOIN  #variables.dsnprefix#mg_image i
				ON
				(
					igi.imageid = i.imageid
					AND
					i.isActive = 1
				)
				WHERE
				i.Tags LIKE <cfqueryparam value="%#arguments.criteria.imagetags#%" CFSQLType="cf_sql_varchar" maxlength="255" />
				OR
				i.Caption LIKE <cfqueryparam value="%#arguments.criteria.imagetags#%" CFSQLType="cf_sql_varchar" maxlength="255" />
			)
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
					imageGroupID  
				FROM
					qList    
			</cfquery>
			
			<cfquery name="qKeep" dbtype="query" maxrows="#arguments.count#">  
				SELECT
					*  
				FROM  
					qList  
				WHERE  
					imageGroupID NOT IN (<cfqueryparam value="#valueList(qExclude.imageGroupID)#" list="true" />)  
			</cfquery> 

			<cfset qList = qKeep> 
		</cfif>

		<!--- we do not create beans here, in the interest of speed --->
		<cfif arguments.isCount>
			<cfreturn qList.total >
		<cfelse>

			<cfquery name="qCount" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
				SELECT
					ImageGroupID,COUNT(ImageGroupID) AS total
				FROM
					#variables.dsnprefix#mg_imagegroupimage
				WHERE	
					ImageGroupID IN (<cfqueryparam value="#valueList(qList.imageGroupID)#" list="true" />)
				GROUP BY ImageGroupID  
			</cfquery>
			
			<cfloop from="1" to="#qList.recordCount#" index="i">
			
				<cfquery name="qCountGroup" dbtype="query">  
					SELECT
						total
					FROM
						qCount
					WHERE	
						ImageGroupID = <cfqueryparam value="#qList.ImageGroupID[i]#" CFSQLType="cf_sql_char" maxlength="35" />
				</cfquery>
				
				<cfset tmpObj = queryRowToStruct(qList,i) />
				<cfif qCountGroup.recordCount>
					<cfset tmpObj.imagecount = qCountGroup.total />
				</cfif>
				
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

<!---^^CUSTOMEND^^--->
</cfcomponent>	



