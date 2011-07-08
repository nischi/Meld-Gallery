<!---
||MELDMANAGERLICENSE||
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