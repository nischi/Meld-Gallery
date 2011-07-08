<!---
||MELDGALLERYLICENSE||
--->
<cfif rc.displayBean.beanExists() and ArrayLen(rc.ImageArray)>
<cfsilent>
	<!--- headers --->
	<cfinclude template="headers/header_fullbody.cfm">
</cfsilent><cfoutput>
<!--- global menu --->
<!--- begin content --->
<div class="meld-body meld-gallery-cycle meld-gallery-cycle-fullbody" style="width: #rc.params.imagewidth#px;height: #rc.params.imageheight#px">
	<!-- CONTENT HERE -->
	<div id="gal#rc.displayBean.getDisplayID()#" class="gallerySlideShow">
	<cfloop from="1" to="#ArrayLen(rc.ImageArray)#" index="local.iiX">
		<cfset local.cImage = rc.ImageArray[local.iiX] />
		<div class="slide">
			<div class="img">
			<img alt="image" title="#local.cImage.getCaption()#" src="#rc.$.createHREFForImage(rc.siteID,local.cImage.getDisplayFileID(),local.cImage.getType(), 'large')#" width="#rc.params.imagewidth#" height="#rc.params.imageheight#">
			</div>
			<div class="desc">
				<h3>#local.cImage.getCaption()#</h3>
				<p>#local.cImage.getDescription()#</p>
				<cfif len(local.cImage.getLinkURL())><span class="link"><a href="#local.cImage.getLinkURL()#">#rc.mmRBF.key('link')#</a></span></cfif>
			</div>
		</div>
	</cfloop>
	</div>
	<div id="gal#rc.displayBean.getDisplayID()#-nav" class="nav">
	</div>
</div>	
<!--- end content --->
</cfoutput>
</cfif>
