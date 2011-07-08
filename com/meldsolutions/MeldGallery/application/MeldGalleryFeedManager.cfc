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
<cfcomponent displayname="MeldGalleryFeedManager" output="false">

	<cfset variables.instance = StructNew()>

	<cffunction name="init" returntype="MeldGalleryFeedManager" access="public" output="false">
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

	<cffunction name="getImagesInFeed" access="public" output="false" returntype="Array" >
		<cfargument name="DisplayBean" type="any" required="true" />
		<cfargument name="LargeImageRenderBean" type="any" required="false" />
		<cfargument name="MediumImageRenderBean" type="any" required="false" />
		<cfargument name="SmallImageRenderBean" type="any" required="false" />
		<cfargument name="start" type="numeric" required="false" default="0"/>
		<cfargument name="size" type="numeric" required="false" default="50"/>
		<cfargument name="count" type="numeric" required="false" default="0"/>
		<cfargument name="isCount" type="numeric" required="false" default="false" />
		<cfargument name="orderby" type="string" required="false" default="caption" />

		<cfset var contentRenderer	= getMuraManager().getBean('contentRenderer') />
		<cfset var arrObjects		= ArrayNew(1)>
		<cfset var qDisplayImages	= "" />
		<cfset var qDisplayImage	= "" />
		<cfset var qFeedImages		= "" />		
		<cfset var qImages			= "" />		
		<cfset var qImage			= "" />		
		<cfset var imageBean		= "" />
		<cfset var sData			= StructNew() />
		<cfset var sArgs			= StructNew() />
		<cfset var displayFileID	= "" />
		<cfset var feedBean			= getFeed( displayBean.getContentID(),displayBean.getSiteID() ) />
		<cfset var qFeed			= feedBean.getQuery() />

		<cfquery name="qFeedImages" dbtype="query">
			SELECT
				fileID,title,summary,fileName,fileExt,contentID
			FROM
				qFeed
			WHERE fileID IS NOT NULL
		</cfquery>

		<cfquery name="qImages" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				imageID,fileID,type,remoteID
			FROM
				#variables.dsnprefix#mg_image
			WHERE
				remoteID IN (<cfqueryparam value="#valueList(qFeedImages.fileID)#" list="true" CFSQLType="cf_sql_char" maxlength="35" />)
		</cfquery>

		<cfquery name="qDisplayImages" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				fileID,imageID,displayImageID,displayID
			FROM
				#variables.dsnprefix#mg_displayimage
			WHERE
				displayID = <cfqueryparam value="#arguments.DisplayBean.getDisplayID()#" CFSQLType="cf_sql_char" maxlength="35" />
			AND
				isValid = 1
		</cfquery>

		<cfset sArgs = StructNew() />
		<cfset sArgs.displayID = arguments.DisplayBean.getDisplayID() />

		<cfset sArgs.LargeImageRenderBean = arguments.LargeImageRenderBean />
		<cfif structKeyExists(arguments,"MediumImageRenderBean")>
			<cfset sArgs.MediumImageRenderBean = arguments.MediumImageRenderBean />
		</cfif>
		<cfif structKeyExists(arguments,"SmallImageRenderBean")>
			<cfset sArgs.SmallImageRenderBean = arguments.SmallImageRenderBean />
		</cfif>

		<cfloop query="qFeedImages">
			<cfquery name="qImage" dbtype="query">
				SELECT
					*
				FROM
					qImages
				WHERE remoteID = <cfqueryparam value="#fileID#" CFSQLType="cf_sql_char" maxlength="35" /> 
			</cfquery>

			<cfset sData 				= StructNew() />

			<!--- use a Meld Gallery 'master', if one exists --->
			<cfif qImage.recordCount>
				<cfset sData.imageID		= qImage.imageID />
				<cfset sData.fileID			= qImage.fileID />
				<cfset sData.type			= qImage.type />
			<cfelse>
				<cfset sData.imageID		= fileID />
				<cfset sData.fileID			= fileID />
				<cfset sData.type			= fileExt />
			</cfif>

			<cfset sData.siteID			= displayBean.getSiteID() />
			<cfset sData.isActive		= 1 />
			<cfset sData.description	= summary />
			<cfset sData.caption		= title />
			<cfset sData.linkURL		= contentRenderer.getURLStem( displayBean.getSiteID(),fileName ) />
												
			<cfset imageBean = getImageService().createImage( argumentCollection=sData ) />

			<cfset sArgs.imageID	= imageBean.getImageID() />
			<cfset sArgs.fileID		= imageBean.getFileID() />
			<cfset sArgs.isExternal	= 1 />
			<cfset sArgs.contentID	= contentID />

			<cfquery name="qDisplayImage" dbtype="query">
				SELECT
					*
				FROM
					qDisplayImages
				WHERE imageID = <cfqueryparam value="#sData.imageID#" CFSQLType="cf_sql_char" maxlength="35" />
			</cfquery>

			<!--- not set, either because cut image doesn't exist or was invalidated --->
			<cfif not qDisplayImage.recordCount>
				<cfset displayFileID = getImageService().getNewDisplayFileID( argumentCollection=sArgs ) />
				<cfset imageBean.setDisplayFileID( displayFileID ) />
			<cfelse>
				<cfset imageBean.setDisplayFileID( qDisplayImage.fileID ) />
			</cfif>
			<cfset arrayAppend(arrObjects,imageBean) />
		</cfloop>

		<cfreturn arrObjects />
	</cffunction>

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

	<cffunction name="getFeed" access="public" output="false" returntype="any">
		<cfargument name="feedID" type="uuid" required="true" />
		<cfargument name="siteID" type="string" required="true" />
		
		<cfset var feedManager = getMuraManager().getBean('feedManager') />
		
		<cfset var feedBean = feedManager.read( feedID=arguments.feedID,siteID=arguments.siteID ) />
				
		<cfreturn feedBean />
	</cffunction>

	<cffunction name="getRemoteFeedList" access="public" output="false" returntype="struct">
		<cfargument name="criteria" type="struct" required="true" />
		<cfargument name="fieldList" type="string" required="false" />
		<cfargument name="start" type="numeric" required="false" default="0"/>
		<cfargument name="size" type="numeric" required="false" default="10"/>
		<cfargument name="count" type="numeric" required="false" default="0"/>
		<cfargument name="isPaged" type="numeric" required="false" default="true" />
		
		<cfset var aFeedGroup		= ArrayNew(1)>
		<cfset var iiX				= "" >
		<cfset var isValid			= false >
		<cfset var sReturn			= StructNew()>
		
		<cfif arguments.isPaged and not arguments.count>
			<cfset arguments.isCount = true>
			<cfset sReturn.count = getFeedList( argumentCollection=arguments) />
			<cfset arguments.isCount = false>
		<cfelse>
			<cfset sReturn.count = arguments.count />
		</cfif>
		
		<cfset aFeedGroup			= getFeedList(argumentCollection=arguments) />

		<cfset sReturn.start		= arguments.start>
		<cfset sReturn.size			= arguments.size>
		<cfset sReturn.itemarray	= aFeedGroup>

		<cfreturn sReturn />
	</cffunction>

	<cffunction name="getFeedList" returntype="any" access="public" output="false">
		<cfargument name="criteria" type="struct" required="true" />
		<cfargument name="fieldList" type="string" required="false" default="name,type,feedid,dateCreated" />
		<cfargument name="start" type="numeric" required="false" default="0"/>
		<cfargument name="size" type="numeric" required="false" default="10"/>
		<cfargument name="count" type="numeric" required="false" default="0"/>
		<cfargument name="isPaged" type="numeric" required="false" default="true" />
		<cfargument name="orderby" type="string" required="false" />

		<cfset var arrObjects		= ArrayNew(1) />
		<cfset var qList			= "" />
		<cfset var qExclude			= "" />		
		<cfset var qKeep			= "" />		
		<cfset var tmpObj			= "" />
		<cfset var globalConfig		= getMuraManager().getBean('configBean') />

		<cfquery name="qList" datasource="#globalConfig.getDatasource()#" username="#globalConfig.getDBUserName()#" password="#globalConfig.getDBPassword()#">
			SELECT
				<cfif not arguments.isCount and arguments.size gt 0 AND variables.dsntype eq "mssql"> 	
					TOP #Ceiling(Val(arguments.start+arguments.size))#
				</cfif>
				<cfif arguments.isCount>
					COUNT(feedID) AS total
				<cfelse>
					#arguments.fieldList#
				</cfif>
			FROM	tcontentfeeds
			WHERE
				0=0
			<cfif structKeyExists(arguments.criteria,"Name") and len(arguments.criteria.Name)>
				AND 
					(
					Name LIKE <cfqueryparam value="%#arguments.criteria.Name#%" CFSQLType="cf_sql_varchar" maxlength="100" />
					OR
					displayName LIKE <cfqueryparam value="%#arguments.criteria.Name#%" CFSQLType="cf_sql_varchar" maxlength="100" />
					)
			</cfif>

			<cfif structKeyExists(arguments.criteria,"type") and len(arguments.criteria.type)>
				AND type = <cfqueryparam value="#arguments.criteria.type#" CFSQLType="cf_sql_varchar" maxlength="145" />
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
					feedID  
				FROM
					qList    
				ORDER BY #arguments.orderBy#
			</cfquery>
			
			<cfquery name="qKeep" dbtype="query" maxrows="#arguments.count#">  
				SELECT
					#arguments.fieldList#
				FROM  
					qList  
				WHERE  
					feedID NOT IN (<cfqueryparam value="#valueList(qExclude.feedID)#" list="true" />)
			</cfquery> 

			<cfset qList = qKeep> 
		</cfif>

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

	<cffunction name="setImageService" access="public" returntype="void" output="false">
		<cfargument name="ImageService" type="any" required="true" />
		<cfset variables.instance.ImageService = arguments.ImageService />
	</cffunction>
	<cffunction name="getImageService" access="public" returntype="any" output="false">
		<cfreturn variables.instance.ImageService />
	</cffunction>

	<cffunction name="setMuraManager" access="public" returntype="any" output="false">
		<cfargument name="MuraManager" type="any" required="true">
		<cfset variables.MuraManager = arguments.MuraManager>
	</cffunction>
	<cffunction name="getMuraManager" access="public" returntype="any" output="false">
		<cfreturn variables.MuraManager>
	</cffunction>
</cfcomponent>