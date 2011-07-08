	<!---
||MELDGALLERYLICENSE||
--->
<cfcomponent displayname="PopEyeBean" output="false" extends="MeldGallery.com.meldsolutions.meldgallery.core.displaytype.DisplayTypeBean">
	<cfset variables.instance = StructNew() />

	<!--- INIT --->
	<cffunction name="init" access="public" returntype="PopEyeBean" output="false">
		<cfset super.init( argumentCollection=arguments ) />
		<cfreturn this />
	</cffunction>
</cfcomponent>	





