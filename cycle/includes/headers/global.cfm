<!---
||MELDGALLERYLICENSE||
--->
<cfsilent>
<cfif not structKeyExists(request,"MeldGallery_header_cycle")>
	<cfsavecontent variable="local.str"><cfoutput>
	<cfif not request.contentRenderer.jsLibLoaded>
		<cfset request.contentRenderer.jsLibLoaded = true />
		<script type="text/javascript" src="#rc.$.globalConfig('context')#/default/js/jquery/jquery.js"></script>
	</cfif>
	<link rel="stylesheet" href="#local.rc.PluginDirectory##local.rc.subsystem#/assets/css/base.css" type="text/css" media="screen" />
	<script type="text/javascript" src="#local.rc.PluginDirectory##local.rc.subsystem#/assets/js/base.js"></script>
	<script type="text/javascript" src="#local.rc.PluginDirectory##local.rc.subsystem#/assets/js/jquery.cycle.all.min.js"></script>
	</cfoutput>
	</cfsavecontent>
	<cfset arrayPrepend( rc.headLoader,local.str )>
	<cfset request.MeldGallery_header_cycle = true />
</cfif>
</cfsilent>
