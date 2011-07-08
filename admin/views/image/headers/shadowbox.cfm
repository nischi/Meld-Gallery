<!---
||MELDGALLERYLICENSE||
--->
﻿<cfsilent>
<cfsavecontent variable="local.str">
<cfoutput>
	<link href="#rc.$.siteConfig().getAssetPath()#/css/shadowbox.css" rel="stylesheet" type="text/css" />
	<script src="#rc.$.siteConfig().getAssetPath()#/js/adapter/shadowbox-jquery.js" type="text/javascript"></script>
	<script src="#rc.$.siteConfig().getAssetPath()#/js/shadowbox.js" type="text/javascript"></script>
</cfoutput></cfsavecontent>
<cfset arrayPrepend( rc.headLoader,local.str )>
</cfsilent>
