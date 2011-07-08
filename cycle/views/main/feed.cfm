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
<cfif rc.displayBean.beanExists() and ArrayLen(rc.ImageArray)>
<cfsilent>
	<!--- headers --->
	<cfinclude template="headers/header_feed.cfm">
</cfsilent><cfoutput>
<!--- global menu --->
<!--- begin content --->
<div class="meld-body meld-gallery-cycle meld-gallery-cycle-feed">
	<!-- CONTENT HERE -->
	<div id="gal#rc.displayBean.getDisplayID()#" class="gallerySlideShow">
	<cfloop from="1" to="#ArrayLen(rc.ImageArray)#" index="local.iiX">
		<cfset local.cImage = rc.ImageArray[local.iiX] />
		<div class="slide">
			<div class="img">
			<img alt="image" title="#local.cImage.getCaption()#" src="#rc.$.createHREFForImage(rc.siteID,local.cImage.getDisplayFileID(),local.cImage.getType(), 'large')#" width="#rc.params.imagewidth#" height="#rc.params.imageheight#">
			</div>
			<div class="desc">
				<h3>#local.cImage.getCaption()#</h3>
				<p>#local.cImage.getDescription()#</p>
				<cfif len(local.cImage.getLinkURL())><span class="link"><a href="#local.cImage.getLinkURL()#">#rc.mmRBF.key('link')#</a></span></cfif>
			</div>
		</div>
	</cfloop>
	</div>
	<div id="gal#rc.displayBean.getDisplayID()#-nav" class="nav">
	</div>
</div>	
<!--- end content --->
</cfoutput>
</cfif>
