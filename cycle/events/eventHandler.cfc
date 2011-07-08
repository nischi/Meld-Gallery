	<!---
||MELDGALLERYLICENSE||
--->
<cfcomponent extends="mura.plugin.pluginGenericEventHandler">
	<cfset variables.framework=getFrameworkVariables()>

	<cffunction name="onApplicationLoad">
		<cfargument name="$">

		<cfset variables.pluginConfig.addEventHandler(this)>
	</cffunction>

	<cffunction name="onGlobalSessionStart">
		<cfargument name="$">
		<!--- invoke onApplicationStart in the application.cfc so the framework can do its thing --->
		<cfinvoke component="#pluginConfig.getPackage()#.Application" method="onSessionStart" />
	</cffunction>

	<cffunction name="getFrameworkVariables" output="false" access="private">
		<cfset var framework = StructNew() />
		<cfinclude template="../../frameworkConfig.cfm" />
		<cfreturn framework />		
	</cffunction>
</cfcomponent>