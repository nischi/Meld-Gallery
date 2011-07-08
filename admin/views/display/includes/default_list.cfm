<!---
||MELDGALLERYLICENSE||
--->
<cfsilent>
	<cfset local.rc = rc>
</cfsilent>
<cfoutput>
<div class="section clearfix">
	<table class="ms-datatable display hideTable" id="ms-datatable"
		data-url="#rc.$.globalConfig().getContext()#/plugins/#local.rc.pluginConfig.getDirectory()#/com/meldsolutions/meldgallery/remote/meldgalleryRemoteAOP.cfc?method=getDisplayList&data&returnFormat=json">
		<thead class="headers">
		<tr>
			<th class="nosort nopad ui-state-active" data-class="nopad">&nbsp;</th>
			<th class="midWidth ui-state-active">#local.rc.mmRBF.key('name')#</th>
			<th class="midWidth ui-state-active">#local.rc.mmRBF.key('Source')#</th>
			<th class="minWidth ui-state-active">#local.rc.mmRBF.key('displaytype')#</th>
			<th class="nosort minWidth ui-state-active" data-class="center">#local.rc.mmRBF.key('status')#</th>
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
			<th><input class="searchable text full" type="text" id="flt_imagegroup" data-column="imagegroup"></th>
			<th>
			<select class="select" name="displayTypeID" id="flt_displaytypeid" data-column="displaytypeid">
				<option value="">#local.rc.mmRBF.key('any')#</option>
				<cfloop from="1" to="#arrayLen(local.rc.aDisplayTypes)#" index="local.iiX">
					<option value="#local.rc.aDisplayTypes[local.iiX].getDisplayTypeID()#">#local.rc.aDisplayTypes[local.iiX].getName()#</option>
				</cfloop>
			</select>
			</th>
			<th>
			<select class="select" name="isactive" id="flt_isactive" data-column="isactive">
				<option value="1">#local.rc.mmRBF.key('active1')#</option>
				<option value="0">#local.rc.mmRBF.key('active0')#</option>
			</select>
			</th>
		</tr>
		</thead>
		<tbody>
	</table>
</div>

</cfoutput>