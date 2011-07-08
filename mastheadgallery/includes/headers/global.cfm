<!---
||MELDGALLERYLICENSE||
--->
<cfsilent>
<cfsavecontent variable="local.str"><cfoutput>
<link rel="stylesheet" href="#local.rc.PluginDirectory#/#local.rc.subsystem#/assets/css/base.css" type="text/css" media="screen" />
<cfif not rc.$.getContentRenderer().jsLibLoaded>
	<cfset rc.$.getContentRenderer().jsLibLoaded = true>
	<script type="text/javascript" src="/admin/js/jquery/jquery.js"></script>
</cfif>
<script type="text/javascript" src="#local.rc.PluginDirectory##local.rc.subsystem#/assets/js/jquery.mastheadfader.js"></script>
<script type="text/javascript" src="#local.rc.PluginDirectory##local.rc.subsystem#/assets/js/base.js"></script>
</cfoutput>
</cfsavecontent>
<cfset arrayPrepend( rc.headLoader,local.str )>
</cfsilent>