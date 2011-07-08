<!---
||MELDMANAGERLICENSE||
--->
<cfcomponent displayname="MeldBean" hint="Root for all mm-based beans" output="false">
	<cfset variables.values		= StructNew()>

	<cffunction name="init" access="public" output="false" returntype="MeldBean">
		<cfreturn this/>
	</cffunction>

	<!--- will update an existing bean's memento with data values --->
	<cffunction name="updateMemento" access="public" output="false" returntype="void">
		<cfargument name="data" type="struct" required="true">

		<cfset var iiX = "">
		<cfloop collection="#arguments.data#" item="iiX">
			<cfif structKeyExists( variables.instance,iiX )>
				<cfset variables.instance[lcase(iiX)] = arguments.data[iiX]>
			</cfif>
		</cfloop>

		<cfif isDefined("arguments.data.values") and isStruct( arguments.data.values )>
			<cfloop collection="#arguments.data.values#" item="iiX">
				<cfset variables.values[lcase(iiX)] = arguments.data.values[iiX]>
			</cfloop>
		</cfif>
	</cffunction>

	<!--- VALUES --->
	<cffunction name="valueExists" access="public" output="false" returntype="boolean">
		<cfargument name="key" type="string" required="true">
		
		<cfreturn structkeyexists( variables.values,arguments.key) />
	</cffunction>
	<cffunction name="getAllValues" access="public" output="false" returntype="struct">
		<cfreturn variables.values />
	</cffunction>
	<cffunction name="setAllValues" access="public" output="false" returntype="void">
		<cfargument name="value" type="struct" required="true">
		
		<cfset variables.values = structCopy( arguments.value ) />
	</cffunction>

	<cffunction name="clearAllValues" access="public" output="false" returntype="struct">
		<cfreturn structclear(variables.values) />
	</cffunction>

	<cffunction name="setValue" access="public" output="false" returntype="any">
		<cfargument name="key" type="string" required="true">
		<cfargument name="value" type="any" required="true">
		
		<cfset variables.values[arguments.key] = arguments.value />
	</cffunction>

	<cffunction name="getValue" access="public" output="false" returntype="any">
		<cfargument name="key" type="string" required="true">
		
		<cfif structkeyexists( variables.values,arguments.key)>
			<cfreturn variables.values[arguments.key] />
		</cfif>
		<cfreturn "" />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfif isDate( getDateCreate() )>
			<cfreturn true />
		</cfif>
		<cfreturn false />
	</cffunction>

</cfcomponent>