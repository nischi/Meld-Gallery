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
</cfsilent>
<cfoutput>
<!--- global menu --->
<!--- begin content --->
<div id="meld-body">
	<!-- CONTENT HERE -->
<form id="meld-edit-form" class="meld-form" method="post" action="index.cfm" onsubmit="return validate(this);" enctype="multipart/form-data">
<input type="hidden" name="action" value="admin:display.choose">
<div>
	<div>
	<ul class="meld-form">
		<li>
			<label for="displayTypeID">
				#rc.mmRBF.key('displaytype')#
			</label>		
			<select class="select" name="displayTypeID" id="displaytypeid" required="true" message="#rc.mmRBF.key('displaytype','validation')#">
				<option value="">#local.rc.mmRBF.key('choosedisplaytype')#</option>
				<cfloop from="1" to="#arrayLen(local.rc.aDisplayTypes)#" index="local.iiX">
					<option value="#local.rc.aDisplayTypes[local.iiX].getDisplayTypeID()#">#local.rc.aDisplayTypes[local.iiX].getName()#</option>
				</cfloop>
			</select>
		</li>
		<li>
			<label for="displayTypeID">
				#rc.mmRBF.key('source')#
			</label>		
			<select class="select" name="sourceType" id="sourceType" required="true" message="#rc.mmRBF.key('source','validation')#">
				<option value="imagegroup">#local.rc.mmRBF.key('imagegroup')#</option>
				<option value="collection">#local.rc.mmRBF.key('collection')#</option>
			</select>
		</li>
	</ul>
	</div>
	<div>
		<ul class="form-buttons">
			<li><input name="btaction" type="submit" class="submit ui-state-default" value="#rc.mmRBF.key('next')#"></li>
			<li><input name="btaction" id="ui-button-cancel" type="submit" class="submit ui-state-default" value="#rc.mmRBF.key('cancel')#"></li>
		</ul>
	</div>
</div>	
</form>


<!---	<form method="post" enctype="multipart/form-data">
		<input type="file" name="newImage">
		<input type="submit">
	</form>
--->
</div>	
<!--- end content --->
</cfoutput> 