<!---
||MELDGALLERYLICENSE||
--->
<cfcomponent displayname="PreProcess" output="false">

	<cfset variables.instance = StructNew()>

	<cffunction name="init" access="public" output="false" returntype="PreProcess">
		<cfreturn this/>
	</cffunction>

	<cffunction name="setImageService" access="public" returntype="void" output="false">
		<cfargument name="ImageService" type="any" required="true" />
		<cfset variables.instance.ImageService = arguments.ImageService />
	</cffunction>
	<cffunction name="getImageService" access="public" returntype="any" output="false">
		<cfreturn variables.instance.ImageService />
	</cffunction>

	<cffunction name="setDisplayImageService" access="public" returntype="void" output="false">
		<cfargument name="DisplayImageService" type="any" required="true" />
		<cfset variables.instance.DisplayImageService = arguments.DisplayImageService />
	</cffunction>
	<cffunction name="getDisplayImageService" access="public" returntype="any" output="false">
		<cfreturn variables.instance.DisplayImageService />
	</cffunction>

	<cffunction name="setImagegroupimageService" access="public" returntype="void" output="false">
		<cfargument name="ImagegroupimageService" type="any" required="true" />
		<cfset variables.instance.ImagegroupimageService = arguments.ImagegroupimageService />
	</cffunction>
	<cffunction name="getImagegroupimageService" access="public" returntype="any" output="false">
		<cfreturn variables.instance.ImagegroupimageService />
	</cffunction>

	<cffunction name="setmmFileUpload" access="public" returntype="void" output="false">
		<cfargument name="mmFileUpload" type="any" required="true" />
		<cfset variables.instance.mmFileUpload = arguments.mmFileUpload />
	</cffunction>
	<cffunction name="getmmFileUpload" access="public" returntype="any" output="false">
		<cfreturn variables.instance.mmFileUpload />
	</cffunction>
</cfcomponent>