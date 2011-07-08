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
			<li class="first">
				<label for="newImage">#local.rc.mmRBF.key('image')#</label>
				<input class="file" type="file" name="newImage" id="newImage"
				<cfif not rc.imageBean.beanExists()>
				required="true" validate="string" message="#local.rc.mmRBF.key('newimagerequired','validation')#" />
				</cfif>
			</li>
			<li>
				<label for="imagebean_name">#local.rc.mmRBF.key('name')#</label>
				<input class="text" type="text" name="imagebean_name" id="imagebean_name" value="#form.imagebean_name#" size="30" maxlength="100" />
			</li>
			<li>
				<label for="imagebean_caption">#local.rc.mmRBF.key('caption')#</label>
				<input class="text" type="text" name="imagebean_caption" id="imagebean_caption" value="#form.imagebean_caption#" size="30" maxlength="100" />
			</li>
			<li>
				<label for="imagebean_tags">
					#local.rc.mmRBF.key('tags')# <a href="##" class="tooltip"><span>#local.rc.mmRBF.key('tagsimages','tip')#</span>&nbsp;</a>
				</label>
				<input class="text long" type="text" name="imagebean_tags" id="imagebean_tags" value="#form.imagebean_tags#" size="30" maxlength="255" />
			</li>
			<li>
			<label for="imagebean_summary">#local.rc.mmRBF.key('summary')#:  <span class="doShowHide" onclick="doClickShowHide('summaryShowHide',false,'imagebean_summary')">#local.rc.mmRBF.key('show')#</show></label>
			<div id="summaryShowHide">
			<textarea name="imagebean_summary" id="imagebean_summary"><cfif len(form.imagebean_summary)>#HTMLEditFormat(form.imagebean_summary)#<cfelse><br /></cfif></textarea>
			</div>
			<script>
				<cfif len(form.imagebean_summary)>
					doClickShowHide('summaryShowHide',true,'imagebean_summary');
				<cfelse>
					$("##summaryShowHide").hide();
				</cfif>
			</script>
			</li>
			<li>
			<label for="imagebean_description">#local.rc.mmRBF.key('description')#: </label>
			<textarea name="imagebean_description" id="imagebean_description"><cfif len(form.imagebean_description)>#HTMLEditFormat(form.imagebean_description)#<cfelse><br /></cfif></textarea>
			<script type="text/javascript" language="Javascript">
			var loadEditorCount = 0;
			jQuery('##imagebean_description').ckeditor(
				{ toolbar: 'Default',
				height:'200',
				customConfig : 'config.js.cfm' },htmlEditorOnComplete);
			</script>
			</li>
		</ul>
	</div>
</cfoutput>