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
	<div id="msTabs-Collection">
		<h3>#local.rc.mmRBF.key('Collection')#</h3>
		<ul class="form">
			<li>
			<input type="hidden" id="ui-selecttable-default" name="ui-selecttable-default"
				<cfif not structKeyExists(rc,"FeedBean")>required="true" message="#rc.mmRBF.key('feed','validation')#"</cfif> value="">
			<table class="ms-datatable display hideTable" id="ms-datatable"
				data-url="#rc.$.globalConfig().getContext()#/plugins/#local.rc.pluginConfig.getDirectory()#/com/meldsolutions/meldgallery/remote/meldgalleryRemoteAOP.cfc?method=getFeedList&data&returnFormat=json&mode=form">
				<thead class="headers">
				<tr>
					<th class="nosort nopad ui-state-active" data-class="nopad">&nbsp;</th>
					<th class="midWidth ui-state-active">#local.rc.mmRBF.key('name')#</th>
					<th class="nosort minWidth ui-state-active">#local.rc.mmRBF.key('type')#</th>
					<th class="minWidth ui-state-active" data-class="center">#local.rc.mmRBF.key('date')#</th>
				</tr>
				</thead>
				<thead class="search" id="ms-datatable_search">
				<tr>
					<th>
					<ul class='table-buttons two'>
						<li><span title="#local.rc.mmRBF.key('clearfilter')#" id="clearFilter" class="sb-button ui-state-active"><span class="ui-icon ui-icon-arrowreturnthick-1-w"></span></span></li>
						<li><span title="#local.rc.mmRBF.key('setfilter')#" id="setFilter" class="sb-button ui-state-active"><span class="ui-icon ui-icon-check"></span></span></li>
					</ul>
					</th>
					<th><input class="searchable text full" type="text" id="flt_name" data-column="name"></th>
					<th></th>
					<th></th>
				</tr>
				</thead>
				<tbody>
			</table>
			</li>
		</ul>
	</div>
</cfoutput>