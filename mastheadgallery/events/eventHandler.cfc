<!---
||MELDGALLERYLICENSE||
--->
<cfcomponent extends="mura.plugin.pluginGenericEventHandler">
	<cfset variables.framework=getFrameworkVariables()>

	<cffunction name="onApplicationLoad">
		<cfargument name="$">

		<cfset variables.pluginConfig.addEventHandler(this)>
	</cffunction>
	
	<cffunction name="getFrameworkVariables" output="false" access="private">
		<cfset var framework = StructNew() />

		<cfinclude template="../../frameworkConfig.cfm" />

		<cfreturn framework />		
	</cffunction>
</cfcomponent>