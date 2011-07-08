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





<cfcomponent displayname="DisplayGateway" output="false">
<!---^^GENERATEDSTART^^--->
	<cffunction name="init" access="public" output="false" returntype="DisplayGateway">
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
		<cfargument name="DisplayID" type="uuid" required="false" />
		<cfargument name="DisplayTypeID" type="string" required="false" />
		<cfargument name="ObjectID" type="string" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="Params" type="string" required="false" />
		<cfargument name="Notes" type="string" required="false" />
		<cfargument name="IsActive" type="boolean" required="false" />
		<cfargument name="AdminID" type="string" required="false" />
		<cfargument name="ModuleID" type="string" required="false" />
		<cfargument name="ContentID" type="string" required="false" />
		<cfargument name="IsValid" type="boolean" required="false" />
		<cfargument name="Settings" type="string" required="false" />
		<!---^^ATTRIBUTES-END^^--->
		<cfargument name="orderby" type="string" required="false" />
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				*,'true' AS BeanExists
			FROM	#variables.dsnprefix#mg_display
			WHERE	0=0
		<!---^^VALUES-START^^--->
			<cfif structKeyExists(arguments,"DisplayID") and len(arguments.DisplayID)>
				AND DisplayID = <cfqueryparam value="#arguments.DisplayID#" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments,"DisplayTypeID") and len(arguments.DisplayTypeID)>
				AND DisplayTypeID = <cfqueryparam value="#arguments.DisplayTypeID#" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ObjectID") and len(arguments.ObjectID)>
				AND ObjectID = <cfqueryparam value="#arguments.ObjectID#" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments,"Name") and len(arguments.Name)>
				AND Name = <cfqueryparam value="#arguments.Name#" CFSQLType="cf_sql_varchar" maxlength="150" />
			</cfif>
			
			<cfif structKeyExists(arguments,"DateCreate") and len(arguments.DateCreate)>
				AND DateCreate = <cfqueryparam value="#arguments.DateCreate#" CFSQLType="cf_sql_timestamp" />
			</cfif>
			
			<cfif structKeyExists(arguments,"DateLastUpdate") and len(arguments.DateLastUpdate)>
				AND DateLastUpdate = <cfqueryparam value="#arguments.DateLastUpdate#" CFSQLType="cf_sql_timestamp" />
			</cfif>
			
			<cfif structKeyExists(arguments,"SiteID") and len(arguments.SiteID)>
				AND SiteID = <cfqueryparam value="#arguments.SiteID#" CFSQLType="cf_sql_varchar" maxlength="25" />
			</cfif>
			
			<cfif structKeyExists(arguments,"Params") and len(arguments.Params)>
				AND Params = <cfqueryparam value="#arguments.Params#" CFSQLType="cf_sql_longvarchar" />
			</cfif>
			
			<cfif structKeyExists(arguments,"Notes") and len(arguments.Notes)>
				AND Notes = <cfqueryparam value="#arguments.Notes#" CFSQLType="cf_sql_longvarchar" />
			</cfif>
			
			<cfif structKeyExists(arguments,"IsActive") and len(arguments.IsActive)>
				AND IsActive = <cfqueryparam value="#arguments.IsActive#" CFSQLType="cf_sql_tinyint" />
			</cfif>
			
			<cfif structKeyExists(arguments,"AdminID") and len(arguments.AdminID)>
				AND AdminID = <cfqueryparam value="#arguments.AdminID#" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ModuleID") and len(arguments.ModuleID)>
				AND ModuleID = <cfqueryparam value="#arguments.ModuleID#" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments,"ContentID") and len(arguments.ContentID)>
				AND ContentID = <cfqueryparam value="#arguments.ContentID#" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments,"IsValid") and len(arguments.IsValid)>
				AND IsValid = <cfqueryparam value="#arguments.IsValid#" CFSQLType="cf_sql_tinyint" />
			</cfif>
			
			<cfif structKeyExists(arguments,"Settings") and len(arguments.Settings)>
				AND Settings = <cfqueryparam value="#arguments.Settings#" CFSQLType="cf_sql_longvarchar" />
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
		<cfargument name="DisplayID" type="uuid" required="false" />
		<cfargument name="DisplayTypeID" type="string" required="false" />
		<cfargument name="ObjectID" type="string" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="Params" type="string" required="false" />
		<cfargument name="Notes" type="string" required="false" />
		<cfargument name="IsActive" type="boolean" required="false" />
		<cfargument name="AdminID" type="string" required="false" />
		<cfargument name="ModuleID" type="string" required="false" />
		<cfargument name="ContentID" type="string" required="false" />
		<cfargument name="IsValid" type="boolean" required="false" />
		<cfargument name="Settings" type="string" required="false" />
		<!---^^ATTRIBUTES-END^^--->
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var arrObjects = arrayNew(1) />
		<cfset var tmpObj = "" />
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","DisplayBean").init(argumentCollection=queryRowToStruct(qList,i)) />
			<cfset arrayAppend(arrObjects,tmpObj) />
		</cfloop>
				
		<cfreturn arrObjects />
	</cffunction>

	<cffunction name="getBeanByAttributes" access="public" output="false" returntype="any">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="DisplayID" type="uuid" required="false" />
		<cfargument name="DisplayTypeID" type="string" required="false" />
		<cfargument name="ObjectID" type="string" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="SiteID" type="string" required="false" />
		<cfargument name="Params" type="string" required="false" />
		<cfargument name="Notes" type="string" required="false" />
		<cfargument name="IsActive" type="boolean" required="false" />
		<cfargument name="AdminID" type="string" required="false" />
		<cfargument name="ModuleID" type="string" required="false" />
		<cfargument name="ContentID" type="string" required="false" />
		<cfargument name="IsValid" type="boolean" required="false" />
		<cfargument name="Settings" type="string" required="false" />
		<!---^^ATTRIBUTES-END^^--->
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		

		<cfif qList.recordCount>
			<cfreturn createObject("component","DisplayBean").init(argumentCollection=queryRowToStruct(qList))>
		<cfelse>
			<cfreturn createObject("component","DisplayBean").init()>
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
				#variables.dsnprefix#mg_display
			WHERE
			DisplayID IN (<cfqueryparam value="#IDList#" CFSQLType="cf_sql_char" list="true" />)
		</cfquery>
		
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","DisplayBean").init(argumentCollection=queryRowToStruct(qList,i)) />
			<cfset strObjects[qList.DisplayID[i]] = tmpObj />
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
		<cfset var qKeep			= "" />
		<cfset var qExclude			= "" />
		<cfset var qFeed			= "" />
		<cfset var qFeeds			= "" />
		<cfset var returnFields		= arguments.fieldList />
		<cfset var GlobalConfig 	= getMuraManager().getServiceFactory().getBean('configBean') />

		<cfquery name="qList" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				<cfif not arguments.isCount and arguments.size gt 0 AND variables.dsntype eq "mssql"> 	
					TOP #Ceiling(Val(arguments.start+arguments.size))#
				</cfif>
				<cfif arguments.isCount>
					COUNT(DisplayID) AS total
				<cfelse>
					d.*,dt.name as displayType,ig.name as imagegroup,ig.imagegroupID,'imagegroup' as sourcetype
				</cfif>
			FROM	#variables.dsnprefix#mg_display d
			JOIN
					#variables.dsnprefix#mg_displaytype dt
			ON
					(d.displayTypeID = dt.displayTypeID)
			LEFT JOIN
					#variables.dsnprefix#mg_imagegroup ig
			ON
					(d.contentID = ig.imagegroupID)
			WHERE
				0=0
			<cfif structKeyExists(arguments.criteria,"DisplayTypeID") and len(arguments.criteria.DisplayTypeID)>
			AND d.DisplayTypeID = <cfqueryparam value="#arguments.criteria.DisplayTypeID#" CFSQLType="cf_sql_char" maxlength="35" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"Name") and len(arguments.criteria.Name)>
			AND d.Name LIKE <cfqueryparam value="%#arguments.criteria.Name#%" CFSQLType="cf_sql_varchar" maxlength="150" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"displayType") and len(arguments.criteria.Name)>
			AND dt.Name LIKE <cfqueryparam value="%#arguments.criteria.displayType#%" CFSQLType="cf_sql_varchar" maxlength="150" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"imagegroup") and len(arguments.criteria.imagegroup)>
			AND ig.name LIKE <cfqueryparam value="%#arguments.criteria.imagegroup#%" CFSQLType="cf_sql_varchar" maxlength="150" />
			</cfif>
			
			<cfif structKeyExists(arguments.criteria,"DateGreater") and len(arguments.criteria.DateGreater)>
			AND d.DateLastUpdate >= <cfqueryparam value="%#arguments.criteria.DateGreater#%" CFSQLType="cf_sql_timestamp" />
			</cfif>

			<cfif structKeyExists(arguments.criteria,"DateLesser") and len(arguments.criteria.DateLesser)>
			AND d.DateLastUpdate <= <cfqueryparam value="%#arguments.criteria.DateLesser#%" CFSQLType="cf_sql_timestamp" />
			</cfif>
			
			AND d.SiteID = <cfqueryparam value="#arguments.criteria.SiteID#" CFSQLType="cf_sql_varchar" maxlength="25" />

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
					displayID  
				FROM
					qList    
			</cfquery>
			
			<cfquery name="qKeep" dbtype="query" maxrows="#arguments.count#">  
				SELECT
					*  
				FROM  
					qList  
				WHERE  
					displayID NOT IN (<cfqueryparam value="#valueList(qExclude.displayID)#" list="true" />)  
			</cfquery> 

			<cfset qList = qKeep> 
		</cfif>

		<!--- do the 'get the feed name' dance --->
		<cfif not arguments.isCount>
			<cfquery name="qKeep" dbtype="query">  
				SELECT
					contentID  
				FROM  
					qList  
				WHERE  
					imageGroupID IS NULL  
			</cfquery> 
			
			<cfif qKeep.recordCount>
				<cfquery name="qFeeds" datasource="#GlobalConfig.getDataSource()#" username="#GlobalConfig.getDBUserName()#" password="#GlobalConfig.getDBPassword()#">
					SELECT
						name,feedID
					FROM	tcontentfeeds
					WHERE
						feedID IN (<cfqueryparam value="#valueList(qKeep.contentID)#" list="true" cfsqltype="cf_sql_char" maxlength="35">)
				</cfquery>
			
				<cfif qFeeds.recordCount>
					<cfloop query="qList">
						<cfquery name="qFeed" dbtype="query">  
							SELECT
								*  
							FROM  
								qFeeds  
							WHERE  
								feedID = <cfqueryparam value="#contentID#" cfsqltype="cf_sql_char" maxlength="35">
						</cfquery> 
						
						<cfif qFeed.recordCount>
							<cfset qList.imagegroup[currentRow] = qFeed.name & " (#getmmResourceBundle().key('feed')#)" />
							<cfset qList.sourcetype[currentRow] = 'collection' />
						</cfif>
					</cfloop>
				</cfif>
			</cfif>
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
<!---^^CUSTOMEND^^--->
	<cffunction name="setmmResourceBundle" access="public" returntype="any" output="false">
		<cfargument name="mmResourceBundle" type="any" required="true">
		<cfset variables.mmResourceBundle = arguments.mmResourceBundle>
	</cffunction>
	<cffunction name="getmmResourceBundle" access="public" returntype="any" output="false">
		<cfreturn variables.mmResourceBundle>
	</cffunction>

	<cffunction name="setMuraManager" access="public" returntype="any" output="false">
		<cfargument name="MuraManager" type="any" required="true">
		<cfset variables.MuraManager = arguments.MuraManager>
	</cffunction>
	<cffunction name="getMuraManager" access="public" returntype="any" output="false">
		<cfreturn variables.MuraManager>
	</cffunction>
</cfcomponent>	









