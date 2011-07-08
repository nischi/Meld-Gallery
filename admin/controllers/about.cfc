<!---
||MELDGALLERYLICENSE||
--->
<cfcomponent extends="controller">
	<cffunction name="default" access="public" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset rc.mmBC.addCrumb( arguments.rc,rc.mmRBF.key('About'),"" )>
	</cffunction>

	<cffunction name="documentation" access="public" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset rc.mmBC.addCrumb( arguments.rc,rc.mmRBF.key('About'),"?action=admin:about" )>
		<cfset rc.mmBC.addCrumb( arguments.rc,rc.mmRBF.key('Documentation'),"?" )>
	</cffunction>

	<cffunction name="support" access="public" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset rc.mmBC.addCrumb( arguments.rc,rc.mmRBF.key('About'),"?action=admin:about" )>
		<cfset rc.mmBC.addCrumb( arguments.rc,rc.mmRBF.key('support'),"?" )>
	</cffunction>

	<cffunction name="license" access="public" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfset rc.mmBC.addCrumb( arguments.rc,rc.mmRBF.key('About'),"?action=admin:about" )>
		<cfset rc.mmBC.addCrumb( arguments.rc,rc.mmRBF.key('license'),"?" )>
	</cffunction>
</cfcomponent>