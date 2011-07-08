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
	<div id="msTabs-Info">
		<h3>#local.rc.mmRBF.key('information')#</h3>
		<ul class="form">
			<li>
				<label for="imagebean_tags">#local.rc.mmRBF.key('image')# #local.rc.mmRBF.key('id')#</label>
				#rc.imageBean.getImageID()#
			</li>
			<cfif rc.imageBean.beanExists()>
			<li>
				<label for="imagebean_tags">#local.rc.mmRBF.key('file')# #local.rc.mmRBF.key('id')#</label>
				#rc.imageBean.getFileID()#
			</li>
			<li>
				<label>#local.rc.mmRBF.key('renderimagelinks')#</label>
				<a target="_new" href="#rc.$.createHREFForImage(rc.siteID,rc.imageBean.getFileID(),rc.imageBean.getType(), 'small')#">#local.rc.mmRBF.key('small')#</a><br />
				<a target="_new" href="#rc.$.createHREFForImage(rc.siteID,rc.imageBean.getFileID(),rc.imageBean.getType(), 'medium')#">#local.rc.mmRBF.key('medium')#</a><br />
				<a target="_new" href="#rc.$.createHREFForImage(rc.siteID,rc.imageBean.getFileID(),rc.imageBean.getType(), 'large')#">#local.rc.mmRBF.key('large')#</a><br />
			</li>
			<li>
				<img src="#rc.$.createHREFForImage(rc.siteID,rc.imageBean.getFileID(),rc.imageBean.getType(), 'medium')#">
			</li>
			</cfif>
		</ul>
	</div>
</cfoutput>