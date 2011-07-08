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
<cfcomponent displayname="MeldGalleryGalleryManager" output="false">

	<cfset variables.instance = StructNew()>

	<cffunction name="init" returntype="MeldGalleryGalleryManager" access="public" output="false">
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

	<cffunction name="getImagesInGallery" access="public" output="false" returntype="Array" >
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
		<cfset var qImages			= "" />		
		<cfset var qImage			= "" />		
		<cfset var imageBean		= "" />
		<cfset var sData			= StructNew() />
		<cfset var sArgs			= StructNew() />
		<cfset var displayFileID	= "" />
		<cfset var qGallery			= getGallery( contentID=displayBean.getContentID(),siteID=displayBean.getSiteID() ) />

		<cfquery name="qImages" datasource="#variables.dsn#" username="#variables.dsnusername#" password="#variables.dsnpassword#">
			SELECT
				imageID,fileID,type,remoteID
			FROM
				#variables.dsnprefix#mg_image
			WHERE
				remoteID IN (<cfqueryparam value="#valueList(qGallery.fileID)#" list="true" CFSQLType="cf_sql_char" maxlength="35" />)
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
		<cfset sArgs.isMuraGallery = 1 />

		<cfset sArgs.LargeImageRenderBean = arguments.LargeImageRenderBean />
		<cfif structKeyExists(arguments,"MediumImageRenderBean")>
			<cfset sArgs.MediumImageRenderBean = arguments.MediumImageRenderBean />
		</cfif>
		<cfif structKeyExists(arguments,"SmallImageRenderBean")>
			<cfset sArgs.SmallImageRenderBean = arguments.SmallImageRenderBean />
		</cfif>

		<cfloop query="qGallery">
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
			<!---<cfset sData.linkURL		= contentRenderer.getURLStem( displayBean.getSiteID(),fileName ) />--->
												
			<cfset imageBean = getImageService().createImage( argumentCollection=sData ) />

			<cfset sArgs.imageID	= imageBean.getImageID() />
			<cfset sArgs.fileID		= imageBean.getFileID() />
			<cfset sArgs.isExternal	= 1 />
			<cfset sArgs.isMuraGallery = 1 />
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

	<cffunction name="getGallery" access="public" output="false" returntype="query">
		<cfargument name="contentID" type="uuid" required="true" />
		<cfargument name="siteID" type="string" required="true" />
		
		<cfset var contentManager	= getMuraManager().getBean('contentManager') />
		<cfset var contentGateway	= getMuraManager().getBean('contentGateway') />
		<cfset var contentBean		= contentManager.getActiveContent(  arguments.contentID,arguments.siteID ) />

		<cfset var qKids = contentGateway.getKids('00000000000000000000000000000000000',siteID,contentBean.getcontentID(),'default',now(),0,'',0,contentBean.getsortBy(),contentBean.getsortDirection()) />
		
		<cfreturn qKids />
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