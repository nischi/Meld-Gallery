<!---
||MELDGALLERYLICENSE||
--->
<cfsilent>
	<cfset local.rc = rc>
</cfsilent>
<cfoutput>
	<div id="msTabs-Info">
		<h3>#local.rc.DisplayTypeBean.getName()# #local.rc.mmRBF.key('information')#</h3>
		<cfinclude template="../../../../#rc.displayTypeBean.getPackage()#/views/admin/info.cfm">
	</div>
</cfoutput>