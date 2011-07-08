<!---
||MELDGALLERYLICENSE||
--->
<cfsilent>
	<cfset local.rc = rc>
</cfsilent>
<cfoutput>
	<div id="msTabs-Settings">
		<h3>#local.rc.DisplayTypeBean.getName()# #local.rc.mmRBF.key('settings')#</h3>
		<cfinclude template="../../../../#rc.displayTypeBean.getPackage()#/views/admin/settings.cfm">
	</div>
</cfoutput>