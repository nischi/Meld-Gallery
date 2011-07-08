<!---
||MELDGALLERYLICENSE||
--->
<cfsilent>
	<!--- use 'local' to keep view-related data in-scope --->
	<cfset local.rc		= rc>
	<!--- headers --->
</cfsilent><cfoutput>
<!--- global menu --->
<!--- begin content --->
<div id="meld-body">
	<!-- CONTENT HERE -->
	<div id="meld-actions" class="section clearfix">
		#view("settings/includes/default_actions")#
	</div>
	<div>
		<ul class="metadata">
			<cfif not isSimpleValue( rc.DisplayTypeBean )>
			<li>
				<strong>#rc.mmRBF.key('default')# #rc.mmRBF.key('displaytype')#:</strong> #rc.DisplayTypeBean.getName()#
			</li>
			</cfif>
			<li>
				<strong>#rc.mmRBF.key('sourcedimensions')#:</strong> #rc.SettingsBean.getImageWidth()# x #rc.SettingsBean.getImageHeight()#
			</li>
			<li>
				<strong>#rc.mmRBF.key('filesizelimit')#:</strong> #rc.SettingsBean.getFileSizeLimit()##rc.mmRBF.key('kilobytes')#
			</li>
			<li>
				<strong>#rc.mmRBF.key('sync')#:</strong> #rc.mmRBF.key('yes' & rc.SettingsBean.getSyncInfo() )#
			</li>
		</ul>
	</div>
</div>	
<!--- end content --->
</cfoutput> 