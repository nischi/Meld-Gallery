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
<cfsavecontent variable="local.str"><cfoutput>
<cfif not structKeyExists(request,"MeldGallery_header_cycle_fullbody")>
	<link rel="stylesheet" href="#rc.PluginDirectory##rc.subsystem#/assets/css/fullbody.css" type="text/css" media="screen" />
	<cfset request.MeldGallery_header_cycle_feed = true />
</cfif>
<script type="text/javascript">
jQuery(document).ready(function() {
	jQuery('##gal#rc.displayBean.getDisplayID()#')
	.cycle({ 
		fx: '#rc.params.effect#',
		containerResize: 0,
		fit: 0,
		height: #rc.params.imageheight#,
		width: #rc.params.imagewidth#,
	    speed: #rc.params.speed#, 
	    timeout: #rc.params.interval#, 
	    pager:  '##gal#rc.displayBean.getDisplayID()#-nav'
		<cfif rc.params.pauseonnav>,onPagerEvent: doMeldGalleryPause</cfif>
	});
});
</script>
</cfoutput>
</cfsavecontent>
<cfset arrayPrepend( rc.headLoader,local.str )>
</cfsilent>
