<!---
||MELDGALLERYLICENSE||
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