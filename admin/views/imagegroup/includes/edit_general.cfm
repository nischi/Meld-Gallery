<!---
||MELDGALLERYLICENSE||
--->
<cfsilent>
	<cfset local.rc = rc>
</cfsilent>
<cfoutput>
	<div id="msTabs-General">
		<h3>#local.rc.mmRBF.key('general')#</h3>
		<ul class="form">
			<li>
				<label for="ImageGroupbean_name">#local.rc.mmRBF.key('name')#</label>
				<input class="text" type="text" name="ImageGroupbean_name" id="ImageGroupbean_name" value="#form.ImageGroupbean_name#" size="30" maxlength="100" />
			</li>
			<li>
				<label for="imagegroupbean_tags">#local.rc.mmRBF.key('tags')#</label>
				<input class="text long" type="text" name="imagegroupbean_tags" id="imagegroupbean_tags" value="#form.imagegroupbean_tags#" size="30" maxlength="255" />
			</li>
			<li>
			<label for="ImageGroupbean_description">#local.rc.mmRBF.key('description')#: </label>
			<textarea name="ImageGroupbean_description" id="ImageGroupbean_description"><cfif len(form.ImageGroupbean_description)>#HTMLEditFormat(form.ImageGroupbean_description)#<cfelse><br /></cfif></textarea>
			<script type="text/javascript" language="Javascript">
			var loadEditorCount = 0;
			jQuery('##ImageGroupbean_description').ckeditor(
				{ toolbar: 'Default',
				height:'200',
				customConfig : 'config.js.cfm' },htmlEditorOnComplete);
			</script>
			</li>
		</ul>
	</div>
</cfoutput>