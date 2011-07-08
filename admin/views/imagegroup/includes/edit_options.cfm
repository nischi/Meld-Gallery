<!---
||MELDGALLERYLICENSE||
--->
<cfsilent>
	<cfset local.rc = rc>
</cfsilent>
<cfoutput>
	<div id="msTabs-Options">
		<h3>#local.rc.mmRBF.key('options')#</h3>
		<ul class="form">
			<li class="checkbox padded">
				<input class="checkbox" type="checkbox" name="imagegroupbean_isactive" id="imagegroupbean_isactive" value="1" <cfif form.imagegroupbean_isactive>CHECKED</cfif>/>
				<label for="imagegroupbean_isactive">#local.rc.mmRBF.key('isactive')#</label>
			</li>
		</ul>
	</div>
</cfoutput>