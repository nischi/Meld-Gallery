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
<cfcomponent displayname="ImageGroupImageBean" output="false" extends="MeldGallery.com.meldsolutions.core.MeldBean">
<!---^^GENERATEDSTART^^--->
	<!---^^PROPERTIES-START^^--->
	<cfproperty name="ImageGroupID" type="uuid" default="" required="true" maxlength="35" />
	<cfproperty name="ImageID" type="uuid" default="" required="true" maxlength="35" />
	<cfproperty name="Caption" type="string" default="" required="true" maxlength="255" />
	<cfproperty name="Description" type="string" default="" required="true" />
	<cfproperty name="ImageClass" type="string" default="" maxlength="25" />
	<cfproperty name="TextClass" type="string" default="" maxlength="25" />
	<!---^^PROPERTIES-END^^--->

	<cfset variables.instance = StructNew() />

	<!--- INIT --->
	<cffunction name="init" access="public" returntype="ImageGroupImageBean" output="false">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="ImageGroupID" type="uuid" required="false" default="#CreateUUID()#" />
		<cfargument name="ImageID" type="string" required="false" default="" />
		<cfargument name="Caption" type="string" required="false" default="" />
		<cfargument name="Description" type="string" required="false" default="" />
		<cfargument name="ImageClass" type="string" required="false" default="" />
		<cfargument name="TextClass" type="string" required="false" default="" />
		<!---^^ATTRIBUTES-END^^--->
		<cfargument name="BeanExists" type="boolean" required="false" default="false" />

		<!---^^SETTERS-START^^--->
		<cfset setImageGroupID( arguments.ImageGroupID ) />
		<cfset setImageID( arguments.ImageID ) />
		<cfset setCaption( arguments.Caption ) />
		<cfset setDescription( arguments.Description ) />
		<cfset setImageClass( arguments.ImageClass ) />
		<cfset setTextClass( arguments.TextClass ) />
		<!---^^SETTERS-END^^--->
		<cfset setBeanExists( arguments.BeanExists ) />
		
		<cfreturn this />
	</cffunction>

	<cffunction name="setMemento" access="public" returntype="ImageGroupImageBean" output="false">
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
	
	<cffunction name="setImageID" access="public" returntype="void" output="false">
		<cfargument name="ImageID" type="string" required="true" />
		<cfset variables.instance['imageid'] = arguments.ImageID />
	</cffunction>
	<cffunction name="getImageID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ImageID />
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
	
	<cffunction name="setImageClass" access="public" returntype="void" output="false">
		<cfargument name="ImageClass" type="string" required="true" />
		<cfset variables.instance['imageclass'] = arguments.ImageClass />
	</cffunction>
	<cffunction name="getImageClass" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ImageClass />
	</cffunction>
	
	<cffunction name="setTextClass" access="public" returntype="void" output="false">
		<cfargument name="TextClass" type="string" required="true" />
		<cfset variables.instance['textclass'] = arguments.TextClass />
	</cffunction>
	<cffunction name="getTextClass" access="public" returntype="string" output="false">
		<cfreturn variables.instance.TextClass />
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
<!---^^CUSTOMEND^^--->
</cfcomponent>	

