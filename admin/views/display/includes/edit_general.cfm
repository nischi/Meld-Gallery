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
				<label for="displaybean_name">#local.rc.mmRBF.key('name')#</label>
				<input class="text" type="text" name="displaybean_name" id="displaybean_name" value="#form.displaybean_name#" size="30" maxlength="100" required="true" message="#local.rc.mmRBF.key('name','validation')#" />
			</li>
			<li class="checkbox padded">
				<input class="checkbox" type="checkbox" name="displaybean_isactive" id="displaybean_isactive" value="1" <cfif form.displaybean_isactive>CHECKED</cfif>/>
				<label for="displaybean_isactive">#local.rc.mmRBF.key('isactive')#</label>
			</li>
			<li>
			<label for="displaybean_notes">#local.rc.mmRBF.key('notes')#:  <span class="doShowHide" onclick="doClickShowHide('notesShowHide')">#local.rc.mmRBF.key('show')#</show></label>
			<div id="notesShowHide">
			<textarea class="textarea" name="displaybean_notes" id="displaybean_notes">#form.displaybean_notes#</textarea>
			</div>
			<script>
				<cfif len(form.displaybean_notes)>
					doShowHide('notesShowHide',true);
				<cfelse>
					$("##notesShowHide").hide();
				</cfif>
			</script>
			</li>
			<cfif structKeyExists(rc,"ImageGroupBean")>
			<li>
				<input type="hidden" name="imagegroupbean_imagegroupid" id="imagegroupbean_imagegroupid" value="#rc.ImageGroupBean.getImageGroupID()#" />
				<label>#local.rc.mmRBF.key('CurrentImageGroup')#:
					#rc.ImageGroupBean.getName()# <a href="##" class="tooltip"><span>#local.rc.mmRBF.key('ImageGroupSubset','tip')#</span>&nbsp;</a>
				</label>
				<cfif ArrayLen( rc.aImages )>
					<cfloop from="1" to="#ArrayLen( rc.aImages )#" index="local.x">
						<img src="#rc.$.createHREFForImage(rc.siteID,rc.aImages[local.x].fileID,rc.aImages[local.x].type, 'small')#">
					</cfloop> 
				</cfif>
			</li>
			<cfelseif structKeyExists(rc,"FeedBean")>
				<input type="hidden" name="feedbean_feedid" id="feedbean_feedid" value="#rc.FeedBean.getFeedID()#" />
				<label>#local.rc.mmRBF.key('CurrentFeed')#:
					#rc.FeedBean.getName()#
				</label>
			</cfif>
		</ul>
	</div>
</cfoutput>