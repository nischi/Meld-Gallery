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
	<!--- use 'local' to keep view-related data in-scope --->
	<cfset local.rc			= rc>
	<!--- headers --->
	<cfoutput>
	<cfinclude template="headers/popeye.cfm">
	</cfoutput>
</cfsilent><cfoutput>
<!--- global menu --->
<!--- begin content --->
	<div class="ppy1" id="gal#rc.displayBean.getDisplayID()#">
		<div class="ppy-outer">
		    <div class="ppy-stage">
		        <div class="ppy-nav">
		            <a class="ppy-prev" title="Previous image">Previous image</a>
		            <a class="ppy-switch-enlarge" title="Enlarge">Enlarge</a>
		            <a class="ppy-switch-compact" title="Close">Close</a>
		            <a class="ppy-next" title="Next image">Next image</a>
		        </div>
		    </div>
		</div>
		<div class="ppy-caption">
		    <div class="ppy-counter">
		        #rc.mmRBF.key('image')# <strong class="ppy-current"></strong> #rc.mmRBF.key('of')# <strong class="ppy-total"></strong> 
		    </div>
		    <span class="ppy-text"></span>
		</div>
		<ul class="ppy-imglist">
		<cfloop from="1" to="#ArrayLen(rc.ImageArray)#" index="local.iiX">
			<cfset local.cImage = rc.ImageArray[local.iiX] />
			<li class="ppy-img"><a href="#rc.$.createHREFForImage(rc.siteID,local.cImage.getDisplayFileID(),local.cImage.getType(), 'large')#">
				<img width="#rc.params.thumbwidth#" height="#rc.params.thumbheight#" <cfif rc.params.showCaption>alt="#local.cImage.getCaption()#"</cfif> title="#local.cImage.getCaption()#" src="#rc.$.createHREFForImage(rc.siteID,local.cImage.getDisplayFileID(),local.cImage.getType(), 'small')#">
			</a>
			<cfif rc.params.showCaption>
			<span class="ppy-extcaption">
				<h3>#local.cImage.getCaption()#</h3>
				#local.cImage.getDescription()#
				<cfif len(local.cImage.getLinkURL())><span class="link"><a href="#local.cImage.getLinkURL()#">#rc.mmRBF.key('link')#</a></span></cfif>
			</span>
			</cfif>
			</li>
		</cfloop>
		</ul>
	</div>	
<!--- end content --->
</cfoutput> 
</cfif>
