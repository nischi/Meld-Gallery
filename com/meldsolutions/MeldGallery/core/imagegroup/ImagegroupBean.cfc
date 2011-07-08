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
<cfcomponent displayname="ImageGroupBean" output="false" extends="MeldGallery.com.meldsolutions.core.MeldBean">
<!---^^GENERATEDSTART^^--->
	<!---^^PROPERTIES-START^^--->
	<cfproperty name="ImageGroupID" type="uuid" default="" required="true" maxlength="35" />
	<cfproperty name="Name" type="string" default="" required="true" maxlength="145" />
	<cfproperty name="Description" type="string" default="" maxlength="255" />
	<cfproperty name="DateCreate" type="date" default="" required="true" />
	<cfproperty name="DateLastUpdate" type="date" default="" required="true" />
	<cfproperty name="AdminID" type="string" default="" maxlength="45" />
	<cfproperty name="Tags" type="string" default="" maxlength="255" />
	<cfproperty name="SiteID" type="string" default="" required="true" maxlength="45" />
	<cfproperty name="IsActive" type="boolean" default="0" required="true" />
	<!---^^PROPERTIES-END^^--->
	<cfproperty name="ImageCount" type="numeric" default="" />
	<cfproperty name="ImageIDArray" type="array" default="" />

	<cfset variables.instance = StructNew() />

	<!--- INIT --->
	<cffunction name="init" access="public" returntype="ImageGroupBean" output="false">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="ImageGroupID" type="uuid" required="false" default="#CreateUUID()#" />
		<cfargument name="Name" type="string" required="false" default="" />
		<cfargument name="Description" type="string" required="false" default="" />
		<cfargument name="DateCreate" type="string" required="false" default="" />
		<cfargument name="DateLastUpdate" type="string" required="false" default="" />
		<cfargument name="AdminID" type="string" required="false" default="" />
		<cfargument name="Tags" type="string" required="false" default="" />
		<cfargument name="SiteID" type="string" required="false" default="" />
		<cfargument name="IsActive" type="boolean" required="false" default="0" />
		<!---^^ATTRIBUTES-END^^--->
		<cfargument name="BeanExists" type="boolean" required="false" default="false" />
		<cfargument name="ImageCount" type="numeric" required="false" default="0" />
		<cfargument name="ImageIDArray" type="array" required="false" default="#ArrayNew(1)#" />

		<!---^^SETTERS-START^^--->
		<cfset setImageGroupID( arguments.ImageGroupID ) />
		<cfset setName( arguments.Name ) />
		<cfset setDescription( arguments.Description ) />
		<cfset setDateCreate( arguments.DateCreate ) />
		<cfset setDateLastUpdate( arguments.DateLastUpdate ) />
		<cfset setAdminID( arguments.AdminID ) />
		<cfset setTags( arguments.Tags ) />
		<cfset setSiteID( arguments.SiteID ) />
		<cfset setIsActive( arguments.IsActive ) />
		<!---^^SETTERS-END^^--->
		<cfset setBeanExists( arguments.BeanExists ) />
		<cfset setImageCount( arguments.ImageCount ) />
		<cfset setImageIDArray( arguments.ImageIDArray ) />
		
		<cfreturn this />
	</cffunction>

	<cffunction name="setMemento" access="public" returntype="ImageGroupBean" output="false">
		<cfargument name="memento" type="struct" required="yes"/>
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>
	<cffunction name="getMemento" access="public" returntype="struct" output="false" >
		<cfreturn variables.instance />
	</cffunction>
	
	<!---^^ACCESSORS-START^^--->
	<cffunction name="setImageGroupID" access="public" returntype="void" output="false">
		<cfargument name="ImageGroupID" type="uuid" required="true" />
		<cfset variables.instance['imagegroupid'] = arguments.ImageGroupID />
	</cffunction>
	<cffunction name="getImageGroupID" access="public" returntype="uuid" output="false">
		<cfreturn variables.instance.ImageGroupID />
	</cffunction>
	
	<cffunction name="setName" access="public" returntype="void" output="false">
		<cfargument name="Name" type="string" required="true" />
		<cfset variables.instance['name'] = arguments.Name />
	</cffunction>
	<cffunction name="getName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Name />
	</cffunction>
	
	<cffunction name="setDescription" access="public" returntype="void" output="false">
		<cfargument name="Description" type="string" required="true" />
		<cfset variables.instance['description'] = arguments.Description />
	</cffunction>
	<cffunction name="getDescription" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Description />
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
	
	<cffunction name="setAdminID" access="public" returntype="void" output="false">
		<cfargument name="AdminID" type="string" required="true" />
		<cfset variables.instance['adminid'] = arguments.AdminID />
	</cffunction>
	<cffunction name="getAdminID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.AdminID />
	</cffunction>
	
	<cffunction name="setTags" access="public" returntype="void" output="false">
		<cfargument name="Tags" type="string" required="true" />
		<cfset variables.instance['tags'] = arguments.Tags />
	</cffunction>
	<cffunction name="getTags" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Tags />
	</cffunction>
	
	<cffunction name="setSiteID" access="public" returntype="void" output="false">
		<cfargument name="SiteID" type="string" required="true" />
		<cfset variables.instance['siteid'] = arguments.SiteID />
	</cffunction>
	<cffunction name="getSiteID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SiteID />
	</cffunction>
	
	<cffunction name="setIsActive" access="public" returntype="void" output="false">
		<cfargument name="IsActive" type="boolean" required="true" />
		<cfset variables.instance['isactive'] = arguments.IsActive />
	</cffunction>
	<cffunction name="getIsActive" access="public" returntype="boolean" output="false">
		<cfreturn variables.instance.IsActive />
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
	<cffunction name="setImageCount" access="public" returntype="void" output="false">
		<cfargument name="ImageCount" type="numeric" required="true" />
		<cfset variables.instance['imageCount'] = arguments.ImageCount />
	</cffunction>
	<cffunction name="getImageCount" access="public" returntype="numeric" output="false">
		<cfreturn variables.instance.ImageCount />
	</cffunction>

	<cffunction name="setImageIDArray" access="public" returntype="void" output="false">
		<cfargument name="ImageIDArray" type="array" required="true" />
		<cfset variables.instance['ImageIDArray'] = arguments.ImageIDArray />
	</cffunction>
	<cffunction name="getImageIDArray" access="public" returntype="array" output="false">
		<cfreturn variables.instance.ImageIDArray />
	</cffunction>
<!---^^CUSTOMEND^^--->
</cfcomponent>	



