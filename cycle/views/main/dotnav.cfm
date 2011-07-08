<!---
||MELDGALLERYLICENSE||
--->
<cfif rc.displayBean.beanExists() and ArrayLen(rc.ImageArray)>
<cfsilent>
	<!--- headers --->
	<cfinclude template="headers/header_dotnav.cfm">
</cfsilent><cfoutput>
<!--- global menu --->
<!--- begin content --->
<div class="meld-body meld-gallery-cycle meld-gallery-cycle-dotnav" style="width: #rc.params.imagewidth#px;">
	<!-- CONTENT HERE -->
	<div class="nav-container">
		<span id="gal#rc.displayBean.getDisplayID()#-nav" class="nav">
		</span>
	</div>
	<div id="gal#rc.displayBean.getDisplayID()#" class="gallerySlideShow">
	<cfloop from="1" to="#ArrayLen(rc.ImageArray)#" index="local.iiX">
		<cfset local.cImage = rc.ImageArray[local.iiX] />
		<cfif len(local.cImage.getLinkUrl())><a href="#local.cImage.getLinkUrl()#"></cfif><img alt="image" title="#local.cImage.getCaption()#" src="#rc.$.createHREFForImage(rc.siteID,local.cImage.getDisplayFileID(),local.cImage.getType(), 'large')#" width="#rc.params.imagewidth#" height="#rc.params.imageheight#"><cfif len(local.cImage.getLinkUrl())></a></cfif>
	</cfloop>
	</div>
</div>	
<!--- end content --->
</cfoutput>
</cfif>
