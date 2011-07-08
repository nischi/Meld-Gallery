<!---
||MELDGALLERYLICENSE||
--->
<cfsilent>
<cfsavecontent variable="local.str">
<cfoutput>
<script src="#rc.$.globalConfig('context')#/plugins/#local.rc.pluginConfig.getDirectory()#/admin/assets/js/selecttable/jquery.selecttable.display.js" type="text/javascript" language="Javascript"></script></cfoutput>
</cfsavecontent>
<cfset arrayPrepend( rc.headLoader,local.str )>
</cfsilent>