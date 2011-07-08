<!---
||MELDGALLERYLICENSE||
--->
<cfsilent>
	<!--- use 'local' to keep view-related data in-scope --->
	<cfset local.rc		= rc>
	<!--- headers --->
	<cfif not StructKeyExists(request,"meld_popeye_header_loaded")>
		<cfinclude template="../includes/headers/global.cfm">
		<cfset request.meld_popeye_header_loaded = true />
	</cfif>
	<cfif structkeyexists( rc,"headLoader" ) and arrayLen(rc.headLoader)>
		<cfloop from="1" to="#arrayLen(rc.headLoader)#" index="iiX">
			<cfhtmlhead text="#rc.headLoader[iiX]#">
		</cfloop>
		<cfset rc.headLoader = ArrayNew(1)/>
	</cfif>
</cfsilent>
<cfoutput>#body#</cfoutput>
