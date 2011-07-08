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
<cfcomponent displayname="PreProcess" output="false">

	<cfset variables.instance = StructNew()>

	<cffunction name="init" access="public" output="false" returntype="PreProcess">
		<cfreturn this/>
	</cffunction>

	<cffunction name="setImageService" access="public" returntype="void" output="false">
		<cfargument name="ImageService" type="any" required="true" />
		<cfset variables.instance.ImageService = arguments.ImageService />
	</cffunction>
	<cffunction name="getImageService" access="public" returntype="any" output="false">
		<cfreturn variables.instance.ImageService />
	</cffunction>

	<cffunction name="setDisplayImageService" access="public" returntype="void" output="false">
		<cfargument name="DisplayImageService" type="any" required="true" />
		<cfset variables.instance.DisplayImageService = arguments.DisplayImageService />
	</cffunction>
	<cffunction name="getDisplayImageService" access="public" returntype="any" output="false">
		<cfreturn variables.instance.DisplayImageService />
	</cffunction>

	<cffunction name="setImagegroupimageService" access="public" returntype="void" output="false">
		<cfargument name="ImagegroupimageService" type="any" required="true" />
		<cfset variables.instance.ImagegroupimageService = arguments.ImagegroupimageService />
	</cffunction>
	<cffunction name="getImagegroupimageService" access="public" returntype="any" output="false">
		<cfreturn variables.instance.ImagegroupimageService />
	</cffunction>

	<cffunction name="setmmFileUpload" access="public" returntype="void" output="false">
		<cfargument name="mmFileUpload" type="any" required="true" />
		<cfset variables.instance.mmFileUpload = arguments.mmFileUpload />
	</cffunction>
	<cffunction name="getmmFileUpload" access="public" returntype="any" output="false">
		<cfreturn variables.instance.mmFileUpload />
	</cffunction>
</cfcomponent>