	<!---
||MELDGALLERYLICENSE||
--->
<cfcomponent displayname="MastheadGalleryBean" output="false" extends="MeldGallery.com.meldsolutions.meldgallery.core.displaytype.DisplayTypeBean">
	<cfset variables.instance = StructNew() />

	<!--- INIT --->
	<cffunction name="init" access="public" returntype="MastheadGalleryBean" output="false">
		<cfset super.init( argumentCollection=arguments ) />
		<cfreturn this />
	</cffunction>
</cfcomponent>	





