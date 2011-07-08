	<!---
||MELDGALLERYLICENSE||
--->
<cfcomponent displayname="MeldGalleryManager" output="false">

	<cfset variables.instance = StructNew()>

	<cffunction name="init" returntype="MeldGalleryManager" access="public" output="false">
		<cfset variables.settings = StructNew() />
		
		<cfreturn this>
	</cffunction>

	<cffunction name="getMeldBean" returntype="any" access="public" output="false">
		<cfreturn createObject("component","MeldGallery.com.meldsolutions.core.MeldBean")>
	</cffunction>

	<cffunction name="getSiteSettings" returntype="any" access="public" output="false">
		<cfargument name="siteID" type="string" required="true">

		<cfset var settingService	= getBeanFactory().getBean("settingService") />
		<cfset var settingBean		= "" />

		<cfif not structKeyExists( variables.settings,siteID ) >
			<cfset variables.settings[siteID] = settingService.getBeanByAttributes( siteID=arguments.siteID ) />
			
			<cfif not variables.settings[siteID].beanExists()>
				<cfset variables.settings[siteID] = settingService.createBaseSiteSettings( arguments.siteID ) />
			</cfif>
		</cfif>

		<cfreturn variables.settings[siteID] >
	</cffunction>

	<cffunction name="clearSiteSettings" returntype="void" access="public" output="false">
		<cfset variables.settings = StructNew() />
	</cffunction>

	<cffunction name="setPluginConfig" access="public" returntype="any" output="false">
		<cfargument name="PluginConfig" type="any" required="true">
		<cfset variables.PluginConfig = arguments.PluginConfig>
	</cffunction>
	<cffunction name="getPluginConfig" access="public" returntype="any" output="false">
		<cfreturn variables.PluginConfig>
	</cffunction>

	<cffunction name="setBeanFactory" access="public" returntype="any" output="false">
		<cfargument name="BeanFactory" type="any" required="true">
		<cfset variables.BeanFactory = arguments.BeanFactory>
	</cffunction>
	<cffunction name="getBeanFactory" access="public" returntype="any" output="false">
		<cfreturn variables.BeanFactory>
	</cffunction>

	<cffunction name="setMeldInterceptManager" access="public" returntype="any" output="false">
		<cfargument name="MeldInterceptManager" type="any" required="true">
		<cfset variables.MeldInterceptManager = arguments.MeldInterceptManager>
	</cffunction>
	<cffunction name="getMeldInterceptManager" access="public" returntype="any" output="false">
		<cfreturn variables.MeldInterceptManager>
	</cffunction>
</cfcomponent>