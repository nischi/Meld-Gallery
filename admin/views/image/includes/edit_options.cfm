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
				<input class="checkbox" type="checkbox" name="imagebean_isactive" id="imagebean_isactive" value="1" <cfif form.imagebean_isactive>CHECKED</cfif>/>
				<label for="imagebean_isactive">#local.rc.mmRBF.key('isactive')#</label>
			</li>
			<li>
				<label for="imagebean_LinkURL">
					#local.rc.mmRBF.key('LinkURL')# <a href="##" class="tooltip"><span>#local.rc.mmRBF.key('LinkURL','tip')#</span>&nbsp;</a>
				</label>
				<input class="text short" type="text" name="imagebean_LinkURL" id="imagebean_LinkURL" value="#form.imagebean_LinkURL#" size="150" maxlength="150" />
			</li>
			<li>
				<label for="imagebean_friendlyName">
					#local.rc.mmRBF.key('friendlyName')# <a href="##" class="tooltip"><span>#local.rc.mmRBF.key('friendlyName','tip')#</span>&nbsp;</a>
				</label>
				<input class="text short" type="text" name="imagebean_friendlyName" id="imagebean_friendlyName" value="#form.imagebean_friendlyName#" size="30" maxlength="255" />
			</li>
		</ul>
	</div>
</cfoutput>