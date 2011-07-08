<!---
||MELDGALLERYLICENSE||
--->
<cfsilent>
	<cfset local.rc = rc>
</cfsilent>
<cfoutput>
	<div id="msTabs-Info">
		<h3>#local.rc.mmRBF.key('information')#</h3>
		<ul class="form">
			<li>
				<label for="imagebean_tags">#local.rc.mmRBF.key('image')# #local.rc.mmRBF.key('id')#</label>
				#rc.imageBean.getImageID()#
			</li>
			<cfif rc.imageBean.beanExists()>
			<li>
				<label for="imagebean_tags">#local.rc.mmRBF.key('file')# #local.rc.mmRBF.key('id')#</label>
				#rc.imageBean.getFileID()#
			</li>
			<li>
				<label>#local.rc.mmRBF.key('renderimagelinks')#</label>
				<a target="_new" href="#rc.$.createHREFForImage(rc.siteID,rc.imageBean.getFileID(),rc.imageBean.getType(), 'small')#">#local.rc.mmRBF.key('small')#</a><br />
				<a target="_new" href="#rc.$.createHREFForImage(rc.siteID,rc.imageBean.getFileID(),rc.imageBean.getType(), 'medium')#">#local.rc.mmRBF.key('medium')#</a><br />
				<a target="_new" href="#rc.$.createHREFForImage(rc.siteID,rc.imageBean.getFileID(),rc.imageBean.getType(), 'large')#">#local.rc.mmRBF.key('large')#</a><br />
			</li>
			<li>
				<img src="#rc.$.createHREFForImage(rc.siteID,rc.imageBean.getFileID(),rc.imageBean.getType(), 'medium')#">
			</li>
			</cfif>
		</ul>
	</div>
</cfoutput>