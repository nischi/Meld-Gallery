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
				<input class="checkbox" type="checkbox" name="displaytypebean_isactive" id="displaytypebean_isactive" value="1" <cfif form.displaytypebean_isactive>CHECKED</cfif>/>
				<label for="displaytypebean_isactive">#local.rc.mmRBF.key('isactive')#</label>
			</li>
		</ul>
	</div>
</cfoutput>