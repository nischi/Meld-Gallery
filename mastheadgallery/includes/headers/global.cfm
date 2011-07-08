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
<link rel="stylesheet" href="#local.rc.PluginDirectory#/#local.rc.subsystem#/assets/css/base.css" type="text/css" media="screen" />
<cfif not rc.$.getContentRenderer().jsLibLoaded>
	<cfset rc.$.getContentRenderer().jsLibLoaded = true>
	<script type="text/javascript" src="/admin/js/jquery/jquery.js"></script>
</cfif>
<script type="text/javascript" src="#local.rc.PluginDirectory##local.rc.subsystem#/assets/js/jquery.mastheadfader.js"></script>
<script type="text/javascript" src="#local.rc.PluginDirectory##local.rc.subsystem#/assets/js/base.js"></script>
</cfoutput>
</cfsavecontent>
<cfset arrayPrepend( rc.headLoader,local.str )>
</cfsilent>