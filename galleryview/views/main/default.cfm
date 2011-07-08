<!---

This file is part of the Meld Gallery application.

Meld Gallery is licensed under the GPL 2.0 license
Copyright (C) 2010,2011 Meld Solutions Inc. http://www.meldsolutions.com/

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
	<!--- use 'local' to keep view-related data in-scope --->
	<cfset local.rc			= rc>
	<!--- headers --->
	<cfoutput>
	<cfinclude template="headers/galleryview.cfm">
	</cfoutput>
</cfsilent><cfoutput>
<!--- global menu --->
<!--- begin content --->
<div class="meld-body">
	<!-- CONTENT HERE -->
	<div>
	<ul id="gal#rc.displayBean.getDisplayID()#" class="galleryImageList">
	<cfif structKeyExists(rc,"imageGroupBean")>
		<cfif structKeyExists(rc.params,"showname") and rc.params.showName>
			<h3>#rc.imageGroupBean.getName()#</h3>
		</cfif>
		<cfif len( rc.imageGroupBean.getDescription() )>
		<div>
			#rc.imageGroupBean.getDescription()#
		</div>
		</cfif>
	</cfif>
	<cfloop from="1" to="#ArrayLen(rc.ImageArray)#" index="local.iiX">
		<cfset local.cImage = rc.ImageArray[local.iiX] />
		<li class="img">
			<img alt="image" title="#local.cImage.getCaption()#" src="#rc.$.createHREFForImage(rc.siteID,local.cImage.getDisplayFileID(),local.cImage.getType(), 'small')#">
			<div class="panel-content">
				<img alt="image" title="#local.cImage.getCaption()#" src="#rc.$.createHREFForImage(rc.siteID,local.cImage.getDisplayFileID(),local.cImage.getType(), 'large')#">
				<cfif rc.params.showdescription>
				<div class="panel-overlay">
					<h3>#local.cImage.getCaption()#</h3>
					<p>#local.cImage.getDescription()#</p>
					<cfif len(local.cImage.getLinkURL())><span class="link"><a href="#local.cImage.getLinkURL()#">#rc.mmRBF.key('link')#</a></span></cfif>
				</div>
				</cfif>
			</div>
		</li>
	</cfloop>
	</ul>
	</div>
</div>	
<!--- end content --->
</cfoutput> 
</cfif>