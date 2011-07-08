<!---
||MELDGALLERYLICENSE||
--->
<cfsilent>
	<!--- use 'local' to keep view-related data in-scope --->
	<cfset local.rc		= rc>
	<cfset local.info	= false>
	<!--- headers --->
	<cfswitch expression="#rc.sourceType#">
		<cfcase value="collection">
			<cfinclude template="headers/jquery-datatable-imagegroup.cfm">
		</cfcase>
		<cfdefaultcase>
			<cfif StructKeyExists(rc.settingsData,'requiresImageGroup') and rc.settingsData.requiresImageGroup eq true>
				<cfinclude template="headers/jquery-datatable-imagegroup.cfm">
			</cfif>
		</cfdefaultcase>
	</cfswitch>

	<cfinclude template="/#local.rc.pluginConfig.getPackage()#/admin/includes/headers/jquery-datatable.cfm">
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
<input type="hidden" name="action" value="admin:display.edit">
<input type="hidden" name="displayTypeID" value="#local.rc.displayBean.getDisplayTypeID()#">
<input type="hidden" name="displayID" value="#local.rc.displayBean.getdisplayID()#">
<input type="hidden" name="params_sourcetype" value="#form.params_sourcetype#">
<div id="msTabs">
	<ul>
		<li><a id="msTabs-General-Tab" href="##msTabs-General">#local.rc.mmRBF.key('general')#</a></li>
		<cfswitch expression="#rc.sourceType#">
			<cfcase value="collection">
				<li><a id="msTabs-Collection-Tab" href="##msTabs-Collection">#local.rc.mmRBF.key('Collection')#</a></li>
			</cfcase>
			<cfdefaultcase>
				<cfif StructKeyExists(rc.settingsData,'requiresImageGroup') and rc.settingsData.requiresImageGroup eq true>
				<li><a id="msTabs-ImageGroup-Tab" href="##msTabs-ImageGroup">#local.rc.mmRBF.key('ImageGroup')#</a></li>
				</cfif>
			</cfdefaultcase>
		</cfswitch>

		<li><a id="msTabs-Settings-Tab" href="##msTabs-Settings">#local.rc.mmRBF.key('settings')#</a></li>
		<cfif local.info>
		<li><a id="msTabs-Info-Tab" href="##msTabs-Info">#local.rc.mmRBF.key('information')#</a></li>
		</cfif>
	</ul>
	<div id="msTabs-panels">
		#view("display/includes/edit_general")#
		<cfswitch expression="#rc.sourceType#">
			<cfcase value="collection">
				#view("display/includes/edit_collection")#
			</cfcase>
			<cfdefaultcase>
				<cfif StructKeyExists(rc.settingsData,'requiresImageGroup') and rc.settingsData.requiresImageGroup eq true>
					#view("display/includes/edit_imagegroup")#
				</cfif>
			</cfdefaultcase>
		</cfswitch>
		#view("display/includes/edit_settings")#
		<cfif local.info>
		#view("display/includes/edit_info")#
		</cfif>
	</div>
	<div>
		<ul class="form-buttons">
			<li><input name="btaction" id="btcancel" type="submit" class="submit ui-state-default" value="#rc.mmRBF.key('cancel')#"></li>
			<cfif local.rc.displayBean.beanExists()>
				<li><input name="btaction" id="btupdate" type="submit" class="submit ui-state-default" value="#rc.mmRBF.key('update')#"></li>
				<li class="right">
					<input type="hidden" id="btdeleteconfirm" name="btdeleteconfirm" value="" />
					<input data-delete="#local.rc.mmRBF.key('delete')#" data-cancel="#local.rc.mmRBF.key('cancel')#" data-title="#local.rc.mmRBF.key('delete')#" data-message="#local.rc.mmRBF.key('display','validation')#" id="btdelete" name="btaction" type="submit" class="submit ui-state-highlight" value="#rc.mmRBF.key('delete')#">
				</li>
			<cfelse>
				<li><input name="btaction" id="btsave" type="submit" class="submit ui-state-default" value="#rc.mmRBF.key('save')#"></li>
			</cfif>
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