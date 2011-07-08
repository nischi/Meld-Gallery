<!---
||MELDGALLERYLICENSE||
--->
<!--- this central controller must be extended by all section controllers --->
<cfcomponent displayname="controller" output="false" extends="mura.cfobject">

	<!--- do not remove the init ... it is crucial --->
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfargument name="fw" type="struct" required="false" default="#StructNew()#">
		<cfset variables.fw = fw />
		
		<cfreturn this />
	</cffunction>

	<!--- runs before every controller request --->
	<cffunction name="before" access="public" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset var mmResourceBundle	= getBeanFactory().getBean("mmResourceBundle") />
		<cfset var displayService	= getBeanFactory().getBean("displayService")>
		<cfset var sInitArgs		= StructNew()>
		<cfset var displayBean		= displayService.getDisplay( rc.params.displayID )>

		<!--- headloader for head includes --->
		<cfset rc.headLoader = ArrayNew(1) />
		<!--- pluginConfig --->
		<cfset rc.pluginConfig = fw.getPluginConfig() />

		<!--- enable the Mura Scope --->
		<cfif not isDefined("$") and structKeyExists(session,"siteID")>
			<cfset rc.$=rc.$>
		</cfif>

		<cfset rc.siteID			= session.siteid />
		<cfset rc.displayBean		= displayBean />
		<cfset rc.displayID			= rc.params.displayID />

		<cfset rc.isAdmin 			= false>

		<cfset rc.subsystem			= fw.getSubSystem()>
		<cfset rc.userID			= rc.$.currentUser('userID')>
		<cfset rc.isAdmin			= rc.$.currentUser().isInGroup('admin') eq true OR rc.$.currentUser().isSuperUser() eq true>
		<cfset rc.rbFactory			= rc.pluginConfig.getApplication().getValue( "rbFactory")>
		<cfset rc.directory			= rc.pluginConfig.getDirectory()>
		<cfset rc.PluginDirectory	= "#rc.$.globalConfig('context')#/plugins/#rc.pluginConfig.getDirectory()#/">
		<cfset rc.mmRBF				= fw.getBeanFactory().getBean("localmmResourceBundle")>
	</cffunction>

	<!--- runs after every controller request --->
	<cffunction name="after" access="public" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">
		
	</cffunction>
	
	<cffunction name="getBeanFactory" access="public" returntype="any" output="false">
		<cfreturn variables.fw.getBeanFactory()>
	</cffunction>
</cfcomponent>