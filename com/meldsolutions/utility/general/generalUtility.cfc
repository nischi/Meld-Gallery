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
<cfcomponent>

	<cffunction name="isUUID" access="public" output="false" returntype="string">
		<cfargument name="value" type="string" required="true" />
	
		<cfreturn REFindNoCase("^[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{16}$", value) />
	</cffunction>

	<cffunction name="createUUIDFromString" access="public" output="false" returntype="string">
		<cfargument name="value" type="string" required="true" />
		
		<cfset var hashString	= hash( arguments.value ) />
		<cfset var newUUID		= left(hashString,8) & "-" & mid(hashString,9,4) & "-" & "3" & mid(hashString,13,3) & "-" & right(hashString,16) />

		<cfreturn newUUID />
	</cffunction>

	<cffunction name="structMerge" access="public" output="false" returntype="struct">
		<cfargument name="aStruct" type="struct" required="true" />
		<cfargument name="bStruct" type="struct" required="true" />
	
		<cfset var iiX = "" />
	
		<cfloop collection="#arguments.bStruct#" item="iiX">
			<cfset arguments.aStruct[iiX] = arguments.bStruct[iiX] />
		</cfloop>

		<cfreturn arguments.aStruct />
	</cffunction>

	<cffunction name="structCompare" access="public" output="false" returntype="boolean">
		<cfargument name="aStruct" type="struct" required="true" />
		<cfargument name="bStruct" type="struct" required="true" />
	
		<cfset var iiX = "" />
	
		<cfloop collection="#arguments.aStruct#" item="iiX">
			<cfif not structKeyExists( arguments.aStruct,iiX )
				or not structKeyExists( arguments.bStruct,iiX )
				or arguments.aStruct[iiX] neq arguments.bStruct[iiX]>
				<cfreturn false>
				<cfbreak>
			</cfif>
		</cfloop>

		<cfreturn true />
	</cffunction>
</cfcomponent> 