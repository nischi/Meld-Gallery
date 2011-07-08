<!---
||MELDGALLERYLICENSE||
--->
<cfsilent>
	<!--- use 'local' to keep view-related data in-scope --->
	<cfset local.rc		= rc>
	<!--- headers --->
	<cfinclude template="/#local.rc.pluginConfig.getPackage()#/admin/includes/headers/jquery-ui-tabs.cfm">
	<cfinclude template="/#local.rc.pluginConfig.getPackage()#/admin/includes/headers/jquery-ui.cfm">
</cfsilent><cfoutput>
<!--- global menu --->
<!--- begin content --->

<div id="meld-body">
	<!-- CONTENT HERE -->
<form id="meld-edit-form" class="meld-form" method="post" action="index.cfm" onsubmit="return validate(this);" enctype="multipart/form-data">
<input type="hidden" name="action" value="admin:settings.edit">
<input type="hidden" name="settingsID" value="#local.rc.settingsBean.getsettingsID()#">
	<div id="msTabs">
	<ul>
		<li><a id="msTabs-ImageSource-Tab" href="##msTabs-ImageSource">#local.rc.mmRBF.key('sourceimage')#</a></li>
		<li><a id="msTabs-ImageThumb-Tab" href="##msTabs-ImageThumb">#local.rc.mmRBF.key('secondaryimages')#</a></li>
		<li><a id="msTabs-Options-Tab" href="##msTabs-Options">#local.rc.mmRBF.key('options')#</a></li>
	</ul>
	<div id="msTabs-panels">
		#view("settings/includes/edit_source")#
		#view("settings/includes/edit_thumbnail")#
		#view("settings/includes/edit_options")#
	</div>
	<div>
		<ul class="form-buttons">
			<li><input name="btaction" id="btcancel" type="submit" class="submit ui-state-default" value="#rc.mmRBF.key('cancel')#"></li>
			<li><input name="btaction" id="btupdate" type="submit" class="submit ui-state-default" value="#rc.mmRBF.key('update')#"></li>
		</ul>
	</div>
</div>	
</form>

</div>	
<!--- end content --->
</cfoutput> 