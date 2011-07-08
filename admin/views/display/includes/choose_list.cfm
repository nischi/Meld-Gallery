<!---
||MELDGALLERYLICENSE||
--->
<cfsilent>
	<!--- use 'local' to keep view-related data in-scope --->
	<cfset local.rc		= rc>
	<!--- headers --->
	<cfinclude template="/#local.rc.pluginConfig.getPackage()#/admin/includes/headers/jquery-ui-tabs.cfm">
</cfsilent>
<cfoutput>
<!--- global menu --->
<!--- begin content --->
<div id="meld-body">
	<!-- CONTENT HERE -->
<form id="meld-edit-form" class="meld-form" method="post" action="index.cfm" onsubmit="return validate(this);" enctype="multipart/form-data">
<input type="hidden" name="action" value="admin:display.choose">
<div>
	<div>
	<ul class="meld-form">
		<li>
			<label for="displayTypeID">
				#rc.mmRBF.key('displaytype')#
			</label>		
			<select class="select" name="displayTypeID" id="displaytypeid" required="true" message="#rc.mmRBF.key('displaytype','validation')#">
				<option value="">#local.rc.mmRBF.key('choosedisplaytype')#</option>
				<cfloop from="1" to="#arrayLen(local.rc.aDisplayTypes)#" index="local.iiX">
					<option value="#local.rc.aDisplayTypes[local.iiX].getDisplayTypeID()#">#local.rc.aDisplayTypes[local.iiX].getName()#</option>
				</cfloop>
			</select>
		</li>
		<li>
			<label for="displayTypeID">
				#rc.mmRBF.key('source')#
			</label>		
			<select class="select" name="sourceType" id="sourceType" required="true" message="#rc.mmRBF.key('source','validation')#">
				<option value="imagegroup">#local.rc.mmRBF.key('imagegroup')#</option>
				<option value="collection">#local.rc.mmRBF.key('collection')#</option>
			</select>
		</li>
	</ul>
	</div>
	<div>
		<ul class="form-buttons">
			<li><input name="btaction" type="submit" class="submit ui-state-default" value="#rc.mmRBF.key('next')#"></li>
			<li><input name="btaction" id="ui-button-cancel" type="submit" class="submit ui-state-default" value="#rc.mmRBF.key('cancel')#"></li>
		</ul>
	</div>
</div>	
</form>


<!---	<form method="post" enctype="multipart/form-data">
		<input type="file" name="newImage">
		<input type="submit">
	</form>
--->
</div>	
<!--- end content --->
</cfoutput> 