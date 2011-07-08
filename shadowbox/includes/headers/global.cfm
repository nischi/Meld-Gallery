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
<cfset request.contentRenderer.jslib = "jquery" />
<cfset request.contentRenderer.loadJSLib() />
<cfset request.contentRenderer.loadShadowboxJS() />
<cfsilent>
<cfif not structKeyExists(request,"MeldGallery_header_shadowbox")>
	<cfsavecontent variable="local.str"><cfoutput>
	<cfif not request.contentRenderer.jsLibLoaded>
		<cfset request.contentRenderer.jsLibLoaded = true />
		<script type="text/javascript" src="#rc.$.globalConfig('context')#/default/js/jquery/jquery.js"></script>
	</cfif>
	<link rel="stylesheet" href="#local.rc.PluginDirectory##local.rc.subsystem#/assets/css/base.css" type="text/css" media="screen" />
	<script type="text/javascript" src="#local.rc.PluginDirectory##local.rc.subsystem#/assets/base.js"></script>
	</cfoutput>
	</cfsavecontent>
	<cfset arrayPrepend( rc.headLoader,local.str )>
	<cfset request.MeldGallery_header_shadowbox = true />
</cfif>
</cfsilent>