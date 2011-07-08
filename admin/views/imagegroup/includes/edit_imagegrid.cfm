<!---
||MELDGALLERYLICENSE||
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