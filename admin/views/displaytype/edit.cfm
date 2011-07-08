<!---
||MELDGALLERYLICENSE||
--->
<cfsilent>
	<!--- use 'local' to keep view-related data in-scope --->
	<cfset local.rc		= rc>
	<cfset local.info = false>
	<!--- headers --->
	<cfinclude template="/#local.rc.pluginConfig.getPackage()#/admin/includes/headers/jquery-ui-tabs.cfm">
	<cfinclude template="/#local.rc.pluginConfig.getPackage()#/admin/includes/headers/jquery-ui.cfm">
	<cfif fileExists("../../../#rc.displayTypeBean.getPackage()#/views/admin/info.cfm")>
		<cfset local.info = true>
	</cfif>
</cfsilent><cfoutput>
<!--- global menu --->
<!--- begin content --->
<div id="meld-body">
	<!-- CONTENT HERE -->
<form id="meld-edit-form" class="meld-form" method="post" action="index.cfm" onsubmit="return validate(this);" enctype="multipart/form-data">
<input type="hidden" name="action" value="admin:displaytype.edit">
<input type="hidden" name="displayTypeID" value="#local.rc.displayTypeBean.getDisplayTypeID()#">
	<div id="msTabs">
	<ul>
		<li><a id="msTabs-Settings-Tab" href="##msTabs-Settings">#local.rc.mmRBF.key('settings')#</a></li>
		<li><a id="msTabs-Options-Tab" href="##msTabs-Options">#local.rc.mmRBF.key('options')#</a></li>
		<cfif local.info>
		<li><a id="msTabs-Info-Tab" href="##msTabs-Info">#local.rc.mmRBF.key('information')#</a></li>
		</cfif>
	</ul>
	<div id="msTabs-panels">
		#view("displaytype/includes/edit_settings")#
		#view("displaytype/includes/edit_options")#
		<cfif local.info>
		#view("display/includes/edit_info")#
		</cfif>
	</div>
	<div>
		<ul class="form-buttons">
			<li><input name="btaction" id="btcancel" type="submit" class="submit ui-state-default" value="#rc.mmRBF.key('cancel')#"></li>
			<li><input name="btaction" id="btupdate" type="submit" class="submit ui-state-default" value="#rc.mmRBF.key('update')#"></li>
		</ul>
	</div>
</div>	
</form>


<!---	<form method="post" enctype="multipart/form-data">
		<input type="file" name="newDisplay">
		<input type="submit">
	</form>
--->
</div>	
<!--- end content --->
</cfoutput> 