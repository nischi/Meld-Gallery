<!---

This file is part of the Meld Gallery application.

Meld Gallery is licensed under the GPL 2.0 license
Copyright (C) 2010 2011 Meld Solutions Inc. http://www.meldsolutions.com/

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation, version 2 of that license..

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

--->
<cfsilent>
	<!--- use 'local' to keep view-related data in-scope --->
	<cfset local.rc		= rc>
	<!--- headers --->
	<cfinclude template="headers/jquery-imagegrid.cfm">
	<cfinclude template="/#local.rc.pluginConfig.getPackage()#/admin/includes/headers/jquery-imagegrid.cfm">
	<cfinclude template="/#local.rc.pluginConfig.getPackage()#/admin/includes/headers/jquery-ui-tabs.cfm">
	<cfinclude template="/#local.rc.pluginConfig.getPackage()#/admin/includes/headers/jquery-ui.cfm">
</cfsilent><cfoutput>
<!--- global menu --->
<!--- begin content --->
<div id="meld-body">
	<!-- CONTENT HERE -->
<form id="meld-edit-form" class="meld-form" method="post" action="index.cfm" onsubmit="return validate(this);" enctype="multipart/form-data">
<input type="hidden" name="action" value="admin:imagegroup.edit">
<input type="hidden" name="imagegroupID" value="#local.rc.imageGroupBean.getimageGroupID()#">
<div id="msTabs">
	<ul>
		<li><a id="msTabs-General-Tab" href="##msTabs-General">#local.rc.mmRBF.key('general')#</a></li>
		<li><a id="msTabs-Images-Tab" href="##msTabs-Images">#local.rc.mmRBF.key('images')#</a></li>
		<li><a id="msTabs-Option-Tab" href="##msTabs-Options">#local.rc.mmRBF.key('options')#</a></li>
	</ul>
	<div id="msTabs-panels">
		#view("imagegroup/includes/edit_general")#
		#view("imagegroup/includes/edit_imagegrid")#
		#view("imagegroup/includes/edit_options")#
	</div>
	<div>
		<ul class="form-buttons">
			<li><input name="btaction" id="btcancel" type="submit" class="submit ui-state-default" value="#rc.mmRBF.key('cancel')#"></li>
			<cfif local.rc.imageGroupBean.beanExists()>
				<li><input name="btaction" id="btupdate" type="submit" class="submit ui-state-default" value="#rc.mmRBF.key('update')#"></li>
				<li class="right">
					<input type="hidden" id="btdeleteconfirm" name="btdeleteconfirm" value="" />
					<input data-delete="#local.rc.mmRBF.key('delete')#" data-cancel="#local.rc.mmRBF.key('cancel')#" data-title="#local.rc.mmRBF.key('delete')#" data-message="#local.rc.mmRBF.key('deleteimagegroup','validation')#" id="btdelete" name="btaction" type="submit" class="submit ui-state-highlight" value="#rc.mmRBF.key('delete')#">
				</li>
			<cfelse>
				<li><input name="btaction" id="btsave" type="submit" class="submit ui-state-default" value="#rc.mmRBF.key('save')#"></li>
			</cfif>
		</ul>
	</div>
</div>	
</form>
</div>	
<!--- end content --->
</cfoutput> 