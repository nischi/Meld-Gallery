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
	<div id="msTabs-Images">
		<h3>#local.rc.mmRBF.key('images')#</h3>
		
		<div class="section clearfix">
			<textarea style="display: none" name="imagegroupbean_imageidlist" id="imagegroupbean_imageidlist">#serializeJSON( rc.ImageGroupBean.getImageIDArray() )#</textarea>
			<div id="ms-imagegrid" class="clearfix"
				data-url="#rc.$.globalConfig().getContext()#/plugins/#local.rc.pluginConfig.getDirectory()#/com/meldsolutions/meldgallery/remote/MeldGalleryRemoteAOP.cfc?contentid=#rc.imageGroupBean.getImageGroupID()#">
				<div class='ui-imagegrid-modal'><div class='ui-imagegrid-spinner'></div></div>
				<div class="ui-select-box">
					<div class='ui-imagegrid-buttonbar ui-widget-header ui-state-active'>
						<div class="left">
							<ul class="table-buttons left">
								<li><span id="ui-clear-filter" title='#rc.mmRBF.key('clearfilter')#' class='sb-button ui-state-default'><a class='ui-icon ui-icon-arrowreturnthick-1-w' href='##'></a></span></li>
								<li><span id="ui-do-filter" title='#rc.mmRBF.key('Filter')#' class='sb-button ui-state-default'><a class='ui-icon ui-icon-check' href='##'></a></span></li>
							</ul>
							<div class="left">
								<input type="text" id="ui-filter" class="ui-filter" name="filter">
								<select id="ui-filter-selected" class="ui-filter" name="isSelected">
									<option value="">#rc.mmRBF.key('all')#</option>
									<option value="0">#rc.mmRBF.key('unselected')#</option>
									<option value="1">#rc.mmRBF.key('selected')#</option>
								</select>
							</div>
						</div>
						<div class="ui-total">
							<span id="ui-totalbox"></span> #rc.mmRBF.key('images')#
						</div>
						<div class="ui-pagebox right">
							<ul class="table-buttons" id="ui-imagegrid-pages">
							</ul>
						</div>
					</div>
					<div class='ui-imagegrid-body ui-imagegrid-boxed clearfix'>
						<ul class='ui-imagegrid-select-list'></ul>
					</div>
				</div>
				<div class="ui-group-box">
					<div class='ui-imagegrid-buttonbar ui-widget-header ui-state-active'>
						<div class="left">
							<!---
							<ul class="table-buttons">
								<li><span title='#rc.mmRBF.key('Save')#' class='sb-button ui-state-default'><a id='ui-imagegrid-save' class='ui-icon ui-icon-disk' href='##'></a></span></li>
							</ul>
							--->
						</div>
						<div class="ui-total">
							<span id="ui-countbox"></span> #rc.mmRBF.key('images')#
						</div>
						<div class="right">
							<ul class="table-buttons" id="ui-imagegrid-pages">
								<li><span title='#rc.mmRBF.key('DeleteAll')#' class='sb-button ui-state-default'><a id='ui-imagegrid-deleteall' class='ui-icon ui-icon-trash' href='##'></a></span></li>
							</ul>
						</div>
					</div>
					<div class='ui-imagegrid-body ui-imagegrid-boxed clearfix'>
						<ul class='ui-imagegrid-group-list'></ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</cfoutput>