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
<cfcomponent displayname="ImageBean" output="false" extends="MeldGallery.com.meldsolutions.core.MeldBean">
<!---^^GENERATEDSTART^^--->
	<!---^^PROPERTIES-START^^--->
	<cfproperty name="ImageID" type="uuid" default="" required="true" maxlength="35" />
	<cfproperty name="FileID" type="uuid" default="" required="true" maxlength="35" />
	<cfproperty name="Caption" type="string" default="" maxlength="150" />
	<cfproperty name="Description" type="string" default="" />
	<cfproperty name="Tags" type="string" default="" maxlength="255" />
	<cfproperty name="CategoryID" type="uuid" default="" maxlength="35" />
	<cfproperty name="DateCreate" type="date" default="" required="true" />
	<cfproperty name="DateLastUpdate" type="date" default="" required="true" />
	<cfproperty name="SiteID" type="string" default="" required="true" maxlength="45" />
	<cfproperty name="LinkURL" type="string" default="" maxlength="150" />
	<cfproperty name="FriendlyName" type="string" default="" maxlength="150" />
	<cfproperty name="IsActive" type="boolean" default="0" required="true" />
	<cfproperty name="Type" type="string" default="" maxlength="10" />
	<cfproperty name="AdminID" type="uuid" default="" maxlength="35" />
	<cfproperty name="Summary" type="string" default="" />
	<cfproperty name="Name" type="string" default="" maxlength="150" />
	<cfproperty name="RemoteID" type="uuid" default="" maxlength="35" />
	<!---^^PROPERTIES-END^^--->
	<cfproperty name="DisplayFileID" type="string" default="" />

	<cfset variables.instance = StructNew() />

	<!--- INIT --->
	<cffunction name="init" access="public" returntype="ImageBean" output="false">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="ImageID" type="uuid" required="false" default="#CreateUUID()#" />
		<cfargument name="FileID" type="string" required="false" default="" />
		<cfargument name="Caption" type="string" required="false" default="" />
		<cfargument name="Description" type="string" required="false" default="" />
		<cfargument name="Tags" type="string" required="false" default="" />
		<cfargument name="CategoryID" type="string" required="false" default="" />
		<cfargument name="DateCreate" type="string" required="false" default="" />
		<cfargument name="DateLastUpdate" type="string" required="false" default="" />
		<cfargument name="SiteID" type="string" required="false" default="" />
		<cfargument name="LinkURL" type="string" required="false" default="" />
		<cfargument name="FriendlyName" type="string" required="false" default="" />
		<cfargument name="IsActive" type="boolean" required="false" default="0" />
		<cfargument name="Type" type="string" required="false" default="" />
		<cfargument name="AdminID" type="string" required="false" default="" />
		<cfargument name="Summary" type="string" required="false" default="" />
		<cfargument name="Name" type="string" required="false" default="" />
		<cfargument name="RemoteID" type="string" required="false" default="" />
		<!---^^ATTRIBUTES-END^^--->
		<cfargument name="BeanExists" type="boolean" required="false" default="false" />
		<cfargument name="DisplayFileID" any="string" required="false" default="" />

		<!---^^SETTERS-START^^--->
		<cfset setImageID( arguments.ImageID ) />
		<cfset setFileID( arguments.FileID ) />
		<cfset setCaption( arguments.Caption ) />
		<cfset setDescription( arguments.Description ) />
		<cfset setTags( arguments.Tags ) />
		<cfset setCategoryID( arguments.CategoryID ) />
		<cfset setDateCreate( arguments.DateCreate ) />
		<cfset setDateLastUpdate( arguments.DateLastUpdate ) />
		<cfset setSiteID( arguments.SiteID ) />
		<cfset setLinkURL( arguments.LinkURL ) />
		<cfset setFriendlyName( arguments.FriendlyName ) />
		<cfset setIsActive( arguments.IsActive ) />
		<cfset setType( arguments.Type ) />
		<cfset setAdminID( arguments.AdminID ) />
		<cfset setSummary( arguments.Summary ) />
		<cfset setName( arguments.Name ) />
		<cfset setRemoteID( arguments.RemoteID ) />
		<!---^^SETTERS-END^^--->
		<cfset setBeanExists( arguments.BeanExists ) />
		<cfset setDisplayFileID( arguments.DisplayFileID ) />
		
		<cfreturn this />
	</cffunction>

	<cffunction name="setMemento" access="public" returntype="ImageBean" output="false">
		<cfargument name="memento" type="struct" required="yes"/>
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>
	<cffunction name="getMemento" access="public" returntype="struct" output="false" >
		<cfreturn variables.instance />
	</cffunction>
	
	<!---^^ACCESSORS-START^^--->
	<cffunction name="setImageID" access="public" returntype="void" output="false">
		<cfargument name="ImageID" type="uuid" required="true" />
		<cfset variables.instance['imageid'] = arguments.ImageID />
	</cffunction>
	<cffunction name="getImageID" access="public" returntype="uuid" output="false">
		<cfreturn variables.instance.ImageID />
	</cffunction>
	
	<cffunction name="setFileID" access="public" returntype="void" output="false">
		<cfargument name="FileID" type="string" required="true" />
		<cfset variables.instance['fileid'] = arguments.FileID />
	</cffunction>
	<cffunction name="getFileID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FileID />
	</cffunction>
	
	<cffunction name="setCaption" access="public" returntype="void" output="false">
		<cfargument name="Caption" type="string" required="true" />
		<cfset variables.instance['caption'] = arguments.Caption />
	</cffunction>
	<cffunction name="getCaption" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Caption />
	</cffunction>
	
	<cffunction name="setDescription" access="public" returntype="void" output="false">
		<cfargument name="Description" type="string" required="true" />
		<cfset variables.instance['description'] = arguments.Description />
	</cffunction>
	<cffunction name="getDescription" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Description />
	</cffunction>
	
	<cffunction name="setTags" access="public" returntype="void" output="false">
		<cfargument name="Tags" type="string" required="true" />
		<cfset variables.instance['tags'] = arguments.Tags />
	</cffunction>
	<cffunction name="getTags" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Tags />
	</cffunction>
	
	<cffunction name="setCategoryID" access="public" returntype="void" output="false">
		<cfargument name="CategoryID" type="string" required="true" />
		<cfset variables.instance['categoryid'] = arguments.CategoryID />
	</cffunction>
	<cffunction name="getCategoryID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CategoryID />
	</cffunction>
	
	<cffunction name="setDateCreate" access="public" returntype="void" output="false">
		<cfargument name="DateCreate" type="string" required="true" />
		<cfset variables.instance['datecreate'] = arguments.DateCreate />
	</cffunction>
	<cffunction name="getDateCreate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DateCreate />
	</cffunction>
	
	<cffunction name="setDateLastUpdate" access="public" returntype="void" output="false">
		<cfargument name="DateLastUpdate" type="string" required="true" />
		<cfset variables.instance['datelastupdate'] = arguments.DateLastUpdate />
	</cffunction>
	<cffunction name="getDateLastUpdate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DateLastUpdate />
	</cffunction>
	
	<cffunction name="setSiteID" access="public" returntype="void" output="false">
		<cfargument name="SiteID" type="string" required="true" />
		<cfset variables.instance['siteid'] = arguments.SiteID />
	</cffunction>
	<cffunction name="getSiteID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SiteID />
	</cffunction>
	
	<cffunction name="setLinkURL" access="public" returntype="void" output="false">
		<cfargument name="LinkURL" type="string" required="true" />
		<cfset variables.instance['linkurl'] = arguments.LinkURL />
	</cffunction>
	<cffunction name="getLinkURL" access="public" returntype="string" output="false">
		<cfreturn variables.instance.LinkURL />
	</cffunction>
	
	<cffunction name="setFriendlyName" access="public" returntype="void" output="false">
		<cfargument name="FriendlyName" type="string" required="true" />
		<cfset variables.instance['friendlyname'] = arguments.FriendlyName />
	</cffunction>
	<cffunction name="getFriendlyName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FriendlyName />
	</cffunction>
	
	<cffunction name="setIsActive" access="public" returntype="void" output="false">
		<cfargument name="IsActive" type="boolean" required="true" />
		<cfset variables.instance['isactive'] = arguments.IsActive />
	</cffunction>
	<cffunction name="getIsActive" access="public" returntype="boolean" output="false">
		<cfreturn variables.instance.IsActive />
	</cffunction>
	
	<cffunction name="setType" access="public" returntype="void" output="false">
		<cfargument name="Type" type="string" required="true" />
		<cfset variables.instance['type'] = arguments.Type />
	</cffunction>
	<cffunction name="getType" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Type />
	</cffunction>
	
	<cffunction name="setAdminID" access="public" returntype="void" output="false">
		<cfargument name="AdminID" type="string" required="true" />
		<cfset variables.instance['adminid'] = arguments.AdminID />
	</cffunction>
	<cffunction name="getAdminID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.AdminID />
	</cffunction>
	
	<cffunction name="setSummary" access="public" returntype="void" output="false">
		<cfargument name="Summary" type="string" required="true" />
		<cfset variables.instance['summary'] = arguments.Summary />
	</cffunction>
	<cffunction name="getSummary" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Summary />
	</cffunction>
	
	<cffunction name="setName" access="public" returntype="void" output="false">
		<cfargument name="Name" type="string" required="true" />
		<cfset variables.instance['name'] = arguments.Name />
	</cffunction>
	<cffunction name="getName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Name />
	</cffunction>
	
	<cffunction name="setRemoteID" access="public" returntype="void" output="false">
		<cfargument name="RemoteID" type="string" required="true" />
		<cfset variables.instance['remoteid'] = arguments.RemoteID />
	</cffunction>
	<cffunction name="getRemoteID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.RemoteID />
	</cffunction>
	<!---^^ACCESSORS-END^^--->

	<!--- BeanExists --->
	<cffunction name="setBeanExists" access="public" output="false" returntype="void">
		<cfargument name="BeanExists" type="boolean" required="true" />
		<cfset variables.BeanExists = arguments.BeanExists >
	</cffunction>
	<cffunction name="BeanExists" access="public" output="false" returntype="boolean">
		<cfreturn variables.BeanExists>
	</cffunction>

	<!--- DUMP --->
	<cffunction name="dump" access="public" output="true" return="void">
		<cfargument name="abort" type="boolean" default="false" />
		<cfdump var="#variables.instance#" />
		<cfif arguments.abort>
			<cfabort />
		</cfif>
	</cffunction>
<!---^^GENERATEDEND^^--->
<!---^^CUSTOMSTART^^--->
	<cffunction name="setDisplayFileID" access="public" returntype="void" output="false">
		<cfargument name="DisplayFileID" type="string" required="true" />
		<cfset variables.instance['DisplayFileID'] = arguments.DisplayFileID />
	</cffunction>
	<cffunction name="getDisplayFileID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DisplayFileID />
	</cffunction>

<!---^^CUSTOMEND^^--->
</cfcomponent>	









