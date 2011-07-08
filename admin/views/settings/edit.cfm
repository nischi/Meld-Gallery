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