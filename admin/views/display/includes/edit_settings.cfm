<!---
||MELDGALLERYLICENSE||
--->
<cfsilent>
	<cfset local.rc = rc>
</cfsilent>
<cfoutput>
	<div id="msTabs-Settings">
		<h3>#local.rc.DisplayTypeBean.getName()# #local.rc.mmRBF.key('settings')#</h3>
		<cfif rc.sourceType eq "collection">
			<div class="notice">#rc.mmRBF.key('muraimagesize')# (#rc.mmRBF.key('muramainimage')#: #$.siteConfig().getGalleryMainScale()#px, #rc.mmRBF.key('muramediumimage')# #$.siteConfig().getGalleryMediumScale()#px)</div>
		</cfif>
		<cfinclude template="../../../../#rc.displayTypeBean.getPackage()#/views/admin/settings.cfm">
	</div>
</cfoutput>
