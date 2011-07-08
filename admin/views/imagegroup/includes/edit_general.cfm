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
	<div id="msTabs-General">
		<h3>#local.rc.mmRBF.key('general')#</h3>
		<ul class="form">
			<li>
				<label for="ImageGroupbean_name">#local.rc.mmRBF.key('name')#</label>
				<input class="text" type="text" name="ImageGroupbean_name" id="ImageGroupbean_name" value="#form.ImageGroupbean_name#" size="30" maxlength="100" />
			</li>
			<li>
				<label for="imagegroupbean_tags">#local.rc.mmRBF.key('tags')#</label>
				<input class="text long" type="text" name="imagegroupbean_tags" id="imagegroupbean_tags" value="#form.imagegroupbean_tags#" size="30" maxlength="255" />
			</li>
			<li>
			<label for="ImageGroupbean_description">#local.rc.mmRBF.key('description')#: </label>
			<textarea name="ImageGroupbean_description" id="ImageGroupbean_description"><cfif len(form.ImageGroupbean_description)>#HTMLEditFormat(form.ImageGroupbean_description)#<cfelse><br /></cfif></textarea>
			<script type="text/javascript" language="Javascript">
			var loadEditorCount = 0;
			jQuery('##ImageGroupbean_description').ckeditor(
				{ toolbar: 'Default',
				height:'200',
				customConfig : 'config.js.cfm' },htmlEditorOnComplete);
			</script>
			</li>
		</ul>
	</div>
</cfoutput>