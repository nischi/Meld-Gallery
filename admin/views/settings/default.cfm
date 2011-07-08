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
	<!--- use 'local' to keep view-related data in-scope --->
	<cfset local.rc		= rc>
	<!--- headers --->
</cfsilent><cfoutput>
<!--- global menu --->
<!--- begin content --->
<div id="meld-body">
	<!-- CONTENT HERE -->
	<div id="meld-actions" class="section clearfix">
		#view("settings/includes/default_actions")#
	</div>
	<div>
		<ul class="metadata">
			<cfif not isSimpleValue( rc.DisplayTypeBean )>
			<li>
				<strong>#rc.mmRBF.key('default')# #rc.mmRBF.key('displaytype')#:</strong> #rc.DisplayTypeBean.getName()#
			</li>
			</cfif>
			<li>
				<strong>#rc.mmRBF.key('sourcedimensions')#:</strong> #rc.SettingsBean.getImageWidth()# x #rc.SettingsBean.getImageHeight()#
			</li>
			<li>
				<strong>#rc.mmRBF.key('filesizelimit')#:</strong> #rc.SettingsBean.getFileSizeLimit()##rc.mmRBF.key('kilobytes')#
			</li>
			<li>
				<strong>#rc.mmRBF.key('sync')#:</strong> #rc.mmRBF.key('yes' & rc.SettingsBean.getSyncInfo() )#
			</li>
		</ul>
	</div>
</div>	
<!--- end content --->
</cfoutput> 