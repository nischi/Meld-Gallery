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
	<cfif not structKeyExists(request,"meld_shadowbox_init_true")>
		<cfinclude template="headers/shadowbox.cfm">
		<cfset request.meld_shadowbox_init_true = true>
	</cfif>
	</cfoutput>
</cfsilent><cfoutput>
<!--- global menu --->
<!--- begin content --->
<div class="meld-body">
	<!-- CONTENT HERE -->
	<div id="svGallery">
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
	<ul class="gallery meld-shadowbox">
	<cfloop from="1" to="#ArrayLen(rc.ImageArray)#" index="local.iiX">
		<cfset local.cImage = rc.ImageArray[local.iiX] />
		<li style="width: #rc.params.thumbwidth#px">
			<a class="gallery" rel="shadowbox[#rc.displayBean.getDisplayID()#]" title="#local.cImage.getCaption()#" href="#rc.$.createHREFForImage(rc.siteID,local.cImage.getDisplayFileID(),local.cImage.getType(), 'large')#">
				<img width="#rc.params.thumbwidth#" height="#rc.params.thumbheight#" title="#local.cImage.getCaption()#" src="#rc.$.createHREFForImage(rc.siteID,local.cImage.getDisplayFileID(),local.cImage.getType(), 'small')#">
			</a>
			<cfif structKeyExists(rc.params,"showCaption") and rc.params.showCaption>
			<div class="caption clearfix">#local.cImage.getCaption()#</div>
			</cfif>
		</li>
	</cfloop>
	</ul>
	</div>
	
</div>	
<!--- end content --->
</cfoutput> 
</cfif>