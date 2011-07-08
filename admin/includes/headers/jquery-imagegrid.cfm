<!---
||MELDGALLERYLICENSE||
--->
<cfsilent>
<cfsavecontent variable="local.str">
<cfoutput><link rel="stylesheet" href="#rc.$.globalConfig().getContext()#/plugins/#local.rc.pluginConfig.getDirectory()#/admin/assets/css/imagegrid.css" type="text/css" media="all" />
<script src="#rc.$.globalConfig('context')#/plugins/#local.rc.pluginConfig.getDirectory()#/admin/assets/js/imagegrid/jquery.imagegrid.0.1.js" type="text/javascript" language="Javascript"></script></cfoutput>
</cfsavecontent>
<cfset arrayPrepend( rc.headLoader,local.str )>
</cfsilent>