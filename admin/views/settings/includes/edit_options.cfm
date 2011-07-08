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
	<cfset local.rc = rc>
</cfsilent>
<cfoutput>
	<div id="msTabs-Options">
		<h3>#local.rc.mmRBF.key('options')#</h3>
		<ul class="form">
		<li>
			<label for="displayTypeID">
				#rc.mmRBF.key('default')# #rc.mmRBF.key('displaytype')#
			</label>		
			<select class="select" name="settingbean_defaultdisplaytypeid" id="settingbean_defaultdisplaytypeid" required="true" message="#rc.mmRBF.key('displaytype','validation')#">
				<cfloop from="1" to="#arrayLen(local.rc.aDisplayTypes)#" index="local.iiX">
					<cfset local.displayType = local.rc.aDisplayTypes[local.iiX] />
					<cfset local.settings = local.displayType.getSettingsData() />
					<cfif not structKeyExists(local.settings,"allowMuraGallery") or local.settings.allowMuraGallery eq true>
					<option value="#local.rc.aDisplayTypes[local.iiX].getDisplayTypeID()#"<cfif local.rc.aDisplayTypes[local.iiX].getDisplayTypeID() eq form.settingbean_defaultdisplaytypeid> SELECTED</cfif>>#local.rc.aDisplayTypes[local.iiX].getName()#</option>
					</cfif>
				</cfloop>
			</select>
		</li>
		<li>
			<label for="settingbean_filesizelimit">
				#local.rc.mmRBF.key('filesizelimit')#
				<a href="##" class="tooltip"><span>#local.rc.mmRBF.key('filesizelimit','tip')#</span>&nbsp;</a>					
			</label>
			<input class="text tiny" type="text" name="settingbean_filesizelimit" id="settingbean_filesizelimit" value="#form.settingbean_filesizelimit#" size="10" maxlength="10" required="true" validate="numeric" message="#local.rc.mmRBF.key('filesizelimit','validate')#"/>
		</li>
		<li>
			<label for="settingbean_syncinfo">
				<input type="checkbox" name="settingbean_syncinfo" id="settingbean_syncinfo" value="1" <cfif form.settingbean_syncinfo>CHECKED</cfif>/>
				#local.rc.mmRBF.key('syncinfo')#
				<a href="##" class="tooltip"><span>#local.rc.mmRBF.key('syncinfo','tip')#</span>&nbsp;</a>
			</label>
				#local.rc.mmRBF.key('syncinfonote')#					
		</li>
		</ul>
	</div>
</cfoutput>